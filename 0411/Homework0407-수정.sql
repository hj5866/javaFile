--1�� ���̺� �����
create table stationery(
    �ŷ�ó varchar2(20) not null,
    ��ǰ�з� varchar2(20) not null,
    ǰ�� varchar2(30) not null,
    ���� number(6) not null,
    �ܰ� number(6) not null,
    �Ǹűݾ� number(10)
);
--������ �Է�
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('������Ʈ�ڽ�','��Ʈ','���� ��������Ʈ',20,2500);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('������Ʈ�ڽ�','�������','������ A4����',30,20000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('������Ʈ�ڽ�','�ʱ��','�𳪹� ����',250,100);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('������Ʈ�ڽ�','�ʱ��','������F(�߰��۾���)���',10,6000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���̹���','��Ʈ','��������  ��Ʈ',150,6000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���̹���','������ǰ','���ǽ� ����������',10,20000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���̹���','�ʱ��','�𳪹� ����',200,100);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���̹���','��Ʈ','��������  ��Ʈ',200,6000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���ξ�Ʈ�ڽ�','��īġ������','��īġ �ٿ뵵 ������',30,900);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���ξ�Ʈ�ڽ�','Ŭ��','�ǽ��ڸ��� ����Ŭ��',20,4000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���ξ�Ʈ�ڽ�','�ʱ��','���ؽ� ������ ȥ��3��',30,3000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���ι���','����Ʈ��','����Ʈ�� ��Ʈ(654)���',35,1700);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('���ι���','�ʱ��','������F(�߰��۾���)���',30,6000);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('��������','����Ʈ��','����Ʈ�� ��Ʈ 3��',60,2300);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�) values('��������','�ʱ��','������F(�߰��۾���)���',45,6000);

desc stationery;
select*from stationery;
drop table stationery;

--�Ǹűݾ� ����
update stationery set �Ǹűݾ�=����*�ܰ�;

--2��
--������ ����
create sequence sq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop sequence sq;

--��ȣ ���̺� ����
alter table stationery add ��ȣ number(3);

