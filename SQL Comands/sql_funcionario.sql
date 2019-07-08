create table departamento
(dep_id number(6) primary key,
 dep_descricao varchar2(30));


create table funcionario
(func_cod number(6) primary key,
 func_nome varchar2(20),
 func_sal number(10,2),
 
 dep_id number(6) references departamento (dep_id));

insert into departamento values (1,'RH');
insert into departamento values (2,'Vendas');
insert into departamento values (3,'Inform�tica');
insert into departamento values (4,'Compras');

insert into funcionario values (1,'Paulo',4000.00,1);
insert into funcionario values (2,'Maria',1500.00,2);
insert into funcionario values (3,'Jo�o',4000.00,1);
insert into funcionario values (4,'Laura',5000.00,2);
insert into funcionario values (5,'Ana',6000.00,3);
insert into funcionario values (6,'Maria',null,null);

alter table funcionario add gerente_cod number(6)
references funcionario (func_cod);

update funcionario set gerente_cod=5 where func_cod in (1,2,3,4);

commit;

select * from funcionario;

select f.func_nome Funcionario, g.func_nome Gerente
from funcionario f, funcionario g
where f.gerente_cod=g.func_cod;

select f.func_cod, f.func_nome, f.func_sal, fa.fa_cod
from funcionario f, faixa_salarial fa
where f.func_sal between fa.fa_menor and fa.fa_maior
order by f.func_sal;

select min(func_sal), max(func_sal)
from funcionario;

delete from funcionario where func_cod=6;

select avg(func_sal) from funcionario where dep_id=2;

select sum(func_sal) from funcionario where dep_id=1;

select avg(func_sal), sum(func_sal) from funcionario;

select count(distinct dep_id) from funcionario;

select count(dep_id) from funcionario;

select count(*) from funcionario where dep_id=2;

update funcionario set func_sal=null where func_cod=2;

select avg(func_sal) from funcionario;

select avg(nvl(func_sal,0)) from funcionario;

update funcionario set func_sal=1500.00 where func_cod=2;

select dep_id, avg(func_sal) from funcionario group by dep_id;

select f.dep_id, d.dep_descricao, avg(f.func_sal)
from funcionario f, departamento d
where d.DEP_ID=f.DEP_ID
group by f.dep_id, d.dep_descricao
order by f.dep_id;

select f.dep_id, d.dep_descricao, avg(f.func_sal)
from funcionario f, departamento d
where d.DEP_ID=f.DEP_ID
group by f.dep_id, d.dep_descricao having avg(f.func_sal) > 4000
order by f.dep_id;

select f.dep_id, d.dep_descricao, sum(f.func_sal)
from funcionario f, departamento d
where d.DEP_ID=f.DEP_ID
group by f.dep_id, d.dep_descricao
order by f.dep_id;

select f.dep_id, d.dep_descricao, max(f.func_sal)
from funcionario f, departamento d
where d.DEP_ID=f.DEP_ID
group by f.dep_id, d.dep_descricao
order by f.dep_id;

select f.dep_id, d.dep_descricao, count(f.func_sal)
from funcionario f, departamento d
where d.DEP_ID=f.DEP_ID
group by f.dep_id, d.dep_descricao
order by f.dep_id;
