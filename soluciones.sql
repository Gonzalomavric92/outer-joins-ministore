-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Gonzalo Mavric
-- Fecha: 07-09-26
-- ══════════════════════════════════════════
-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Los productos del catálogo que nunca fueron vendidos son Hub USB-C 7p y Parlante Bluetooth.
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT productos.nombre, ventas.venta_id
FROM productos
LEFT JOIN ventas ON productos.producto_id = ventas.producto_id
WHERE ventas.venta_id IS NULL;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos que no figuran en nuestro catálogo? (posible error de carga de datos)
-- La venta con id_venta número 10 tiene un id_producto de 999. Es un posible error de carga ya que dicho id_producto no se encuentra dentro de la tabla de productos
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT ventas.venta_id, ventas.producto_id, productos.nombre
FROM productos
RIGHT JOIN ventas ON productos.producto_id = ventas.producto_id
WHERE productos.producto_id IS NULL;

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT ventas.venta_id, ventas.producto_id, ventas.fecha_venta, productos.nombre
FROM ventas
FULL OUTER JOIN productos ON productos.producto_id = ventas.producto_id;