--�������� ��ȣ ���̱�
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ) values('������Ʈ�ڽ�','��Ʈ','���� ��������Ʈ',20,2500,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('������Ʈ�ڽ�','�������','������ A4����',30,20000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('������Ʈ�ڽ�','�ʱ��','�𳪹� ����',250,100,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('������Ʈ�ڽ�','�ʱ��','������F(�߰��۾���)���',10,6000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���̹���','��Ʈ','��������  ��Ʈ',150,6000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���̹���','������ǰ','���ǽ� ����������',10,20000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���̹���','�ʱ��','�𳪹� ����',200,100,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���̹���','��Ʈ','��������  ��Ʈ',200,6000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���ξ�Ʈ�ڽ�','��īġ������','��īġ �ٿ뵵 ������',30,900,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���ξ�Ʈ�ڽ�','Ŭ��','�ǽ��ڸ��� ����Ŭ��',20,4000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���ξ�Ʈ�ڽ�','�ʱ��','���ؽ� ������ ȥ��3��',30,3000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���ι���','����Ʈ��','����Ʈ�� ��Ʈ(654)���',35,1700,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('���ι���','�ʱ��','������F(�߰��۾���)���',30,6000,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('��������','����Ʈ��','����Ʈ�� ��Ʈ 3��',60,2300,sq.nextval);
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,��ȣ)  values('��������','�ʱ��','������F(�߰��۾���)���',45,6000,sq.nextval);

--update�� ��ȣ�ű��
update stationery set ��ȣ=sq.nextval;

--������ ���簪(currval) Ȯ�� ����351p
select sq.currval from dual;

--�������� �� 1�� �����ϱ�(���ϴ� ���� �ǵ��� ���� ���ְų� ������)
--������ �����ϴ� ���:alter sequence sq increment by ���Ǿ�� currval���� 0���� �����ѵ�,
--(ex:currval ���� 29�̸�, alter sequence sq increment by -29)
--alter sequence sq increment by 1�� �ʱ�ȭ �ѵ�(select sq.nextval from dual�� �����ʴ´�) update�ؼ� �� Ȯ��
alter sequence sq increment by 1;
select sq.nextval from dual;

--������ ����
alter sequence sq
minvalue -1;

select*from stationery;
select*from user_sequences;

--�÷����� �ٲٴ¹�(��ȣ�� �Ǿ����� �ű������)
--1.select from���� ���
select ��ȣ,�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ� from stationery;

--2.view���� ���
create view stationery_view as stationery_view as
    (��ȣ,�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ� from stationery);
    select*from stationery_view;
    
--3.�������̺� �����ؼ�,����,�������̺����,�ٽ� ����
create table station2 as
select ��ȣ,�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ�
from stationery;

drop table stationery;

alter table station2 rename to stationery;

select*from stationery;

--3��
--�ŷ�ó�� ������ ��ռ���, ��մܰ�, ����Ǹŷ�, �ִ��Ǹűݾ�, �ּ��Ǹűݾ� ����ϱ�
select �ŷ�ó,count(�ŷ�ó)as ����, trunc(avg(����))as ��ռ���,trunc(avg(�ܰ�))as ��մܰ�,trunc(avg(�Ǹűݾ�))as ����Ǹűݾ�,
max(�Ǹűݾ�)as �ִ��Ǹűݾ�, min(�Ǹűݾ�)as �ּ��Ǹűݾ�
from stationery
group by �ŷ�ó;

select*from stationery;

--4��
--���̺��� �� �÷��� �������� �̸� ���̱�(�������� ����)
--ó���� not null �̿��� �� ���Ǿ ������ �� �Ǵ��󱸿� �׷��� null�� ���� �ѹ��� �ϰ�
--�ٽ� not null�� �����ϴ� �Ǿ����^��^~~!!!
alter table stationery modify(�ŷ�ó constraint customer_nn NOT null); 
alter table stationery modify(��ǰ�з� constraint class_nn not null);
alter table stationery modify(ǰ�� constraint product_nn not null);
alter table stationery modify(���� constraint number_nn not null);
alter table stationery modify(�ܰ� constraint price_nn not null);

--rename���� �����ϱ�
alter table stationery rename constraint SYS_C0011310 to class_nn;
  
select CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME from user_constraints where table_name = 'STATIONERY';

--5��
--���̺��� ��ǰ�� '�ʱ��'�� ���ڵ常 �����Ͽ� stationery_new ���̺� ����
create table stationery_new
as select*from stationery
where ��ǰ�з�='�ʱ��';

select*from stationery_new;

--6��
--�Ǹűݾ��� ����Ǹűݾ� �̸��� ���ڵ常 ����ϱ�(��������)
select �ŷ�ó,��ǰ�з�,ǰ��,�Ǹűݾ�,����,�ܰ�,��ȣ
from stationery
where �Ǹűݾ� < (select avg(�Ǹűݾ�) from stationery);

--7�� ����258������
--���̺��� �ŷ�ó�� ����Ǹűݾ��� ���ϰ� ��� �÷� ���
select �ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ�
from stationery
where (�ŷ�ó,�Ǹűݾ�) in (select �ŷ�ó,trunc(avg(�Ǹűݾ�)) from stationery group by �ŷ�ó);

--�ּ��Ǹűݾװ� ��
select �ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ�
from stationery
where (�ŷ�ó,�Ǹűݾ�) in (select �ŷ�ó,trunc(min(�Ǹűݾ�)) from stationery group by �ŷ�ó);

select*from stationery;

--8��
--�ŷ�ó �̸��� '��Ʈ�ڽ�'�� ���� ���ڵ�� �߿��� '���̹���'���� �������� �ʴ� ǰ����
--���� ���ڵ��� ��� �÷��� ����ϱ�
select*
from stationery
where ǰ�� not in(select ǰ�� from stationery where �ŷ�ó='���̹���')
and �ŷ�ó like '%��Ʈ�ڽ�%'
order by ��ȣ;

--9��
--���̺� ���� �߰��ϱ�
insert into stationery(�ŷ�ó,��ǰ�з�,ǰ��,����,�ܰ�,�Ǹűݾ�)
values('��������','��īġ������','��īġ �ٿ뵵 ������',20,650,13000);

--10��
--���̺��� ǰ��'����'�� ���Ե� ���ڵ��� �ܰ��� 200���� ��� �����ϱ�
update stationery set �ܰ�=200 where ǰ�� like '%����%';

select*from stationery;



