SELECT * FROM Productos;
-- del id '1' hay '1' en stock
CALL actualizarInventario(1, 1);
-- comprobar que se ha restado
SELECT * FROM Productos;
-- del id '1' hay '0' en stock
CALL actualizarInventario(1, 1);