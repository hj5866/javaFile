--1��
create table book(
    ������ȣ number(4) primary key,
    å�̸� varchar2(40) unique,
    �з� varchar2(20),
    ���� number(6) not null,
    ���ΰ��� number(6),
    å�Ұ� varchar2(30),
    ������ date
);

create table author(
    �Ϸù�ȣ number(2) primary key,
    ���� varchar2(20) not null,
    ���ǻ� varchar2(10) not null,
    ������ȣ number(4) references book (������ȣ)
);

insert into book values(1001,'�̿쳪 ��쳪 �� �λ�','������',13500,12150,'������� �ϻ� ������','2023/03/10');
insert into book values(1002,'���ú��� �� �׸��� Ű���� �ߴ�','�ڱ���',14850,null,'�������� �ܴ��ϰ�!','2023/04/03');
insert into book values(1003,'���̾�Ʈ ��ŷ','�ǰ� ���',12600,11340,'�ȱ⸦ ����� �ٲٴ� ��','2023/03/20');
insert into book values(1004,'������ ������','�Ҽ�/��/���',10800,9720,'�Ƹ���� ������ ���� ����','2023/03/31');
insert into book values(1005,'���̳��� ����ħ','�ڱ���',7200,6480,'�ڱ� �ڽ��� ����϶�','2023/03/02');
insert into book values(1006,'������� ���ܼ�','�Ҽ�/��/���',11700,10200,'���� ã�� �ִ�','2023/01/14');
insert into book values(1007,'�޸���� ���� ��Ź��','�Ҽ�/��/���',13500,12150,'���󿡼� ���� �Ƹ��ٿ� ��Ź��','2023/03/18');
insert into book values(1008,'����� �ᱹ �����̵� �س��� ���','������',15000,13500,'�츮�� �ᱹ �س���','2023/04/13');
insert into book values(1009,'�λ��� ����','������',18000,16200,'�������ϰ����� ����� �߸����','2023/10/05');
insert into book values(1010,'���� ���� ����','������',19800,17820,'���� ���ο� �ӻ����� ����','2023/03/10');

insert into author values(1,'������','�ݴ޴�',1001);
insert into author values(2,'������','ī��Ͻ�',1002);
insert into author values(4,'������','��ħ��',1004);
insert into author values(3,'������ī �߽���','��ſ���',1003);
insert into author values(5,'���̳�','���̿�',1005);
insert into author values(6,'��ī�� ������','���������',1006);
insert into author values(7,'������','�Ϸθ���',1007);
insert into author values(8,'�����','�ʸ�',1008);
insert into author values(9,'����ö','����',1009);
insert into author values(10,'������ �����','����',1010);

select*from book;
select*from author;

--2��
select ������ȣ,å�̸�,�з�,����
from book
where ���� between 15000 and 20000;

--3��
select ������ȣ,å�̸�,�з�,����,���ΰ���,å�Ұ�,������
from book
where å�Ұ� like '%����%';

--4��
select �з�,avg(����)
from book
group by �з�
having avg(����) >= 12000
order by �з� desc; 

--5��
select ������ȣ,å�̸�,å�Ұ�,rpad(�з�,14,'@')as �з�
from book;

--6��
create table shopping(
    ����ȣ number(4) primary key,
    ���̸� varchar2(20) not null,
    ��ǰ varchar2(20),
    ���� number(7),
    ���� number(3)
);
select*from shopping;

alter table shopping add ��� varchar2(10);
alter table shopping rename column ��ǰ to ���Ի�ǰ;
alter table shopping drop column ����;

--7��
select å�̸�,����,å�Ұ�,������
from book
where ���� >= (select avg(����) from book);

--8��
select ������ȣ,å�̸�,�з�, A.����, A.���ǻ�
from book B join author A using(������ȣ);

--9��
select B.������ȣ,B.å�̸�,B.�з�,A.����,A.���ǻ�,B.���ΰ���
from book B left outer join author A on(B.������ȣ=A.������ȣ)
where B.�з�='������'
order by å�̸� desc;

select*from author;
select*from book;

--10��
select ������ȣ,å�̸�,�з�,����,å�Ұ�
from book
where ���� in(select max(����) from book group by �з�);


