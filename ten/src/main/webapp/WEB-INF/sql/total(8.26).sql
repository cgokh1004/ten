--멤버
CREATE TABLE member (
       id                   varchar2(12char) NOT NULL,
       passwd				varchar2(30char) NOT NULL,
       name                 varchar2(10char) NOT NULL,
       gender               varchar2(12char) NOT NULL
                                   CHECK (gender IN ('남', '여')),
       mem_type             varchar2(3char) DEFAULT '개인' NOT NULL
                                   CHECK (mem_type IN ('개인', '법인' , '관리자')),
       mfile                 VARCHAR2(30char) NULL,
       license_type         VARCHAR2(30char) DEFAULT '없음' NOT NULL
                                   CHECK (license_type IN ('없음','1종대형', '1종보통', '2종보통')),
       certi_num            NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (certi_num BETWEEN 0 AND 5),
       phone_num            VARCHAR2(15char) NOT NULL,
       phone_certi          NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (phone_certi IN (0, 1)),
       zipcode  			varchar2(7char)  NOT NULL,
       address1             VARCHAR2(50char) NOT NULL,
       address2             VARCHAR2(50char) NULL,
       addr_certi           NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (addr_certi IN (0, 1)),
       sns                  VARCHAR2(40char) NULL,
       sns_certi            NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (sns_certi IN (0, 1)),
       mail                 VARCHAR2(40char) NULL,
       mail_certi           NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (mail_certi IN (0, 1)),
       passport             VARCHAR2(40char) NULL,
       passport_certi       NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (passport_certi IN (0, 1)),
       PRIMARY KEY (id)
);


--설문
CREATE TABLE survey (
       sulno                NUMBER(10) NOT NULL,
       askcontent           varchar2(50char) NOT NULL, 
       sulgroupname	    varchar2(20char) NOT NULL,
       sulstate             varchar2(10char) NOT NULL,
       PRIMARY KEY (sulno)
);


