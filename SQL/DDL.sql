-- crear la base de datos con el nombre 'consesionaria'

CREATE TABLE IF NOT EXISTS "clientes" (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(128) NOT NULL,
    saldo NUMERIC(10,2) NOT NULL,
    telefono VARCHAR(16) NOT NULL UNIQUE,
    correo VARCHAR(32) NOT NULL UNIQUE
);

CREATE TYPE estado_vehiculos AS ENUM ('nuevo','usado');

CREATE TABLE IF NOT EXISTS "vehiculos" (
    id SERIAL PRIMARY KEY,
    marca VARCHAR(128) NOT NULL,
    modelo VARCHAR(128) NOT NULL,
    año VARCHAR(4) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    estado estado_vehiculos NOT NULL,
    disponible BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS "ventas" (
    id SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    total NUMERIC(10,2) NOT NULL, 
    Foreign Key (id_cliente) REFERENCES clientes(id),
    Foreign Key (id_vehiculo) REFERENCES vehiculos(id)
);

CREATE TABLE IF NOT EXISTS "clientes_potenciales" (
    id SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    fecha DATE NOT NULL,
    Foreign Key (id_cliente) REFERENCES clientes(id),
    Foreign Key (id_vehiculo) REFERENCES vehiculos(id)
);

CREATE TYPE roles_empleados AS ENUM ('mantenimiento','ventas');

CREATE TABLE IF NOT EXISTS "empleados" (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(128) NOT NULL,
    telefono VARCHAR(16) NOT NULL,
    correo VARCHAR(32) NOT NULL,
    roles roles_empleados NOT NULL,
    fecha_contratacion TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "departamento_ventas" (
    id SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_venta INT NOT NULL,
    comisiones NUMERIC(10,2) NOT NULL,
    Foreign Key (id_empleado) REFERENCES empleados(id),
    Foreign Key (id_venta) REFERENCES ventas(id)
);

CREATE TABLE IF NOT EXISTS "proveedores" (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(128) NOT NULL,
    telefono VARCHAR(16) NOT NULL UNIQUE,
    piezas TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "historial_servicios" (
    id SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_vehiculo INT NOT NULL,
    id_proveedor INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    Foreign Key (id_empleado) REFERENCES empleados(id),
    Foreign Key (id_vehiculo) REFERENCES vehiculos(id),
    Foreign Key (id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE IF NOT EXISTS "departamento_servicio" (
    id SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_hservicio INT NOT NULL,
    horario_inicio TIMESTAMP NOT NULL,
    horario_fin TIMESTAMP NOT NULL,
    Foreign Key (id_empleado) REFERENCES empleados(id),
    Foreign Key (id_hservicio) REFERENCES historial_servicios(id)
);