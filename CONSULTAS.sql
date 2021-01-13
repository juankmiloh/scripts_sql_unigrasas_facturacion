-- Cantidad de producto vendido de un item
SELECT I.NOMBRE, SUM(FI.CANTIDAD) AS CANTIDAD FROM FACTURA F, FACTURA_HAS_ITEM FI, ITEM I
WHERE F.IDFACTURA = FI.IDFACTURA
AND FI.IDITEM = I.IDITEM
AND F.IDESTADO = 1
AND F.IDCLIENTE = 5
GROUP BY F.IDESTADO, I.NOMBRE
ORDER BY F.IDFACTURA DESC;