CREATE TABLE sulconfirm (
       confirmno            NUMBER(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       sulno                NUMBER(10) NOT NULL,
       selno                NUMBER(10) NOT NULL,
       PRIMARY KEY (confirmno), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (sulno)
                             REFERENCES survey
);


CREATE TABLE sulmunr (
       sulmunrno            NUMBER(10) NOT NULL,
       chono                NUMBER(10) NOT NULL,
       chocontent           varchar2(4000) NOT NULL,
       sulno                NUMBER(10) NOT NULL,
       PRIMARY KEY (sulmunrno), 
       FOREIGN KEY (sulno)
                             REFERENCES survey
);


--스케쥴
CREATE TABLE events (
       event_id             NUMBER(10) NOT NULL,
       event_name           varchar(127) NOT NULL,
       start_date           DATE NOT NULL,
       end_date             DATE NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (event_id), 
       FOREIGN KEY (id)
                             REFERENCES member
);


--여행
CREATE TABLE travel (
       tra_no               NUMBER(10) NOT NULL,
       tdate                DATE NOT NULL,
       filename		    varchar2(30char) NOT NULL,
       location             varchar2(15char) NOT NULL,
       title                varchar2(30char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       viewcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       PRIMARY KEY (tra_no)
);


CREATE TABLE tra_reply (
       treply_no            NUMBER(10) NOT NULL,
       tra_no               NUMBER(10) NOT NULL,
       trep_date            DATE NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (treply_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (tra_no)
                             REFERENCES travel
);


--맛집
CREATE TABLE food (
       faddress             varchar2(50char) NOT NULL,
       foodname             varchar2(30char) NOT NULL,
       PRIMARY KEY (faddress)
);

CREATE TABLE food_review (
       frev_no              NUMBER(10) NOT NULL,
       faddress             varchar2(50char) NOT NULL,
	   score                NUMBER(1) NOT NULL,
                                   CHECK (score BETWEEN 1 AND 5),
       content              varchar2(4000) NOT NULL,
       fooddate             DATE NOT NULL,
       ID                   varchar2(12char) NOT NULL,
       PRIMARY KEY (frev_no), 
       FOREIGN KEY (ID)
                             REFERENCES member, 
       FOREIGN KEY (faddress)
                             REFERENCES food
);



--ktx
CREATE TABLE ktx (
       ktx_no               number(10) NOT NULL,
       s_point              varchar2(50char) NOT NULL,
       s_address	    varchar2(80char) NOT NULL,
       r_point              varchar2(50char) NOT NULL,
       r_address	    varchar2(80char) NOT NULL,
       purpose              varchar2(5char) NOT NULL,
       s_date               DATE NOT NULL,
       seat                 NUMBER(1) NOT NULL
                                   CHECK (seat BETWEEN 0 AND 4),
       price                NUMBER(10) NOT NULL,
       content              varchar2(4000) NOT NULL,
       reg_date             date NOT NULL,
       id                   varchar2(12char) NOT NULL,
       apply_seat	    NUMBER(10) default 0 NULL,
       PRIMARY KEY (ktx_no), 
       FOREIGN KEY (id)
                             REFERENCES member
);


CREATE TABLE ktx_reply (
       ktxrep_no            number(10) NOT NULL,
       content              varchar2(4000) NOT NULL,
       ktx_no               number(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (ktxrep_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (ktx_no)
                             REFERENCES ktx
);

CREATE TABLE ktx_review (
       krev_no              NUMBER(10) NOT NULL,
       score                NUMBER(1) NOT NULL,
                                   CHECK (score BETWEEN 1 AND 5),
       content              varchar2(4000) NULL,
       ktx_no               NUMBER(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (krev_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (ktx_no)
                             REFERENCES ktx
);

CREATE TABLE ktx_booked (
       booked_no	    NUMBER(10) NOT NULL,
       ktx_no		    NUMBER(10) NOT NULL,
       appli_id             VARCHAR2(12char) NOT NULL,
       writer_id            VARCHAR2(12char) NOT NULL,
       appli_seat           NUMBER(1) NOT NULL,
       PRIMARY KEY (booked_no), 
       FOREIGN KEY (ktx_no)
                             REFERENCES ktx
);



--카풀
CREATE TABLE carpool (
       carpoolno            NUMBER(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       carpooldate          DATE NOT NULL,
       c_start           		varchar2(30char) NOT NULL,
       c_startv           		varchar2(30char) NOT NULL,
       c_end                 	varchar2(30char) NOT NULL,
       c_endv                 	varchar2(30char) NOT NULL,
       via                  varchar2(30char) NULL,
       viav                  varchar2(30char) NULL,
       purpose              varchar2(15char) NOT NULL,
       c_type                 varchar2(15char) NOT NULL
                                    CHECK (c_type IN ('장기카풀', '단기카풀', '여성전용카풀')),
       kind                 varchar2(15char) NOT NULL
       								CHECK (kind IN ('타세요', '태워주세요')),
       startdate            DATE NULL,
       seat                 NUMBER(10) NULL,
       now_seat           NUMBER(3) default 0 NOT NULL ,
       price                NUMBER(10) NULL,
       smoke                varchar2(10char)  NULL
      								CHECK (smoke IN ('흡연', '비흡연')),
       c_comment              varchar2(4000) NULL,
       PRIMARY KEY (carpoolno), 
       FOREIGN KEY (id)
                             REFERENCES member
);

CREATE TABLE carpool_review (
       crev_no              number(10) NOT NULL,
       score                NUMBER(1) NOT NULL,
                                   CHECK (score BETWEEN 1 AND 5),
       carpoolno            number(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       content              varchar2(4000) NULL,
       PRIMARY KEY (crev_no), 
       FOREIGN KEY (carpoolno)
                             REFERENCES carpool, 
       FOREIGN KEY (id)
                             REFERENCES member
);

CREATE TABLE carpool_booked (
       booked_no        NUMBER(10) NOT NULL, 
       carpoolno          NUMBER(10) NOT NULL,
       appli_id             VARCHAR2(12char) NOT NULL,
       writer_id            VARCHAR2(12char) NOT NULL,
       kind                  VARCHAR2(5char) NOT NULL
                                   CHECK (kind IN ('타세요', '태워주세요')),
       type                 VARCHAR2(6char) NOT NULL
                                   CHECK (type IN ('정기카풀', '단기카풀', '여성전용카풀')),
       appli_seat           NUMBER(3) NOT NULL,
       PRIMARY KEY (booked_no), 
       FOREIGN KEY (carpoolno)
                             REFERENCES carpool
);


CREATE TABLE carpool_reply (
       crep_no              number(10) NOT NULL,
       crep_date            DATE NOT NULL,
       content              varchar2(4000) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       carpoolno            number(10) NOT NULL,
       PRIMARY KEY (crep_no), 
       FOREIGN KEY (carpoolno)
                             REFERENCES carpool, 
       FOREIGN KEY (id)
                             REFERENCES member
);


--고객센터
CREATE TABLE bbs ( 
  bbsno   NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  wname   VARCHAR(20)   NOT NULL,  -- 글쓴이 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*) 
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서
  refnum  NUMBER(7)      DEFAULT 0,-- 답변확인 컬럼  
  PRIMARY KEY (bbsno)  
); 

 create table reply(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
bbsno number(7) not null,
primary key(rnum),
foreign key(bbsno)  references bbs(bbsno)
 