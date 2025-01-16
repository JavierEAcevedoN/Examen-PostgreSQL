INSERT INTO public.clientes 
(nombre, saldo, telefono, correo) 
VALUES
('Ignacio',120000.00,'45361272','Ignacio@postgrestest.com'),
('Kevin',60000.00,'32415424','Kevin@postgrestest.com'),
('Alvaro',300000.00,'5454323','Alvaro@postgrestest.com'),
('Javier',10000000.00,'21331221','Javier@postgrestest.com'),
('Carlos',50000.00,'44332311','Carlos@postgrestest.com');

INSERT INTO public.vehiculos
(marca, modelo, año, precio, estado, disponible)
VALUES
('Mercedes', 'Carro', '2012', 20000.00, 'nuevo', true),
('Lamborgini', 'Carro', '2025', 300000.00, 'nuevo', false),
('Lebel', 'Carro', '2022', 150000.00, 'usado', true),
('Buger', 'Carro', '2023', 423000.00, 'nuevo', false),
('Adidas', 'Carro', '2024', 125199.00, 'nuevo', true),
('Madkat', 'Carro', '1998', 234123.00, 'usado', false),
('Tesla', 'Carro', '1986', 22334.00, 'nuevo', true),
('Cart', 'Carro', '2015', 10000.00, 'nuevo', false);

INSERT INTO public.ventas
(id_cliente, id_vehiculo, fecha, total)
VALUES
( 2, 1, '2015-01-26 01:01:16', 20000.00),
( 2, 2, '2025-03-16 02:02:15', 300000.00),
( 4, 3, '2023-02-27 03:03:14', 150000.00),
( 4, 4, '2025-05-13 04:04:13', 423000.00),
( 5, 5, '2025-04-14 05:05:12', 125199.00),
( 5, 6, '2024-07-15 06:06:11', 234123.00),
( 5, 7, '2000-06-16 07:07:10', 22334.00),
( 5, 8, '2016-09-18 08:08:09', 10000.00),
( 2, 4, '2024-08-19 09:09:08', 423000.00),
( 4, 2, '2025-10-12 10:10:07', 300000.00);

INSERT INTO public.clientes_potenciales
(id_cliente, id_vehiculo, fecha)
VALUES
(1, 3, '2022-03-12'),
(3, 6, '2002-12-05');

INSERT INTO public.empleados
(nombre, telefono, correo, roles, fecha_contratacion)
VALUES
('Maria', '323414', 'Maria@empleado.xyz', 'mantenimiento', '2015-12-22 02:00:16'),
('Hugo', '4433121', 'Hugo@empleado.xyz', 'ventas', '2016-11-13 02:01:16'),
('Ana', '323123213', 'Ana@empleado.xyz', 'mantenimiento', '2017-05-26 07:01:16'),
('Elkin', '554332123', 'Elkin@empleado.xyz', 'ventas', '2018-05-16 12:01:14'),
('Mariana', '33441234', 'Mariana@empleado.xyz', 'mantenimiento', '2019-04-23 15:04:16');

INSERT INTO public.departamento_ventas
(id_empleado, id_venta, comisiones)
VALUES
(2, 1, 1000.00),
(4, 2, 5000.00),
(2, 3, 3000.00),
(4, 4, 10000.00),
(2, 5, 12000.00),
(4, 6, 20000.00),
(2, 7, 2000.00),
(4, 8, 1000.00),
(2, 9, 30000.00),
(4, 10, 70000.00);

INSERT INTO public.proveedores
(nombre, telefono, piezas)
VALUES
('Deiner', '44332124', 'partes de motor'),
('Parra', '54344534', 'chasis'),
('Dayana', '3123132', 'llantas'),
('Angel', '65453423', 'hidraulicos'),
('Sofia', '44332432', 'circuitos');

INSERT INTO public.historial_servicios
(id_empleado, id_vehiculo, id_proveedor, fecha)
VALUES
(1, 1, 1, '2014-01-26 01:01:16'),
(3, 2, 4, '2025-01-14 02:02:15'),
(5, 3, 2, '2022-02-27 03:03:14'),
(1, 4, 2, '2025-01-07 04:04:13'),
(3, 5, 5, '2025-01-03 05:05:12'),
(5, 6, 3, '2023-07-15 06:06:11'),
(1, 7, 3, '1999-06-16 07:07:10'),
(3, 8, 1, '2014-09-18 08:08:09'),
(5, 4, 4, '2023-08-19 09:09:08'),
(1, 2, 5, '2025-10-12 10:10:07');

INSERT INTO public.departamento_servicio
(id_empleado, id_hservicio, horario_inicio, horario_fin)
VALUES
(1, 1, '2014-01-26 00:30:00', '2014-01-26 05:00:00'),
(3, 2, '2025-01-14 01:30:00', '2025-01-14 06:00:00'),
(5, 3, '2022-02-27 02:30:00', '2022-02-27 07:00:00'),
(1, 4, '2025-01-07 03:30:00', '2025-01-07 08:00:00'),
(3, 5, '2025-01-03 04:30:00', '2025-01-03 09:00:00'),
(5, 6, '2023-07-15 05:30:00', '2023-07-15 10:00:00'),
(1, 7, '1999-06-16 06:30:00', '1999-06-16 11:00:00'),
(3, 8, '2014-09-18 07:30:00', '2014-09-18 12:00:00'),
(5, 9, '2023-08-19 08:30:00', '2023-08-19 13:00:00'),
(1, 10, '2025-10-12 09:30:00', '2025-10-12 14:10:00');