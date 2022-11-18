-- PROCEDIMIENTOS ALMACENADOS PARA LA TABLA CLIENTES

-- VISTA DE CLIENTES
CREATE VIEW v_listado_clientes AS 
SELECT * FROM tb_clientes;

SELECT * FROM v_listado_clientes;  

-- LISTAR CLIENTES
DELIMITER $$
CREATE PROCEDURE sp_listar_clientes()
BEGIN
	SELECT * FROM v_listado_clientes;
END $$

CALL sp_listar_clientes();

-- OBTENER CLIENTES
DELIMITER $$
CREATE PROCEDURE sp_obtener_clientes(
IN idcliente_ INT
)
BEGIN
	SELECT * FROM tb_clientes
	WHERE idcliente = idcliente_;
END $$

CALL sp_obtener_clientes(2)

-- INSERTAR CLIENTES 
DELIMITER $$
CREATE PROCEDURE sp_insertar_clientes(
IN nombre_cliente_ 	VARCHAR(40),
IN apellido_cliente_ 	VARCHAR(40),
IN direccion_cliente_ 	VARCHAR(40),
IN ruc_cliente_ 	CHAR(11)
)
BEGIN 
	INSERT INTO tb_clientes(nombre_cliente,apellido_cliente,direccion_cliente,ruc_cliente)
	VALUES(nombre_cliente_,apellido_cliente_,direccion_cliente_,ruc_cliente_);
END $$

CALL sp_insertar_clientes('Jorge','Quiroz','Calle amazonas 5460', '95412658713')

-- MODIFICAR CLIENTES
DELIMITER $$
CREATE PROCEDURE sp_modificar_clientes(
IN idcliente_		INT,
IN nombre_cliente_ 	VARCHAR(40),
IN apellido_cliente_ 	VARCHAR(40),
IN direccion_cliente_ 	VARCHAR(40),
IN ruc_cliente_ 	CHAR(11)
)
BEGIN
	UPDATE tb_clientes SET
	nombre_cliente = nombre_cliente_,
	apellido_cliente = apellido_cliente_,
	direccion_cliente = direccion_cliente_,
	ruc_cliente = ruc_cliente_
	WHERE idcliente = idcliente_;
END$$

CALL sp_modificar_clientes(3,'Renato','Nuñes','Calle tupac amaru 4560','65841257458')

-- ELIMAR CLIENTES
DELIMITER $$
CREATE PROCEDURE sp_eliminar_clientes(
IN idcliente_ INT
)
BEGIN
DELETE FROM tb_clientes WHERE idcliente = idcliente_;
END $$

CALL sp_eliminar_clientes(4)

-- TABLA MÁS IMPORTANTE
-- TABLA DONDE USAREMOS LOS PROCEDIMIENTOS PARA PODER IMPRIMIR LA FACTURA
-- PROCEDIMIENTOS ALMACENADOS TABLA DETALLE VENTAS

-- VISTA DE DETALLE VENTAS
CREATE VIEW v_listado_detalle_ventas AS 
SELECT 
d.*,
v.num_serie,
p.descripcion,
p.precio_unitario,
(p.precio_unitario*d.cantidad) precio_parcial
FROM tb_detalle_ventas d
INNER JOIN tb_ventas v ON d.idventa = v.idventa
INNER JOIN tb_productos p ON d.idproducto = p.idproducto;

SELECT * FROM v_listado_detalle_ventas;  

-- PROCEDIMIENTOS DEL RESULTADO DETALLE VENTAS

DELIMITER $$
CREATE PROCEDURE sp_obtener_resultado()
BEGIN
	SELECT SUM(precio_parcial)*0.72 AS SUBTOTAL, SUM(precio_parcial)*0.18 AS IGV, SUM(precio_parcial) AS TOTAL FROM v_listado_detalle_ventas;
END$$

CALL sp_obtener_resultado()


-- LISTAR DETALLE VENTAS
DELIMITER $$
CREATE PROCEDURE sp_listar_detalle_ventas()
BEGIN
	SELECT * FROM v_listado_detalle_ventas;
END $$

