--SUBQUERY
--주쿼리와 서브쿼리로 구현되는 하나의 구문에서 먼저 서브쿼리가 실행되고 결과를 통해서 주쿼리 연산이 실행된다
--SELECT문 FROM, WHERE, GROUP BY, ORDER BY, HAVING, UPDATE, DELETE, INSERT INTO문에서 사용된다.
--()로 묶어서 사용된다./ 비교조건의 오른쪽에 선언된다./ 일반적으로 ORDER BY 절은 사용하지 않는다.
--서브쿼리의 결과가 단일행, 다중행으로 나뉜다
--단일행 연산자(>, >=,<, <=, ==,!=)   다중행 연산자(IN, NOT IN, ANY, ALL,,,)

--Q1) JONES 보다 월급을 많이 받는 사원의 이름과 봉급을 출력하자 --2975
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

SELECT ENAME, SAL
FROM EMP
WHERE SAL > 2976;

SELECT ENAME, SAL        -- 기본질의/기본 쿼리/ 주쿼리
FROM EMP
WHERE SAL > (SELECT SAL                    --서브쿼리, 부쿼리
             FROM EMP                       --서브쿼리, 부쿼리
             WHERE ENAME = 'JONES');   --서브쿼리, 부쿼리

--Q2) 사원번호가 7839인 사원과 같은 업무 직업을 가진 사원들의 이름과 직업을 출력하자.
SELECT ENAME, JOB
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE EMPNO = 7839);
             
--Q3) 7566 사원보다 급요를 많이 받는 사원의 이름, 급여를 출력해보자
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL
              FROM EMP
              WHERE EMPNO = 7566);
      
--Q4)사원의 봉급의 평균보다 적은 사원의 사원번호, 이름, 직업, 부서번호를 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL < (SELECT AVG(SAL)
              FROM EMP);

--Q5) 사원번호가 7521인 사원과 직업이 같고 봉급이 7934인 사원보다 많은 
  --  사원의 이름, 직업, 입사일 , 봉급을 출력해보자
SELECT ENAME, JOB, HIREDATE, EMPNO, SAL
FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO = 7521)
      AND
      SAL > (SELECT SAL FROM EMP WHERE EMPNO = 7934);
  
--Q6) 직업중에서 가장 적은 평균급여를 받는 작업을 출력하자
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
                   FROM EMP
                   GROUP BY JOB);

--Q7) 사원의 봉급이 20번 부서번호의 최소 봉급보다 많은 부서번호를 출력하자
SELECT DEPTNO, MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO =20);

--Q8) 부서별 최소 봉급과 같은 월듭을 받는 사원의 부서번호와 이름을 출력하자
SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO); --다중행이므로 =를 사용하지않고 IN사용

SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL =ANY(SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);  --Q8)과 Q9)동일

/*다중 행 (Multiple-Row) 서브쿼리 ? 하나 이상의 행을 리턴 하는 서브쿼리를 다중 행 서브쿼리라고 한다.
 ? 복수 행 연산자(IN, ANY, ALL)를 사용한다. 
 IN : 목록에 있는 임의의 값과 동일하면 참  
 ANY : 서브쿼리에서 리턴된 각각의 값과 비교하여 하나라도 참이면 참 ( =ANY는IN과 동일) 
        EX) < ANY  = 최대값보다 적음   ,   >ANY  최소값보다 큼
 ALL : 서브쿼리에서 리턴된 모든 값과 비교하여 모두 참이어야 참 
       EX) < ALL = 최소값보다 적음   ,   >ALL  최대값 보다 큼  
 *NOT 연산자는 IN, ANY, ALL 연산자와 함께 사용될 수 있다.
*/

 --Q9) 업무가 SALESMAN인 사원보다 급여를 많이 받는 사원의 이름, 급여, 직업을 출력하자
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB ='SALESMAN' );

--Q10) FORD, BLAKE 와 매니저 및 부서번호가 같은 사원의 정보를 출력
SELECT ENAME, DEPTNO, MGR
FROM EMP
WHERE (MGR, DEPTNO) IN (SELECT MGR, DEPTNO
                         FROM EMP
                         WHERE ENAME IN('FORD', 'BLAKE'));
                         
--Q11) 소속된 부서번호의 평균봉급보다 많은 봉급을 받는 사원의 이름, 급여, 부서번호, 입사일, 직업을 출력

SELECT ENAME, SAL, DEPTNO, HIREDATE, JOB
FROM EMP E
WHERE SAL > (SELECT AVG(SAL)
              FROM EMP
              WHERE DEPTNO = E.DEPTNO); 
              --E를 쓴이유: 주쿼리의 테이블의 컬럼을 역참조할때 별칭을 사용한다
              
