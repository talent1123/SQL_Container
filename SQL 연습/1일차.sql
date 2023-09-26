--  SELECT  컬럼,,,, FROM   테이블명,,,;
--Q1)사원테이블에서 사원의 이름과  월급을 출력하자. 
SELECT ENAME, SAL
FROM SCOTT.EMP;

--Q2) 사원테이블에서 전체 데이터를 출력하자. 
SELECT * 
FROM SCOTT.EMP;

--Q3) 사원테이블에서 사원의 번호, 사원의 이름, 봉급을 출력해보자.  
SELECT EMPNO,ENAME, SAL 
FROM SCOTT.EMP;

--Q4)부서테이블에서 부서의 이름과 부서번호를 출력하자.  
SELECT DNAME,DEPTNO
FROM SCOTT.DEPT;

--Q5)사원테이블에서 사원의 번호를 '사번'이라고 출력하고 사원의 이름을 '이름'이라고 출력하자.  
--별칭 :컬럼별칭, 테이블의 별칭  
--컬럼명 별칭,컬럼명  "별  칭" , 컬럼명 AS 별칭, 컬럼명 AS "별  칭" 
SELECT ENAME 사번, ENAME 이름 
FROM SCOTT.EMP;

SELECT ENAME AS 사번, ENAME AS 이름 
FROM SCOTT.EMP;

SELECT ENAME "사 번", ENAME "이 름 "
FROM SCOTT.EMP;

SELECT ENAME AS "사 번", ENAME  AS "이 름"
FROM SCOTT.EMP;

--Q6)테이블의 별칭을 주자 [명시적 : 테이블들에서 동일한 컬럼이 있을경우 , 묵시적]
--6-1) 사원테이블의 내용과 부서테이블의 내용을 전체출력 해보자.  
SELECT  *
FROM SCOTT.EMP, SCOTT.DEPT;
--6-2) 사원테이블의 내용과 부서테이블의 내용중 사원의이름과 부서번호를  출력 해보자.
SELECT E.ENAME, D.DEPTNO
FROM SCOTT.EMP E, SCOTT.DEPT D;   --테이블의 명시적인 별칭  ->테이블명 별칭 

--6-3) 사원테이블의 내용과 부서테이블의 내용중 사원의이름과 부서번호를  출력 해보자.
SELECT ENAME, D.DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT D;   --테이블의 명시적인 별칭  ->테이블명 별칭 


--6-4) 사원테이블의 내용과 부서테이블의 내용중 사원의이름과 부서번호를  출력 해보자.
SELECT ENAME, SCOTT.DEPT.DEPTNO    --  테이블 명시 
FROM SCOTT.EMP , SCOTT.DEPT ;   

-- EX) 
SELECT ENAME, D.DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT "D";   --테이블의 명시적인 별칭  ->테이블명 별칭 

SELECT ENAME, "나".DEPTNO
FROM SCOTT.EMP , SCOTT.DEPT "나";   --테이블의 명시적인 별칭  ->테이블명 별칭 


--Q7) 사원의 테이블에서 사원이이름과 봉급을 출력 하되 봉급은 연봉으로 출력하자.
  -- 컬럼+ 컬럼  = 리턴  
  SELECT ENAME, SAL*12 연봉
  FROM SCOTT.EMP;
  
--Q8) 사원의 테이블에서 사원이이름과 봉급을 출력 하되 "00의 봉급은  00이다"
 -- || (연결문자열)
 SELECT ENAME||'님'
 FROM  SCOTT.EMP;
 
SELECT ENAME||'의 봉급은' ||SAL ||'이다'
FROM  SCOTT.EMP;

--Q9) SELECT   컬럼리스트 FROM 테이블리스트 WHERE 조건문  
 -- 사원테이블에서 사원의 이름이 JONES의 레코드를 전체 출력 해보자.  
SELECT *
FROM SCOTT.EMP
WHERE ENAME ='JONES';

--Q10)부서테이블에서 부서번호가 10 또는  20인 내용만 출력 해보자.  
SELECT *
FROM SCOTT.DEPT
WHERE DEPTNO =10 OR DEPTNO =20;

--Q11)사원테이블에서 사원의 이름, 사원의 봉급, 커미션, 봉금+커미션을  월급이라고 출력 해보자.  (4칙연산)
SELECT ENAME, SAL,COMM, SAL+COMM 월급
FROM SCOTT.EMP;
  --NULL의 키워드는 null
   --1)NULL문자, 0은 숫자이다. 
   --2)NULL은 공백의 문자이다. 
   --3)Null의 연산 결과는 null이다. 
   --4)null을 하나라도 포함한 데이터의 연산결과는 null / 한행의 열에 데이터가 없으면 null이다. 

