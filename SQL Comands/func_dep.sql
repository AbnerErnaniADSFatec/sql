create table funcionario (
     fun_cod number(4) constraint PK_fun_cod primary key,
     fun_nome varchar2(40),
     fun_cpf number(11),
);