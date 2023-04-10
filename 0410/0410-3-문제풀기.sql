create table member_ex(
    �����ȣ number(7) primary key,
    ���� varchar(5) not null,
    ���ɴ� number(2),
    ������ date not null,
    �ּ� varchar(10)
);

create table order_ex(
    �ֹ���ȣ number(5) primary key,
    �����ȣ number(7) not null,
    �ֹ��� date not null,
    ä���ڵ� number(1),
    �����ڵ� number(2),
    ��ǰ�ڵ� number(3),
    �ǸŰ��� number(10)
);
insert into member_ex values(1000001,'man',20,'2019-01-22','Seoul');
insert into member_ex values(1000002,'women',20,'2019-01-12','Gyeonggi');
insert into member_ex values(1000003,'women',20,'2019-01-24','Gyeonggi');
insert into member_ex values(1000004,'man',20,'2019-02-14','Gangwon');
insert into member_ex values(1000005,'man',20,'2019-01-26','Busan');
insert into member_ex values(1000006,'man',20,'2019-02-16','Daejeon');
insert into member_ex values(1000007,'women',20,'2019-01-28','Jeju');
insert into member_ex values(1000008,'man',20,'2019-01-18','Jeju');

insert into order_ex values(1,1000060,'2020-01-10',1,19,637,385000);
insert into order_ex values(10,1000799,'2020-01-15',1,10,457,31000);
insert into order_ex values(1000,1000154,'2020-04-12',1,29,306,52700);
insert into order_ex values(1001,1000195,'2020-04-12',1,27,534,15000);
insert into order_ex values(1002,1000265,'2020-04-12',1,21,561,5000);
insert into order_ex values(1003,1000306,'2020-04-12',2,9,487,9000);
insert into order_ex values(1004,1000376,'2020-04-12',1,8,370,14000);
insert into order_ex values(1005,1000417,'2020-04-12',1,12,455,21000);
insert into order_ex values(1006,1000487,'2020-04-12',1,35,158,4000);
insert into order_ex values(1007,1000001,'2022-03-30',3,32,200,14000);
insert into order_ex values(1008,1000002,'2022-04-10',2,45,300,25000);
insert into order_ex values(1009,1000003,'2022-02-22',2,30,200,158000);
insert into order_ex values(10010,1000004,'2022-05-10',4,15,100,5400);
insert into order_ex values(10011,1000005,'2021-07-20',5,16,270,27000);
insert into order_ex values(10012,1000006,'2022-08-10',4,20,140,65400);
insert into order_ex values(10013,1000007,'2021-11-30',5,32,200,10000);
insert into order_ex values(10014,1000008,'2022-3-18',5,30,300,50000);

select*from member_ex;
select*from order_ex;

--����1
--�� ���̺��� �����ȣ�� ���� ������ ���� inner join ��� �÷� ǥ��
select*
from member_ex join order_ex using(�����ȣ);

select*
from member_ex M, order_ex O
where M.�����ȣ=O.�����ȣ;

--����2
--member_ex �������� �ؼ� outer join�ϱ�
--��������� ���� ��������
select*
from member_ex M left outer join order_ex O
on(M.�����ȣ=O.�����ȣ);

--����3
--����2�� ����� �̿��ؼ� ���� ����(�׷�)���� �Ǹűݾ��� �հ� ���ؼ� ���.
--�հ��÷��� �̸�:���Ǹűݾ�
select M.����,sum(�ǸŰ���)as ���Ǹűݾ�
from member_ex M left outer join order_ex O
on(M.�����ȣ=O.�����ȣ)
group by M.����;

--����4
--����3���� ����� �׷� ������ �ϳ� �� �߰��Ͽ� ���
--�׷�(����,�ּ�)
select M.����,M.�ּ�,sum(�ǸŰ���)as ���Ǹűݾ�
from member_ex M left outer join order_ex O
on(M.�����ȣ=O.�����ȣ)
group by M.����,M.�ּ�;

--����5
--ä���ڵ尡 1�� ������ �߿��� �ǸŰ����� ��� �ǸŰ��� �̸���
--���ڵ��� �ֹ���ȣ,�����ȣ,�ֹ���,�����ڵ�,�ּ�,�ǸŰ��� ���
--����� �ȳ����°��� �ش�Ǵ� ���� ����̴�
select O.�ֹ���ȣ,O.�����ȣ,O.�ֹ���,O.�����ڵ�,M.�ּ�,O.�ǸŰ���
from member_ex M ,order_ex O
where M.�����ȣ=O.�����ȣ
and O.ä���ڵ�=1
and O.�ǸŰ��� < (select avg(�ǸŰ���) from order_ex);
