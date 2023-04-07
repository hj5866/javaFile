--1��
create table food(
    ���̵� number(2) constraint food_id primary key,
    ���ĸ� varchar2(20) constraint food_name unique,
    �������� varchar2(10),
    ������ varchar2(20) constraint food_store not null,
    ��ȭ��ȣ varchar2(13) constraint food_tel not null,
    �̸��� varchar2(20),
    �������з���ȣ number(4) constraint food_store_num not null
    );
    desc food;
--2��  
create table store(
    ���̵� number(2) constraint store_id primary key,
    �������� varchar2(20) constraint store_name unique,
    �������з���ȣ number(4) constraint store_num not null,
    �丮�� varchar2(10)
);
    desc store;
    
--3��
insert into food values(1,'�����','�߽�','ȫ�����','032-547-8564','hkbj@gmail.com',10);
insert into food values(2,'������','�߽�','ȫ�����','032-547-8564',null,10);
insert into food values(3,'�޺���̼� ����',null,'�̵����ƽ�','031-547-8961','italia@gmail.com',20);
insert into food values(4,'����ʹ�','�Ͻ�','���ϱ⸮','02-415-7854','onigiri@gmail',30);
insert into food values(5,'������','�Ͻ�','���ϱ⸮','02-415-7854','onigiri@gmail',30);
insert into food values(6,'��������','�ѽ�','�ҸӴϳ�','02-549-7541','grandma@gmail.com',40);
insert into food values(7,'�����','�ѽ�','�ҸӴϳ�','02-549-7541',null,40);
insert into food values(8,'��â����',null,'�ҸӴϳ�','02-549-7541','grandma@gmail.com',40);
insert into food values(9,'�ܹ���',null,'�����ε�','032-125-5236','mado@gmail.com',50);
insert into food values(10,'������','�н�','�̸�н�','032-125-5236',null,60);

select*from food;
drop table food;

--4��
insert into store values(1,'ȫ�����',10,'������');
insert into store values(2,'�̵����ƽ�',20,'�ĺ��');
insert into store values(3,'���ϱ⸮',30,'������');
insert into store values(4,'�ҸӴϳ�',40,'�����');
insert into store values(5,'�����ε�',50,'��Ƽ��');
insert into store values(6,'�̸�н�',60,'���̸�');

select*from store;
drop table store;

--5��
--food���̺��� �������з���ȣ�� store���̺��� �������з���ȣ�� �̿��Ͽ� �ΰ��� ���̺��� join�ϱ�
--������ �̸����� �������� ����
--�������:���̵�,���ĸ�,������,��ȭ��ȣ,�̸���,�丮��
select F.���̵�,F.���ĸ�,F.������,F.��ȭ��ȣ,F.�̸���,S.�丮��
from food F, store S
where F.�������з���ȣ = S.�������з���ȣ
order by F.������;

--6��
--food���̺��� �������з���ȣ�� store���̺��� �������з���ȣ�� �̿��Ͽ� �ΰ��� ���̺� join
--����:�������̸��� '�ҸӴϳ�'�� �����͸� join
--������ �̸����� ��������, ���ĸ� �������� ����
--�������:���̵�,���ĸ�,������,�丮��
select F.���̵�,F.���ĸ�,F.������,S.�丮��
from food F, store S
where F.�������з���ȣ=S.�������з���ȣ
and F.������='�ҸӴϳ�'
order by F.������, F.���ĸ� desc;

--7�� 187p
--food���̺��� ���������� ���(�׷�)���, �������̸� ���� �������� ����
select ���̵�,���ĸ�,��������,������,��ȭ��ȣ,�̸���,�������з���ȣ
from food
group by ���̵�,���ĸ�,��������,������,��ȭ��ȣ,�̸���,�������з���ȣ
order by ������ desc;

--8�� 366p
--food���̺� <����>�÷� �߰�
--����,������(6�ڸ�) ��������:�ʼ�,�������� �̸�:food_price

