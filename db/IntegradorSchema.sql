create database INTEGRADOR_SOLO;

-- HAY QUE CREAR LAS TABLAS QUE NO TIENEN DEPENDENCIAS PRIMERO
-- LUEGO HAY QUE CREAR LAS QUE SE VINCULAN

create table ESTADOS (
	id_estado bigint auto_increment primary key,
	nombre VARCHAR(255));

create table FORMAPAGOS (
	id_formapago bigint auto_increment primary key,
	nombre varchar(255));

create table ROLES (
	id_rol bigint auto_increment primary key,
	nombre varchar(255));

create table CATEGORIAS(
	id_categoria bigint auto_increment primary key,
	createdAt timestamp,
	eliminado boolean,
	nombre VARCHAR(255),
	descripcion VARCHAR(255)
	);

create table PRODUCTOS (
	id_producto bigint auto_increment primary key,
	createdAt timestamp ,
	eliminado BOOLEAN,
	nombre VARCHAR (255),
	precio DECIMAL (10,2),
	descripcion VARCHAR (255), 
	stock int,
	imagen VARCHAR (255),
	disponible BOOLEAN,
	id_categoria bigint,
	foreign key (id_categoria) references CATEGORIAS(id_categoria)
	);

create table USUARIOS (
	id_usuario bigint auto_increment primary key,
	createdAt timestamp ,
	eliminado BOOLEAN,
	nombre VARCHAR(255),
	apellido VARCHAR(255),
	mail VARCHAR(255),
	celular VARCHAR(20),
	password VARCHAR(255),
	id_rol bigint,
	foreign key (id_rol) references ROLES(id_rol)
	);

create table PEDIDOS (
	id_pedido bigint auto_increment primary key, 
	createdAt timestamp ,
	eliminado BOOLEAN,
	id_usuario bigint, 
	id_formapago bigint, 
	id_estado bigint, 
	total decimal (10,2), 
	fecha_pedido datetime,
	foreign key (id_usuario) references USUARIOS(id_usuario),
	foreign key (id_formapago) references FORMAPAGOS(id_formapago),
	foreign key (id_estado) references ESTADOS(id_estado)
	);

create table DETALLEPEDIDOS (
	id_detallepedido bigint auto_increment primary key, 
	createdAt timestamp ,
	eliminado BOOLEAN,
	cantidad int, 
	subtotal decimal(10,2), 
	id_pedido bigint, 
	id_producto bigint,
	foreign key (id_pedido) references PEDIDOS(id_pedido),
	foreign key (id_producto) references PRODUCTOS(id_producto)
	);






















