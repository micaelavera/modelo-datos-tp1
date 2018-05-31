drop database if exists tarjeta;

create database tarjeta;


create table cliente(dni integer,nombre varchar(64),apellido varchar(64),direccion varchar(64), telefono integer);
create table tarjeta(numero integer,limite integer, codigoSeguridad integer,  fecha_vencimiento date);
create table comercio(codigo_postal integer);

create table compra(numero_tarjeta integer);


alter table cliente add constraint cliente_pk primary key (dni);
alter table tarjeta add constraint direccion_pk primary key (codigoSeguridad);
alter table comercio add constraint compra_pk primary key (codigo_postal);

alter table compra add constraint compra_fk1 foreign key (numero_tarjeta) references tarjeta(numero);
