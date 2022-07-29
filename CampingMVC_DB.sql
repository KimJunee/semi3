
-- SEMI 계정 생성
-- CREATE USER SEMI IDENTIFIED BY SEMI;
-- GRANT RESOURCE, CONNECT TO SEMI;
-- 계정 삭제하기
-- drop user SEMI cascade;


------------------------------------------------
--------------- camp_site 관련 테이블 ---------------
------------------------------------------------
DROP TABLE camp_site;
CREATE TABLE camp_site(
cs_no NUMBER PRIMARY KEY,                           
cs_name VARCHAR2(1000),                       
cs_line_intro CLOB,           
cs_intro CLOB,                     
cs_allar VARCHAR2(1000),                     
cs_insrnc_at VARCHAR2(1000),             
cs_bizr_no VARCHAR2(1000),                 
cs_managesttus VARCHAR2(1000),         
cs_feature_name VARCHAR2(1000),       
cs_induty VARCHAR2(1000),                   
cs_lct_cl VARCHAR2(1000),
cs_do_name VARCHAR2(1000),                 
cs_sigungu_name VARCHAR2(1000),       
cs_zipcode VARCHAR2(1000),
cs_addr1 VARCHAR2(1000),          
cs_addr2 VARCHAR2(1000),                     
cs_map_x VARCHAR2(1000),      
cs_map_y VARCHAR2(1000),         
cs_tel VARCHAR2(1000),                         
cs_homepage VARCHAR2(1000),              
cs_resve_url VARCHAR2(1000),      
cs_resve_cl VARCHAR2(1000),               
cs_manager NUMBER,                
cs_gnrl_site NUMBER,             
cs_auto_site NUMBER,             
cs_glamp_site NUMBER,           
cs_carav_site NUMBER,           
cs_indiv_carav_site NUMBER,
cs_animal_cmg VARCHAR2(1000),
cs_postbl_fclty VARCHAR2(1000),       
cs_sbrs_cl VARCHAR2(1000)                 
);

SET DEFINE OFF; -- &넣을려면 이거 실행시키고 해야함

INSERT INTO camp_site VALUES (3068, '내원자동차야영장' , '숲과 계곡이 공존하는 즐거움이 가득한 지리산 내원야영장'
, '지리산국립공원 내원사 앞 내원계곡을 끼고 있는 내원자동차야영장은 일반야영장을 2007년에 자동차야영장과 일반야영장의 
혼합형으로 만든 캠핑장이다. 모든 시설의 이용이 걸어서 2~3분 내에 위치하고 있어 편리하며, 모든 편의시설이 깨끗하고 정리정돈이
잘 되어 있다. 야영장내 주차장이 따로 마련되어 있으며 일반캠핑장 32개소와 카라반 겸용 사이트 5개소, 데크사이트(소) 11개소,
데크사이트(중) 5개소가 있다.    내원자동차야영장은 국립공원 야영장임에도 불구하고 휴양림 같은 분위기가나는 곳이다. 
숲 속 사이트는 데크와 노지사이트 모두 나무테이블이 비치되어 있어 테이블을 따로 준비하지 않아도 된다. 사이트 옆으로 흐르는 계곡
의 물소리를 들을 수 있고 데크에 앉아 나무 사이로 보이는 폭포도 감상할 수 있는 멋진 캠핑장이다. 
숲속사이트 이용자들의 편의를 위해 리어카 몇 대가 준비되어 있다. 반드시 짐을 나르고 난 뒤에는 제자리에 가져다 두어야 다음 
사람이 편리하게 이용할 수 있다. 개수대 물은 계곡수를 사용하기 때문에 식수로 쓰려면 반드시 끓여야 한다. 샤워장은 무료가 
아닌 유료로 운영되고 있어 사용료 1천원을 내야 이용이 가능하다. (온수는 나오지 않아 냉수 샤워만 가능)' , '0', 'Y'
, '61-38-03639', '운영', '','자동차야영장,카라반','산,숲,계곡', '경상남도','산청군','666921','경상남도 산청군 삼장면 대포리',
'산 106-2' , '127.8124104', '35.2967767', '055-972-7775', 'http://www.knps.or.kr/front/portal/visit/visitCourseMain.do?parkId=120100&parkNavGb=park_facView&vnewsId=186'
,'http://reservation.knps.or.kr', '', 0, 32, 16, 0, 0, 5, '불가능','계곡 물놀이,산책로,농어촌체험시설'
,'전기,무선인터넷'
);