-- 상호연관서브쿼리: 상의 질의 즉 주 쿼리에 있는 테이블 열을 참조하는 것을 말한다
--1)메인 쿼리에서 하나의 ROW에서 서브쿼리가 한번씩 실행된다.
--2)테이블에서 행을 먼저 읽어서 각 행의 값을 관련된 데이터와 비교한다
--3)주 쿼리에서 각 서브쿼리의 행에 대해 다른 결과를 리턴할때 사용한다
--4)각 행의 값에 따라 응답이 달라지는 다중 질의의 값을 리턴받을때 사용한다
--5)서브쿼리에서 메인쿼리의 컬럼명을 사용할 수 있지만 메인에서는 서브쿼리의 컬럼명을 사용할 수 없다.


--Q12) 인라인 뷰(INLINE) : FROM 절에 서브쿼리 11문제를 바꿔보자
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

-- 스칼라(Scalar) 서브쿼리
--  하나의 행에서 하나의 열 값만 리턴하는 서브 쿼리를 스칼라 서브쿼리라고 한다. 
-- 스칼라 서브 쿼리의 값은 서브 쿼리의 select 목록에 있는 항목 값이다
--  서브쿼리가 0개의 행을 리턴하면 스칼라 서브쿼리의 값은 NULL이다.
--  서브쿼리가 2개 이상의 행을 리턴하면 오류가 리턴된다. 
-- SELECT(GROUP BY는 제외), INSERT의 VALUES 목록, DECODE의 CASE조건문, UPDATE SET문

--Q13)사원번호, 이름, 부서번호, 사원이 속한 부서의 평균 급여를 출력
SELECT EMPNO, ENAME, DEPTNO, SAL,
  ROUND((SELECT AVG(SAL)
  FROM EMP
  WHERE DEPTNO = E.DEPTNO)) AS M_SAL
FROM EMP E;


--Q14)사원번호, 이름, 부서번호, 사원이 속한 부서를 출력
    --부서명으로 정렬하자
SELECT EMPNO, ENAME, DEPTNO, SAL  
FROM EMP E
ORDER BY (SELECT DNAME
          FROM DEPT
          WHERE DEPTNO = E.DEPTNO);
          
--Q15)EXISTS 연산자
--부하사원을 가지고 있는[EMPNO=MGR] 사원의 사원번호, 사원의 이름, 직업, 입사일 봉급을 출력하자
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
FROM EMP E
WHERE EXISTS(SELECT 1
             FROM EMP
             WHERE E.EMPNO = MGR)
ORDER BY 1;

--Q16)부하사원이 없는![EMPNO=MGR] 사원의 사원번호, 사원의 이름, 직업, 입사일 봉급을 출력하자
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
FROM EMP E
WHERE NOT EXISTS(SELECT 1
             FROM EMP
             WHERE E.EMPNO = MGR)
ORDER BY 1;


--Q16)'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SMITH');

--Q17)10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
--   부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO = 10);
               

--Q18) 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
--   'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')
      AND ENAME != 'BLAKE';

--Q19) 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
               FROM EMP) 
ORDER BY SAL DESC;

--Q20) 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
--   있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE'%T%');

--Q21) 자신의 급여가 평균급여보다 많고,이름에 S자가 들어가는 사원과 동일한
--  부서에서 근무하는 모든 사원의 사원번호,이름 및 급여를 출력하시오

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

--Q22) 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
--   많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--   (단, ALL 또는 ANY 연산자를 사용할 것)
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


--Q23) 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
--   이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
              FROM DEPT
              WHERE LOC = 'DALLAS');

--Q24) SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
              FROM DEPT
              WHERE DNAME = 'SALES');

--Q25) 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라.
--     (KING에게 보고하는 사원이란 mgr이 KING인 사원을 의미함)
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');

--Q26) 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
--    이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL ,DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
      AND SAL IN(SELECT SAL
                   FROM EMP
                   WHERE COMM IS NOT NULL);
      

--Q27) 30번 부서 사원들과 월급과 커미션이 같지 않은
--    사원들의 이름, 월급, 커미션을 출력하라.(30번 부서 제외)
SELECT ENAME, SAL, COMM
        FROM EMP
        WHERE SAL NOT IN(SELECT SAL
                         FROM EMP
                         WHERE DEPTNO = 30)
       AND COMM NOT IN(SELECT NVL(COMM, 0)
                       FROM EMP
                       WHERE DEPTNO = 30);

/*
--Q28) 사원번호, 이름, 월급, 그리고 월급누적을 출력하라.
        사원번호  이름   월급   월급누적
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

