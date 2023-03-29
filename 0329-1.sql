-- as ����ϸ� ��Ī ���̱� ����
select ename as �̸�, sal as ����, sal*12+comm as ����,comm as �߰��޿� from emp;

-- as�� �ϳ��� �ٲٰ������, ���� �� �� �ű⿡ as�� ���� select*from ���̿� �� �� ����!
-- desc�� �ڿ� ���̸� �������� ������ �����ϴ�.
select empno,ename,job,mgr hiredate, sal as ����,comm,deptno 
from emp order by sal desc;

-- order by = ����
-- 1������:deptno(��������), 2������: sal(��������)
select * from emp order by deptno asc, sal desc;

-- emp���̺��� job�� �����͸� �ߺ����� ����ϱ�
select distinct job from emp;

-- 92������ 3-1��
select * from emp;
-- 92������ 3-2��
select empno as employee_no, ename as employee_name, mgr as manager,
sal as salary, comm as commission, deptno as derartment_no from emp;
-- 92������ 3-3�� //desc(��������) asc(��������)
select * from emp order by deptno desc,ename asc;
-- 3���� ��ħ
select empno as employee_no, ename as employee_name, mgr as manager,
sal as salary, comm as commission, deptno as derartment_no from emp
order by deptno desc, ename asc;

-- where �� ����
select*from emp where deptno=30;
-- ��ȣ�� 30�̸鼭 jop�� SALESMAN�ΰ� ���
select*from emp where deptno=30 and job = 'SALESMAN';
-- ��ȣ�� 30�̰ų� jop�� CLERK�ΰ� ���
select*from emp where deptno=30 or job = 'CLERK';

select *from emp where sal*12=36000;
select* from emp where sal >= 3000;
-- �̸��� �ձ����� �ƽ�Ű�ڵ尪�� F���� ũ�ų�������
select*from emp where ename >= 'F';
-- ���ڿ��� ���ʴ�� �ձ��ں��� �ѱ��ھ� ����
select*from emp where ename <= 'FORZ';
-- �̸��� SMITH�� �ƴѰ� �ƴѰ�(not)
select*from emp where not ename !='SMITH';

--job�� ���� 'MANAGER','SALESMAN','CLERK'�ΰ� ����ϱ�
select*from emp where job in ('MANAGER','SALESMAN','CLERK');
--job�� ���� 'MANAGER','SALESMAN','CLERK'�� �ƴѰ� ����ϱ�
select*from emp where job not in ('MANAGER','SALESMAN','CLERK');

-- a���� b���� ����:between
select*from emp where sal between 2000 and 3000;
select*from emp where sal not between 2000 and 3000;

--����111 ����, S�� �����ϴ� ���ڿ��� ���
select*from emp where ename like 'S%';
--�ι�° ���ڰ� L�� ���ڿ� ���
select*from emp where ename like '_L%';

-- is null = ���� ���°�
select*from emp where comm is null;
select*from emp where comm is not null;

select*from emp where sal > null or comm is null;

-- union(������)���̺� ��ġ�� ����119p 
select empno,ename,sal,deptno from emp where deptno =10
union
select empno,ename,sal,deptno from emp where deptno =20;
--�ڷ���(������Ÿ��)�� ���ٸ� union ����
select empno, ename, deptno from emp where deptno=10
union
select sal, job, deptno from emp where deptno=20;

--�ٸ� ���̺� ��ġ��(�� �̸��� �տ� �ۼ��� select���� �� �̸��� ����Ѵ�)
select empno,ename,job from emp where deptno=30
union
select deptno,dname,loc from dept where deptno=30;
-- union all(�ߺ� �����͵� �Բ� ���)
select empno,ename,sal,deptno from emp where deptno=10
union all
select empno,ename,sal,deptno from emp where deptno=10;

-- minus(������) deptno�� 10���� ������ ���� ���
select empno,ename,sal,deptno from emp
minus
select empno,ename,sal,deptno from emp where deptno=10;

--intersect(������) deptno�� ��ġ�� 10���� ���
select empno,ename,sal,deptno from emp
intersect
select empno,ename,sal,deptno from emp where deptno=10;
