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

alter table cliente add constraint cliente_pk primary key (dni);
alter table tarjeta add constraint tarjeta_pk primary key (numero);
alter table comercio add constraint compra_pk primary key (cod_comercio);
alter table compra add constraint compra_fk1 foreign key (numero_tarjeta) references tarjeta(numero);
alter table compra add constraint compra_fk2 foreign key (cod_comercio) references comercio(cod_comercio);

--agregar pks y fks que faltan y arreglar nombre que se "cambiaron"
