drop database if exists tarjeta;
create database tarjeta;

\c tarjeta

create table cliente(
	        dni integer,
		nombre varchar(64),
		apellido varchar(64),
		direccion varchar(64),
		telefono integer
);

create table tarjeta(
	        numero_tarjeta integer,
		dni_cliente integer,
		codigo_seguridad integer,
		limite_compra integer,
		saldo real,
		fecha_vencimiento date,
		estado_tarjeta varchar(64)
);
		/* estado_tarjeta comprende el estado de vigencia,suspendida,etc, se podria poner un enum */

create table comercio(
	        codigo_comercio integer,
		nombre varchar(64),
		direccion varchar(64),
		codigo_postal integer
);

create table compra(
	        codigo_compra integer,
		numero_tarjeta integer,
		fecha date,
		horario time
);

create table factura(
	        codigo_factura integer,
		dni_cliente integer,
		codigo_comercio integer,
		total_pagar real,
		detalle_articulo integer
);
--detalle es la fk de factura 
-- ver si compra contiene a factura o viceversa.

create table detalle(
	        codigo_articulo integer,
		cantidad integer,
		precio_unitario real
);

create table resumen(
	        codigo_factura integer,
		periodo_facturado integer,
		fecha_vencimiento date,
		total_pagar real,
		numero_tarjeta integer
);		
--PRIMARY KEY--
alter table cliente add constraint cliente_pk primary key (dni);
alter table tarjeta add constraint tarjeta_pk primary key (numero_tarjeta);
alter table comercio add constraint comercio_pk primary key (codigo_comercio);
alter table compra add constraint compra_pk primary key(codigo_compra);
alter table factura add constraint factura_pk primary key (codigo_factura);
alter table detalle add constraint detalle_pk primery key (codigo_articulo);

--FOREIGN KEY--
alter table tarjeta add constraint tarjeta_fk0 foreign key (dni_cliente) references cliente(dni);
alter table compra add constraint compra_fk0 foreign key (numero_tarjeta) references tarjeta(numero_tarjeta);
alter table factura add constraint factura_fk0 foreign key (dni_cliente) references cliente (dni);
alter table factura add constraint factura_fk1 foreign key (detalle_articulo) references detalle(codigo_articulo);
alter table resumen add constraint detalle_fk0 foreign key (codigo_factura) references factura(codigo_factura);

--agregar pks y fks que faltan y arreglar nombres que se "cambiaron"
