--[���� 1]  ������̺��� �����ȣ, �����, �޿��� �˻��Ͻÿ�
select  employee_id,last_name,salary 
from hr.employees;
--[���� 2]  ������̺��� �μ���  90���� ������� �����,�Ի���,����,�μ��ڵ带 ����Ͻÿ�
--         ����1)  ������  �����, �� �� ��,��   ��,�μ��ڵ�� �Ͻÿ�(as ����)
--         ����2)  ����  = �޿� * 12
--         ����3)  ���� �ڿ� ȭ����� "��"�� ���̽ÿ� (|| ���Ῥ����)
--         ����4)  �������  first_name , last_name�� ���� �Ͻÿ�

select first_name || '  ' ||last_name as �����,hire_date as "�� �� ��", 
          salary*12 || '��' as "��  ��" , department_id as �μ��ڵ�
from hr.employees
where department_id=90;
 
--[���� 3]  ������̺���  ����ID��  IT_PROG,ST_MAN,SA_REP�� ����� ǥ���Ͻÿ�
--        ����1)  �����, ����ID, �μ�ID�� ǥ��
--        ����2)  or  ������ �̿� ,  in ������ �̿� �Ѵ� ���ÿ�
--        or������ �̿�
select last_name,job_id,department_id 
from employees
where job_id='IT_PROG' or  job_id='ST_MAN' or job_id='SA_REP';

--       in������ �̿�
select last_name,job_id,department_id 
from employees
where  job_id  in ('IT_PROG','ST_MAN','SA_REP');

--[���� 4]  �Ի�����  1997~2000 ������ �Ի��� �������  �����,�Ի���, ���� ID�� ����Ͻÿ� 
--(and,  between������ ��� ǥ��)
--  and������
select last_name,hire_date,job_id 
from employees
where  hire_date >= '1997/01/01'
            and  hire_date  <= '2000/12/31';

-- between������ (�ʰ�,�̸��� ����)
select last_name,hire_date,job_id 
from employees
where  hire_date  between '1997/01/01' and '2000/12/31';




--[���� 5]  Ŀ�̼��� ���� �ʴ� �������   �̸��� ����,Ŀ�̼��� ����Ͻÿ�
--         (is  null)  
select last_name,salary*12,commission_pct
from employees
where  commission_pct is null;
--[���� 6]   ����ID��  IT�� ���ԵǾ��ִ� ������� �̸��� ����ID�� ���Ͻÿ�

select last_name,job_id 
from employees
where  job_id like '%IT%'; 
--[���� 7] �޿���  1500�̻�  5000������ �����  IT_PROG�� ���� ID�� ����� ǥ���Ͻÿ�
--����1) ������  ����̸�, �̸���,��ȭ��ȣ

select  last_name as ����̸�,email as �̸���,phone_number as ��ȭ��ȣ
from employees
where (salary between 1500 and 5000) and job_id='IT_PROG';

--[���� 8 ]   ������ ���� �����ȣ , �̸�, ������ ����Ͻÿ� 

select employee_id as "�����ȣ",first_name || '  ' || last_name as "��  ��",
       salary * 12 || '�޷�' as "��  ��"
from  employees;

 
--[����  9] ����� �̸��� job_id�� ������ ���� ����Ͻÿ� 

 select last_name || ' is a ' || job_id as "Employee Detail" from employees; 
--[���� 10] �޿��� 2500���� �̰ų� 3000�̻��̸鼭 90�� �μ��� ����� �̸�, �޿�, �μ�ID�� ����Ͻÿ�.
--      ����1) ������ �����, ��  ��, �μ��ڵ�� �Ͻÿ�
--      ����2) �޿��տ� $�� ���̽ÿ�
--      ����3) ������� first_name�� last_name�� �����ؼ� ����Ͻÿ�

select first_name ||'  ' || last_name as "�����",
       '$'|| salary as "��  ��",department_id as "�μ��ڵ�"
