--  SELECT  �÷�,,,, FROM   ���̺��,,,;
--Q1)������̺��� ����� �̸���  ������ �������. 
SELECT ENAME, SAL
FROM SCOTT.EMP;

--Q2) ������̺��� ��ü �����͸� �������. 
SELECT * 
FROM SCOTT.EMP;

--Q3) ������̺��� ����� ��ȣ, ����� �̸�, ������ ����غ���.  
SELECT EMPNO,ENAME, SAL 
FROM SCOTT.EMP;

--Q4)�μ����̺��� �μ��� �̸��� �μ���ȣ�� �������.  
SELECT DNAME,DEPTNO
FROM SCOTT.DEPT;

--Q5)������̺��� ����� ��ȣ�� '���'�̶�� ����ϰ� ����� �̸��� '�̸�'�̶�� �������.  
--��Ī :�÷���Ī, ���̺��� ��Ī  
--�÷��� ��Ī,�÷���  "��  Ī" , �÷��� AS ��Ī, �÷��� AS "��  Ī" 
SELECT ENAME ���, ENAME �̸� 
FROM SCOTT.EMP;

SELECT ENAME AS ���, ENAME AS �̸� 
FROM SCOTT.EMP;

SELECT ENAME "�� ��", ENAME "�� �� "
FROM SCOTT.EMP;

SELECT ENAME AS "�� ��", ENAME  AS "�� ��"
FROM SCOTT.EMP;

--Q6)���̺��� ��Ī�� ���� [����� : ���̺�鿡�� ������ �÷��� ������� , ������]
--6-1) ������̺��� ����� �μ����̺��� ������ ��ü��� �غ���.  
SELECT  *
FROM SCOTT.EMP, SCOTT.DEPT;--/ - CROSS JOIN  /  [ANSI  QUERY]
--6-2) ������̺��� ����� �μ����̺��� ������ ������̸��� �μ���ȣ��  ��� �غ���.
SELECT E.ENAME, D.DEPTNO
FROM SCOTT.EMP E, SCOTT.DEPT D;   --���̺��� ������� ��Ī  ->���̺�� ��Ī 

--6-3) ������̺��� ����� �μ����̺��� ������ ������̸��� �μ���ȣ��  ��� �غ���.
SELECT ENAME, D.DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT D;   --���̺��� ������� ��Ī  ->���̺�� ��Ī 


--6-4) ������̺��� ����� �μ����̺��� ������ ������̸��� �μ���ȣ��  ��� �غ���.
SELECT ENAME, SCOTT.DEPT.DEPTNO    --  ���̺� ��� 
FROM SCOTT.EMP , SCOTT.DEPT ;   

-- EX) 
SELECT ENAME, D.DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT "D";   --���̺��� ������� ��Ī  ->���̺�� ��Ī 

SELECT ENAME, "��".DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT "��";   --���̺��� ������� ��Ī  ->���̺�� ��Ī 


--Q7) ����� ���̺��� ������̸��� ������ ��� �ϵ� ������ �������� �������.
  -- �÷�+ �÷�  = ����  
  SELECT ENAME, SAL*12 ����
  FROM SCOTT.EMP;
  
--Q8) ����� ���̺��� ������̸��� ������ ��� �ϵ� "00�� ������  00�̴�"
 -- || (���Ṯ�ڿ�)
 SELECT ENAME||'��'
 FROM  SCOTT.EMP;
 
SELECT ENAME||'�� ������' ||SAL ||'�̴�'
FROM  SCOTT.EMP;

--Q9) SELECT   �÷�����Ʈ FROM ���̺���Ʈ WHERE ���ǹ�  
 -- ������̺��� ����� �̸��� JONES�� ���ڵ带 ��ü ��� �غ���.  
SELECT *
FROM SCOTT.EMP
WHERE ENAME ='JONES';

--Q10)�μ����̺��� �μ���ȣ�� 10 �Ǵ�  20�� ���븸 ��� �غ���.  
SELECT *
FROM SCOTT.DEPT
WHERE DEPTNO =10 OR DEPTNO =20;

--Q11)������̺��� ����� �̸�, ����� ����, Ŀ�̼�, ����+Ŀ�̼���  �����̶�� ��� �غ���.  (4Ģ����)
SELECT ENAME, SAL,COMM, SAL+COMM ����
FROM SCOTT.EMP;
  --NULL�� Ű����� null
   --1)NULL����, 0�� �����̴�. 
   --2)NULL�� ������ �����̴�. 
   --3)Null�� ���� ����� null�̴�. 
   --4)null�� �ϳ��� ������ �������� �������� null / ������ ���� �����Ͱ� ������ null�̴�. 

