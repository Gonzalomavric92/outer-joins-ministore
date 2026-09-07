1 - En la Consulta 1 se utilizó LEFT JOIN porque se quiere identificar qué productos no tienen ninguna venta registrada.

La tabla que queda a la izquierda es productos, por lo que LEFT JOIN permite conservar todos los productos, incluso aquellos que no tienen coincidencias en ventas. 
Luego, mediante WHERE ventas.venta_id IS NULL, se seleccionan solamente los productos que nunca fueron vendidos.

Si utilizáramos INNER JOIN, solo aparecerían los productos que tienen al menos una venta, por lo que no podríamos detectar los productos sin ventas.

En este caso, con los datos proporcionados, por ejemplo, los productos 108 - Hub USB-C 7p y 109 - Parlante Bluetooth no aparecen en ventas. Por eso la Consulta 1 permite 
identificarlos.

2 - Se utilizó RIGHT JOIN porque queremos conservar todas las ventas, incluso aquellas que no tienen un producto correspondiente en la tabla productos.

Como lo que se quiere es conservar todas las ventas, la tabla de la derecha es la de ventas y la tabla de la izquierda es la de productos.

3 - En la Consulta 1, ventas.venta_id aparece como NULL cuando un producto no tiene ninguna venta asociada.Esto significa que el producto Hub USB-C 7p existe en productos, 
pero no existe ninguna fila en ventas con producto_id = 108 ni producto_id = 109.

En la Consulta 2, productos.producto_id aparece como NULL cuando existe una venta cuyo producto no existe en la tabla productos. Esto significa que existe la venta número 
10, pero el producto 999 no está registrado en la tabla productos.

4 - Utilizaría FULL OUTER JOIN cuando necesito comparar dos conjuntos de información y detectar tanto las coincidencias como los registros que existen solamente en una de 
las dos tablas.

Por ejemplo, en un negocio podría utilizarse para comparar:

> productos registrados en el sistema de ventas vs. productos registrados en el sistema de inventario;
> clientes registrados en un CRM vs. clientes que realizaron compras;
> facturas emitidas vs. pagos registrados;
> productos de un catálogo actual vs. productos de un catálogo anterior.