from employees
where (salary<=2500  or  salary>=3000) and department_id=90;

--[���� 11 ] ����ID�� 'SA_REP' �̰ų� 'AD_PRES' �̸鼭 �޿��� 15000�� 
--�ʰ��ϴ� ������� �̸�, ����ID ,�޿��� ����Ͻÿ�
 
select last_name as "�̸�",job_id as "����ID", salary || '��' as "�� ��"
from employees
where  (job_id = 'SA_REP' or job_id = 'AD_PRES') and salary > 15000;


--[����12] Employees���̺��� ����ID�� �ߺ����� �ʰ� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
select distinct job_id
from employees;
 
 
--[����13 ] �Ի����� 97���� ������� �����ȣ,�̸�,�Ի����� ǥ���Ͻÿ�
select employees_id,last_name,hire_date
from employees
where hire_date like '97%';

  
--
--[���� 14 ] ����ID�� MAN�� ���ԵǾ��ִ� ������� �̸�,����ID,�μ�ID�� ����Ͻÿ�

 

select last_name,job_id,department_id
from employees
where  job_id  like '%MAN%';


 
--[���� 15 ] �����, �μ�ID, �Ի�����  �μ����� �������� �����Ͻÿ�
--     �����μ��� ��������  �Ի��� ������ �����Ͻÿ�

select last_name,department_id,hire_date 
from employees
order by  department_id  desc,  hire_date asc;


 


--[���� 16] ����� ���ڵ带 �˻��Ͻÿ�(concat,  length)
--      ����1) �̸��� ���� �����Ͻÿ�(concat)
--      ����2) ������ �̸��� ���̸� ���Ͻÿ�(length)
--      ����3) ���� n���� ������ ���(substr)
select  employee_id, concat(first_name,last_name) as name, 
length(concat(first_name,last_name)) as length
from employees
where  substr(last_name,-1,1)='n';

 

 
--[���� 17] 2000�� ���Ŀ� ���� ����� ã���ÿ� 
select last_name,to_char(hire_date,'dd-mon-yyyy')
from employees
where hire_date>to_char(to_date('2000-01-01','yy-mm-dd'),'yy-mm-dd');
 
--[���� 18] �޿��� 10000�̸��̸� �ʱ�, 20000�̸��̸� �߱� �� �ܸ� ����� ����Ͻÿ�
--����1) �÷�����  '����'���� �Ͻÿ�
--      ����2) ������ �����ȣ, �����, ��  ��
--      ����3) ����(��������)���� �����ϰ�, ������ �����(��������)���� �����Ͻÿ�

select employee_id as �����ȣ,last_name as �����, 
       case 
          when salary<10000 then '�ʱ�'
          when salary<20000 then '�߱�'
          else '���'
       end "����"
from employees
order by 3,2;
 

--[���� 19 ] ������̺��� �����ȣ, �̸�, �޿�, Ŀ�̼�, ������ ����Ͻÿ�
--        ����1) ������ $ ǥ�ÿ� ���ڸ����� �޸��� ����Ͻÿ�
--        ����2) ���� = �޿� * 12 + (�޿� * 12 * Ŀ�̼�) 
--        ����3) Ŀ�̼��� ���� �ʴ� ����� �����ؼ� ����Ͻÿ�

select employee_id as "�����ȣ",last_name as "����̸�",
       salary as "�޿�", nvl(commission_pct,0) as "Ŀ�̼�",
       to_char(to_number((salary*12+(salary*12*nvl(commission_pct,0)))),
        '$9,999,999') as "����"
from employees;   

 
 
--[���� 20] �Ŵ����� ���� ����� �Ŵ���id��, 1000������ ǥ��
--        ����1) ������ �����ȣ,�̸�,�Ŵ���ID
--        ����2) ��� ����� ǥ���Ͻÿ�       
 
select employee_id,last_name,nvl(manager_id,1000) as manager_id
from employees;





