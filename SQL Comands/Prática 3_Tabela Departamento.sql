CREATE TABLE DEPARTAMENTO
(
    dep_cod number(4) constraint pk_dep_cod primary key,
    dep_nome varchar(30),
    dep_data_inicial date)


CREATE TABLE FUNCIONARIO
(
    cod_funcionario number(4) constraint pk_cod_funcionario primary key,
    func_nome varchar(100),
    func_CPF varchar(15),
    func_salario decimal(4,2),
    func_endereco varchar(252),
    fun_sexo char(1),
    cod_super number(4),
    cod_depart number(4) constraint FK_cod_depart references departamento(dep_cod)
)


CREATE TABLE DEPENDENTE
(
    cod_func number(4) constraint FK_cod_func references funcionario(cod_funcionario),
    cod_seq number(4) constraint pk_cod_seq primary key,
    nome varchar(100),
    parentesco varchar(30),
    data_nasc date
)


CREATE TABLE LOCALIZACAO
(
    cod_depart2 number(4) constraint FK_cod_depart2 references departamento(dep_cod),
    nome_local varchar(252) constraint pk_local primary key
)

