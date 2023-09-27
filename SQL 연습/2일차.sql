  /*
- LOWER(char) ? 문자열을 소문자로
- UPPER(char) ? 문자열을 대문자로
- INITCAP(char) ? 주어진 문자열의 첫 번째 문자를 대문자로 나머지 문자는 소문자로 변환시켜 준다.
- CONCAT(char1, char2) ? CONCAT 함수는 Concatenation의 약자로 두 문자를 결합
- SUBSTR(s, m ,[n]) ? 부분 문자열 추출함 . m 번째 자리부터 길이가 n개인 문자열을 반환
    ? m이음수일 경우에는 뒤에서 M번째 문자부터 반대 방향으로 n개의 문자를 반환
- INSTR(s1, s2 , m, n) ? 문자열 검색, s1의 m번째부터 s2 문자열이 나타나는 n번째 위치 반환 ? 지정한 문자열이 발견되지 않으면 0 이 반환된다

- LENGTH(s) ? 문자열의 길이를 리턴 
-CHR(n) ? ASCII값이 n에 해당되는 문자를 리턴
- ASCII (s) ? 해당 문자의 ASCII값 리턴
- LPAD(s1,n,[s2]) ? 왼쪽에 문자열을 S2를 끼어 놓는 역할,
         n은 반환되는 문자열의 전체 길이를 나타내며, S1의 문자열이 n보다 클 경우 S1을 n개 문자열 만큼 반환.
-RPAD(s1,n,[s2])  ? LPAD와반대로 오른쪽에 문자열을 끼어 놓는 역할
-LTRIM (s ,c) , RTRIM (s,c) ? 문자열 왼쪽 c문자열 제거 , 문자열 오른쪽 c문자열 제거
- TRIM ? 특정 문자를 제거 한다.   제거핛 문자를 입력하지 않으면 기본적으로 공백이 제거 된다.  리턴 값의 데이터타입은 VARCHAR2 이다.
- REPLACE(s,p,r) ? s에서 from 문자열의 각 문자를 to문자열의 각 문자로 변환한다.
- TRANSLATE (s,from,to) ? s에서 from 문자열의 각 문자를 to문자열의 각 문자로 리턴

*/

  -- Q1)DEPT 테이블에서 컬럼의 첫 글자들만 대문자로 변화하여 모든 정보를 출력하여라. 
SELECT DEPTNO, DNAME, INITCAP(DNAME)
FROM SCOTT.DEPT;


  -- Q2)EMP 테이블에서 이름의 첫글자가 'K'보고 크고 'Y'보다 작은 사원의 사원번호, 이름, 업무, 급여, 부서번호를 조회한다. 
        --단, 이름순으로 정렬하여라. 
SELECT ENAME, EMPNO, JOB, SAL, DEPTNO
FROM SCOTT.EMP
WHERE SUBSTR(ENAME, 1, 1) > 'K' AND SUBSTR(ENAME, 1, 1) < 'Y'
ORDER BY ENAME;        

  -- Q3)EMP 테이블에서 부서가 20번인 사원의 사원번호, 이름, 이름의 자릿수, 급여, 급여의 자릿수를 조회한다.
  SELECT DEPTNO, EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
  FROM SCOTT.EMP
  WHERE DEPTNO = '20';
  
  
   -- Q4)EMP 테이블에서 이름 중 'L'자의 위치를 조회한다.
 --                  EX) ALLEN	2	2	3	0

SELECT ENAME, INSTR(ENAME, 'L', 1, 1) 
FROM SCOTT.EMP

  --- Q5) EMP 테이블에서 10번 부서의 사원에 대하여 담당 업무 중 좌측에 'A'를 삭제하고 급여 중 좌측의 1을 삭제하여 출력하여라. 
 
  SELECT  ENAME, JOB, LTRIM(JOB, 'A'), SAL, LTRIM(SAL, 1)
  FROM SCOTT.EMP
  WHERE DEPTNO = 10;
  
  --- Q6) REPACE함수를 사용하여 사원이름에 SC문자열을 *?로 변경해서 조회. 
