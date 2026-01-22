import os
import subprocess

ICONO = r"C:\Users\Usuario\Downloads\corazoncito.ico"
UNIDADES = [r"C:\", r"D:\"]

def asignar_icono(carpeta):
    desktop_ini = os.path.join(carpeta, "desktop.ini")

    contenido = "[.ShellClassInfo]\nIconResource={},0\n".format(ICONO)

    with open(desktop_ini, "w", encoding="ascii") as f:
        f.write(contenido)

    subprocess.run(["attrib", "+h", "+s", desktop_ini], shell=True)
    subprocess.run(["attrib", "+r", carpeta], shell=True)

for unidad in UNIDADES:
    for root, dirs, files in os.walk(unidad):
        for d in dirs:
            ruta = os.path.join(root, d)
            try:
                asignar_icono(ruta)
            except:
                pass

print("✔ Icono aplicado a todas las carpetas encontradas.")