INSERT INTO camp_site VALUES (?, ? , ? , ? , ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
						+ ",?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? );
commit;

SELECT * FROM camp_site;
DELETE FROM camp_site;

------------------------------------위에 부분은 세미프로젝트와 관련된 쿼리 입니다--------------------------------------------------------------

------------------------------------여기 아래 부분으로는 세미프로젝트와 관련 없는 쿼리 입니다.------------------------------------------------------
INSERT INTO MEMBER (
    NO, 
    ID, 
    PASSWORD, 
    ROLE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    HOBBY, 
    STATUS, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'admin', 
    '1234', 
    'ROLE_ADMIN', 
    '관리자', 
    '010-1234-4341', 
    'admin@iei.or.kr', 
    '서울시 강남구 역삼동',
    NULL,
    DEFAULT,
    DEFAULT,
    DEFAULT
);

COMMIT;

SELECT * FROM MEMBER;

------------------------------------------------
--------------- Board 관련 테이블 ---------------
------------------------------------------------

DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE TABLE BOARD (	
    NO NUMBER,
    WRITER_NO NUMBER, 
	TITLE VARCHAR2(50), 
	CONTENT VARCHAR2(2000), 
	TYPE VARCHAR2(100), 
	ORIGINAL_FILENAME VARCHAR2(100), 
	RENAMED_FILENAME VARCHAR2(100), 
	READCOUNT NUMBER DEFAULT 0, 
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    CREATE_DATE DATE DEFAULT SYSDATE, 
    MODIFY_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(NO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(WRITER_NO) REFERENCES MEMBER(NO) ON DELETE SET NULL
);

COMMENT ON COLUMN BOARD.NO IS '게시글번호';
COMMENT ON COLUMN BOARD.WRITER_NO IS '게시글작성자';
COMMENT ON COLUMN BOARD.TITLE IS '게시글제목';
COMMENT ON COLUMN BOARD.CONTENT IS '게시글내용';
COMMENT ON COLUMN BOARD.TYPE IS '게시글 타입';
COMMENT ON COLUMN BOARD.ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN BOARD.RENAMED_FILENAME IS '첨부파일변경이름';
COMMENT ON COLUMN BOARD.READCOUNT IS '조회수';
COMMENT ON COLUMN BOARD.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN BOARD.CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN BOARD.MODIFY_DATE IS '게시글수정날짜';

DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO;

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '게시글 '||SEQ_BOARD_NO.CURRVAL , '게시글 테스트입니다.'||SEQ_BOARD_NO.CURRVAL, 'B'||SEQ_BOARD_NO.CURRVAL, null, null, DEFAULT, 'Y', SYSDATE, SYSDATE);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[판매] 애플 노트북 팔아요.',  '노트북 맥북 최신입니다. 게임하시면 안됩니다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[판매] 삼성 노트북 팔아요.',  '삼성 노트북 팝니다. 터치 됩니다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[판매] 아이폰 팔아요.',  '아이폰13 팝니다. ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[판매] 갤럭시 팔아요.',  '갤럭시 플립3 팝니다. ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[구매] 애플 노트북 삽니다.',  '맥북 게임용으로 삽니다. 이거 게임 잘돌아가나요?', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[구매] 삼성 노트북 삽니다.',  '삼성 노트북 삽니다. 아이폰 개발하려 삽니다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[구매] 아이폰 삽니다.',  '아이폰3사요. 30만원에 네고합니다. ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[구매] 갤럭시 삽니다.',  '갤럭시 삽니다. 아무 기종이나 상관없어요. ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);

COMMIT;
SELECT * FROM BOARD;

--------------------------------------------------------------------
------------------------- REPLY 관련 테이블 -------------------------
--------------------------------------------------------------------

DROP TABLE REPLY CASCADE CONSTRAINTS;

CREATE TABLE REPLY(
  NO NUMBER PRIMARY KEY,
  BOARD_NO NUMBER,
  WRITER_NO NUMBER,
  CONTENT VARCHAR2(400),
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  CREATE_DATE DATE DEFAULT SYSDATE,
  MODIFY_DATE DATE DEFAULT SYSDATE,
  FOREIGN KEY (BOARD_NO) REFERENCES BOARD,
  FOREIGN KEY (WRITER_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_REPLY_NO;

COMMENT ON COLUMN "REPLY"."NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '댓글이작성된게시글';
COMMENT ON COLUMN "REPLY"."WRITER_NO" IS '댓글작성자';
COMMENT ON COLUMN "REPLY"."CONTENT" IS '댓글내용';
COMMENT ON COLUMN "REPLY"."STATUS" IS '상태값(Y/N)';
COMMENT ON COLUMN "REPLY"."CREATE_DATE" IS '댓글올린날짜';
COMMENT ON COLUMN "REPLY"."MODIFY_DATE" IS '댓글수정날짜';

INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, 51, 22, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, 50, 1, '반갑습니다.', DEFAULT, DEFAULT, DEFAULT);

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;

SELECT * FROM REPLY;

--------------------------------DDL 끝-------------------------------------------

-- MEMBER 

-- 멤버 조회
-- SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'

-- 멤버 추가
-- INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)

-- 멤버 수정               
-- UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?

-- 멤버 패스워드 변경
-- UPDATE MEMBER SET PASSWORD=? WHERE NO=?

-- 멤버 삭제
-- UPDATE MEMBER SET STATUS=? WHERE NO=?

-- BOARD DML

-- 총 게시글 갯수
-- SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'

-- 조회수 증가
-- UPDATE BOARD SET READCOUNT=? WHERE NO=?

-- 게시글 작성
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)

