create table aluno (
    aluno_cod number(8) constraint PK_aluno_cod primary key,
    aluno_nome varchar(30),
    aluno_sexo char(1) constraint CK_SEXO Check (aluno_sexo in ('F', 'M'))
);

desc aluno;

insert into aluno values (1, 'Maria', 'O'); // Erro na constraint
insert into aluno values (1, 'Maria', 'F');

select * from aluno;