CALL sp_listar_detalle_ventas();

-- OBTENER DETALLE VENTAS
DELIMITER $$
CREATE PROCEDURE sp_obtener_detalle_ventas(
IN iddetalleventa_ INT
)
BEGIN
	SELECT * FROM tb_detalle_ventas
	WHERE iddetalleventa = iddetalleventa_;
END $$

CALL sp_obtener_detalle_ventas(1)

-- INSERTAR DETALLE VENTAS 
DELIMITER $$
CREATE PROCEDURE sp_insertar_detalle_ventas(
IN idventa_	INT,
IN idproducto_	INT,
IN cantidad_	INT
)
BEGIN 
	INSERT INTO tb_detalle_ventas(idventa,idproducto,cantidad)
	VALUES(idventa_,idproducto_,cantidad_);
END $$

CALL sp_insertar_detalle_ventas(1,3,5)


-- MODIFICAR DETALLE VENTAS
DELIMITER $$
CREATE PROCEDURE sp_modificar_detalle_ventas(
IN iddetalleventa_ 	INT,
IN idventa_		INT,
IN idproducto_		INT,
IN cantidad_		INT
)
BEGIN
	UPDATE tb_detalle_ventas SET
	idventa = idventa_,
	idproducto = idproducto_,
	cantidad = cantidad_
	WHERE iddetalleventa = iddetalleventa_;
END$$

CALL sp_modificar_detalle_ventas(3,2,1,2)

-- ELIMAR DETALLE VENTAS
DELIMITER $$
CREATE PROCEDURE sp_eliminar_detalle_ventas(
IN iddetalleventa_ INT
)
BEGIN
DELETE FROM tb_detalle_ventas WHERE iddetalleventa = iddetalleventa_;
END $$

CALL sp_eliminar_detalle_ventas(4)

-- PROCEDIMIENTOS ALMACENADOS PARA LA TABLA EMPLEADOS

-- VISTA DE EMPLEADOS
CREATE VIEW v_listado_empleados AS 
SELECT * FROM tb_empleados;

SELECT * FROM v_listado_empleados; 

-- LISTAR EMPLEADOS
DELIMITER $$
CREATE PROCEDURE sp_listar_empleados()
BEGIN
	SELECT * FROM v_listado_empleados;
END $$

CALL sp_listar_empleados();

-- OBTENER EMPLEADOS
DELIMITER $$
CREATE PROCEDURE sp_obtener_empleados(
IN idempleado_ INT
)
BEGIN
	SELECT * FROM tb_empleados
	WHERE idempleado = idempleado_;
END $$

CALL sp_obtener_empleados(2)

-- INSERTAR EMPLEADOS
DELIMITER $$
CREATE PROCEDURE sp_insertar_empleados(
IN nombres_ 	VARCHAR(40),
IN apellidos_	VARCHAR(40),
IN dni_ 	VARCHAR(20),
IN fechac_ 	DATE
)
BEGIN 
	INSERT INTO tb_empleados(nombres,apellidos,dni,fechac)
	VALUES(nombres_,apellidos_,dni_,fechac_);
END $$

CALL sp_insertar_empleados('Benito','Perez','79541236', '2000-08-15')

-- MODIFICAR EMPLEADOS
DELIMITER $$
CREATE PROCEDURE sp_modificar_empleados(
IN idempleado_	INT,
IN nombres_ 	VARCHAR(40),
IN apellidos_	VARCHAR(40),
IN dni_ 	VARCHAR(20),
IN fechac_ 	DATE
)
BEGIN
	UPDATE tb_empleados SET
	nombres = nombres_,
	apellidos = apellidos_,
	dni = dni_,
	fechac = fechac_
	WHERE idempleado = idempleado_;
END$$

CALL sp_modificar_empleados(4,'Rodrigo','Perez','79541252', '2000-11-18')

-- ELIMAR EMPLEADOS
DELIMITER $$
CREATE PROCEDURE sp_eliminar_empleados(
IN idempleado_ INT
)
BEGIN
DELETE FROM tb_empleados WHERE idempleado = idempleado_;
END $$

