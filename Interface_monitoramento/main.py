import json
import queue
import threading
import time
from datetime import datetime
import serial
import serial.tools.list_ports

import tkinter as tk
from tkinter import ttk
from tkinter.scrolledtext import ScrolledText

from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure


# ============================================================
# CONFIGURAÇÕES
# ============================================================

BAUD_RATE = 115200

# Paleta de Cores (Dark Theme Moderno)
BG_MAIN = "#121212"
BG_CARD = "#1e1e1e"
FG_TEXT = "#e0e0e0"
FG_HIGHLIGHT = "#00d4ff"
COLOR_X = "#ff5555"
COLOR_Y = "#50fa7b"
COLOR_Z = "#8be9fd"


# ============================================================
# LEITOR SERIAL
# ============================================================

class SerialReader(threading.Thread):
    def __init__(self, porta, baudrate, event_queue):
        super().__init__(daemon=True)
        self.porta = porta
        self.baudrate = baudrate
        self.event_queue = event_queue
        self.running = True
        self.raw_x = []
        self.raw_y = []
        self.raw_z = []

    def stop(self):
        self.running = False

    def run(self):
        try:
            ser = serial.Serial(self.porta, self.baudrate, timeout=2)
            time.sleep(2)
            ser.reset_input_buffer()
            self.event_queue.put(("connection", f"Conectado"))
        except Exception as e:
            self.event_queue.put(("connection", "Erro de Conexão"))
            self.event_queue.put(("log", f"Erro ao abrir serial: {e}"))
            return

        while self.running:
            try:
                if ser.in_waiting == 0:
                    time.sleep(0.01)
                    continue

                linha = ser.readline().decode("utf-8").strip()
                if not linha:
                    continue

                # Filtro específico do seu projeto
                linha = linha.replace("INFO: HW RFFT failed, FFT size not supported. Must be a power of 2 between 32 and 4096, (size was 16)", "")

                try:
                    data = json.loads(linha)
                except json.JSONDecodeError:
                    self.event_queue.put(("log", f"JSON inválido: {linha}"))
                    continue

                status = data.get("status")

                if status == "RAW_DATA":
                    raw = data["data"]
                    self.raw_x.append(raw["x"])
                    self.raw_y.append(raw["y"])
                    self.raw_z.append(raw["z"])
                else:
                    message = data.get("message", "")
                    self.event_queue.put(("log", message))
                    info = data.get("data")

                    if info:
                        self.event_queue.put((
                            "metrics",
                            {
                                "status": status,
                                "rms": info.get("RMS"),
                                "rms_medio": info.get("RMS_medio"),
                                "rms_limite": info.get("RMS_limite"),
                                "classe": info.get("Classe")
                            }
                        ))

                    if message == "Entrando em StandBy":
                        self.event_queue.put((
                            "waveform",
                            {
                                "x": self.raw_x.copy(),
                                "y": self.raw_y.copy(),
                                "z": self.raw_z.copy()
                            }
                        ))
                        self.raw_x.clear()
                        self.raw_y.clear()
                        self.raw_z.clear()

            except UnicodeDecodeError:
                pass
            except Exception as e:
                self.event_queue.put(("log", f"Erro: {e}"))

        ser.close()
        self.event_queue.put(("connection", "Desconectado"))


# ============================================================
# DASHBOARD
# ============================================================

