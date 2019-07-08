create table aluno(
   alu_id number(8) constraint pk_alu_id primary key,
   alu_nome varchar(30),
   alu_cpf varchar(11),
   constraint UK_alu_cpf Unique (alu_cpf)
);

desc aluno;

select * from aluno;

insert into aluno values (1,'Maria','1111111');

insert into aluno values (2,'João','2222222');

insert into aluno values (3,'Joana','3333333');

/*drop table aluno;*/

select constraint_name, constraint_type, status, search_condition
from user_constraints
where table_name='ALUNO';

create table teste (
     id number(4) primary key,
     descricao varchar(30)
);