CALL sp_eliminar_empleados(4)

-- PROCEDIMIENTOS ALMACENADOS PARA LA TABLA LOGIN

-- VISTA DE LOGIN
CREATE VIEW v_listado_login AS 
SELECT * FROM tb_login;

SELECT * FROM v_listado_login;  

-- LISTAR LOGIN
DELIMITER $$
CREATE PROCEDURE sp_listar_login()
BEGIN
	SELECT * FROM v_listado_login;
END $$

CALL sp_listar_login();

-- OBTENER LOGIN
DELIMITER $$
CREATE PROCEDURE sp_obtener_login(
IN idlogin_ INT
)
BEGIN
	SELECT * FROM tb_login
	WHERE idlogin = idlogin_;
END $$

CALL sp_obtener_login(2)

-- INSERTAR LOGIN
DELIMITER $$
CREATE PROCEDURE sp_insertar_login(
IN idempleado_ 		INT,
IN usuario_	 	CHAR(15),
IN clave_	 	VARCHAR(60),
IN tipoacceso_	 	CHAR(1),
IN estado_		CHAR(1)
)
BEGIN 
	INSERT INTO tb_login(idempleado,usuario,clave,tipoacceso,estado,updated_at)
	VALUES(idempleado_,usuario_,clave_,tipoacceso_,estado_,CURRENT_TIMESTAMP());
END $$

CALL sp_insertar_login(4,'ren@gmail.com','1011', 'I','1')

-- MODIFICAR LOGIN
DELIMITER $$
CREATE PROCEDURE sp_modificar_login(
IN idlogin_		INT,
IN clave_	 	VARCHAR(60),
IN tipoacceso_	 	CHAR(1),
IN estado_		CHAR(1)
)
BEGIN
	UPDATE tb_login SET
	clave = clave_,
	tipoacceso = tipoacceso_,
	estado = estado_
	WHERE idlogin = idlogin_;
END$$

CALL sp_modificar_login(1,'125','A','0')

-- ELIMAR LOGIN
DELIMITER $$
CREATE PROCEDURE sp_eliminar_login(
IN idlogin_ INT
)
BEGIN
DELETE FROM tb_login WHERE idlogin = idlogin_;
END $$

CALL sp_eliminar_login(4)

-- PROCEDIMIENTOS PARA LA TABLA PRODUCTOS

-- VISTA PRODUCTOS
CREATE VIEW v_listado_productos AS 
SELECT * FROM tb_productos p;

SELECT * FROM v_listado_productos;  

-- LISTAR PRODUCTOS
DELIMITER $$
CREATE PROCEDURE sp_listar_productos()
BEGIN
	SELECT * FROM v_listado_productos;
END $$

CALL sp_listar_productos();

-- OBTENER PRODUCTOS
DELIMITER $$
CREATE PROCEDURE sp_obtener_productos(
IN idproducto_ INT
)
BEGIN
	SELECT * FROM tb_productos
	WHERE idproducto = idproducto_;
END $$


CALL sp_obtener_productos(2)

-- INSERTAR PRODUCTOS
DELIMITER $$
CREATE PROCEDURE sp_insertar_productos(
IN idtipomaterial_ 	INT,
IN descripcion_	 	VARCHAR(60),
IN talla_ 		CHAR(3),
IN precio_unitario_ 	FLOAT,
IN stock_		INT 
)
BEGIN 
	INSERT INTO tb_productos(idtipomaterial,descripcion,talla,precio_unitario,stock,created_at)
	VALUES(idtipomaterial_,descripcion_,talla_,precio_unitario_,stock_,CURRENT_TIMESTAMP);
END $$

CALL sp_insertar_productos(2,'Casaca','XL', 40, 90)

-- MODIFICAR PRODUCTOS
DELIMITER $$
CREATE PROCEDURE sp_modificar_productos(
IN idproducto_		INT,
IN idtipomaterial_ 	INT,
IN descripcion_	 	VARCHAR(60),
IN talla_ 		CHAR(3),
IN precio_unitario_ 	FLOAT,
IN stock_		INT
)
BEGIN
	UPDATE tb_productos SET
	idtipomaterial = idtipomaterial_,
	descripcion = descripcion_,
	talla = talla_,
	precio_unitario = precio_unitario_,
	stock = stock_,
	updated_at = CURRENT_TIMESTAMP()
	WHERE idproducto = idproducto_;
