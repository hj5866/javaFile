--1. salary ���̺��� ��� ���ڵ带 �˻�
select*from salary;

--2. salary ���̺��� �̸�,�μ�,��å,�̸��ϸ� �˻�
select �̸�,�μ�,��å,�̸��� from salary;

--3. salary ���̺��� ��å(�ߺ� ����)�� �˻� 
select distinct ��å from salary;

--4. salary ���̺��� ���̰� 30 �̻��� ���ڵ��� �̸�,�μ�,����,���� �˻�
--   (���糯¥�� �⵵-������ �⵵)>=30
select �̸�,�μ�,����,���� from salary
where trunc(months_between(sysdate,����)/12) >=30;
    
--5. salary ���̺��� �μ��� '��ȹ��'�� ���ڵ��� ��ȣ,�̸�,�μ�,�Ի��� �˻�
 select ��ȣ,�̸�,�μ�,�Ի��� from salary where �μ�='��ȹ��'; 
 
--6. salary ���̺��� ������ 3000�̻� 4000�̸��� ���ڵ��� �̸�, �μ�, ��å, ���޸� �˻�
select �̸�,�μ�,��å,���� from salary where ���� >=3000 and ���� < 4000;
select �̸�,�μ�,��å,���� from salary where ���� between 3000 and 3999;

--7. in Ű���� ��� salary ���̺��� ��å�� ����, �븮,����� ���ڵ常 �˻�
select *from salary where ��å in('����','�븮','���');

--8. between Ű���� ��� salary ���̺��� �Ի����� 2020/01/01 ~ 2022/12/31 �� ���ڵ常 �˻�
select *from salary where �Ի��� between '2020/01/01' and '2022/12/31';


--9. not Ű���� ��� salary ���̺��� �߰������� �ִ� ���ڵ常 �˻�
select*from salary where �߰����� is not null;

--10. ����̸��� '��'���� ���ڵ��� �̸�, �μ�, ��å,�̸��� �˻�
select �̸�, �μ�, ��å, �̸��� from salary where �̸� like '��%';

--11. ����̸��� �������� �������� �����Ͽ� ���̺� ǥ���ϱ�
select *from salary order by �̸� asc;

--12. �μ��� ��������,��å�� �������� �����Ͽ� ���̺� ǥ���ϱ�
select*from salary order by �μ� asc, ��å desc;

--13. �μ���'�ѹ���' �̰ų� 1980��� �¾ �������� ���� ǥ���ϱ�
select *from salary where �μ�='�ѹ���' or ���� between '1980-01-01' and '1989-12-31' ;
select *from salary where �μ�='�ѹ���' or to_char(����,'YYYY') >= 1980 and to_char(����,'YYYY') < 1990;

--14. �߰������� �ִ� ���ڵ带 �˻��ϵ�, ���� ���� ���������Ͽ� ǥ��
select *from salary where �߰����� is not null order by ���� desc;

--15. ��ȣ,�̸�,�μ�,�Ի���,����,���� ǥ�� ����:����*12-����3.3%
select ��ȣ,�̸�,�μ�,�Ի���,����,����*12-(����*12*0.033) as ���� from salary ;

--16. �μ��� ����,�ְ��(����),������(����),�հ�(����),���(����)ǥ��
select �μ�, max(����), min(����), sum(����), floor(avg(����))as ��տ��� from salary
group by �μ�;

--17. �μ��� �ο� ǥ���ϱ�
select �μ�,count(*) from salary group by �μ�;

--18. �̸��� '������'�� ������ ������ �μ��� �ִ� ������� �̸�,�Ի��� ǥ�� ��,'������'������ ǥ�� ����.
select �̸�,�Ի��� from salary where �μ� in (select �μ� from salary where �̸� in '������') and �̸� <> '������';

--19. �ڽ��� �޿��� ��� �޿� �̻��� �������� ���� ǥ��, �� �޿��� �������� �������� ����
select *from salary where (���� >= (select avg(����) from salary)) order by ���� desc;

