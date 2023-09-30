SELECT * FROM EMP;
--SUBQUERY
--�������� ���������� �����Ǵ� �ϳ��� �������� ���� ���������� ����ǰ� ����� ���ؼ� ������ ������ ����ȴ�
--SELECT�� FROM, WHERE, GROUP BY, ORDER BY, HAVING, UPDATE, DELETE, INSERT INTO������ ���ȴ�.
--()�� ��� ���ȴ�./ �������� �����ʿ� ����ȴ�./ �Ϲ������� ORDER BY ���� ������� �ʴ´�.
--���������� ����� ������, ���������� ������
--������ ������(>, >=,<, <=, ==,!=)   ������ ������(IN, NOT IN, ANY, ALL,,,)
--Q1) JONES ���� ������ ���� �޴� ����� �̸��� ������ ������� --2975
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

SELECT ENAME, SAL
FROM EMP
WHERE SAL > 2976;

SELECT ENAME, SAL        -- �⺻����/�⺻ ����/ ������
FROM EMP
WHERE SAL > (SELECT SAL                    --��������, ������
             FROM EMP                       --��������, ������
             WHERE ENAME = 'JONES');   --��������, ������

--Q2) �����ȣ�� 7839�� ����� ���� ���� ������ ���� ������� �̸��� ������ �������.
SELECT ENAME, JOB
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE EMPNO = 7839);
             
--Q3) 7566 ������� �޿並 ���� �޴� ����� �̸�, �޿��� ����غ���
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL
              FROM EMP
              WHERE EMPNO = 7566);
      
--Q4)����� ������ ��պ��� ���� ����� �����ȣ, �̸�, ����, �μ���ȣ�� ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL < (SELECT AVG(SAL)
              FROM EMP);

--Q5) �����ȣ�� 7521�� ����� ������ ���� ������ 7934�� ������� ���� 
  --  ����� �̸�, ����, �Ի��� , ������ ����غ���
SELECT ENAME, JOB, HIREDATE, EMPNO, SAL
FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO = 7521)
      AND
      SAL > (SELECT SAL FROM EMP WHERE EMPNO = 7934);
  
--Q6) �����߿��� ���� ���� ��ձ޿��� �޴� �۾��� �������
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
                   FROM EMP
                   GROUP BY JOB);

--Q7) ����� ������ 20�� �μ���ȣ�� �ּ� ���޺��� ���� �μ���ȣ�� �������
SELECT DEPTNO, MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO =20);

--Q8) �μ��� �ּ� ���ް� ���� ������ �޴� ����� �μ���ȣ�� �̸��� �������
SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO); --�������̹Ƿ� =�� ��������ʰ� IN���

SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL =ANY(SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);  --Q8)�� Q9)����
/*���� �� (Multiple-Row) �������� ? �ϳ� �̻��� ���� ���� �ϴ� ���������� ���� �� ����������� �Ѵ�.
 ? ���� �� ������(IN, ANY, ALL)�� ����Ѵ�. 
 IN : ��Ͽ� �ִ� ������ ���� �����ϸ� ��  
 ANY : ������������ ���ϵ� ������ ���� ���Ͽ� �ϳ��� ���̸� �� ( =ANY��IN�� ����) 
        EX) < ANY  = �ִ밪���� ����   ,   >ANY  �ּҰ����� ŭ
 ALL : ������������ ���ϵ� ��� ���� ���Ͽ� ��� ���̾�� �� 
       EX) < ALL = �ּҰ����� ����   ,   >ALL  �ִ밪 ���� ŭ  
 *NOT �����ڴ� IN, ANY, ALL �����ڿ� �Բ� ���� �� �ִ�.
*/

 --Q9) ������ SALESMAN�� ������� �޿��� ���� �޴� ����� �̸�, �޿�, ������ �������
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB ='SALESMAN' );