END$$

CALL sp_modificar_productos(2,3,'Pantalon','L',60,100)

-- ELIMAR PRODUCTOS
DELIMITER $$
CREATE PROCEDURE sp_eliminar_productos(
IN idproducto_ INT
)
BEGIN
DELETE FROM tb_productos WHERE idproducto = idproducto_;
END $$

CALL sp_eliminar_productos(4)

-- PROCEDIMIENTOS ALMACENADOS TABLA TIPO MATERIAL

-- VISTA DE TIPO MATERIAL
CREATE VIEW v_listado_tipo_material AS 
SELECT * FROM tb_tipo_material;

SELECT * FROM v_listado_tipo_material;  

-- LISTAR TIPO MATERIAL
DELIMITER $$
CREATE PROCEDURE sp_listar_tipo_material()
BEGIN
	SELECT * FROM v_listado_tipo_material;
END $$

CALL sp_listar_tipo_material();

-- OBTENER TIPO MATERIAL
DELIMITER $$
CREATE PROCEDURE sp_obtener_tipo_material(
IN idtipomaterial_ INT
)
BEGIN
	SELECT * FROM tb_tipo_material
	WHERE idtipomaterial = idtipomaterial_;
END $$

CALL sp_obtener_tipo_material(2)

-- INSERTAR TIPO MATERIAL
DELIMITER $$
CREATE PROCEDURE sp_insertar_tipo_material(
IN tipomaterial_	VARCHAR(40)
)
BEGIN 
	INSERT INTO tb_tipo_material(tipomaterial)
	VALUES(tipomaterial_);
END $$

CALL sp_insertar_tipo_material('cuero')

-- ELIMAR TIPO MATERIAL
DELIMITER $$
CREATE PROCEDURE sp_eliminar_tipo_material(
IN idtipomaterial_ INT
)
BEGIN
DELETE FROM tb_tipo_material WHERE idtipomaterial = idtipomaterial_;
END $$

CALL sp_eliminar_tipo_material(4)

-- PROCEDIMIENTOS ALMACENADOS PARA LA TABLA VENTAS
-- VISTA DE VENTAS
CREATE VIEW v_listado_ventas AS 
SELECT * FROM tb_ventas;

SELECT * FROM v_listado_ventas;  

-- LISTAR VENTAS
DELIMITER $$
CREATE PROCEDURE sp_listar_ventas()
BEGIN
	SELECT * FROM v_listado_ventas;
END $$

CALL sp_listar_ventas();

-- OBTENER VENTAS
DELIMITER $$
CREATE PROCEDURE sp_obtener_ventas(
IN idventa_ INT
)
BEGIN
	SELECT * FROM tb_ventas
	WHERE idventa = idventa_;
END $$

CALL sp_obtener_ventas(2)

-- INSERTAR VENTAS 
DELIMITER $$
CREATE PROCEDURE sp_insertar_ventas(
IN idcliente_	 	INT,
IN idlogin_	 	INT,
IN tipodocumento_ 	VARCHAR(20),
IN num_serie_		CHAR(11),
IN fecha_venta_		DATE,
IN total 		FLOAT
)
BEGIN 
	INSERT INTO tb_ventas(idcliente,idlogin,tipodocumento,num_serie,fecha_venta,created_at)
	VALUES(idcliente_,idlogin_,tipodocumento_,num_serie_,fecha_venta_,CURRENT_TIMESTAMP());
END $$

CALL sp_insertar_ventas(3,2,'DNI','003','2022-11-17',NULL)

-- ELIMAR VENTAS
DELIMITER $$
CREATE PROCEDURE sp_eliminar_ventas(
IN idventa_ INT
)
BEGIN
DELETE FROM tb_ventas WHERE idventa = idventa_;
END $$

CALL sp_eliminar_ventas(3)









