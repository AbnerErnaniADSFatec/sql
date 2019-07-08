/* Abner Anjos e Mariana Vasconcellos ADS - Turma A 4 semestre */

CREATE TABLESPACE  TS_BD
DATAFILE 'C:\BD\ts_bd.dbf' SIZE 1M 
AUTOEXTEND ON;

CREATE USER USER_BD
IDENTIFIED BY ALUNO 
DEFAULT TABLESPACE TS_BD
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_BD;

GRANT DBA TO USER_BD WITH ADMIN OPTION;

CREATE TABLE DEPARTAMENTO
(
    dep_cod number(4) constraint pk_dep_cod primary key,
    dep_nome varchar(30),
    dep_data_inicial date
);


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
);


CREATE TABLE DEPENDENTE
(
    cod_func number(4) constraint FK_cod_func references funcionario(cod_funcionario),
    cod_seq number(4) constraint pk_cod_seq primary key,
    nome varchar(100),
    parentesco varchar(30),
    data_nasc date
);


CREATE TABLE LOCALIZACAO
(
    cod_depart2 number(4) constraint FK_cod_depart2 references departamento(dep_cod),
    nome_local varchar(252) constraint pk_local primary key
);

CREATE TABLE PROJETO
(
    cod_proj number(4) constraint pk_cod_proj primary key,
    cod_depart3 number(4) constraint FK_cod_depart3 references departamento(dep_cod),
    titulo varchar(150),
    descricao varchar(252),
    data_cad date
);

CREATE TABLE PARTICIPA
(
    cod_func number(4) constraint FK_cod_func2 references funcionario(cod_funcionario),
    cod_proj number(4) constraint FK_cod_proj references projeto(cod_proj),
    constraint PK_cod_participa primary key (cod_func, cod_proj),
    horas varchar(50)
);

ALTER TABLE funcionario MODIFY func_nome NOT NULL;

ALTER TABLE funcionario MODIFY func_cpf UNIQUE;

ALTER TABLE funcionario ADD CONSTRAINT func_cpf UNIQUE (func_cpf);

ALTER TABLE funcionario MODIFY func_cpf NOT NULL;

ALTER TABLE funcionario MODIFY func_salario NUMBER(4,2);

ALTER TABLE funcionario MODIFY fun_sexo constraint CK_fun_sexo Check (fun_sexo in ('F', 'M'));

ALTER TABLE funcionario MODIFY func_salario NUMBER(4,2) CHECK (func_salario >= 1000);

ALTER TABLE funcionario MODIFY cod_super number(4) constraint FK_cod_super references funcionario(cod_funcionario);

ALTER TABLE departamento MODIFY dep_nome varchar(100) NOT NULL;

ALTER TABLE dependente MODIFY nome NOT NULL;

ALTER TABLE dependente MODIFY parentesco NOT NULL;

ALTER TABLE dependente ADD constraint PK_cod_dependente primary key (cod_func);

ALTER TABLE dependente MODIFY cod_func NOT NULL;

ALTER TABLE dependente MODIFY parentesco constraint CK_parentesco Check (parentesco in ('PAI', 'MAE', 'IRMAOS','FILHO'));

ALTER TABLE projeto MODIFY titulo NOT NULL;

ALTER TABLE projeto MODIFY data_cad date;

SELECT * FROM USER_CONSTRAINTS WHERE table_name='funcionario';