class Dashboard(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Monitoramento Avançado de Vibração (STM32)")
        self.geometry("1400x850")
        self.configure(bg=BG_MAIN)
        
        self.queue = queue.Queue()
        self.serial_thread = None
        
        self._create_layout()
        self.after(50, self.process_queue)

    def create_card(self, parent, title):
        frame = tk.Frame(parent, bg=BG_CARD, highlightbackground="#333333", highlightthickness=1)
        frame.pack(side="left", fill="both", expand=True, padx=5, pady=5)

        inner = tk.Frame(frame, bg=BG_CARD, pady=15)
        inner.pack(expand=True)

        tk.Label(inner, text=title.upper(), bg=BG_CARD, fg="#888888", font=("Segoe UI", 9, "bold")).pack()
        
        value = tk.Label(inner, text="---", bg=BG_CARD, fg=FG_HIGHLIGHT, font=("Segoe UI", 22, "bold"))
        value.pack()
        return value

    def _create_layout(self):
        # --- BARRA DE CONTROLE (NOVO) ---
        control_frame = tk.Frame(self, bg=BG_MAIN)
        control_frame.pack(fill="x", padx=15, pady=(15, 0))

        tk.Label(control_frame, text="Porta Serial:", bg=BG_MAIN, fg=FG_TEXT, font=("Segoe UI", 10, "bold")).pack(side="left", padx=(0, 5))
        
        self.cmb_ports = ttk.Combobox(control_frame, state="readonly", width=15)
        self.cmb_ports.pack(side="left", padx=(0, 10))
        
        self.btn_refresh = tk.Button(control_frame, text="Atualizar Portas", bg="#333333", fg=FG_TEXT, relief="flat", command=self.update_ports)
        self.btn_refresh.pack(side="left", padx=(0, 10))
        
        self.btn_connect = tk.Button(control_frame, text="Conectar", bg="#50fa7b", fg="black", font=("Segoe UI", 9, "bold"), relief="flat", command=self.toggle_connection)
        self.btn_connect.pack(side="left")

        self.update_ports() # Busca portas ao iniciar

        # --- TOPO: CARDS DE MÉTRICAS ---
        top = tk.Frame(self, bg=BG_MAIN)
        top.pack(fill="x", padx=15, pady=10)

        self.lbl_connection = self.create_card(top, "Status da Conexão")
        self.lbl_status = self.create_card(top, "Status do Motor")
        self.lbl_classe = self.create_card(top, "Classe de Vibração")
        self.lbl_rms = self.create_card(top, "RMS Atual")
        self.lbl_rms_medio = self.create_card(top, "RMS Médio Calibrado")
        self.lbl_rms_limite = self.create_card(top, "Limite Aceitável")

        self.lbl_connection.config(text="Desconectado", fg="#888888")

        # --- CENTRO: LOGS E GRÁFICOS ---
        center = tk.Frame(self, bg=BG_MAIN)
        center.pack(fill="both", expand=True, padx=15, pady=(0, 15))

        # Esquerda: Logs
        left = tk.Frame(center, bg=BG_MAIN)
        left.pack(side="left", fill="y", padx=(0, 10))

        tk.Label(left, text="Terminal de Logs", bg=BG_MAIN, fg=FG_TEXT, font=("Segoe UI", 11, "bold")).pack(anchor="w", pady=(0, 5))

        self.log_box = ScrolledText(left, width=45, bg=BG_CARD, fg="#00ff88", font=("Consolas", 10), insertbackground="white", relief="flat", highlightthickness=1, highlightbackground="#333333")
        self.log_box.pack(fill="y", expand=True)

        # Direita: Gráficos
        right = tk.Frame(center, bg=BG_MAIN)
        right.pack(side="right", fill="both", expand=True)

        tk.Label(right, text="Série Temporal (Aceleração)", bg=BG_MAIN, fg=FG_TEXT, font=("Segoe UI", 11, "bold")).pack(anchor="w", pady=(0, 5))

        self.figure = Figure(figsize=(10, 8), dpi=100, facecolor=BG_MAIN)
        self.ax_x = self.figure.add_subplot(311)
        self.ax_y = self.figure.add_subplot(312)
        self.ax_z = self.figure.add_subplot(313)

        self.setup_axes()

        self.canvas_frame = tk.Frame(right, bg=BG_CARD, highlightthickness=1, highlightbackground="#333333")
        self.canvas_frame.pack(fill="both", expand=True)

        self.canvas = FigureCanvasTkAgg(self.figure, self.canvas_frame)
        self.canvas.draw()
        self.canvas.get_tk_widget().pack(fill="both", expand=True, padx=2, pady=2)

    # --- FUNÇÕES DA INTERFACE ---

    def update_ports(self):
        """Busca as portas COM disponíveis no sistema"""
        portas = [p.device for p in serial.tools.list_ports.comports()]
        self.cmb_ports['values'] = portas
        if portas:
            self.cmb_ports.current(0)
        else:
            self.cmb_ports.set("Nenhuma porta")

    def toggle_connection(self):
        """Conecta ou desconecta a comunicação serial"""
        if self.serial_thread is None or not self.serial_thread.running:
            porta_selecionada = self.cmb_ports.get()
            if porta_selecionada and porta_selecionada != "Nenhuma porta":
                self.lbl_connection.config(text="Conectando...", fg="#f1fa8c")
                self.serial_thread = SerialReader(porta_selecionada, BAUD_RATE, self.queue)
                self.serial_thread.start()
                
                self.btn_connect.config(text="Desconectar", bg="#ff5555", fg="white")
                self.cmb_ports.config(state="disabled")
            else:
                self.add_log("Selecione uma porta serial válida.")
        else:
            self.serial_thread.stop()
            self.btn_connect.config(text="Conectar", bg="#50fa7b", fg="black")
            self.cmb_ports.config(state="readonly")

    def setup_axes(self):
        for ax in [self.ax_x, self.ax_y, self.ax_z]:
            ax.set_facecolor(BG_CARD)
            ax.tick_params(colors=FG_TEXT, labelsize=8)
            ax.spines['bottom'].set_color('#444444')
            ax.spines['top'].set_color('#444444')
            ax.spines['left'].set_color('#444444')
            ax.spines['right'].set_color('#444444')
            ax.grid(True, color='#333333', linestyle='--', alpha=0.7)

    def add_log(self, message):
        timestamp = datetime.now().strftime("%H:%M:%S")
        self.log_box.insert(tk.END, f"[{timestamp}] {message}\n")
        self.log_box.see(tk.END)

    def update_metrics(self, data):
        classe = str(data.get("classe", "")).upper()
        
        # --- ALERTA VISUAL BASEADO NO STATUS/CLASSE ---
        alert_color = FG_HIGHLIGHT  # Azul padrão
        
        if "NORMAL" in classe:
            alert_color = "#50fa7b" # Verde (Seguro)
        elif "CALIBRANDO" in classe:
            alert_color = "#bd93f9" # Roxo (Em configuração)
        elif "ANOMALIA" in classe or "FALHA" in classe:
            alert_color = "#ff5555" # Vermelho (Alerta Visual de Perigo)
        elif "STANDBY" in classe or data.get("status") == "StandBy":
            alert_color = "#f1fa8c" # Amarelo (Aguardando)

        # Aplica a cor de alerta na Classe E no Status para ficar muito visível
        if data["status"]:
            self.lbl_status.config(text=data["status"], fg=alert_color)

        if data["classe"]:
            self.lbl_classe.config(text=classe, fg=alert_color)

        if data["rms"] is not None:
            self.lbl_rms.config(text=f"{data['rms']:.2f}")

        if data["rms_medio"] is not None:
            self.lbl_rms_medio.config(text=f"{data['rms_medio']:.2f}")

        if data["rms_limite"] is not None:
            self.lbl_rms_limite.config(text=f"{data['rms_limite']:.2f}")

    def update_graphs(self, waveform):
        self.ax_x.clear()
        self.ax_y.clear()
        self.ax_z.clear()
        self.setup_axes()

        self.ax_x.plot(waveform["x"], color=COLOR_X, linewidth=1.5)
        self.ax_y.plot(waveform["y"], color=COLOR_Y, linewidth=1.5)
        self.ax_z.plot(waveform["z"], color=COLOR_Z, linewidth=1.5)

        self.ax_x.set_title(f"Eixo X ({len(waveform['x'])} amostras)", color=FG_TEXT, fontsize=10, pad=3)
        self.ax_y.set_title(f"Eixo Y ({len(waveform['y'])} amostras)", color=FG_TEXT, fontsize=10, pad=3)
        self.ax_z.set_title(f"Eixo Z ({len(waveform['z'])} amostras)", color=FG_TEXT, fontsize=10, pad=3)

        self.figure.tight_layout(pad=2.0)
        self.canvas.draw()

    def process_queue(self):
        while not self.queue.empty():
            event_type, payload = self.queue.get()

            if event_type == "connection":
                cor = "#50fa7b" if "Conectado" in payload else "#ff5555"
                if "Desconectado" in payload: cor = "#888888"
                self.lbl_connection.config(text=payload, fg=cor)
            elif event_type == "log":
                self.add_log(payload)
            elif event_type == "metrics":
                self.update_metrics(payload)
            elif event_type == "waveform":
                self.update_graphs(payload)

        self.after(50, self.process_queue)

    def on_close(self):
        if self.serial_thread and self.serial_thread.running:
            self.serial_thread.stop()
        self.destroy()

if __name__ == "__main__":
    app = Dashboard()
    app.protocol("WM_DELETE_WINDOW", app.on_close)
    app.mainloop()