select * from memo

select memono, title, viewcnt,wdate, r
from(
	select memono, title, viewcnt,wdate,rownum r
	from(
		select memono, title, viewcnt,wdate
		from MEMO
		order by memono desc
	 )
 )
	 where r>=1 and r<=10
2. memo 테이블 구조 
>>>>> /WebContent/WEB-INF/sql/memo.sql 
----------------------------------------------------------------------------- 
1) 테이블 제작  
- NOT NULL   : INSERT시 필수 입력, 생략 불가능 
- DEFAULT 0  : INSERT시 값을 입력하지 않으면 0이 추가됨. 
- DEFAULT 'A': INSERT시 값을 입력하지 않으면 'A'가 추가됨. 
- NUMBER(3)  : int 계열, -999 ~ +999, 나머지 바이트 재사용 
- VARCHAR(30): String 계열, 문자열 저장, 가변길이 문자열, 
               빈공간 재사용, 한글 15자, 영숫자는 30자 
- DATE       : 날짜 
 
 
-- 임시 영역으로 테이블 삭제, 복구 가능한 휴지통으로 삭제 
DROP TABLE memo; 
 
-- 테이블을 복구 불가능 하도록 삭제 
DROP TABLE memo PURGE; 
 
-- 테이블 생성 
CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
); 
 
 
 
2) SEQUENCE 객체(MySQL: AUTO_INCREMENT) 
- 레코드는 고유하게 구분되어야하는 제약이 있으며 
  고유한 값을 저장하기위해 데이터를 구분값으로 사용하는 경우가 있고 
  Sequence 즉 일련번호처럼 오라클에서 생성되는 값을 사용하는 경우도 있음. 
 
  START WITH 0: 일련번호 0부터 시작 
  INCREMENT BY 1: 일련번호를 1 씩 증가 
  MINVALUE 0: 최소값 
  CACHE 2: 시퀀스를 테이블에 저장함으로 자주 Update가 발생함으로 
           이것을 줄이기위해 메모리에서 일련번호를 증가시키며 
           CACHE 명령을 이용해 증가 단위를 정의할 수 있음,  
           메모리에서 일련번호 증가, 처리 속도 향상, 
           기본값은 20임, INSERT가 많이 발생하면 기본값을 길게 해줌  
   
  MySQL: memono INT NOT NULL AUTO_INCREMENT PRIMARY KEY 
 
  
  ★ 11g는 서버 종료시 Cache 값을 저장을한 후 재사용 한다.
 
  
  
-- SEQUENCE 객체 삭제 
DROP SEQUENCE memo_seq; 
 
-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 
 
- CACHE 10: 메모리에서 10개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
- CACHE 20: 메모리에서 20개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
- CACHE 30: 메모리에서 30개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
 
-- dual: 가상 테이블, SQL형식 맞출경우 임시 테이블 사용, 변경하면 안됨
SELECT memo_seq.nextval FROM dual;
 
 NEXTVAL
 -------
       1
 
-- 현재 sequence 확인(Run SQL Command Line 에서 실행);
SELECT memo_seq.currval FROM dual;
 
       
       
-- create 
-- memo_seq.nextval: 일련번호 자동 생성하여 할당 
--                   (MySQL은 컬럼명을 명시하지 않음). 
-- sysdate: 현재 날짜와 시간(MySQL: now()) 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate); 
 
-- select list, 자주 읽는 메모 먼저 출력  
-- DESC: Descending, ASC: Ascending 
SELECT memono, title, content, to_char(wdate, 'yyyy-dd-mm'), viewcnt 
FROM memo  
ORDER BY memono ASC; 
 
 MEMONO TITLE  CONTENT      WDATE                 VIEWCNT
 ------ ------ ------------ --------------------- -------
      1 오늘의 메모 이전주 토익 시험 준비 2014-08-19 14:38:16.0       0
 
 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '읽을 도서', '가메출판사 오라클 11g', sysdate); 
 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '수업 복습', '메모 제작', sysdate); 
 
INSERT INTO memo 
VALUES(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0); 
 
 
SELECT memono, title, content, wdate, viewcnt 
FROM memo  
ORDER BY memono ASC; -- 오름 차순
 
 MEMONO TITLE  CONTENT             WDATE                 VIEWCNT 
 ------ ------ ------------------- --------------------- ------- 
      1 오늘의 메모 이전주 토익 시험 준비        2014-05-14 12:02:48.0       0 
      2 읽을 도서   가메출판사 오라클 11g        2014-05-14 12:02:49.0       0 
      3 수업 복습   메모 제작                    2014-05-14 12:02:49.0       0 
      4 도서구입    JSP Web Programming          2014-05-14 12:02:50.0       0 
 
      
