--���̺� ������ �����ϴ� ���Ǿ�
CREATE TABLE EMP_RECORD2 AS SELECT*FROM EMP WHERE 1<>1;

--���� ����
--DISTINCT ����Ʈ : �ߺ� ���� //����
SELECT DISTINCT �÷� FROM ���̺�

--BETWEEN A AND B
--�޿��� 2000~3000������ ��� �����͸� ��ȸ�ؾ� �Ѵٸ�?
select * from emp where sal between 2000 and 3000;

--��ҹ��� �ٲ��ִ� ���� �Լ�
--upper : ���� �����͸� ��� �빮�ڷ� ��ȯ
--lower : ���� �����͸� ��� �ҹ��ڷ� ��ȯ
--initcap : ù���ڸ� �빮�ڷ� , ������ ���ڸ� �ҹ��ڷ�
select ename,upper(name),lower(ename),initcap(ename) from emp;
--��)��� �̸��� 'SCOTT'�� ������ ã��
select*from emp where upper(ename) = upper('scott');
--��)��� �̸��� 'SCOTT'�ܾ ������ ������ ã��
select*from emp where upper(ename) like upper('%scott%');

--���ڿ� �Ϻθ� �����ϴ� SUBSTR
select job, substr(job,1,2), substr(job, 3,2), substr(job, 5) from emp;
-- substr(job,1,2)�� �ǹ�: ������� clerk�� ù��° ���ں��� �α��� ��� // cl
-- substr(job,3,2)�� �ǹ�: ������� clerk�� ����° ���ں��� �α��� ��� // le
-- substr(job, 5)�� �ǹ�: ������� clerk�� �ټ���° ���ں��� ������ ��� // k

--Ư�����ڸ� �ٸ����ڷ� �ٲٴ� replace
select '010-1234-5678' as replace_before,
replace('010-1234-5678', '-', ' ') -- 010 1234 5678
replace('010-1234-5678', '-') -- 01012345678
from dual;

--���� where, having ����
--where : ��ȸ�� ���� �����ϴ� ���ǽ�
--having : ��� �׷��� �����ϴ� ���ǽ�
--emp���̺��� �ּ��� ��å�� ��ձ޿��� 500�̻��� ������� �μ���ȣ,��å,�μ��� ��å�� ��ձ޿� ���
select deptno,job,avg(sal)as ��ձ޿�
from emp
group by deptno,job
having avg(sal) >= 500;

--insert into ���������� �̿��� ������ �߰� ����275P

--update set: ������ �����ϱ�
--��ü���� : dept_temp2�� loc�÷��� seoul�� ���� ����
update dept_temp2 set loc ='SEOUL';
--�Ϻκм���: where ���� �̿��Ѵ�. DEPTNO�� 40�� dname,loc�� ����.
update dept_temp2 set dname = 'DATABASE', LOC= 'SEOUL'
WHERE DEPTNO = 40;
--���� �ǵ�����
rollback;
--���������� ������ �����ϱ� ����280p

--alter:���̺� ���� 317p
--emp������ ���̺� ����
create table emp_alter as select * from emp;
select * from emp_alter;

--ADD:�� �߰�
alter table emp_alter add hp varchar2(20);

--RENAME:�� �̸� ����
alter table emp_alter rename column hp to TEL;
select * from emp_alter;

--���� �ڷ��� ����
alter table emp_alter 
modify empno number(5);
desc emp_alter; --���� Ȯ��

--�� ����
alter table emp_alter --���̺�
drop column tel; --�÷�
select*from emp_alter;

--���̺� �̸� �����ϱ�
rename emp_alter to emp_rename;

--��������
--�丮�� �̸��� ������,������,��Ƽ���� �����Ϳ� �ش��ϴ� ���ڵ� ���
--�������:���̵�,���ĸ�,������,�������з���ȣ,�丮��
select F.���̵�,F.���ĸ�,F.������,F.�������з���ȣ,S.�丮��
from food F ,store S
where F.�������з���ȣ=S.�������з���ȣ
and �丮�� in('������','������','��Ƽ��');


--food���̺��� ������ 10000~20000 ������ ������ ���
--�������:���̵�,������,����,�丮��
select F.���̵�,F.������,F.����,S.�丮��
from food F, store S
where F.�������з���ȣ=S.�������з���ȣ
and F.���� between 10000 and 20000
order by ����;

--�ܺ�����

--store���̺� food���̺��� �ܺ������ϱ�
--�������з���ȣ �÷� �̿�, store���̺�� food���̺��� ��� �÷� ���
select*
from store S left outer join food F on(S.�������з���ȣ=F.�������з���ȣ);

--left join�� right join�� ����� �ٸ�������,
--dept���̺���,deptno 40���� �ֱ� ������
--�� �ڵ忡�� left outer join�� �ؾ� dept���̺��� ������ �ȴ�.
--��������� deptno�� �������� �� ���̺��� join�Ǿ��� ������,
--���ǽĿ��� E.deptno=D.deptno�� �Ȱ�.��
select D.deptno,D.dname,E.empno,E.ename,E.job,E.sal
from dept D left outer join emp E
--emp���̺��� �μ���ȣ��, dept���̺��� �μ���ȣ�� ������,
on(E.DEPTNO=D.DEPTNO)
order by D.deptno,E.ename;

--�������� �߰��ϱ�
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
 --foreign key �����ϴ� ���   
deptno number(2) constraint empfk_deptno_fk references dept_fk (deptno));


ALL > 1,2,3,4,5 -- �ִ�
ALL < 1,2,3,4,5 -- �ּڰ�

ANY > 1,2,3,4,5-- �ּڰ�
ANY < 1,2,3,4,5-- �ִ�

1 -> 2,3,4, <- 5 -- ANY
<- 1,......,5 -> -- ALL

--������ �������� 255P
SELECT * FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL ASC;
800                             2950 3000 5000
    950 1250 1250 1500 1600 2850

�μ���ȣ�� 30�� ����� �ִ� �޿����� ���� �޿��� ���� ����� ��� ������ ����ϼ���.
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
�μ���ȣ�� 30�� ����� �ּ� �޿����� ���� �޿��� ���� ����� ��� ������ ����ϼ���.
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
 
�μ���ȣ�� 30�� ����� �ִ� �޿����� ���� �޿��� ���� ����� ��� ������ ����ϼ���.
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);
�μ���ȣ�� 30�� ����� �ּ� �޿����� ���� �޿��� ���� ����� ��� ������ ����ϼ���.
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--���߿� �������� 258p
select*from emp where (deptno,sal) in (select deptno, max(sal) from emp group by deptno);
--emp ���̺��� �μ���ȣ�� �ִ�޿��� ������ּ���.