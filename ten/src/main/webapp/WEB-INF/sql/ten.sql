CREATE TABLE member (
       id                   varchar2(12char) NOT NULL,
       name                 varchar2(10char) NOT NULL,
       gender               varchar2(12char) NOT NULL
                                   CHECK (gender IN ('남', '여')),
       mem_type             varchar2(2char) DEFAULT '개인' NOT NULL
                                   CHECK (mem_type IN ('개인', '법인')),
       mfile                 VARCHAR2(30char) NULL,
       license_type         VARCHAR2(30char) DEFAULT '없음' NOT NULL
                                   CHECK (license_type IN ('없음','1종대형', '1종보통', '2종보통')),
       certi_num            NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (certi_num BETWEEN 0 AND 5),
       phone_num            VARCHAR2(15char) NOT NULL,
       phone_certi          NUMBER(1) DEFAULT 0 NOT NULL
                                   CHECK (phone_certi IN (0, 1)),
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

--기본사항--
select * from member;
drop table member;

--------------------------------------insert--------------------------
insert into member
(id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
sns,sns_certi,mail,mail_certi,passport,passport_certi)
values
('ktw3722','김성빈','남','개인','사진.jpg','2종보통','010-4017-7980',1,'여기','저기',1,
'facebook',1,'ktw3722@naver.com',1,'여권.jpg',1);
--트랜잭션요망
update member
set certi_num=(select sum(phone_certi+addr_certi+sns_certi+mail_certi+passport_certi) from member where id='ktw3722')
where id='ktw3722'

insert into member
(id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
sns,sns_certi,mail,mail_certi,passport,passport_certi)
values
('user2','홍길동','남','개인','사진.jpg','2종보통','010-1234-1234',1,'여기','저기',1,
'facebook',1,'1233722@naver.com',1,'여권.jpg',1);
--트랜잭션요망
update member
set certi_num=(select sum(phone_certi+addr_certi+sns_certi+mail_certi+passport_certi) from member where id='ktw3722')
where id='user2'
--------------------------------------read--------------------------
select id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
sns,sns_certi,mail,mail_certi,passport,passport_certi 
from member
where id='ktw3722'

--------------------------------------update--------------------------
update member
set
mfile='홍길동.jpg', license_type='1종대형', phone_num='010-4563-4235', phone_certi='1',address1='거기',address2='요기',addr_certi='1',
sns='instagram',sns_certi='1',mail='ktw3722@naver.com',mail_certi='1',passport='여권.jpg',passport_certi='0'
where id='ktw3722'
--트랜잭션요망
update member
set certi_num=(select sum(phone_certi+addr_certi+sns_certi+mail_certi+passport_certi) from member where id='ktw3722')
where id='ktw3722'

--------------------------------------delete--------------------------
delete from member where id='ktw3722'

--------------------------------------list--------------------------
SELECT id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
		sns,sns_certi,mail,mail_certi,passport,passport_certi , r
		from(
			 SELECT id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
					sns,sns_certi,mail,mail_certi,passport,passport_certi , rownum r  
				from(SELECT id,name,gender,mem_type,mfile,license_type,phone_num,phone_certi,address1,address2,addr_certi,
							sns,sns_certi,mail,mail_certi,passport,passport_certi   
						FROM member
						where name like '%김%' 
						ORDER BY id
			)
)
	where r>=1 AND r<=5;
	
--------------------------------------total--------------------------
select count(*)
from member
where name like '%김%' 








------------------------------------------------------------------------
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
                                    CHECK (c_type IN ('정기카풀', '단기카풀', '여성전용카풀')),
       kind                 varchar2(15char) NOT NULL
       								CHECK (kind IN ('타세요', '태워주세요')),
       startdate            DATE NOT NULL,
       seat                 NUMBER(10) NOT NULL,
       price                NUMBER(10) NOT NULL,
       smoke                varchar2(10char)  NULL
      								CHECK (smoke IN ('흡연', '비흡연')),
       c_comment              varchar2(4000) NULL,
       PRIMARY KEY (carpoolno), 
       FOREIGN KEY (id)
                             REFERENCES member
);

--기본사항--
select *from carpool;
drop table carpool;

--insert--
insert into carpool 
(carpoolno,id,carpooldate,c_start,c_startv,c_end,c_endv,via,viav,
purpose,c_type,kind,startdate,seat,price,smoke,c_comment) 
values ( (SELECT NVL(MAX(carpoolno), 0) + 1 as carpoolno FROM carpool),
'ktw3722', (SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS carpooldate from dual),
'동서울터미널','127.123124', '이천시외버스터미널','142.123124','','','출퇴근','단기카풀',
'태워주세요','2016-07-21','1','5000','비흡연','같이가실분구합니다.');

--read--
SELECT carpoolno,id,carpooldate,c_start,c_startv,c_end,c_endv,via,viav,
purpose,c_type,kind,startdate,seat,price,smoke,c_comment 
FROM carpool WHERE carpoolno = 1;

--update--
update carpool set c_start='남부터미널',c_startv='142.123124',c_end='해운대',c_endv='127.123124',
via='우리집',viav='123123124', purpose='여행',c_type='단기카풀',kind='태워주세요',startdate='2016-07-20',
seat='1',price='5000',smoke='비흡연',c_comment='태워주세요' where carpoolno=2;

