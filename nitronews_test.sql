create database if not exists nitronews;

use nitronews;

create table if not exists pais(
	id int not null auto_increment,
    nome_pais text,
    primary key (id)
);

create table if not exists estado(
	id int not null auto_increment,
    nome_estado text,
    id_pais int,
    primary key (id),
    foreign key (id_pais) references pais(id)
);

insert into pais (nome_pais) values ("Brasil"), ("Estados Unidos"), ("Canada"), ("Argentina");

insert into estado (nome_estado, id_pais)
values 
('Rio Grande de Sul', 1), ('Santa Catarina', 1), ('Paraná', 1),
('Texas', 2), ('Flórida', 2), ('Califórnia', 2),
('Ontário', 3), ('Quebec', 3), ('Manitoba', 3),
('Córdova', 4), ('Chaco', 4), ('San Luis', 4);

select nome_estado from estado where nome_estado='Paraná';
select estado.nome_estado, pais.nome_pais from estado inner join pais on estado.id_pais = pais.id;
alter table pais add column sigla varchar(2);

create table if not exists cidade(
	id int not null auto_increment,
    nome_cidade text,
    id_estado int,
    primary key (id),
    foreign key (id_estado) references estado(id)
);