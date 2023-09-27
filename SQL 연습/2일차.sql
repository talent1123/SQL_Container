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

  -- Q1)DEPT ���̺��� �÷��� ù ���ڵ鸸 �빮�ڷ� ��ȭ�Ͽ� ��� ������ ����Ͽ���. 
SELECT DEPTNO, DNAME, INITCAP(DNAME)
FROM SCOTT.DEPT;


  -- Q2)EMP ���̺��� �̸��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ��ȸ�Ѵ�. 
        --��, �̸������� �����Ͽ���. 
SELECT ENAME, EMPNO, JOB, SAL, DEPTNO
FROM SCOTT.EMP
WHERE SUBSTR(ENAME, 1, 1) > 'K' AND SUBSTR(ENAME, 1, 1) < 'Y'
ORDER BY ENAME;        

  -- Q3)EMP ���̺��� �μ��� 20���� ����� �����ȣ, �̸�, �̸��� �ڸ���, �޿�, �޿��� �ڸ����� ��ȸ�Ѵ�.
  SELECT DEPTNO, EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
  FROM SCOTT.EMP
  WHERE DEPTNO = '20';
  
  
   -- Q4)EMP ���̺��� �̸� �� 'L'���� ��ġ�� ��ȸ�Ѵ�.
 --                  EX) ALLEN	2	2	3	0

SELECT ENAME, INSTR(ENAME, 'L', 1, 1) 
FROM SCOTT.EMP

  --- Q5) EMP ���̺��� 10�� �μ��� ����� ���Ͽ� ��� ���� �� ������ 'A'�� �����ϰ� �޿� �� ������ 1�� �����Ͽ� ����Ͽ���. 
 
  SELECT  ENAME, JOB, LTRIM(JOB, 'A'), SAL, LTRIM(SAL, 1)
  FROM SCOTT.EMP
  WHERE DEPTNO = 10;
  
  --- Q6) REPACE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ. 
SELECT ENAME, REPLACE(ENAME, 'SC', '*?')
FROM SCOTT.EMP;

   --Q7)TRANSLATE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ�Ѵ�
SELECT ENAME, TRANSLATE(ENAME, 'SC', '*?')������2
FROM SCOTT.EMP;               

 --NULL�� ����Ұ�



/*
   �׷��Լ�: GROUP BY Ű����� �Բ� ���ȴ�
   SELECT
   FROM
   WHERE
   GROUP BY
   HAVING
   ORDER BY    ;
   
   ���� �� �Լ��� ���ǿ����� �Ҷ��� HAVING�� ����Ѵ�
*/

--Q8)��� ���̺��� �Ի��Ϸ� �����Լ��� ����غ���
SELECT MIN(HIREDATE), MAX(HIREDATE), MEDIAN(HIREDATE), COUNT(HIREDATE), COUNT(*)
FROM SCOTT.EMP;

--Q9)��� ���̺��� ��������, ����ū��, ������, �߰���, ���, �հ踦 ���غ���
SELECT MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP;

--Q10)������ �ο����� ��� �غ���
SELECT JOB, COUNT(JOB)
FROM SCOTT.EMP
GROUP BY JOB;


--Q11)��� ���̺��� �μ����� ��������, ����ū��, ������, �߰���, ���, �հ踦 ���غ���
SELECT DEPTNO, MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO;


--Q12)�� �μ����� ��������, ����ū��, ������, �߰���, ���, �հ踦 ���غ���. �� �޿��� ���� ���� ���� ������ ����
SELECT DEPTNO, MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO
ORDER BY 6 DESC;

--Q13)����, �μ��� ������ ���� ����غ���
SELECT JOB, DEPTNO, SUM(SAL)
FROM SCOTT.EMP
GROUP BY JOB, DEPTNO;

--Q14)������̺��� �μ��ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����غ���
SELECT DEPTNO, COUNT(*), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

/* 
    1)WHERE ���� �Լ� ����, HAVING �����Լ� ���Ŀ� �Ƿ��� �۾��Ѵ�
    2)HAVING�� �̿��ؼ� �����Լ������ �׷��� �����Ѵ�.
    3)�׷��� ���� -> �׷��Լ� ��� -> HAVING�� ���͸�
*/
--Q15)������̺��� �޿��� �ִ� 2900 �̻��� �μ��� ���ؼ� �μ���ȣ, ���, �޿��հ踦 ������
SELECT JOB, ROUND(AVG(SAL),1), MAX(SAL)
FROM SCOTT.EMP
GROUP BY JOB
HAVING AVG(SAL) >= 2900;

--Q16)������ �޿��� ����� 3000�̻��� ������ ���ؼ� ��ձ޿�, �޿��� �հ踦 ������
SELECT JOB, ROUND(AVG(SAL),1), MAX(SAL)
FROM SCOTT.EMP
GROUP BY JOB
HAVING  AVG(SAL) >= 3000;

--Q17)�μ��� ��� �޿��� �ִ� ���� ��ȸ�غ���
SELECT ROUND(MAX(AVG(SAL)), 2)
FROM SCOTT.EMP
GROUP BY DEPTNO;

-- SQL�� �������

/*
      FROM   -> JOIN�� ���ؼ� ���̺��� ����
      WHERE    ->�ϳ��� ROW���� �о ������ �����ϴ� ����� �����Ѵ�
      GROUP BY  ->���ϴ� ����� �׷����Ѵ�
      HAVING   -> ������ �����ϴ� �׷��� �����.
      ORDER BY   -> ���ǿ� ���� �����Ѵ�
      SELECT   -> ���ϴ� ����� PROJECTION�Ѵ�.
*/




