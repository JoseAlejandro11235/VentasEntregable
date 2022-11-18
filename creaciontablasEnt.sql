USE db_venta

CREATE TABLE tb_clientes(
idcliente 		INT 		AUTO_INCREMENT,
nombre_cliente 		VARCHAR(40) 	NOT NULL,
apellido_cliente 	VARCHAR(40)	NOT NULL,
direccion_cliente 	VARCHAR(40)  	NOT NULL,
ruc_cliente 		CHAR(11) 	NOT NULL,
CONSTRAINT pk_idcliente PRIMARY KEY(idcliente),
CONSTRAINT un_ruc_cliente UNIQUE(ruc_cliente)

)ENGINE = INNODB CHARSET = utf8;


CREATE TABLE tb_empleados(
idempleado 		INT 		AUTO_INCREMENT,
nombres 		VARCHAR(40) 	NOT NULL,
apellidos		VARCHAR(40)	NOT NULL,
dni			VARCHAR(20)	NOT NULL,
fechac 			DATE 		NOT NULL,
CONSTRAINT pk_idempleado PRIMARY KEY(idempleado),
CONSTRAINT un_dni UNIQUE(dni)
)ENGINE = INNODB CHARSET = utf8;


CREATE TABLE tb_login(
idlogin			INT 		AUTO_INCREMENT,
idempleado		INT 		NOT NULL,
usuario			CHAR(15)	NOT NULL,
clave 			VARCHAR(60)	NOT NULL,
tipoacceso		CHAR(1)		NOT NULL DEFAULT 'C',
estado			CHAR(1)		NOT NULL DEFAULT '1',
created_at 		DATETIME	NOT NULL DEFAULT NOW(),
updated_at		DATETIME	NULL,
CONSTRAINT pk_idlogin PRIMARY KEY(idlogin),
CONSTRAINT fk_idempleado FOREIGN KEY(idempleado) REFERENCES tb_empleados(idempleado)
)ENGINE = INNODB CHARSET = utf8;

CREATE TABLE tb_tipo_material(
idtipomaterial 		INT 		AUTO_INCREMENT,
tipomaterial		VARCHAR(40)	NOT NULL,
CONSTRAINT pk_idtipomaterial PRIMARY KEY(idtipomaterial),
CONSTRAINT un_tipomaterial UNIQUE(tipomaterial)
)ENGINE = INNODB CHARSET = utf8;

CREATE TABLE tb_productos(
idproducto 		INT 		AUTO_INCREMENT,
idtipomaterial 		INT 		NOT NULL,
descripcion 		VARCHAR(60)	NOT NULL,
talla 			CHAR(3) 	NULL,
precio_unitario		FLOAT 		NOT NULL,
stock			INT 		NOT NULL,
created_at 		DATETIME	NOT NULL DEFAULT NOW(),
updated_at		DATETIME  	NULL,
CONSTRAINT pk_idproducto PRIMARY KEY(idproducto),
CONSTRAINT fk_idtipomaterial FOREIGN KEY (idtipomaterial) REFERENCES tb_tipo_material(idtipomaterial)
)ENGINE = INNODB CHARSET = utf8;

CREATE TABLE tb_ventas(
idventa 		INT 		AUTO_INCREMENT,
idcliente		INT 		NOT NULL,
idlogin			INT 		NOT NULL,
tipodocumento		VARCHAR(20)	NOT NULL,
num_serie		CHAR(11)	NOT NULL,
fecha_venta		DATE 		NULL,
total 			FLOAT 		NULL,
created_at		DATETIME	NOT NULL DEFAULT NOW(),
updated_at		DATETIME 	NULL,
CONSTRAINT pk_idventa PRIMARY KEY(idventa),
CONSTRAINT fk_idcliente FOREIGN KEY (idcliente) REFERENCES tb_clientes(idcliente),
CONSTRAINT fk_idlogin FOREIGN KEY(idlogin) REFERENCES tb_login(idlogin),
CONSTRAINT un_num_serie UNIQUE(num_serie),
CONSTRAINT chk_estado CHECK(estado IN ('1','0'))
)ENGINE = INNODB CHARSET = utf8;

CREATE TABLE tb_detalle_ventas(
iddetalleventa 		INT 		AUTO_INCREMENT,
idventa			INT 		NOT NULL,
idproducto 		INT 		NOT NULL,
cantidad		INT 		NOT NULL,
CONSTRAINT pk_iddetalleventa PRIMARY KEY(iddetalleventa),
CONSTRAINT fk_idventa FOREIGN KEY (idventa) REFERENCES tb_ventas(idventa),
CONSTRAINT fk_idproducto FOREIGN KEY (idproducto) REFERENCES tb_productos(idproducto),
CONSTRAINT chk_cantidad CHECK(cantidad > 0)
)ENGINE = INNODB CHARSET = utf8;





