--ù��° ���
--�÷� �߰��ѵ� -> ������ �Է��ϰ� -> �������� �߰�
alter table food add (���� number(6));

update food set ����='10000' where ���ĸ�='�����';
update food set ����='20000' where ���ĸ�='������';
update food set ����='25000' where ���ĸ�='�޺���̼� ����';
update food set ����='16000' where ���ĸ�='����ʹ�';
update food set ����='15000' where ���ĸ�='������';
update food set ����='18000' where ���ĸ�='��������';
update food set ����='8000' where ���ĸ�='�����';
update food set ����='30000' where ���ĸ�='��â����';
update food set ����='9200' where ���ĸ�='�ܹ���';
update food set ����='6000' where ���ĸ�='������';

alter table food modify(���� constraint food_price NOT NULL);
-----------------------------�ι�° ���-----------------------
--default�� 0�� �߰��ѵ� �ѹ��� constraint���� �����ѵڿ� ->ù��° ���ó��
--update set���� �����͸� �߰��ϸ� ��.
alter table food add ���� number(6) default 0
   constraint food_price not null;  

desc food;
select *from food;

--�������� Ȯ��
select constraint_name, constraint_type, table_name
from user_constraints where table_name='FOOD';

--9��
--food���̺��� ������ ��� ���� �̻��� �������� ��� �÷� ���
select *
from food
where ���� >= (select avg(����) from food);

--10��
--food���̺��� ������ 10000~20000 ������ ������ ���
--�������:���̵�,������,����,�丮��
select F.���̵�,F.������,F.����,S.�丮��
from food F, store S
where F.�������з���ȣ=S.�������з���ȣ
and F.���� between 10000 and 20000
order by ����;

--��������


--join~using
select F.���̵�,F.������,F.����,S.�丮��
from food F join store S using(�������з���ȣ)
where F.���� between 10000 and 20000
order by ����;

--join~on
select F.���̵�,F.������,F.����,S.�丮��
from food F join store S on (F.�������з���ȣ=S.�������з���ȣ)
where F.���� between 10000 and 20000
order by ����;


--11��
--store ���̺� ���ڵ� �Է�
--���̵�:7 ������:������� �������з���ȣ:70 �丮��:NULL
insert into store(���̵�,��������,�������з���ȣ,�丮��) values(7,'�������',70,NULL);
select*from store;

--12��
--store���̺� food���̺��� �ܺ������ϱ�
--�������з���ȣ �÷� �̿�, store���̺�� food���̺��� ��� �÷� ���
select*
from store S left outer join food F on(S.�������з���ȣ=F.�������з���ȣ);

--13��
--�丮�� �̸��� ������,������,��Ƽ���� �����Ϳ� �ش��ϴ� ���ڵ� ���
--�������:���̵�,���ĸ�,������,�������з���ȣ,�丮��
select F.���̵�,F.���ĸ�,F.������,F.�������з���ȣ,S.�丮��
from food F ,store S
where F.�������з���ȣ=S.�������з���ȣ
and �丮�� in('������','������','��Ƽ��');

--using
select F.���̵�,F.���ĸ�,F.������,�������з���ȣ,S.�丮��
from food F join store S using(�������з���ȣ)
where �丮�� in('������','������','��Ƽ��');

--14��
--food���̺��� ������ �̸��� 'ȫ�����'�� �����͸� �����Ͽ� ���ο� ���̺� food_new ����
CREATE TABLE food_new
AS SELECT * FROM food
WHERE ������ = 'ȫ�����';

select*from food_new;

--15�� store���̺� <���> �÷� �߰�,�ڷ��� �������̹��ڿ��� 10�ڸ�
--<���> �÷����� <�߰�����>���� ����, <�߰�����> �÷� ����
alter table store add ��� varchar2(10);
alter table store rename column ��� to �߰�����;
alter table store drop column �߰�����;

select*from store;