--Q10) FORD, BLAKE �� �Ŵ��� �� �μ���ȣ�� ���� ����� ������ ���
SELECT ENAME, DEPTNO, MGR
FROM EMP
WHERE (MGR, DEPTNO) IN (SELECT MGR, DEPTNO
                         FROM EMP
                         WHERE ENAME IN('FORD', 'BLAKE'));
                         
--Q11) �Ҽӵ� �μ���ȣ�� ��պ��޺��� ���� ������ �޴� ����� �̸�, �޿�, �μ���ȣ, �Ի���, ������ ���

SELECT ENAME, SAL, DEPTNO, HIREDATE, JOB
FROM EMP E
WHERE SAL > (SELECT AVG(SAL)
              FROM EMP
              WHERE DEPTNO = E.DEPTNO); 
              --E�� ������: �������� ���̺��� �÷��� �������Ҷ� ��Ī�� ����Ѵ�
              
-- ��ȣ������������: ���� ���� �� �� ������ �ִ� ���̺� ���� �����ϴ� ���� ���Ѵ�
--1)���� �������� �ϳ��� ROW���� ���������� �ѹ��� ����ȴ�.
--2)���̺��� ���� ���� �о �� ���� ���� ���õ� �����Ϳ� ���Ѵ�
--3)�� �������� �� ���������� �࿡ ���� �ٸ� ����� �����Ҷ� ����Ѵ�
--4)�� ���� ���� ���� ������ �޶����� ���� ������ ���� ���Ϲ����� ����Ѵ�
--5)������������ ���������� �÷����� ����� �� ������ ���ο����� ���������� �÷����� ����� �� ����.


--Q12) �ζ��� ��(INLINE) : FROM ���� �������� 11������ �ٲ㺸��
SELECT ENAME, SAL, DEPTNO, HIREDATE, JOB
FROM EMP E
WHERE SAL > (SELECT AVG(SAL)
              FROM EMP
              WHERE DEPTNO = E.DEPTNO); 

--CASE 1:
 SELECT E.ENAME, E.SAL, E.DEPTNO, E.HIREDATE, D.AVGSAL
 FROM EMP E,   (SELECT DEPTNO , AVG(SAL)  AVGSAL FROM EMP E GROUP BY DEPTNO) D
 WHERE E.DEPTNO = D.DEPTNO AND E.SAL  > D.AVGSAL;

--CASE 2: 
 SELECT E.ENAME, E.SAL, E.DEPTNO, E.HIREDATE, E.JOB, D.AVGSAL
 FROM EMP E,   (SELECT DEPTNO , AVG(SAL)  AVGSAL FROM EMP E GROUP BY DEPTNO) D
 WHERE E.DEPTNO = D.DEPTNO AND E.SAL  > D.AVGSAL;

--CASE 3: 
 SELECT E.ENAME, E.SAL, E.DEPTNO, E.HIREDATE, E.JOB
 FROM EMP E,   (SELECT DEPTNO , AVG(SAL)  AVGSAL FROM EMP E GROUP BY DEPTNO) D
 WHERE E.DEPTNO = D.DEPTNO AND E.SAL  > D.AVGSAL;


SELECT E.ENAME, E.DEPTNO, E.JOB
FROM (SELECT ENAME, JOB, DEPTNO 
      FROM EMP
      WHERE JOB = 'MANAGER') E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- ��Į��(Scalar) ��������
--  �ϳ��� �࿡�� �ϳ��� �� ���� �����ϴ� ���� ������ ��Į�� ����������� �Ѵ�. 
-- ��Į�� ���� ������ ���� ���� ������ select ��Ͽ� �ִ� �׸� ���̴�
--  ���������� 0���� ���� �����ϸ� ��Į�� ���������� ���� NULL�̴�.
--  ���������� 2�� �̻��� ���� �����ϸ� ������ ���ϵȴ�. 
-- SELECT(GROUP BY�� ����), INSERT�� VALUES ���, DECODE�� CASE���ǹ�, UPDATE SET��

--Q13)�����ȣ, �̸�, �μ���ȣ, ����� ���� �μ��� ��� �޿��� ���
SELECT EMPNO, ENAME, DEPTNO, SAL,
  ROUND((SELECT AVG(SAL)
  FROM EMP
  WHERE DEPTNO = E.DEPTNO)) AS M_SAL
FROM EMP E;


--Q14)�����ȣ, �̸�, �μ���ȣ, ����� ���� �μ��� ���
    --�μ������� ��������
SELECT EMPNO, ENAME, DEPTNO, SAL  
FROM EMP E
ORDER BY (SELECT DNAME
          FROM DEPT
          WHERE DEPTNO = E.DEPTNO);
          
--Q15)EXISTS ������
--���ϻ���� ������ �ִ�[EMPNO=MGR] ����� �����ȣ, ����� �̸�, ����, �Ի��� ������ �������
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
FROM EMP E
WHERE EXISTS(SELECT 1
             FROM EMP
             WHERE E.EMPNO = MGR)
ORDER BY 1;

--Q16)���ϻ���� ����![EMPNO=MGR] ����� �����ȣ, ����� �̸�, ����, �Ի��� ������ �������
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
FROM EMP E
WHERE NOT EXISTS(SELECT 1
             FROM EMP
             WHERE E.EMPNO = MGR)
ORDER BY 1;




--QUESTION
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
--   �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO = 10);
               

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
--   'BLAKE'�� ���� ����϶�.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')
      AND ENAME != 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
               FROM EMP) 
ORDER BY SAL DESC;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
--   �ִ� ����� �����ȣ�� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE'%T%');

--6 �ڽ��� �޿��� ��ձ޿����� ����,�̸��� S�ڰ� ���� ����� ������
--  �μ����� �ٹ��ϴ� ��� ����� �����ȣ,�̸� �� �޿��� ����Ͻÿ�

--     EMPNO    ENAME      SAL
--    --------  --------  -------
--      7902     FORD       3000
--      7876     ADAMS      1100
--      7788     SCOTT      3000
--      7566     JONES      2975
--      7369     SMITH       800
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                  FROM EMP
              )
              AND DEPTNO IN(
              SELECT DEPTNO
              FROM EMP
              WHERE ENAME LIKE '%S%');

--7. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
--   ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--   (��, ALL �Ǵ� ANY �����ڸ� ����� ��)
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30 );
                 
SELECT ENAME, DEPTNO, SAL 
FROM EMP e
WHERE SAL > ANY (
    SELECT MAX(SAL) 
    FROM EMP e
    WHERE DEPTNO = 30);


--8. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
--   �̸�, �μ���ȣ, ������ ����϶�.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
              FROM DEPT
              WHERE LOC = 'DALLAS');

--9. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
              FROM DEPT
              WHERE DNAME = 'SALES');

--10. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
--     (KING���� �����ϴ� ����̶� mgr�� KING�� ����� �ǹ���)
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
--    �̸�, ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL ,DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
      AND SAL IN(SELECT SAL
                   FROM EMP
                   WHERE COMM IS NOT NULL);
      

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
--    ������� �̸�, ����, Ŀ�̼��� ����϶�.(30�� �μ� ����)
SELECT ENAME, SAL, COMM
        FROM EMP
        WHERE SAL NOT IN(SELECT SAL
                         FROM EMP
                         WHERE DEPTNO = 30)
       AND COMM NOT IN(SELECT NVL(COMM, 0)
                       FROM EMP
                       WHERE DEPTNO = 30);
/*
--13. �����ȣ, �̸�, ����, �׸��� ���޴����� ����϶�.
        �����ȣ  �̸�   ����   ���޴���
       --------------------------------
      	7369	SMITH	800	800
	7499	ALLEN	1600	2400
	7521	WARD	1250	3650
  */
SELECT E.EMPNO, E.ENAME, E.SAL, SUM(D.SAL)
FROM EMP E, (SELECT EMPNO, SAL FROM EMP) D
WHERE E.EMPNO >= D.EMPNO
GROUP BY E.EMPNO, E.ENAME , E.SAL
ORDER BY 1;