--delete--
delete from carpool
where carpoolno=3;

--list--
SELECT carpoolno,name,startdate,c_start,c_end,purpose,c_type,kind,carpooldate, r
		from(
			 SELECT carpoolno,name,startdate,c_start,c_end,purpose,c_type,kind,carpooldate, rownum r  
				from(SELECT carpoolno,name,startdate,c_start,c_end,purpose,c_type,kind,carpooldate 
						FROM carpool join member
						on carpool.id = member.id
						where c_start like '%터미널%'
						ORDER BY carpoolno, carpooldate desc
			)
)
	where r>=1 AND r<=5;
	
--total--
select count(*)
from carpool
where c_start like '%터미널%' 






-------------------------------------------------------------------------
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

--기본사항--
select *from carpool_review;
drop table carpool_review;

--insert--
insert into carpool_review 
(crev_no,id,content,score,carpoolno) 
values 
( (SELECT NVL(MAX(crev_no), 0) + 1 as crev_no FROM carpool_review),'ktw3722','',5,1);

--read--
SELECT crev_no,id,content,score,carpoolno 
FROM carpool_review WHERE crev_no = 1;

--update--
update carpool_review 
set content='이건',score=4 where crev_no=1;

--delete--
delete from carpool_review 
where crev_no=2;

--list--
SELECT crev_no,name,content,score,carpoolno, r
		from(
			 SELECT crev_no,name,content,score,carpoolno, rownum r  
				from(SELECT crev_no,name,content,score,carpoolno 
						FROM carpool_review join member
							on carpool_review.id=member.id
							where name like '%김%'
							ORDER BY crev_no desc
			)
)
	where r>=1 AND r<=5;
	
--total--
select count(*)
FROM carpool_review join member
on carpool_review.id=member.id
where name like '%김%'









------------------------------------------------------------------------
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

--기본사항--
select *from carpool_reply;
drop table carpool_reply;

--insert--
insert into carpool_reply 
(crep_no,crep_date,id,content,carpoolno) 
values 
( (SELECT NVL(MAX(crep_no), 0) + 1 as crep_no FROM carpool_reply),
(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS carpooldate from dual),'ktw3722','그날가능합니다',1);

--read--
SELECT crep_no,crep_date,id,content,carpoolno 
FROM carpool_reply WHERE crep_no=2;

--update--
update carpool_reply
set crep_date=(SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS carpooldate from dual),content='그날가능!'
where crep_no=2;

--delete--
delete from carpool_reply 
where crep_no=2;

--list--
SELECT crep_no,name,crep_date,content,carpoolno , r
		from(
			 SELECT crep_no,name,crep_date,content,carpoolno , rownum r  
				from(SELECT crep_no,name,crep_date,content,carpoolno  
						FROM carpool_reply join member
						on carpool_reply.id=member.id
						where name like '%김%'
						ORDER BY crep_no desc
			)
)
	where r>=1 AND r<=5;
	
--total--
select count(*)
FROM carpool_reply join member
on carpool_reply.id=member.id
where name like '%김%'








--------------------------------------------------------------------------
CREATE TABLE carpool_booked (
       booked_no        NUMBER(10) NOT NULL, 
       carpoolno          NUMBER(10) NOT NULL,
       appli_id             VARCHAR2(12char) NOT NULL,
       writer_id            VARCHAR2(12char) NOT NULL,
       kind                  VARCHAR2(5char) NOT NULL
                                   CHECK (kind IN ('타세요', '태워주세요')),
       type                 VARCHAR2(6char) NOT NULL
                                   CHECK (type IN ('정기카풀', '단기카풀', '여성전용카풀')),
       appli_seat           NUMBER(1) NOT NULL,
       PRIMARY KEY (booked_no), 
       FOREIGN KEY (carpoolno)
                             REFERENCES carpool
);

--기본사항--
select * from carpool_booked
drop table carpool_booked

--insert--
insert into carpool_booked
(booked_no,appli_id,writer_id,type,kind,appli_seat,carpoolno)
values
((SELECT NVL(MAX(booked_no), 0) + 1 as booked_no FROM carpool_booked),
'ktw3722','user1','단기카풀','타세요',1,1);

--read--
select booked_no,appli_id,writer_id,type,kind,appli_seat,carpoolno
from carpool_booked
where booked_no=1

--update--
update carpool_booked
set type='정기카풀',kind='태워주세요',appli_seat='2'
where booked_no=1

--delete--
delete from carpool_booked
where booked_no=1

--list--
SELECT booked_no,name,c_start,c_end,type,kind,carpoolno, r
		from(
			 SELECT booked_no,name,c_start,c_end,type,kind,carpoolno, rownum r  
				from(SELECT b.booked_no,k.name,c.c_start,c.c_end,b.type,b.kind,b.carpoolno  
						FROM carpool_booked b join member k
						on b.appli_id=k.id
						join carpool c on c.id=b.appli_id
						where name like '%김%'
						ORDER BY appli_id
			)
)
	where r>=1 AND r<=5;
	
--total--
select count(*)
from carpool_booked b join member k
on b.appli_id=k.id 
where name like '%김%'