--Q12) ������̺��� ����� �̸�, ����� ����, Ŀ�̼�, ����+Ŀ�̼���  �����̶�� ��� �غ���.
      --null�� ����   nvl(�÷�, �ʱⰪ)        
   SELECT  COMM, NVL(COMM,0)
   FROM SCOTT.EMP;
   
SELECT ENAME, SAL,COMM, SAL+NVL(COMM,0) ����
FROM SCOTT.EMP;

--Q13) ������̺��� ����� �̸�, Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� �������� ä���� ��� ����. 
SELECT ENAME, COMM, NVL(COMM,SAL) AS RES
FROM SCOTT.EMP;

--Q14) ����̸�, �Ŵ����� ����ϵ� ABCD��� ���� �߰��÷����� �߰�����. 
SELECT ENAME, 'ABCD', MGR
FROM SCOTT.EMP;

--Q15) ����̸�(���), ������(������)��� �غ���.  SCOTT(���)
SELECT ENAME||'(���)', MGR|| '(������)'
FROM SCOTT.EMP;

--Q16) �ߺ� �� ���� 
-- DISTINCT ��� Ű���带 �÷��� �տ� ����Ǹ�  �ߺ��� ���� �� ���� �� ���
-- ���� �÷��� �ִ� ������ ���� �� �ѹ��� ��µȴ�.  
-- SELECT  �ٷ� �ڿ� ���ȴ�. 
-- DISTINCT ������ ���� ���� ����� �� �ִ�.  
SELECT DISTINCT JOB
FROM SCOTT.EMP;

--Q17) �μ���(DEPTNO) ����ϴ� ����(JOB)�� �ѹ����� ��ȸ�Ѵ�. 
SELECT DISTINCT DEPTNO , JOB
FROM SCOTT.EMP;

--Q18)�ǻ翭(PSEUDO COLUMNS)   : ���̺�� �����ϰ� QUERY������ ���μ� ������ �Ҽ� ����.  
 --ROWNUM :SELECT ������ �˻��ϰ� �Ǹ� �ο���� �����Ѵ�.  
 /*        �˻��� ���� �Ϸù�ȣ�̴�. 
           ORDER BY�������� �ο��ȴ�.             
            
 --ROWID  : ���̺��� Ư���� ���� ������ �� �ִ� id  
 
 */
    SELECT ROWNUM, ROWID, ENAME
    FROM  SCOTT.EMP;

--Q19) WHERE �� ���  :  ������(JOB)��  MANAGER�� ��� ������ ����غ���.  
/*
SELECT �÷�����Ʈ AS "�� Ī  "  ->  ""  Ÿ��Ʋ��,  '' ������ VALUE  
FROM ���̺���Ʈ  ��Ī
WHERE ���ǽ�; -> ���̸�, �񱳿�����, ���ǿ����� ������  ���ϰ���  TRUE�� �����͸� �����Ѵ�. 
              -> �񱳴��  : ���, ���̸�, ����� ������ �̷������.  
                ���, ��,��, LIKE, IN, NOT, BETWEEN,IS NULL, IS NOT NULL, ANY,ALL  ��
*/
SELECT  *
FROM SCOTT.EMP
WHERE JOB='MANAGER';  -- ���ڿ�, ��¥, �ð� 

--Q20)�޿��� 3000 �̻��� ����ǹ�ȣ, ����̸�, ������ ��� �غ���.  
SELECT  EMPNO, ENAME,SAL
FROM SCOTT.EMP
WHERE SAL  >= 3000;

