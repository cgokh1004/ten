CREATE TABLE member (
       id                   varchar2(12char) NOT NULL,
       passwd	 varchar2(30char) NOT NULL,
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

CREATE TABLE car (
       carno                varchar2(7char) NOT NULL,
       place                varchar2(5char) NOT NULL,
       brand                varchar2(10char) NOT NULL,
       placevalue          	varchar2(50char) NOT NULL,
       state                NUMBER(1) NOT NULL,
       PRIMARY KEY (carno)
);

CREATE TABLE car_booked (
       carbook_no           varchar2(10char) NOT NULL,
       carno                varchar2(7char) NOT NULL,
       id                   varchar2(12char)NOT NULL,
       carbookdate          DATE NOT NULL,
       PRIMARY KEY (carbook_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (carno)
                             REFERENCES car
);


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

drop table events
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

CREATE TABLE sulmunr (
       sulmunrno            NUMBER(10) NOT NULL,
       chono                NUMBER(10) NOT NULL,
       chocontent           varchar2(4000) NOT NULL,
       sulno                NUMBER(10) NOT NULL,
       PRIMARY KEY (sulmunrno), 
       FOREIGN KEY (sulno)
                             REFERENCES survey
);


CREATE TABLE festival (
       fes_no               NUMBER(10) NOT NULL,
       fdate                DATE NOT NULL,
       title                varchar2(30char) NOT NULL,
       location             varchar2(15char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       veiwcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       PRIMARY KEY (fes_no)
);


CREATE TABLE fes_reply (
       freply_no            NUMBER(10) NOT NULL,
       fes_no               NUMBER(10) NOT NULL,
       frep_date            DATE NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (freply_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (fes_no)
                             REFERENCES festival
);


CREATE TABLE travel (
       tra_no               NUMBER(10) NOT NULL,
       tdate                DATE NOT NULL,
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
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (frev_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (faddress)
                             REFERENCES food
);


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

CREATE TABLE qquestion (
       qqno                 NUMBER(10) NOT NULL,
       title                varchar2(30char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       viewcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       qqdate               DATE NOT NULL,
       PRIMARY KEY (qqno)
);


CREATE TABLE question (
       qno                  NUMBER(10) NOT NULL,
       title                varchar2(30char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       viewcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       qdate                DATE NOT NULL,
       groupno              NUMBER(10) NOT NULL,
       indent               NUMBER(5) DEFAULT 0 NOT NULL,
       ansnum               NUMBER(5) DEFAULT 0 NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (qno), 
       FOREIGN KEY (id)
                             REFERENCES member
);


CREATE TABLE notice (
       noticeno             NUMBER(10) NOT NULL,
       title                varchar2(30char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       imgname              varchar2(30char) NOT NULL,
       viewcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       wdate                DATE NOT NULL,
       PRIMARY KEY (noticeno)
);

CREATE TABLE ncomment (
       comno                NUMBER NOT NULL,
       content              VARCHAR2(4000) NOT NULL,
       wdate                DATE NOT NULL,
       noticeno             NUMBER(10) NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (comno), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (noticeno)
                             REFERENCES notice
);


CREATE TABLE advise (
       advno                NUMBER(10) NOT NULL,
       title                varchar2(30char) NOT NULL,
       content              varchar2(4000) NOT NULL,
       viewcnt              NUMBER(10) DEFAULT 0 NOT NULL,
       advdate              DATE NOT NULL,
       groupno              NUMBER(10) NOT NULL,
       indent               NUMBER(10) default 0 NOT NULL,
       ansnum               NUMBER(10) default 0 NOT NULL,
       id                   varchar2(12char) NOT NULL,
       PRIMARY KEY (advno), 
       FOREIGN KEY (id)
                             REFERENCES member
);

drop table bus
CREATE TABLE bus (
       busno                NUMBER(10) NOT NULL,
       id                   VARCHAR2(12char) NOT NULL,
       regdate              DATE not NULL,
       startdate            DATE not NULL,
       enddate              DATE not NULL,
       price                NUMBER(10) not NULL,
       b_start              VARCHAR2(30char)not NULL,
       b_end                VARCHAR2(30char)not NULL,
       ways                 VARCHAR2(2char)not NULL
                                   CHECK (ways IN ('왕복', '편도')),
       PRIMARY KEY (busno), 
       FOREIGN KEY (id)
                             REFERENCES member
);

CREATE TABLE bus_info (
       car_num              NUMBER(10) NOT NULL,
       id                   VARCHAR(12char) NOT NULL,
       seat_num             NUMBER(2) NOT NULL,
       PRIMARY KEY (car_num), 
       FOREIGN KEY (id)
                             REFERENCES member
);

CREATE TABLE bus_reply (
       rev_no               NUMBER(10) NOT NULL,
       busno                NUMBER(10) NOT NULL,
       id                   VARCHAR2(12char) NOT NULL,
       price                NUMBER(10) NOT NULL,
       content              VARCHAR2(4000) NULL,
       car_num              VARCHAR2(7char) NOT NULL,
       bid_req              NUMBER(2) NULL
                                   CHECK (bid_req IN (0, 1)),
       deal_comp            NUMBER(2) NULL
                                   CHECK (deal_comp IN (0, 1)),
       PRIMARY KEY (rev_no), 
       FOREIGN KEY (id)
                             REFERENCES member, 
       FOREIGN KEY (busno)
                             REFERENCES bus
);


CREATE TABLE request (
       rrply_no             NUMBER(10) NOT NULL,
       id                   VARCHAR2(12char) NOT NULL,
       coid                 VARCHAR2(12char) NOT NULL,
       req_date             DATE NULL,
       accept               NUMBER(2) NULL
                                   CHECK (accept IN (0, 1)),
       rev_no               NUMBER(10) NOT NULL,
       PRIMARY KEY (rrply_no), 
       FOREIGN KEY (rev_no)
                             REFERENCES bus_reply
);


CREATE TABLE reser_comp (
       comp_no              NUMBER(10) NOT NULL,
       price                NUMBER(10) NOT NULL,
       b_start              VARCHAR2(30char) NOT NULL,
       startdate            DATE NULL,
       b_end                VARCHAR2(30char) NOT NULL,
       enddate              DATE NOT NULL,
       comp_date            DATE NOT NULL,
       ways                 VARCHAR2(2char) NOT NULL
                                   CHECK (ways IN ('왕복', '편도')),
       car_num              VARCHAR2(7char) NOT NULL,
       id                   VARCHAR2(12char) NOT NULL,
       coid                 VARCHAR2(12char) NOT NULL,
       rrply_no             NUMBER(10) NOT NULL,
       PRIMARY KEY (comp_no), 
       FOREIGN KEY (rrply_no)
                             REFERENCES request
);



select * from member

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
       now_seat           NUMBER(3) NOT NULL,
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
