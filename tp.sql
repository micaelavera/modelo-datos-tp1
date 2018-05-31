drop database if exists tarjeta;

create database tarjeta;

create table cliente(dni integer,
			nombre varchar(64),
			apellido varchar(64),
			direccion varchar(64),
			 telefono integer);

create table tarjeta(numero integer,
			limite integer, 
			codigoSeguridad integer, 
			fecha_vencimiento date,
			suspension boolean);

create table comercio(cod_comercio integer,
			nombre varchar(64),
			direccion varchar(64),
			codigo_postal integer);

create table compra(numero_tarjeta integer,
			cod_comercio integer,
			fecha date,
			 monto real);

create table factura(total_pagar real,
		 nro_tarjeta integer,
		nro_factura integer );		



alter table cliente add constraint cliente_pk primary key (dni);
alter table tarjeta add constraint tarjeta_pk primary key (numero);
alter table comercio add constraint compra_pk primary key (cod_comercio);
alter table compra add constraint compra_fk1 foreign key (numero_tarjeta) references tarjeta(numero);
alter table compra add constraint compra_fk2 foreign key (cod_comercio) references comercio(cod_comercio);