SELECT ENAME, REPLACE(ENAME, 'SC', '*?')
FROM SCOTT.EMP;

   --Q7)TRANSLATE함수를 사용하여 사원이름에 SC문자열을 *?로 변경해서 조회한다
SELECT ENAME, TRANSLATE(ENAME, 'SC', '*?')변경결과2
FROM SCOTT.EMP;               

 --NULL은 연산불가



/*
   그룹함수: GROUP BY 키워드와 함께 사용된다
   SELECT
   FROM
   WHERE
   GROUP BY
   HAVING
   ORDER BY    ;
   
   다중 행 함수는 조건연산을 할때는 HAVING을 사용한다
*/

--Q8)사원 테이블의 입사일로 집계함수를 출력해보자
SELECT MIN(HIREDATE), MAX(HIREDATE), MEDIAN(HIREDATE), COUNT(HIREDATE), COUNT(*)
FROM SCOTT.EMP;

--Q9)사원 테이블에서 봉급으로, 가장큰값, 작은값, 중간값, 평균, 합계를 구해보자
SELECT MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP;

--Q10)직업별 인원수를 출력 해보자
SELECT JOB, COUNT(JOB)
FROM SCOTT.EMP
GROUP BY JOB;


--Q11)사원 테이블에서 부서별로 봉급으로, 가장큰값, 작은값, 중간값, 평균, 합계를 구해보자
SELECT DEPTNO, MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO;


--Q12)각 부서별로 봉급으로, 가장큰값, 작은값, 중간값, 평균, 합계를 구해보자. 단 급여의 합이 많은 순을 정렬을 하자
SELECT DEPTNO, MAX(SAL), MIN(SAL), MEDIAN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO
ORDER BY 6 DESC;

--Q13)직업, 부서별 월급을 합을 출력해보자
SELECT JOB, DEPTNO, SUM(SAL)
FROM SCOTT.EMP
GROUP BY JOB, DEPTNO;

--Q14)사원테이블에서 부서인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력해보자
SELECT DEPTNO, COUNT(*), SUM(SAL) 
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

/* 
    1)WHERE 집계 함수 이전, HAVING 집계함수 이후에 피러링 작업한다
    2)HAVING을 이용해서 집계함수결과로 그룹을 제한한다.
    3)그룹이 형성 -> 그룹함수 계산 -> HAVING절 필터링
*/
--Q15)사원테이블에서 급여가 최대 2900 이상인 부서에 대해서 부서번호, 평균, 급여합계를 구하자
SELECT JOB, ROUND(AVG(SAL),1), MAX(SAL)
FROM SCOTT.EMP
GROUP BY JOB
HAVING AVG(SAL) >= 2900;

--Q16)업무별 급여의 평균이 3000이상인 업무에 대해서 평균급여, 급여의 합계를 구하자
SELECT JOB, ROUND(AVG(SAL),1), MAX(SAL)
FROM SCOTT.EMP
GROUP BY JOB
HAVING  AVG(SAL) >= 3000;

--Q17)부서별 평균 급여중 최대 값을 조회해보자
SELECT ROUND(MAX(AVG(SAL)), 2)
FROM SCOTT.EMP
GROUP BY DEPTNO;

-- SQL문 실행순서

/*
      FROM   -> JOIN을 통해서 테이블을 생성
      WHERE    ->하나의 ROW씩을 읽어서 조건을 만족하는 결과를 추출한다
      GROUP BY  ->원하는 행들을 그룹핑한다
      HAVING   -> 조건을 만족하는 그룹을 남긴다.
      ORDER BY   -> 조건에 따라 정렬한다
      SELECT   -> 원하는 결과만 PROJECTION한다.
*/