--20, �߰������� null�̸� Xǥ��, �ƴϸ� Oǥ���ϱ�
select �̸� ,�μ�,��å,�Ի���, nvl2(�߰�����,'O','X')as �߰����翩�� from salary;

--21. salary ���̺��� �̸��� ���� �̸����� �и��ؼ� ǥ���ϰ�, �μ��̸����� '��'�� ���� �μ��̸� ǥ���ϱ�
select substr(�̸�,1,1)as ��,substr(�̸�,2,2)as �̸�, substr(�μ�,1,2)as �μ� from salary;

--22. salary���̺��� �̸� ��� ������ *�� �ٲ㼭 ǥ���ϱ�
select replace(�̸�,substr(�̸�,2,1),'*')as �̸�������ȣ from salary;
select substr(�̸�,1,1) || lpad('*',length(�̸�)-2,'*')|| substr(�̸�,3,1) as �̸�������ȣ from salary;
SELECT CONCAT(SUBSTR(�̸�, 1, 1), CONCAT('*', SUBSTR(�̸�, 3, 1))) AS �̸� FROM SALARY;
select substr(�̸�,1,1) || '*' || substr(�̸�,3,1) as �̸�������ȣ from salary;

--23. salary���̺��� �̸��� '��'�� �ٿ��� ǥ���ϱ�
select concat(�̸�,'��') from salary;
select �̸� || '��' as �̸� from salary;
--�ѱ��� 2byte�� �����ϹǷ� length(�̸�)*2+2 �ؾ� ��
select rpad(�̸�,length*2+2,'��') as �̸� from salary;

--24. salary���̺��� ������ ��հ��� �Ҽ��� 2�ڸ������� �ݿø��Ͽ� ǥ���ϱ�
select round(avg(����),2)as ������հ� from salary;
select to_char(avg(����),'FM9999.00')as ������հ� from salary;

--25. salary���̺��� ��� ������ �Ի��Ϸκ��� 12���� �Ŀ� ȣ���� ���� �����̴�. ȣ���� ���� ������ ��¥�� ǥ���ϱ�
select �̸�,to_char(ADD_MONTHS(�Ի���,12),'YYYY-MM-DD')as ������¥ from salary;

--26. salary���̺��� �Ի��ϰ� ������ �⵵-��-�Ϸ� ǥ���ϱ�
select �̸�, �μ�, to_char(�Ի���,'YYYY-MM-DD')as �Ի���,to_char(����,'YYYY-MM-DD')as ���� from salary;

--27. salary���̺��� ��å�� '����'�̸� ������ 10% �λ�, '����'�̸� ������ 7% �λ�, '����'�̸� 5% �λ�, '�븮'�̸� 3% �λ�, '���'�̸� 0 ���� ���� ǥ��
select �̸�,����,
    decode(��å,
        '����',����+����*0.1,
        '����',����+����*0.07,
        '����',����+����*0.05,
        '�븮',����+����*0.03,
        ����
    )as �λ�ȿ���
    from salary;

--28. salary���̺��� ������ ��տ����̻��� ������ �μ��� ��ȣ,�̸�, �μ�, ����,�̸����� �μ����� �������� �����Ͽ� ǥ���ϱ�
select ��ȣ,�̸�,�μ�,����,�̸��� from salary where (���� >= (select avg(����) from salary)) order by �μ�;

--29. 28�� ������ ����� �Ұ�� �Ѱ踦 ǥ���ϱ�
select ��ȣ,�̸�,�μ�,����,�̸��� from salary where (���� >= (select avg(����) from salary)) group by rollup(��ȣ,�μ�,�̸�,����,�̸���);

--30. salary���̺��� �� ���ڵ� �� ǥ���ϱ�
select concat(count(*),'��')as �ѷ��ڵ�� from salary;