create table departamento (
      cod_departamento number(8) constraint PK_cod_departamento primary key,
      dep_descricao varchar(30)
);

insert into departamento values (1, 'RH');

insert into departamento values (2, 'VENDAS');

select * from departamento;

create table funcionario (
      fun_cod number(8) constraint PK_fun_cod primary key,
      fun_nome varchar(30),
      cod_departamento number(8)
);

insert into funcionario values (101,'Maria',1);

insert into funcionario values (102, 'João', 2);

insert into funcionario values (103, 'Cleber', 3);

insert into funcionario values (104, 'Gabriel', 4);

select *from funcionario;

alter table funcionario
add constraint fk_cod_departamento
foreign key (cod_departamento)
references departamento(cod_departamento)
on delete cascade;

select * from funcionario;

select * from departamento;

delete from