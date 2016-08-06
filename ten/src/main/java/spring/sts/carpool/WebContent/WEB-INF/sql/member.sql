1) 테이블 구조 
DROP TABLE member PURGE; 
 
-- version 3.0  
CREATE TABLE member ( 
    id       VARCHAR(10) NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20) NOT NULL, -- 패스워드, 영숫자 조합 
    mname    VARCHAR(20) NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      VARCHAR(14)     NULL, -- 전화번호 
    email    VARCHAR(50) NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)     NULL, -- 주소 2 
    job      VARCHAR(20) NOT NULL, -- 직업 
    mdate    DATE        NOT NULL, -- 가입일     
    fname    VARCHAR(50) DEFAULT 'member.jpg', -- 회원 사진
    grade    CHAR(1)     DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 
 
 
※ 제약 조건 
- NOT NULL: INSERT SQL에서 필수 입력. 
- UNIQUE  : 컬럼에 중복된 값이 올 수 없음. 
- PRIMARY KEY (id): 기본적으로 UNIQUE의 성질을 포함하면서 레코드를 
  구분하는 기준 컬럼의 값. 
 
 
 
2) 기초 데이터 추가 
       
DELETE FROM member; 
       
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate) 
VALUES('user3', '1234', '개발자3', '123-1234', 'email3@mail.com',  
'123-123','용인시','남동구' ,'A01', sysdate); 

INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, grade) 
VALUES('admin', '1234', '관리자', '123-1234', 'admin@mail.com',  
'123-123','서울시','관철동' ,'A01', sysdate, 'A'); 


SELECT id, mname, tel, email,  address1, address2, fname, r
from(
	SELECT id, mname, tel, email,  address1, address2, fname, rownum r
	 from(
			SELECT id, mname, tel, email,  address1, address2, fname 
			FROM member
			where id like '%'||'user1'||'%'
			ORDER BY id ASC
	 	)
	 )
where r>=1 and r<=5


 ID    PASSWD MNAME TEL      EMAIL           ZIPCODE ADDRESS1 ADDRESS2 JOB MDATE                 FNAME      GRADE
 ----- ------ ----- -------- --------------- ------- -------- -------- --- --------------------- ---------- -----
 user1 1234   개발자1  123-1234 email1@mail.com 123-123 인천시      남동구      A01 2014-08-28 11:38:31.0 man.jpg    H
 user2 1234   개발자2  123-1234 email2@mail.com 123-123 광명시      남동구      A01 2014-08-28 11:39:19.0 man.jpg    H
 user3 1234   개발자3  123-1234 email3@mail.com 123-123 용인시      남동구      A01 2014-08-28 11:39:24.0 myface.jpg H
 
  
3) 중복 아이디 검사 관련 SQL 
    -- 0: 중복 아님, 1: 중복  
 
SELECT COUNT(id)  
FROM member  
WHERE id='user1'; 
 
 COUNT(ID)
 ---------
         1
 
         
SELECT COUNT(id) as cnt  
FROM member  
WHERE id='user1'; 
 
 CNT
 ---
   1
   
   
   
4) 이메일 중복 확인
   SELECT COUNT(email) as cnt  
   FROM member  
   WHERE email='user1'; 
 
 
   
5) 우편 번호 검색

   CREATE TABLE zipcode (
   
   zipcode    varchar(7)    not null,  
   sido       varchar(20)   not null, 
   gugun      varchar(30)   not null,
   dongli       varchar(50)   not null,
   etc        varchar(100)  null
   
   )

 
   SELECT zipcode, sido, gugun, dongli, etc 
   FROM zipcode 
   WHERE (dongli LIKE '%간석4동%') 
   ORDER BY sido, gugun, dongli; 
 
 
 
6) 회원 전체 목록 
- LIKE    : 정확하게 일치하지 않아도 출력 
- =(equal): 정확하게 일치해야 출력 
 
- 검색을 하지 않는 경우, 전체 목록 출력 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member 
ORDER BY id ASC;   -- id 컬럼값으로 오름차순 정렬, DESC: 내림 차순 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member 
WHERE id LIKE '%%' -- 검색어가 없음으로 전체 레코드 출력 
ORDER BY id ASC;   -- id 컬럼값으로 오름차순 정렬, DESC: 내림 차순 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname
FROM member  
ORDER BY mdate DESC; 
 
 ID    PASSWD MNAME TEL      EMAIL           ZIPCODE ADDRESS1             ADDRESS2 JOB MDATE                 FNAME
 ----- ------ ----- -------- --------------- ------- -------------------- -------- --- --------------------- ------------
 user5 1234   왕눈이   123-1234 email5@mail.com 111-111 인천시 남동구 간석4동         NULL     A03 2014-09-02 14:34:13.0 ansunggi.jpg
 user4 1234   왕눈이   123-1234 email4@mail.com 405-726 인천 남동구 간석4동 주안주공아파트  1-1      A03 2014-09-02 14:24:48.0 member.jpg
 user3 1234   개발자3  123-1234 email3@mail.com 123-123 용인시                  남동구      A01 2014-09-02 11:52:46.0 myface.jpg
 user2 1234   개발자2  123-1234 email2@mail.com 123-123 광명시                  남동구      A01 2014-09-02 11:52:45.0 man.jpg
 user1 1234   개발자1  123-1234 email1@mail.com 123-123 인천시                  남동구      A01 2014-09-02 11:52:31.0 man.jpg
 
 
 
 
7) user1 회원 정보 보기 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member  
WHERE id='user1'; 
 
 
 
8) 회원 이미지의 수정
UPDATE member 
SET fname='' 
WHERE id='user1'; 
 
 
 
9) 패스워드 변경
UPDATE member
SET passwd='1234'
WHERE id='';
 
SELECT id, mname, passwd
FROM member
ORDER BY id DESC;
 
 
 
10) 회원 정보 수정 
 
UPDATE member  
SET passwd='TEST',mname='TEST', tel='123-123', email='email10',zipcode='TEST',  
    address1='수원', address2='팔달구', job='TEST', grade = 'C' 
WHERE id = 'user3'; 
 
 
-- 모든 컬럼 전부 출력, 개발시는 비권장
SELECT * FROM member; 
 
- 이미지 수정 
UPDATE member 
SET fname = '' 
WHERE id=''; 
 
 
 
11) 'user3' 회원 삭제 
 
DELETE FROM member WHERE id='user3'; 
 
SELECT * FROM member; 
 
 
 
12) 모든 회원 삭제(권장 아님) 
   - DELETE는 항상 대부분 WHERE 조건을 같이 사용합니다. 
 
DELETE FROM member; 
 
 
 
13) 로그인 관련 SQL 
  
SELECT COUNT(id) as cnt 
FROM member 
WHERE id = 'user1' AND passwd = '1234';  