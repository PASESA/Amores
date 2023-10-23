from datetime import datetime, date, timedelta
from tkinter import messagebox as mb

from escpos.printer import Usb, USBNotFoundError

import tkinter as tk
from tkinter import ttk
from tkinter import messagebox as mb
from tkinter import scrolledtext as st

from tkinter import *
from tkinter import simpledialog

from operacion import Operacion
import xlsxwriter

penalizacion_con_importe = False
from dateutil.relativedelta import relativedelta
from view_login import View_Login
from queries import Pensionados
from view_agregar_pensionado import View_agregar_pensionados
from view_modificar_pensionado import View_modificar_pensionados
import traceback
import math

import atexit

###--###
data_printer = (0x04b8, 0x0e15, 0)

contraseña_pensionados = "P4s3"

valor_tarjeta = 116
valor_reposiion_tarjeta = 232
penalizacion_diaria_pension = 0

logo_1 = "LOGO1.jpg"
AutoA = "AutoA.png"

qr_imagen = "reducida.png"
PROMOCIONES = ('prom 1')

nombre_estacionamiento = 'Amores'

estilo = ('Arial', 12)
font_entrada = ('Arial', 20)
font_entrada_negritas = ('Arial', 20, 'bold')
font_reloj = ('Arial', 65)
font_mensaje = ('Arial', 40)

from controller_email import main
send_data = False

class FormularioOperacion:
    def __init__(self):
        if send_data:
            atexit.register(main)

        self.controlador_crud_pensionados = Pensionados()
        self.folio_auxiliar = None

        self.DB=Operacion()
        self.ventana1=tk.Tk()
        self.ventana1.title(f"{nombre_estacionamiento} COBRO")
        self.cuaderno1 = ttk.Notebook(self.ventana1)
        # Asociar el evento <<NotebookTabChanged>> a la función on_tab_changed
        self.cuaderno1.config(cursor="")         # Tipo de cursor
        self.ExpedirRfid()
        self.check_inputs()

        self.cuaderno1.grid(column=0, row=0, padx=5, pady=2)
        self.ventana1.mainloop()
        ###########################Inicia Pagina1##########################

    def ExpedirRfid(self):
        seccion_entrada = tk.Frame(self.cuaderno1)
        self.cuaderno1.add(seccion_entrada, text="Expedir Boleto")

        seccion_entrada = tk.Frame(seccion_entrada)
        seccion_entrada.grid(column=0, row=0, padx=5, pady=2, sticky=tk.NSEW)

        frame_bienvenida = tk.Frame(seccion_entrada)
        frame_bienvenida.grid(column=0, row=0, padx=5, pady=2)

        frame_mensaje_bienvenida = tk.Frame(frame_bienvenida)
        frame_mensaje_bienvenida.grid(column=0, row=0, padx=5, pady=2)

        # Asegura que la fila y la columna del frame se expandan con el contenedor
        frame_mensaje_bienvenida.grid_rowconfigure(0, weight=1)
        frame_mensaje_bienvenida.grid_columnconfigure(0, weight=1)

        label_entrada = tk.Label(frame_mensaje_bienvenida, text="Bienvenido(a) al estacionamiento Amores", font=font_entrada)
        label_entrada.grid(row=0, column=0, sticky="nsew")



        frame_datos_entrada = tk.Frame(seccion_entrada)
        frame_datos_entrada.grid(column=0, row=1, padx=5, pady=2)

        frame_info_cliente=tk.Frame(frame_datos_entrada)
        frame_info_cliente.grid(column=0, row=0, padx=5, pady=2)

        frame_info_placa=tk.Frame(frame_info_cliente)
        frame_info_placa.grid(column=0, row=0, padx=5, pady=2)

        label_placa=tk.Label(frame_info_placa, text="Ingrese Placa o lea Tarjetón", font= font_entrada)
        label_placa.grid(column=0, row=0, padx=5, pady=2)

        self.Placa=tk.StringVar()
        self.entry_placa=tk.Entry(frame_info_placa, width=20, textvariable=self.Placa, font=('Arial', 28, 'bold'), justify='center')
        self.entry_placa.bind('<Return>', self.Pensionados)
        self.entry_placa.grid(column=0, row=1, padx=5, pady=2)



        frame_boton=tk.Frame(frame_datos_entrada)
        frame_boton.grid(column=2, row=0, padx=5, pady=2)

        frame_folio = tk.Frame(frame_boton)
        frame_folio.grid(column=0, row=0, padx=5, pady=2)

        label_folio=tk.Label(frame_folio, text="Folio:", font=font_entrada)
        label_folio.grid(column=0, row=0, padx=5, pady=2, sticky="nsew")
        self.MaxId=tk.StringVar()
        entryMaxId=ttk.Entry(frame_folio, width=12, textvariable=self.MaxId, state="readonly", font=font_entrada)
        entryMaxId.grid(column=1, row=0, padx=5, pady=2, sticky=tk.NW)

        boton_entrada=tk.Button(frame_boton, text="Generar Entrada", width=15, height=3, anchor="center", background="red", font=font_entrada_negritas, command=self.agregarRegistroRFID)
        boton_entrada.grid(column=0, row=1, padx=5, pady=2)
        


        frame_info = tk.Frame(seccion_entrada)#, background = '#CCC')
        frame_info.grid(column=0, row=2, padx=5, pady=2)

        self.label_informacion = tk.Label(frame_info, text="... ", width=25, font=font_mensaje, justify='center')
        self.label_informacion.grid(column=0, row=0, padx=5, pady=2)



        frame_reloj = tk.Frame(seccion_entrada)
        frame_reloj.grid(column=0, row=3, padx=5, pady=2)

        self.Reloj = tk.Label(frame_reloj, text="Reloj", background="white", font=font_reloj)
        self.Reloj.grid(column=0, row=0, padx=5, pady=2)
        self.entry_placa.focus()


    def check_inputs(self):
        fecha_hora =datetime.now().strftime("%d-%b-%Y %H:%M:%S")
        self.Reloj.config(text=fecha_hora)            
        self.ventana1.after(60, self.check_inputs)



    def agregarRegistroRFID(self):pass
    def Pensionados(self):pass