--Q12) 사원테이블에서 사원의 이름, 사원의 봉급, 커미션, 봉금+커미션을  월급이라고 출력 해보자.
      --null도 연산   nvl(컬럼, 초기값)        
   SELECT  COMM, NVL(COMM,0)
   FROM SCOTT.EMP;
   
SELECT ENAME, SAL,COMM, SAL+NVL(COMM,0) 월급
FROM SCOTT.EMP;

--Q13) 사원테이블에서 사원의 이름, 커미션을 출력하되 커미션이 책정되지 않은 사원은 봉급으로 채워서 출력 하자. 
SELECT ENAME, COMM, NVL(COMM,SAL) AS RES
FROM SCOTT.EMP;

--Q14) 사원이름, 매니저를 출력하되 ABCD라는 값의 중간컬럼으로 추가하자. 
SELECT ENAME, 'ABCD', MGR
FROM SCOTT.EMP;

--Q15) 사원이름(사원), 관리자(관리자)출력 해보자.  SCOTT(사원)
SELECT ENAME||'(사원)', MGR|| '(관리자)'
FROM SCOTT.EMP;

--Q16) 중복 행 제거 
-- DISTINCT 라는 키워드를 컬럼명 앞에 선언되면  중복행 제거 후 단일 행 출력
-- 같은 컬럼에 있는 동일한 값은 단 한번만 출력된다.  
-- SELECT  바로 뒤에 사용된다. 
-- DISTINCT 다음에 여러 열을 사용할 수 있다.  
SELECT DISTINCT JOB
FROM SCOTT.EMP;

--Q17) 부서별(DEPTNO) 담당하는 업무(JOB)를 한번씩만 조회한다. 
SELECT DISTINCT DEPTNO , JOB
FROM SCOTT.EMP;

--Q18)의사열(PSEUDO COLUMNS)   : 테이블과 유사하게 QUERY가능한 열로서 변경은 할수 없다.  
 --ROWNUM :SELECT 문으로 검색하게 되면 로우수를 리턴한다.  
 /*        검색된 행의 일련번호이다. 
           ORDER BY정렬전에 부여된다.             
            
 --ROWID  : 테이블내에 특정한 행을 구별할 수 있는 id  
 
 */
    SELECT ROWNUM, ROWID, ENAME
    FROM  SCOTT.EMP;

--Q19) WHERE 절 사용  :  담당업무(JOB)가  MANAGER인 사원 정보를 출력해보자.  
/*
SELECT 컬럼리스트 AS "별 칭  "  ->  ""  타이틀명,  '' 데이터 VALUE  
FROM 테이블리스트  별칭
WHERE 조건식; -> 열이름, 비교연산자, 조건연산자 등으로  리턴값이  TRUE인 데이터만 추출한다. 
              -> 비교대상  : 상수, 열이름, 값목록 등으로 이루어진다.  
                산술, 비교,논리, LIKE, IN, NOT, BETWEEN,IS NULL, IS NOT NULL, ANY,ALL  등
*/
SELECT  *
FROM SCOTT.EMP
WHERE JOB='MANAGER';  -- 문자열, 날짜, 시간 

--Q20)급여가 3000 이상인 사원의번호, 사원이름, 봉급을 출력 해보자.  
SELECT  EMPNO, ENAME,SAL
FROM SCOTT.EMP
WHERE SAL  >= 3000;