-- 게시글 수정
-- UPDATE BOARD SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?

-- 게시글 삭제
-- UPDATE BOARD SET STATUS=? WHERE NO=?

-- 상세 조회
/*
SELECT  B.NO, B.TITLE, M.ID, B.READCOUNT, B.ORIGINAL_FILENAME, B.RENAMED_FILENAME, B.CONTENT, B.CREATE_DATE, B.MODIFY_DATE
FROM BOARD B
JOIN MEMBER M ON(B.WRITER_NO = M.NO)
WHERE B.STATUS = 'Y' AND B.NO=?
*/

/* 
목록 조회(페이징) 쿼리
SELECT RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS  
FROM (
    SELECT ROWNUM AS RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS 
    FROM (
        SELECT  B.NO, B.TITLE, M.ID, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS
        FROM BOARD B JOIN MEMBER M ON(B.WRITER_NO = M.NO) 
        WHERE B.STATUS = 'Y' ORDER BY B.NO DESC
    )
)
WHERE RNUM BETWEEN 2 and 3;
*/

-- insert query
-- INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)

-- 한 게시판에 해당하는 댓글 리스트 조회용 쿼리문
/*
SELECT R.NO, R.BOARD_NO, R.CONTENT, M.ID, R.CREATE_DATE, R.MODIFY_DATE
FROM REPLY R
JOIN MEMBER M ON(R.WRITER_NO = M.NO)
WHERE R.STATUS='Y' AND BOARD_NO= ? 
ORDER BY R.NO DESC;
*/

/*
select * FROM REPLY;
DELETE REPLY WHERE NO=5
*/

/*
SELECT RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS  
FROM (
    SELECT ROWNUM AS RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS 
    FROM (
      SELECT  B.NO, B.TITLE, M.ID, B.CREATE_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS
        FROM BOARD B JOIN MEMBER M ON(B.WRITER_NO = M.NO) 
        WHERE 1 = 1 
        AND B.STATUS = 'Y'
        --	AND M.ID LIKE '%admin%' 
        --	AND B.TITLE LIKE '%구매%' 
        -- AND B.CONTENT LIKE '%아이폰%' 
        ORDER BY B.NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;
*/

/*
SELECT  COUNT(*)
FROM BOARD B
JOIN MEMBER M ON(B.WRITER_NO = M.NO)
WHERE 1=1
    AND B.STATUS = 'Y'
--	AND M.ID LIKE '%admin%' 
--	AND B.TITLE LIKE '%구매%' 
	AND B.CONTENT LIKE '%아이폰%' 
*/