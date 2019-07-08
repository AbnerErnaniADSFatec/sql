create table pedido (
      ped_cod number(8),
      ped_valor_total number(8,2)
);

desc pedido;

insert into pedido values (1,100.45);

insert into pedido values (2,599.90);

select * from pedido;

alter table pedido add ped_data date;

update pedido set ped_data=sysdate where ped_cod=1;

alter table pedido modify ped_valor_total number(10,2);

alter table pedido drop column ped_data;

alter table pedido rename column ped_cod to ped_id;

select * from user_constraints where table_name='PEDIDO';

alter table pedido add constraint PK_ped_id primary key(ped_id);

alter table pedido disable constraint PK_ped_id;

alter table pedido add constraint FK_cli_id foreign key (cli_id);

alter table cliente drop constraint PK_cli_id cascade;

alter table pedido enable constraint PK_ped_id;

alter table pedido rename to vendas;

describe vendas;