FormularioOperacion()





















































# # class TuClase:
# #     def __init__(self):
# #         self.dias_dentro = 0
# #         self.horas_dentro = 12
# #         self.minutos_dentro = 1

# #         # Define el diccionario de tarifas
# #         self.tarifas = {
# #             "Normal": {
# #                 "hora_base": 28,
# #                 "cuarto_hora": 7,
# #                 "max_horas": 12.25,  # Nuevo límite de horas
# #                 "dia_completo": 250,
# #                 "max_horas_tarifa": 100
# #             },

# #             # Agrega más tarifas según sea necesario
# #         }

# #     def calcular_tarifa(self):
# #         if self.dias_dentro == 0 and self.horas_dentro == 0:
# #             return self.tarifas["Normal"]["hora_base"]

# #         # Calcula el tiempo en horas, incluyendo cuartos de hora
# #         tiempo_en_horas = self.horas_dentro + self.minutos_dentro / 60

# #         cuarto_hora = (tiempo_en_horas - int(tiempo_en_horas)) * 4  # Calcula el cuarto de hora

# #         for tarifa, info in self.tarifas.items():
# #             if tiempo_en_horas <= info["max_horas"]:
# #                 importe = tiempo_en_horas * info["hora_base"] + cuarto_hora * info["cuarto_hora"]
# #                 if self.dias_dentro > 0:
# #                     importe += info["dia_completo"] * self.dias_dentro
# #                 return importe

# #         return self.tarifas["Normal"]["max_horas_tarifa"] + info["dia_completo"] * self.dias_dentro

# # print(TuClase().calcular_tarifa())