--Q21)�޿��� 1300  ���� 1700������ �ش��ϴ� ����� �̸�, ������ �������. 
  -- ����÷�  BETWEEN ������   AND ū��   =    EXPR >= A AND  EXPR <=B
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  BETWEEN 1300 AND 1700;
  
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  >= 1300 AND  SAL<= 1700;
   
  --Q22)�޿��� 1300  ���� 1700������ �ش��ϴ� ����� �ƴ�  �̸�, ������ �������. 
  -- ����÷� NOT BETWEEN ������   AND ū��   =    EXPR < A OR  EXPR > B 
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL NOT BETWEEN 1300 AND 1700;
  
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  < 1300 OR  SAL> 1700;
  
  
  --Q23)BETWEEN AND  ������ ->����� ����
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  BETWEEN 1700 AND 1300;
   
   --Q24)  IN (������ �߿� ��ġ�ϴ� ��)  : EXPR IN(3,4,5) 
   /*
            ������� ���߿� �ϳ��� ��ġ�ϴ� ���� ����
            IN   =ANY �����ڿ� ����. 
            NOT IN  !=ALL �� ����.  
   */
  -- �����ȣ�� 7902, 7788, 7566  �� ����� �̸��� �����ȣ, �Ի���(0000�� 00�� 00�� 00��) �� �������.  
   SELECT ENAME, EMPNO, TO_CHAR(HIREDATE,'YYYY "��" MM "��" DD "��"  DAY')  
   FROM  SCOTT.EMP
   WHERE EMPNO IN (7902,7788, 7566);
  
  --Q25)  LIKE (������ ������ ���� ��) 
  /*
        Ư�� ���Ͽ� ���ϴ� ���ڿ��� �����ϴ� Ű���� 
        %:������ ���� ���ڿ�(���鰡��)  
        _:�ѱ���. 
        ESCAPE :  �˻��� ���ڿ� %, _���� ����    
  */
  
  -- ����� �̸��� S�� �����ϴ� ����� �̸���  ������ �������.  
  SELECT ENAME, SAL
  FROM SCOTT.EMP
  WHERE ENAME LIKE 'S%';
  
  --PLAYTER_T���̺��� �����̸��� _���ڰ� ����ִ� ������ ������ �������.  
  SELECT PNAME 
  FROM PALYTER_T
  WHERE PNAME LIKE '%@_%' ESCAPE   '@';  --  'ȫ_�浿'   '100%'
  
  --Q26).  Ŀ�̼��� �������� ���� ����� ����غ���.  
  SELECT  *
  FROM SCOTT.EMP
  WHERE COMM IS NOT NULL;
  
  SELECT  *
  FROM SCOTT.EMP
  WHERE COMM = NVL(COMM,0);
  
  /*
  �� �����ڴ� �� ������ ����� �����Ͽ� �ϳ��� ����� �����ϰų� ���� ������ ����� �����ϱ⵵ �Ѵ�.
  ������ ��ü�� ���� ��쿡�� ���� ��ȯ�ȴ�.
1) WHERE �� ���� ���� ������ ������ �� ����Ѵ�.
2) AND�� ��� ������ ����� TRUE���� ���õȴ�.
3) OR�� �� ������ ����� TRUE�̸� ���õȴ�.
4) NOT�� �ڵ����� ������ ����� FALSE�̸� ���õȴ�.
5) �켱������ NOT, AND, OR ���̴�.
6) (  ) �� ��� �켱 ���� ��Ģ���� �켱�Ѵ�.  
  
  */
    
  --Q27) EMP ���̺��� �޿��� 2800 �̻��̰� 
  --JOB�� MANAGER�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� �������.
   SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
   FROM SCOTT.EMP
   WHERE SAL  >= 2800  AND JOB ='MANAGER';
  
  --Q28)EMP ���̺��� �޿��� 2800 �̻��̰ų�
  --JOB�� MANAGER�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����Ѵ�. 
  SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
   FROM SCOTT.EMP
   WHERE SAL  >= 2800  OR JOB ='MANAGER';
  
  --Q29)EMP ���̺��� JOB�� 'MANAGER', 'CLERK', 'ANALYST �� �ƴ� 
   --����� �����ȣ, ����, ������, �޿�, �μ���ȣ�� �������
    SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
    FROM  SCOTT.EMP 
    WHERE  JOB NOT IN ('MANAGER', 'CLERK', 'ANALYST');
  
  --Q30) ������ ���� :  �Ի��� ������ �����ؼ� �����ȣ, �޿�, �Ի�����, �μ���ȣ�� ��� �غ���.  
  /*
    SELECT
    FROM 
    WHERE     
    ORDER BY  ASC|DESC  �÷���:  ORDER BY�� SELECT������ �������� ����Ѵ�. 
    
    -ASC :�������� (A->Z,  �� ->��, 1-10 ) 
    -DESC: ��������
    NULL ���������� �������� ǥ�õȴ�. 
  */
  SELECT ROWNUM, ROWID, ENAME, SAL, HIREDATE,DEPTNO 
  FROM SCOTT.EMP
  ORDER BY   5  ASC ;
  
  
  --Q30)�μ����� ����ϴ� ������ �ѹ��� ��ȸ����, ������������ ��������. 
   SELECT  DISTINCT DEPTNO, JOB
   FROM  SCOTT.EMP
   ORDER BY JOB;
   
   
  --Q31) �Լ� : �����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, ��Ÿ�Լ�(�������Լ�, �м��Լ�)���� ���Ѵ�. 
  
  SELECT NLS_INITCAP('ijsland') "InitCap"
  FROM DUAL;
  
  -- Q32)������̺��� scott�� ��� ��ȣ, �̸�, ������(�ҹ���)�� ����غ���. 
   SELECT EMPNO, ENAME, LOWER(JOB)
   FROM SCOTT.EMP
   WHERE   ENAME =UPPER('scott');
   
   -- Q33) ����� �̸��� �����ȣ�� �ϳ��� �÷��� �ۼ�����. �� ||���� ����.  
   SELECT ENAME, EMPNO, CONCAT(ENAME,EMPNO) AS  RES
   FROM SCOTT.EMP;
   
  
  
  
  
  
  
  /*
  - LOWER(char) ? ���ڿ��� �ҹ��ڷ� 
- UPPER(char) ? ���ڿ��� �빮�ڷ� 
- INITCAP(char) ? �־��� ���ڿ��� ù ��° ���ڸ� �빮�ڷ� ������ ���ڴ� �ҹ��ڷ� ��ȯ���� �ش�.
- CONCAT(char1, char2) ? CONCAT �Լ��� Concatenation�� ���ڷ� �� ���ڸ� ����
- SUBSTR(s, m ,[n]) ? �κ� ���ڿ� ������ . m ��° �ڸ����� ���̰� n���� ���ڿ��� ��ȯ
    ? m�������� ��쿡�� �ڿ��� M��° ���ں��� �ݴ� �������� n���� ���ڸ� ��ȯ
- INSTR(s1, s2 , m, n) ? ���ڿ� �˻�, s1�� m��°���� s2 ���ڿ��� ��Ÿ���� n��° ��ġ ��ȯ ? ������ ���ڿ��� �߰ߵ��� ������ 0 �� ��ȯ�ȴ�

- LENGTH(s) ? ���ڿ��� ���̸� ����  
 -CHR(n) ? ASCII���� n�� �ش�Ǵ� ���ڸ� ����
- ASCII (s) ? �ش� ������ ASCII�� ����
- LPAD(s1,n,[s2]) ? ���ʿ� ���ڿ��� S2�� ���� ���� ����,
         n�� ��ȯ�Ǵ� ���ڿ��� ��ü ���̸� ��Ÿ����, S1�� ���ڿ��� n���� Ŭ ��� S1�� n�� ���ڿ� ��ŭ ��ȯ.
-RPAD(s1,n,[s2])  ? LPAD�͹ݴ�� �����ʿ� ���ڿ��� ���� ���� ����
 -LTRIM (s ,c) , RTRIM (s,c) ? ���ڿ� ���� c���ڿ� ���� , ���ڿ� ������ c���ڿ� ����
- TRIM ? Ư�� ���ڸ� ���� �Ѵ�.   ������ ���ڸ� �Է����� ������ �⺻������ ������ ���� �ȴ�.  ���� ���� ������Ÿ���� VARCHAR2 �̴�.
- REPLACE(s,p,r) ? s���� from ���ڿ��� �� ���ڸ� to���ڿ��� �� ���ڷ� ��ȯ�Ѵ�.
- TRANSLATE (s,from,to) ? s���� from ���ڿ��� �� ���ڸ� to���ڿ��� �� ���ڷ� ����

*/
  
  
  -- Q34)DEPT ���̺��� �÷��� ù ���ڵ鸸 �빮�ڷ� ��ȭ�Ͽ� ��� ������ ����Ͽ���. 
  -- Q35)EMP ���̺��� �̸��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ��ȸ�Ѵ�. 
        --��, �̸������� �����Ͽ���. 
        
  -- Q36)EMP ���̺��� �μ��� 20���� ����� �����ȣ, �̸�, �̸��� �ڸ���, �޿�, �޿��� �ڸ����� ��ȸ�Ѵ�.LENGTH���
   -- Q37)EMP ���̺��� �̸� �� 'L'���� ��ġ�� ��ȸ�Ѵ�.
  --                  EX) ALLEN	2	2	3	0
  --- Q38) EMP ���̺��� 10�� �μ��� ����� ���Ͽ� ��� ���� �� ������ 'A'�� �����ϰ� �޿� �� ������ 1�� �����Ͽ� ����Ͽ���. 
  --RTRIM ���
  --- Q39) REPACE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ. 
   --Q40)TRANSLATE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ�Ѵ�
  
  











  



