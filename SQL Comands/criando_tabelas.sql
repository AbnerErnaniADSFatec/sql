create table pedido (
    ped_cod number(6) constraint PK_ped_cod primary key,
    ped_data date,
    ped_valor_total number(10,2)
);

create table produto (
    pro_cod number(6) constraint PK_pro_cod primary key,
    pro_descricao varchar(30)
);

create table item (
    ped_cod number(6) constraint FK_ped_cod references pedido (ped_cod),
    pro_cod number(6) constraint FK_pro_cod references produto (pro_cod),
    ite_quantidade number(6),
    ite_valor number(7,2),
    constraint PK_ped_cod_pro_cod primary key (ped_cod,pro_cod)
);

desc pedido;

desc produto;

desc item;

select sysdate from dual;

insert into pedido values (1, sysdate,100.38);

insert into produto values (1, 'Caneta');
insert into produto values (2, 'Lápis');

insert into item values (1,1,3,20);
insert into item values (1,2,3,80.38);


select * from pedido;

select * from produto;

select * from item;
