use tecnotiendadb;
drop table productos;
create table productos(
	id int primary key auto_increment,
	nombre varchar(100) not null,
    img varchar(30) not null,
    precio decimal(8,2) not null,
    descripcion text not null,
    stock int not null default 0,
    destacado tinyint(1) not null,
    categoria varchar(20)
);

insert into productos (nombre, img, precio, descripcion, stock, destacado, categoria) values (
'Pantalla Led Samsung Np-r420 14.0 Reg 40 Pines',
'Monitor.jpg',
12500,
'Pantalla Led Samsung Np-r420 14.0 Reg 40 Pines',
10,
false,
'componentes');

insert into productos (nombre, img, precio, descripcion, stock, destacado, categoria) values (
'Silla Gamer Pc',
'Silla gamer.jpg',
22999,
'Diseñada para quienes pasan muchas horas frente a la computadora. Disfrutá sin descuidar las zonas lumbar, dorsal y cervical.',
20,
true,
'componentes');

insert into productos (nombre, img, precio, descripcion, stock, destacado, categoria) values (
'Kit de Pc completa',
'KitPC_I5_M19_8GB_1TB.jpg',
53999,
'Pc Completa Intel I5 + Monitor 19 Led +8gb +hd 1 Tb +kit',
30,
false,
'pc');

/*
select * from productos;
update productos set destacado = true where id = 3;
*/

create table usuarios(
	id int primary key auto_increment,
    alias varchar(10) not null,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    codigo_postal varchar(10) not null,
    email varchar(50) not null unique,
    clave varchar(50) not null,
    fecha_alta timestamp default current_timestamp not null
);
select * from usuarios;
insert into usuarios (alias, nombre, apellido, codigo_postal, email, clave) 
values ('mati', 'matias', 'caldarone', '1884', 'matias.caldarone@gmail.com', 'test123');