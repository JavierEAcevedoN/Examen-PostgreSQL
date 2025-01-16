-- 1. Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, incluyendo detalles como marca, modelo, y precio.
SELECT marca, modelo, precio FROM vehiculos WHERE disponible = true;
-- 2. Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, junto con la información de los vehículos adquiridos.
SELECT
    cl.nombre AS nombre_cliente,
    cl.telefono AS telefono_cliente,
    cl.correo AS correo_cliente,
    ven.fecha AS fecha_venta
FROM ventas ven
INNER JOIN clientes cl ON ven.id_cliente = cl.id
WHERE date_part('year', ven.fecha) BETWEEN date_part('year',current_timestamp + INTERVAL '-1 years') AND date_part('year',current_timestamp);
-- 3. Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.
SELECT
    ve.marca AS marca_vehiculo,
    ve.modelo AS modelo_vehiculo,
    ve.precio AS precio_vehiculo,
    hs.fecha AS fecha_servicio,
    em.nombre AS nombre_empleado,
    em.telefono AS telefono_empleado,
    em.correo AS correo_empleado
FROM historial_servicios hs
INNER JOIN vehiculos ve ON hs.id_vehiculo = ve.id
INNER JOIN empleados em ON hs.id_empleado = em.id
WHERE ve.id = 2;
-- 4. Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados en los servicios de mantenimiento.
SELECT nombre, telefono, piezas FROM proveedores;
-- 5. Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas en un período específico.
SELECT
    em.nombre AS nombre_empleado,
    em.telefono AS telefono_empleado,
    em.correo AS correo_empleado,
    dp.comisiones AS commision_empleado
FROM departamento_ventas dp
INNER JOIN empleados em ON dp.id_empleado = em.id;
-- 6. Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.
SELECT
    ve.marca AS marca_vehiculo,
    ve.modelo AS modelo_vehiculo,
    ve.precio AS precio_vehiculo,
    hs.fecha AS fecha_servicio,
    em.nombre AS nombre_empleado,
    em.telefono AS telefono_empleado,
    em.correo AS correo_empleado
FROM historial_servicios hs
INNER JOIN vehiculos ve ON hs.id_vehiculo = ve.id
INNER JOIN empleados em ON hs.id_empleado = em.id
WHERE em.id = 1;
-- 7. Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, proporcionando pistas valiosas para estrategias de marketing.
SELECT
    ve.marca AS marca_vehiculo,
    ve.modelo AS modelo_vehiculo,
    ve.precio AS precio_vehiculo,
    cp.fecha AS fecha_registro,
    cl.nombre AS nombre_cliente,
    cl.telefono AS telefono_cliente,
    cl.correo AS correo_cliente
FROM clientes_potenciales cp
INNER JOIN clientes cl ON cp.id_cliente = cl.id
INNER JOIN vehiculos ve ON cp.id_vehiculo = ve.id;
-- 8. Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen al departamento de servicio, junto con sus horarios de trabajo.
SELECT
    em.nombre AS nombre_empleado,
    em.telefono AS telefono_empleado,
    em.correo AS correo_empleado,
    ds.horario_inicio AS horario_inicio,
    ds.horario_fin AS horario_fin
FROM departamento_servicio ds
INNER JOIN empleados em ON ds.id_empleado = em.id;
-- 9. Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de precios específico, proporcionando datos útiles para análisis de ventas.
SELECT
    ve.marca AS marca_vehiculo,
    ve.modelo AS modelo_vehiculo,
    ve.precio AS precio_vehiculo,
    ven.total AS total_venta,
    ven.fecha AS fecha_venta
FROM ventas ven
INNER JOIN vehiculos ve ON ven.id_vehiculo = ve.id
WHERE ven.total BETWEEN 100000.00 AND 300000.00;
-- 10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra en el concesionario, destacando la lealtad del cliente.
SELECT
    cl.nombre AS nombre_cliente,
    cl.telefono AS telefono_cliente,
    cl.correo AS correo_cliente,
    count(ven.id_vehiculo) AS cantidad_compras,
    CASE 
        WHEN count(ven.id_vehiculo) > 3 THEN 'leal'
        WHEN count(ven.id_vehiculo) > 2 THEN 'constante'
        ELSE 'reciente' 
    END AS lealtad
FROM ventas ven
INNER JOIN clientes cl ON ven.id_cliente = cl.id
GROUP BY cl.id
HAVING count(ven.id_vehiculo) > 1;