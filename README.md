# ExamenPostgreSQL
# 📄 Proyecto: MOVIERENTAL – Gestión de Alquiler de Películas
## 📝 Descripción
Este proyecto consiste en el diseño de una base de datos para una empresa que gestiona el alquiler de películas. El objetivo es permitir un manejo eficiente de clientes, películas, pagos, sucursales y más, facilitando consultas e informes útiles para la operación del negocio.

### 🧱 Especificaciones del sistema
- Clientes: Información personal como nombre, dirección, teléfono, correo, etc.

- Películas: Título, género, duración, disponibilidad y precio.

- Alquileres: Fecha de inicio y devolución, cliente que alquila, y película alquilada.

- Pagos: Fecha, monto y cliente relacionado.

- Categorías: Clasificación de las películas.

- Sucursales: Información sobre las distintas ubicaciones.

- Inventario: Relación entre películas y sucursales (existencias por sucursal).

### 📦 Entregables del Examen
- Modelo ER
- Diagrama Entidad-Relación con entidades, relaciones, atributos y cardinalidades.

- Estructura de la Base de Datos
- Scripts SQL para crear tablas con claves primarias, foráneas, restricciones (NOT NULL, UNIQUE, CHECK, etc.).

- Archivos de Inserción de Datos
- Conjunto de registros de ejemplo representativos (clientes, películas, alquileres, pagos...).

- Consultas SQL
- Consultas útiles como:

- Películas más alquiladas.

- Clientes frecuentes.

- Total recaudado.

- Promedio mensual de alquileres.

- Clientes que alquilaron en los 12 meses del año, etc.

- Informe de Almacenado
Procedimiento que registre un nuevo alquiler, incluyendo verificación de disponibilidad, inserción en alquiler, y creación automática del pago.

### 🛠️ Tecnologías
- PostgreSQL

- SQL puro
