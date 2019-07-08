create table departamento
(dep_id number(6) primary key,
 dep_descricao varchar2(30));


create table funcionario
(func_cod number(6) primary key,
 func_nome varchar2(20),
 func_sal number(10,2));
 
 create table faixa_salarial(
    fa_cod varchar2(1) constraint fs_pk primary key,
    fa_menor number(6,2),
    fa_maior number(6,2)
 );
 
 insert into faixa_salarial values ('A',1000.00,2999.00);
 insert into faixa_salarial values ('B',3000.00,5999.00);
 insert into faixa_salarial values ('C',6000.00,9999.00);
 
 dep_id number(6) references departamento (dep_id));

insert into departamento values (1,'RH');
insert into departamento values (2,'Vendas');
insert into departamento values (3,'Informática');
insert into departamento values (4,'Compras');

insert into funcionario values (1,'Paulo',4000.00,1);
insert into funcionario values (2,'Maria',1500.00,2);
insert into funcionario values (3,'João',4000.00,1);
insert into funcionario values (4,'Laura',5000.00,2);
insert into funcionario values (5,'Ana',6000.00,3);
insert into funcionario values (6,'Maria',null,null);

commit;

select * from funcionario;

select * from departamento;

select f.func_cod, f.func_nome, d.dep_id, d.dep_descricao
from departamento d
right outer join funcionario f
on f.dep_id=d.dep_id
order by f.FUNC_NOME;

select f.func_cod, f.func_nome, d.dep_id, d.dep_descricao
from funcionario f
left outer join departamento d
on f.dep_id=d.dep_id
order by f.FUNC_NOME;

select f.func_cod, f.func_nome, d.dep_id, d.dep_descricao
from departamento d
left outer join funcionario f
on f.dep_id=d.dep_id
order by f.FUNC_NOME;

select f.func_cod, f.func_nome, d.dep_id, d.dep_descricao
from departamento d, funcionario f
where f.dep_id(+) = d.dep_id
order by f.FUNC_NOME;

select f.func_cod, f.func_nome, d.dep_descricao
from funcionario f
full outer join departamento d
on f.dep_id=d.dep_id;

select * from faixa_salarial;

select * from funcionario;

select f.func_cod, f.func_nome, f.func_sal, fa.fa_cod
from funcionario f, faixa_salarial fa
where f.func_sal between fa.fa_menor and fa.fa_maior
order by fa.FA_COD;

alter table funcionario add gerente_cod number(6)
references funcionario (func_cod);

update funcionario set gerente_cod=5 where func_cod in (1,2,3,4);

select fg.func_cod, fg.func_nome, ff.gerente_cod, ff.func_nome
from funcionario fg, funcionario ff
where fg.func_cod=ff.gerente_cod
order by ff.func_nome;