--Q21)급여가 1300  에서 1700사이의 해당하는 사원의 이름, 봉급을 출력하자. 
  -- 대상컬럼  BETWEEN 작은값   AND 큰값   =    EXPR >= A AND  EXPR <=B
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  BETWEEN 1300 AND 1700;
  
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  >= 1300 AND  SAL<= 1700;
   
  --Q22)급여가 1300  에서 1700사이의 해당하는 사원이 아닌  이름, 봉급을 출력하자. 
  -- 대상컬럼 NOT BETWEEN 작은값   AND 큰값   =    EXPR < A OR  EXPR > B 
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL NOT BETWEEN 1300 AND 1700;
  
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  < 1300 OR  SAL> 1700;
  
  
  --Q23)BETWEEN AND  번외편 ->결과를 예측
   SELECT ENAME,SAL
   FROM SCOTT.EMP
   WHERE SAL  BETWEEN 1700 AND 1300;
   
   --Q24)  IN (여러값 중에 일치하는 값)  : EXPR IN(3,4,5) 
   /*
            여러목록 값중에 하나와 일치하는 값을 리턴
            IN   =ANY 연산자와 같다. 
            NOT IN  !=ALL 와 같다.  
   */
  -- 사원번호가 7902, 7788, 7566  인 사원의 이름과 사원번호, 입사일(0000년 00월 00일 00일) 를 출력하자.  
   SELECT ENAME, EMPNO, TO_CHAR(HIREDATE,'YYYY "년" MM "월" DD "일"  DAY')  
   FROM  SCOTT.EMP
   WHERE EMPNO IN (7902,7788, 7566);
  
  --Q25)  LIKE (문자의 패턴이 같은 값) 
  /*
        특정 패턴에 속하는 문자열을 추출하는 키워드 
        %:임의의 길이 문자열(공백가능)  
        _:한글자. 
        ESCAPE :  검색할 문자에 %, _문자 대응    
  */
  
  -- 사원의 이름이 S로 시작하는 사원의 이름과  봉급을 출력하자.  
  SELECT ENAME, SAL
  FROM SCOTT.EMP
  WHERE ENAME LIKE 'S%';
  
  --PLAYTER_T테이블에서 영문이름에 _문자가 들어있는 선수의 정보를 출력하자.  
  SELECT PNAME 
  FROM PALYTER_T
  WHERE PNAME LIKE '%@_%' ESCAPE   '@';  --  '홍_길동'   '100%'
  
  --Q26).  커미션이 측정되지 않은 사원을 출력해보자.  
  SELECT  *
  FROM SCOTT.EMP
  WHERE COMM IS NOT NULL;
  
  SELECT  *
  FROM SCOTT.EMP
  WHERE COMM = NVL(COMM,0);
  
  /*
  논리 연산자는 두 조건의 결과를 결합하여 하나의 결과를 생성하거나 단일 조건의 결과를 부정하기도 한다.
  조건의 전체가 참인 경우에만 행이 반환된다.
1) WHERE 절 여러 개의 조건을 지정할 때 사용한다.
2) AND는 모든 조건의 결과가 TRUE여야 선택된다.
3) OR는  조건의 결과라도 TRUE이면 선택된다.
4) NOT은 뒤따르는 조건의 결과가 FALSE이면 선택된다.
5) 우선순위는 NOT, AND, OR 순이다.
6) (  ) 는 모든 우선 순위 규칙보다 우선한다.  
  
  */
    
  --Q27) EMP 테이블에서 급여가 2800 이상이고 
  --JOB이 MANAGER인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하자.
   SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
   FROM SCOTT.EMP
   WHERE SAL  >= 2800  AND JOB ='MANAGER';
  
  --Q28)EMP 테이블에서 급여가 2800 이상이거나
  --JOB이 MANAGER인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력한다. 
  SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
   FROM SCOTT.EMP
   WHERE SAL  >= 2800  OR JOB ='MANAGER';
  
  --Q29)EMP 테이블에서 JOB이 'MANAGER', 'CLERK', 'ANALYST 가 아닌 
   --사원의 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하자
    SELECT EMPNO,ENAME,JOB,SAL, DEPTNO
    FROM  SCOTT.EMP 
    WHERE  JOB NOT IN ('MANAGER', 'CLERK', 'ANALYST');
  
  --Q30) 데이터 정렬 :  입사일 순으로 정렬해서 사원번호, 급여, 입사일자, 부서번호를 출력 해보자.  
  /*
    SELECT
    FROM 
    WHERE     
    ORDER BY  ASC|DESC  컬럼명:  ORDER BY는 SELECT문장의 마지막에 명시한다. 
    
    -ASC :오름차순 (A->Z,  ㄱ ->ㅎ, 1-10 ) 
    -DESC: 내림차순
    NULL 오름차순시 마지막에 표시된다. 
  */
  SELECT ROWNUM, ROWID, ENAME, SAL, HIREDATE,DEPTNO 
  FROM SCOTT.EMP
  ORDER BY   5  ASC ;
  
  
  --Q30)부서별로 담당하는 업무를 한번씩 조회하자, 업무기준으로 정렬하자. 
   SELECT  DISTINCT DEPTNO, JOB
   FROM  SCOTT.EMP
   ORDER BY JOB;
   
   
  --Q31) 함수 : 문자함수, 숫자함수, 날짜함수, 변환함수, 기타함수(윈도우함수, 분석함수)등을 말한다. 
  
  SELECT NLS_INITCAP('ijsland') "InitCap"
  FROM DUAL;
  
  -- Q32)사원테이블에서 scott의 사원 번호, 이름, 담당업무(소문자)를 출력해보자. 
   SELECT EMPNO, ENAME, LOWER(JOB)
   FROM SCOTT.EMP
   WHERE   ENAME =UPPER('scott');
   
   -- Q33) 사원의 이름과 사원번호를 하나의 컬럼에 작성하자. 단 ||하지 말자.  
   SELECT ENAME, EMPNO, CONCAT(ENAME,EMPNO) AS  RES
   FROM SCOTT.EMP;
   
  
  
  
  
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

 
  
  











  



