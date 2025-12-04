import mysql.connector

conexion = mysql.connector.connect(
    host="localhost",
    user="Tiago",
    password="123456",
    database="Ventas"
)

cursor = conexion.cursor()


def pausar():
    input("\nPresiona ENTER para continuar...")

def ejecutar_procedimiento(nombre, parametros=None):
    
    if parametros is None:
        cursor.callproc(nombre)
    else:
        cursor.callproc(nombre, parametros)

    resultados = []
    for r in cursor.stored_results():
        resultados.extend(r.fetchall())

    return resultados

# MENU PRODUCTOS
def menu_productos():
    while True:
        print("\n=== Gestión de Productos ===")
        print("1. Ver productos")
        print("2. Ver producto por ID")
        print("3. Agregar producto")
        print("4. Actualizar producto")
        print("5. Eliminar producto")
        print("0. Volver")
        opcion = input("Seleccione opción: ")

        if opcion == "1":
            filas = ejecutar_procedimiento("ver_productos")
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "2":
            p_id = int(input("Ingrese ID: "))
            filas = ejecutar_procedimiento("ver_producto_por_id", [p_id])
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "3":
            p_id = int(input("ID: "))
            nombre = input("Nombre: ")
            desc = input("Descripción: ")
            precio = float(input("Precio: "))
            stock = int(input("Stock: "))
            ejecutar_procedimiento("agregar_producto", [p_id, nombre, desc, precio, stock])
            conexion.commit()
            print("Producto agregado correctamente.")
            pausar()

        elif opcion == "4":
            p_id = int(input("ID: "))
            precio = float(input("Nuevo precio: "))
            stock = int(input("Nuevo stock: "))
            ejecutar_procedimiento("actualizar_producto", [p_id, precio, stock])
            conexion.commit()
            print("Producto actualizado.")
            pausar()

        elif opcion == "5":
            p_id = int(input("ID a eliminar: "))
            ejecutar_procedimiento("eliminar_producto", [p_id])
            conexion.commit()
            print("Producto eliminado.")
            pausar()

        elif opcion == "0":
            return

# MENU CLIENTES
def menu_clientes():
    while True:
        print("\n=== Gestión de Clientes ===")
        print("1. Ver clientes")
        print("2. Ver cliente por DNI")
        print("3. Registrar cliente")
        print("4. Actualizar cliente")
        print("5. Actualizar contacto")
        print("0. Volver")
        opcion = input("Seleccione opción: ")

        if opcion == "1":
            filas = ejecutar_procedimiento("VerClientes")
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "2":
            dni = int(input("DNI: "))
            filas = ejecutar_procedimiento("VerClientePorDNI", [dni])
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "3":
            datos = [
                int(input("DNI: ")),
                input("Nombre: "),
                input("Apellido: "),
                input("Email: "),
                input("Teléfono: "),
                input("Dirección: "),
                input("Ciudad: ")
            ]
            ejecutar_procedimiento("registrar_cliente", datos)
            conexion.commit()
            print("Cliente registrado.")
            pausar()

        elif opcion == "4":
            datos = [
                int(input("DNI: ")),
                input("Nombre: "),
                input("Apellido: "),
                input("Email: "),
                input("Teléfono: "),
                input("Dirección: "),
                input("Ciudad: ")
            ]
            ejecutar_procedimiento("actualizar_cliente", datos)
            conexion.commit()
            print("Cliente actualizado.")
            pausar()

        elif opcion == "5":
            dni = int(input("DNI: "))
            email = input("Nuevo Email: ")
            tel = input("Nuevo Teléfono: ")
            dirc = input("Nueva Dirección: ")
            ciu = input("Nueva Ciudad: ")
            ejecutar_procedimiento("ActualizarContactoCliente", [dni, email, tel, dirc, ciu])
            conexion.commit()
            print("Contacto actualizado.")
            pausar()

        elif opcion == "0":
            return


# MENU ORDENES Y REPORTES
def menu_ordenes():
    while True:
        print("\n=== Procesamiento y Reportes ===")
        print("1. Mostrar órdenes de un cliente")
        print("2. Productos más vendidos")
        print("3. Producto más vendido")
        print("4. Ajustar cantidad máxima de producto")
        print("0. Volver")
        opcion = input("Opción: ")

        if opcion == "1":
            dni = int(input("DNI del cliente: "))
            filas = ejecutar_procedimiento("MostrarOrdenesDeCliente", [dni])
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "2":
            filas = ejecutar_procedimiento("ProductosMasVendidos")
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "3":
            filas = ejecutar_procedimiento("ProductoMasVendido")
            for fila in filas:
                print(fila)
            pausar()

        elif opcion == "4":
            pid = int(input("ID Producto: "))
            maxc = int(input("Cantidad máxima: "))
            ejecutar_procedimiento("AjustarCantidadMaxima_Cursor", [pid, maxc])
            conexion.commit()
            print("Cantidades ajustadas.")
            pausar()

        elif opcion == "0":
            return

# MAIN
def main():
    while True:
        print("\n===== SISTEMA DE VENTAS EN LÍNEA =====")
        print("1. Gestión de Productos")
        print("2. Gestión de Clientes")
        print("3. Procesamiento y Reportes")
        print("0. Salir")

        opcion = input("Seleccione opción: ")

        if opcion == "1":
            menu_productos()
        elif opcion == "2":
            menu_clientes()
        elif opcion == "3":
            menu_ordenes()
        elif opcion == "0":
            print("\nGracias por usar el sistema!")
            cursor.close()
            conexion.close()
            break


if __name__ == "__main__":
    main()