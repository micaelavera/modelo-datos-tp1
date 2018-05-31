
drop database if exists tarjeta;

create database tarjeta;


create table cliente(dni integer,nombre varchar(64),apellido varchar(64),direccion varchar(64), telefono integer);
create table tarjeta(numero integer,);
create table comercio(codigo_postal integer);

create table compra(numero_tarjeta integer);