-- DESC: 내림 차순 정렬      
SELECT memono, title, content, wdate, viewcnt 
FROM memo  
ORDER BY memono DESC; 
 
 MEMONO TITLE  CONTENT             WDATE                 VIEWCNT 
 ------ ------ ------------------- --------------------- ------- 
      4 도서구입    JSP Web Programming          2014-05-14 12:02:50.0       0
      3 수업 복습   메모 제작                    2014-05-14 12:02:49.0       0      
      2 읽을 도서   가메출판사 오라클 11g        2014-05-14 12:02:49.0       0 
      1 오늘의 메모 이전주 토익 시험 준비        2014-05-14 12:02:48.0       0 
 
      
----------------------------------------------------------------------------- 
 
 
      
3. 테이블 작성 실습
 
1) 테이블명: sungjuk
컬럼 목록: 번호, 성명, 국어, 영어, 수학, 총점, 평균
 
Create TABLE sungjuk(
  no   NUMBER(5),
  name VARCHAR(20),
  kuk  NUMBER(3),
  eng  NUMBER(3),
  mat  NUMBER(3),
  tot  NUMBER(3),
  avg  NUMBER(3),
  PRIMARY KEY(no)  
);
 


 
Create TABLE sungjuk(
  no   NUMBER(5) NOT NULL,
  name VARCHAR(20) NOT NULL,
  kuk  NUMBER(3) NOT NULL,
  eng  NUMBER(3) NOT NULL,
  mat  NUMBER(3) NOT NULL,
  tot  NUMBER(3),
  avg  NUMBER(3),
  PRIMARY KEY(no)  
);
 
 
Create TABLE sungjuk(
  no   NUMBER(5) NOT NULL,
  name VARCHAR(20) NOT NULL,
  kuk  NUMBER(3) DEFAULT 0,
  eng  NUMBER(3) DEFAULT 0,
  mat  NUMBER(3) DEFAULT 0,
  tot  NUMBER(3) DEFAULT 0,
  avg  NUMBER(3) DEFAULT 0,
  PRIMARY KEY(no)  
);
 
 
 
2) 테이블명: 뉴스(news)
컬럼 목록: 번호, 제목, 미디어, 기자명, 등록일 
 
DROP TABLE news;
 
CREATE TABLE news(
  newsno INT          NOT NULL,
  title  VARCHAR(100) NOT NULL,
  media  VARCHAR(50)  NOT NULL,
  author VARCHAR(30)  NOT NULL,
  rdate  DATE         NOT NULL,
  PRIMARY KEY(newsno)
);
 
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 IE 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;
 
 NEWSNO TITLE                      MEDIA AUTHOR RDATE
 ------ -------------------------- ----- ------ ---------------------
      1 MS, 2016년 구형 IE 브라우저 지원 중단 ZDNet 가길동    2014-08-19 15:27:14.0
 
      
-- MySQL 가능      
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, "MS, 2016년 구형 'IE' 브라우저 지원 중단", 'ZDNet', '가길동', sysdate);
 
-- MySQL 가능
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 \'IE\' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
-- Oracle, single quotation의 추가
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;
 
NEWSNO TITLE                        MEDIA AUTHOR RDATE
 ------ ---------------------------- ----- ------ ---------------------
      1 MS, 2016년 구형 IE 브라우저 지원 중단   ZDNet 가길동    2014-08-19 15:47:06.0
      2 MS, 2016년 구형 'IE' 브라우저 지원 중단 ZDNet 가길동    2014-08-19 15:47:23.0
 
 
-- Oracle, double quotation의 추가
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"', '연합뉴스', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;
 
 NEWSNO TITLE                        MEDIA AUTHOR RDATE
 ------ ---------------------------- ----- ------ ---------------------
      1 MS, 2016년 구형 IE 브라우저 지원 중단   ZDNet 가길동    2014-08-19 15:47:06.0
      2 MS, 2016년 구형 'IE' 브라우저 지원 중단 ZDNet 가길동    2014-08-19 15:47:23.0
      3 "차량 막무가내 견인한 뒤 요금 과다청구 많아"   연합뉴스  가길동    2014-08-19 15:50:05.0
 
 
