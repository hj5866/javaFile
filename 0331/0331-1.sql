--sal(����)�� �հ� ���ϱ�
select sum(sal) from emp;

--������ ���� ���ϱ�
--count(*):��� ���ڵ� ���� ���ϱ�
select count(*) from emp;
select count(ename) from emp;
--count(): null�� �ƴ� ������ ������ ����.
select count(comm) from emp;

--���� ���� �޴� ����� ������
select max(sal) from emp;
--�μ���ȣ�� 10���� ����� �ִ� �޿�
select max(sal) from emp where deptno=10;
--�μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի���
select max(hiredate) from emp where deptno=20; 
--���� ���� �޴� ����� ������
select min(sal) from emp;
--�μ���ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի���
select min(hiredate) from emp where deptno=20; 
--�μ���ȣ�� 30�� ������� ��� �޿� ���
select avg(sal) from emp where deptno=30;

--�μ���ȣ�� 10�� �������� ������ ��� ���ϱ�
select avg(sal), '10' as deptno from emp where deptno=10
union all
select avg(sal), '20' as deptno from emp where deptno=20
union all
select avg(sal), '30' as deptno from emp where deptno=30;

--group by : ���� ������ �׷����� ������ (���� ���� �������)
select avg(sal),deptno from emp
group by deptno;

--�׷����(1��:�μ���ȣ,2��:����) group by
--���ı���(1��:�μ���ȣ,2��:����) order by
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

--emp���̺��� deptno,job,��տ��� �˻�
--��� ������ 2000�̻��� �����͸� �μ���, �������� �׷� ����
--�μ�����, ������������ �������� ����
select deptno, job, avg(sal)
    from emp
    group by deptno, job
        having avg(sal) >= 2000 --having�� ������ group by��
    order by deptno, job;
    
--emp���̺��� ������ 3000������ �����͸�
--deptno,job,��տ��� �˻�
--��� ������ 2000�̻��� �����͸� �μ���, �������� �׷� ����
--where���� �Բ� ���
select deptno, job, avg(sal)
    from emp
    where sal <= 3000
    group by deptno, job
        having avg(sal) >= 2000
    order by deptno, job;
    
-- roll up:�׷캰 ����� ����ϰ� ,������ �� �հ� ������ ���
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
    from emp
group by rollup(deptno, job)
order by deptno, job;

--grouping sets
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job)
order by deptno, job;

--grouping: rollup �̳� cube���� ���� �����ִ�.
select deptno, job, count(*), max(sal), sum(sal), avg(sal),
    grouping(deptno),grouping(job)
from emp
group by cube(deptno, job)
order by deptno,job;

--listagg ����207p
--within group�� listagg, rank, dense_rank�� �Բ� ���
--���� ����� �������� ������ ������
select deptno,
    listagg(ename,',')
   within group(order by ename asc) as enames
   from emp
   group by deptno;
 
--pivot ����208p
--�μ���ȣ�� 10,20,30�߿� ���ϴ� �����Ϳ���
--������ ���� ���� �����͸� ��� ǥ��(�μ���ȣ�� ����)  
select *from
    (select deptno, job, sal from emp)
    pivot(max(sal)
        for deptno in (10, 20, 30))
    order by job;