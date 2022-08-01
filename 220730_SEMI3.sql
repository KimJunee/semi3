/*-- 유저 생성
CREATE USER SEMI
IDENTIFIED BY SEMI
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp;
-- 권한 설정
GRANT CONNECT TO SEMI;
GRANT RESOURCE TO SEMI;
GRANT dba TO SEMI;
GRANT CREATE TABLE TO SEMI;
ALTER USER SEMI DEFAULT TABLESPACE USERS;
*/
--=========================================================
--멤버---------------------------------------------------------------------------------------------
DROP TABLE USER_T CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_UNO;

CREATE TABLE USER_T(
    USER_NO NUMBER  PRIMARY KEY,
    USER_ID VARCHAR2(1000)  NOT NULL,
    USER_PW VARCHAR2(1000) NOT NULL,
    USER_NAME VARCHAR2(1000) NOT NULL,
    USER_PHONE VARCHAR2(1000) NOT NULL,
    USER_EMAIL VARCHAR2(1000) NOT NULL,
    USER_BIRTH VARCHAR2(1000)
);
CREATE SEQUENCE SEQ_UNO;

INSERT INTO USER_T VALUES (SEQ_UNO.NEXTVAL, 'dummy1', '1234', '홍길동', '010-1234-4321', 'abcd@gmail.com', '900101');
INSERT INTO USER_T VALUES (SEQ_UNO.NEXTVAL, 'dummy2', '2134', '김길동', '010-1234-4312', 'bcda@naver.com', '890202');

SELECT * FROM USER_T;

COMMIT;
--=========================================================
-----------------------USER-T---DML---(마이페이지_정보수정)-----------------------------------
--유저조회
-- SELECT * FROM USER_T WHERE USER_ID=? ;

-- 유저 수정               
-- UPDATE USER_T SET USER_NAME=?,USER_PHONE=?,USER_EMAIL=?,USER_BIRTH=? WHERE USER_NO=?;

-- 유저 패스워드 변경
-- UPDATE USER_T WHERE USER_NO=?;

-- 회원 탈퇴
-- DELETE USER_T  WHERE USER_NO=?;
--=========================================================
--------------- (문의게시판)INQUIRY_BOARD 관련 테이블 ---------------
--------------------------DDL--------------------------------------

--문의 게시판
DROP TABLE INQUIRY_BOARD CASCADE CONSTRAINTS;

CREATE TABLE INQUIRY_BOARD(
    INQUIRY_NO NUMBER PRIMARY KEY NOT NULL,  --문의글번호
    USER_NO   NUMBER,                        --문의글 작성자번호
    CS_NO  NUMBER,                           --캠핑장번호
    INQUIR_TITLE VARCHAR2(1000) NOT NULL,    --문의글 제목
    INQUIR_CONTENT VARCHAR2(1000) NOT NULL,  --문의글 내용
    INQUIR_REGIST DATE DEFAULT SYSDATE,      --등록날짜
    INQUIR_HIT NUMBER DEFAULT 0,             --조회수
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --작성자번호 외래키
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE    --캠핑장사이트 외래키
);

COMMENT ON COLUMN INQUIRY_BOARD.INQUIRY_NO IS '문의글번호';
COMMENT ON COLUMN INQUIRY_BOARD.USER_NO IS '문의글 작성자번호';
COMMENT ON COLUMN INQUIRY_BOARD.CS_NO IS '캠핑장 번호';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_TITLE IS '문의글 제목';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_CONTENT IS '문의글 내용';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_REGIST IS '등록날짜';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_HIT IS '문의글 조회수';

--게시글 번호 증가
DROP SEQUENCE SEQ_INQUIRY_BOARD_INQUIRY_NO;
CREATE SEQUENCE SEQ_INQUIRY_BOARD_INQUIRY_NO;

INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,1,1, '문의글 SQL테스트 제목입니다1','문의글 SQL 테스트 내용입니다1',SYSDATE, 1);
INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,2,2, '문의글 SQL테스트 제목입니다2','문의글 SQL 테스트 내용입니다2',SYSDATE, 1);

BEGIN
    FOR N IN 1..50
    LOOP
        INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,1,3, '문의글 제목'||SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,'문의글 내용'||SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,SYSDATE, 1 );
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
SELECT * FROM INQUIRY_BOARD;

--------------------------DML----------------------------
--SELECT * FROM INQUIRY_BOARD;

-- 총 문의글 갯수(확인완)
--SELECT COUNT(*) FROM INQUIRY_BOARD;

-- 조회수 증가(확인완)
--UPDATE INQUIRY_BOARD SET INQUIR_HIT=3 WHERE INQUIRY_NO=1;

-- 문의글 작성(확인완)
--INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT);

-- 문의글 수정_마이페이지(확인완)
-- UPDATE INQUIRY_BOARD SET INQUIR_TITLE=?,INQUIR_CONTENT=? WHERE INQUIRY_NO=?;

-- 문의글 삭제_마이페이지(확인완)
--DELETE INQUIRY_BOARD  WHERE INQUIRY_NO=?;

-- 게시글 상세 조회 (확인완)

SELECT IB.INQUIRY_NO,UT.USER_ID,CS.CS_NAME,IB.INQUIR_TITLE,IB.INQUIR_CONTENT,IB.INQUIR_REGIST,IB.INQUIR_HIT
FROM INQUIRY_BOARD IB
INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO)
WHERE IB.INQUIRY_NO=1;

--목록 조회(페이징) 쿼리(확인완)
-- 문의글번호,문의글제목,작성자,등록일,조회수
SELECT RNUM, INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST,INQUIR_HIT
FROM (
    SELECT ROWNUM AS RNUM,INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST,INQUIR_HIT
    FROM (
        SELECT IB.INQUIRY_NO,IB.INQUIR_TITLE,UT.USER_ID,IB.INQUIR_REGIST,IB.INQUIR_HIT
        FROM INQUIRY_BOARD IB JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
         ORDER BY IB.INQUIRY_NO
    )
)
WHERE RNUM BETWEEN 1 and 10;

--1번째 부터 10번째 글을 보기

--내게시물목록보기-마이페이지(확인완)

SELECT RNUM, INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST, INQUIR_HIT
FROM (
    SELECT ROWNUM AS  RNUM,INQUIRY_NO,INQUIR_TITLE,USER_ID,INQUIR_REGIST,INQUIR_HIT
    FROM (
        SELECT IB.INQUIRY_NO,IB.INQUIR_TITLE,UT.USER_ID,IB.INQUIR_REGIST,IB.INQUIR_HIT
        FROM INQUIRY_BOARD IB  JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
         where UT.USER_NO=1
    )
)
WHERE RNUM BETWEEN 1 and 20;

--게시판 검색기능(확인완)

SELECT RNUM, INQUIRY_NO,USER_ID,CS_NAME,INQUIR_TITLE,INQUIR_CONTENT,INQUIR_REGIST,INQUIR_HIT  
FROM (
    SELECT ROWNUM AS RNUM,INQUIRY_NO,USER_ID,CS_NAME,INQUIR_TITLE,INQUIR_CONTENT,INQUIR_REGIST,INQUIR_HIT  
    FROM (
        SELECT  IB.INQUIRY_NO,UT.USER_ID,CS.CS_NAME,IB.INQUIR_TITLE,IB.INQUIR_CONTENT,IB.INQUIR_REGIST,IB.INQUIR_HIT
        FROM INQUIRY_BOARD IB 
        INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
        INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO)
        WHERE 1 = 1 
        AND UT.USER_ID LIKE '%dummy1%' 
        AND IB.INQUIR_TITLE LIKE '%테스트%' 
         AND IB.INQUIR_CONTENT LIKE '%테스트%' 
        ORDER BY IB.INQUIRY_NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;

--글 개수 몇개인지!+(확인완)

SELECT  COUNT(*)
FROM INQUIRY_BOARD IB
INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO)
WHERE 1=1
	AND UT.USER_ID LIKE '%dummy1%' 
    AND IB.INQUIR_TITLE LIKE '%테스트%' 
    AND IB.INQUIR_CONTENT LIKE '%테스트%' ;
--=========================================================
-------------------(문의게시판댓글) INREPLY 관련 테이블 ------------------
--------------------------DDL-------------------------------------
DROP TABLE INREPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_INR_NO;

--댓글
CREATE TABLE INREPLY(
    INR_NO NUMBER PRIMARY KEY ,                  --댓글번호
    INR_CONTENT VARCHAR2(1000) ,                 --댓글내용
    INR_REGIST DATE DEFAULT SYSDATE,             --댓글등록날짜
    USER_NO   NUMBER,                               --댓글작성자번호(커뮤니티게시판 테이블 컬럼)
    INQUIRY_NO NUMBER ,                          --댓글이 작성된게시글번호(커뮤니티게시판 테이블 컬럼)
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,     --작성자번호 외래키
    FOREIGN KEY (INQUIRY_NO) REFERENCES INQUIRY_BOARD        --문의글번호 외래키
);

COMMENT ON COLUMN "INREPLY"."INR_NO" IS '댓글번호';
COMMENT ON COLUMN "INREPLY"."INR_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "INREPLY"."INR_REGIST" IS '댓글등록날짜';
COMMENT ON COLUMN "INREPLY"."USER_NO" IS '댓글작성자번호';
COMMENT ON COLUMN "INREPLY"."INQUIRY_NO" IS '댓글작성된게시글번호';

CREATE SEQUENCE SEQ_INR_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '문의답변달아요', SYSDATE,1, 1);
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '문의답변입니다', SYSDATE,2, 2);
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '문의답변', SYSDATE,1, 3);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, 'SQL문의글답변테스트1', SYSDATE, 1, 4);
INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, 'SQL문의글답변테스트2', SYSDATE, 2, 5);
  
COMMIT;
SELECT * FROM INREPLY; 
  
--------------------------DML----------------------------
--  사용자가 작성한 댓글 조회(확인완료)
--SELECT * FROM INREPLY WHERE USER_NO =?;

--댓글 작성(확인완료)
--INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL,?, DEFAULT,?,?);

-- 댓글 수정(확인완료)
--UPDATE INREPLY SET INR_CONTENT=? WHERE INR_NO=?;

-- 댓글 삭제(확인완료)
--DELETE INREPLY  WHERE INR_NO=?;
 
 -- 한 게시물에 해당하는 댓글 리스트 조회용 쿼리문(확인완료)
 /*
SELECT INR.INR_NO,INR.INR_CONTENT,INR.INR_REGIST, UT.USER_ID, INR.INQUIRY_NO
FROM INREPLY INR
INNER JOIN USER_T UT  ON(INR.USER_NO = UT.USER_NO)
WHERE  INR.INQUIRY_NO= ?
ORDER BY  INR.INR_NO DESC;
*/

--=========================================================
--------------- (커뮤니티게시판)COMMU_BOARD 관련 테이블 ---------------
--------------------------DDL--------------------------------------
DROP TABLE COMMU_BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_COMMU_BOARD_CO_NO;

--커뮤니티 게시판
CREATE TABLE COMMU_BOARD(
    CO_NO NUMBER PRIMARY KEY NOT NULL,  --게시글번호
    USER_NO   NUMBER,                 --게시글 작성자번호
    CO_TITLE  VARCHAR2(1000) NOT NULL,      --게시글 제목
    CO_CONTENT VARCHAR2(1000) NOT NULL,    --내용
    CO_REGIST DATE DEFAULT SYSDATE,        --등록날짜
    CO_HIT NUMBER DEFAULT 0,        --조회수
    CONSTRAINT FK_BOARD_USER_NO FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL
);

COMMENT ON COLUMN COMMU_BOARD.CO_NO IS '게시글번호';
COMMENT ON COLUMN COMMU_BOARD.USER_NO IS '게시글작성자번호';
COMMENT ON COLUMN COMMU_BOARD.CO_TITLE IS '게시글제목';
COMMENT ON COLUMN COMMU_BOARD.CO_CONTENT IS '게시글내용';
COMMENT ON COLUMN COMMU_BOARD.CO_REGIST IS '게시글등록날짜';
COMMENT ON COLUMN COMMU_BOARD.CO_HIT IS '게시글조회수';

--게시글 번호 증가
CREATE SEQUENCE SEQ_COMMU_BOARD_CO_NO;

INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,1, '캠핑장에서 라면 맛있게 끓이는 방법 아시나요?','밖에서 먹으면 다맛있는데 혹시 더 맛있게 먹는방법 아시는분은 댓글 남겨주세요!',SYSDATE, 1);
INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,2, '캠핑장에서 폭죽놀이 했었는데 넘 재밌었어요','소리나는 폭죽은 안하고 스파클링폭죽했는데 너무 재밌었어요',SYSDATE, 1);

BEGIN
    FOR N IN 1..50
    LOOP
        INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,1, '게시글 제목'||SEQ_COMMU_BOARD_CO_NO.CURRVAL,'게시글 내용'||SEQ_COMMU_BOARD_CO_NO.CURRVAL,SYSDATE, 1 );
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
SELECT * FROM COMMU_BOARD;

--------------------------DML----------------------------
--SELECT * FROM COMMU_BOARD;

-- 총 게시글 갯수(확인완료)
--SELECT COUNT(*) FROM COMMU_BOARD;

-- 조회수 증가(확인완료)
 --UPDATE COMMU_BOARD SET CO_HIT=3 WHERE CO_NO=1;

-- 게시글 작성(확인완료)
--INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT);

-- 게시글 수정_마이페이지(확인완료)
-- UPDATE COMMU_BOARD SET CO_TITLE=?,CO_CONTENT='? WHERE CO_NO=?;

-- 게시글 삭제_마이페이지(확인완료)
-- DELETE COMMU_BOARD  WHERE CO_NO=?;

-- 게시글 상세 조회 (확인완료)
/*
SELECT  CB.CO_NO, UT.USER_ID, CB.CO_TITLE, CB.CO_CONTENT, CB.CO_REGIST, CB.CO_HIT
FROM COMMU_BOARD CB
JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
WHERE CB.CO_NO=1;
*/

--목록 조회(페이징) 쿼리(확인완료)
/*
SELECT RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT
FROM (
    SELECT ROWNUM AS RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT
    FROM (
        SELECT CB.CO_NO,CB.CO_TITLE,UT.USER_ID,CB.CO_REGIST, CB.CO_HIT
        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
         ORDER BY CB.CO_NO
    )
)
WHERE RNUM BETWEEN 1 and 10;
*/
--1번째 부터 10번째 글을 보기

--내게시물목록보기-마이페이지(확인완료)

SELECT RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT
FROM (
    SELECT ROWNUM AS RNUM, CO_NO,CO_TITLE,USER_ID,CO_REGIST, CO_HIT
    FROM (
        SELECT CB.CO_NO,CB.CO_TITLE,UT.USER_ID,CB.CO_REGIST, CB.CO_HIT
        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
         where UT.USER_NO=1
    )
)
WHERE RNUM BETWEEN 1 and 20;

--게시판 검색기능(확인완료)
/*
SELECT RNUM, CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT  
FROM (
    SELECT ROWNUM AS RNUM,CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT  
    FROM (
        SELECT  CB.CO_NO,UT.USER_ID, CB.CO_TITLE,CB.CO_CONTENT,CB.CO_REGIST,CB.CO_HIT 
        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) 
        WHERE 1 = 1 
        --AND UT.USER_ID LIKE '%dummy1%' 
        --AND CB.CO_TITLE LIKE '%캠핑%' 
         AND CO_CONTENT LIKE '%폭죽%' 
        ORDER BY  CB.CO_NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;
*/

--글 개수 몇개인지!+(확인완료)
/*
SELECT  COUNT(*)
FROM COMMU_BOARD CB
JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
WHERE 1=1
	AND UT.USER_ID LIKE '%dummy1%' 
--	AND CB.CO_TITLE LIKE '%캠핑%' 
--	AND CO_CONTENT LIKE '%폭죽%' ;
*/

--=========================================================
-------------------(커뮤니티게시판댓글) REPLY 관련 테이블 ------------------
--------------------------DDL-------------------------------------------------------
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_REP_NO;


--댓글
CREATE TABLE REPLY(
    REP_NO NUMBER PRIMARY KEY ,                  --댓글번호
    REP_CONTENT VARCHAR2(1000) ,                 --댓글내용
    REP_REGIST DATE DEFAULT SYSDATE,             --댓글등록날짜
    USER_NO   NUMBER,                     --댓글작성자번호(커뮤니티게시판 테이블 컬럼)
    CO_NO NUMBER ,                           --댓글이 작성된게시글번호(커뮤니티게시판 테이블 컬럼)
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --작성자번호 외래키
    FOREIGN KEY (CO_NO) REFERENCES COMMU_BOARD        --게시물번호 외래키
);

COMMENT ON COLUMN "REPLY"."REP_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."REP_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "REPLY"."REP_REGIST" IS '댓글등록날짜';
COMMENT ON COLUMN "REPLY"."USER_NO" IS '댓글작성자번호';
COMMENT ON COLUMN "REPLY"."CO_NO" IS '댓글 작성한 게시글';

CREATE SEQUENCE SEQ_REP_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '답변달아요~~~.', SYSDATE,1, 19);
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '답변이요.', SYSDATE,2,  20);
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '댓글남겨요.', SYSDATE,1, 21);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '답변남깁니다1.', SYSDATE, 1, 18);
INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '답변남깁니다2.', SYSDATE, 2, 9);
  
COMMIT;
SELECT * FROM REPLY; 
  
--------------------------DML----------------------------
--  사용자가 작성한 댓글 조회(확인완료)
--SELECT * FROM REPLY WHERE USER_NO = ?;

--댓글 작성(확인완료)
--INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL,?, DEFAULT,?, ?);

-- 댓글 수정(확인완료)
--UPDATE REPLY SET REP_CONTENT=? WHERE REP_NO=?;

-- 댓글 삭제(확인완료)
--DELETE REPLY  WHERE REP_NO=?;
 
 -- 한 게시판에 해당하는 댓글 리스트 조회용 쿼리문(확인완료)
 /*
SELECT R.REP_NO, R.CO_NO,R.REP_CONTENT, UT.USER_ID, R.REP_REGIST
FROM REPLY R
JOIN USER_T UT  ON(R.USER_NO = UT.USER_NO)
WHERE  R.CO_NO= ?
ORDER BY R.REP_NO DESC;
*/
-- R.CO_NO= 20 으로 테스트해보기

--=========================================================
-------------------(캠핑장리뷰) REVIEW 관련 테이블 ------------------
--------------------------DDL-------------------------------------
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_REV_NO;

--댓글
CREATE TABLE REVIEW(
    REV_NO NUMBER PRIMARY KEY ,              --리뷰번호
    REV_TITLE VARCHAR2(1000) ,               --리뷰제목
    REV_CONTENT  VARCHAR2(1000),             --리뷰내용
    REV_REGIST DATE DEFAULT SYSDATE,         --리뷰등록날짜
    REV_IMAGE VARCHAR2(1000) ,               --리뷰이미지
    REV_STAR VARCHAR2(1000) ,                --리뷰별점
    USER_NO NUMBER ,                         --사용자번호 
    CS_NO NUMBER ,                           --캠핑장번호
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --작성자번호 외래키
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE  --캠핑장번호 외래키
);

COMMENT ON COLUMN "REVIEW"."REV_NO" IS '리뷰번호';
COMMENT ON COLUMN "REVIEW"."REV_TITLE" IS '리뷰제목';
COMMENT ON COLUMN "REVIEW"."REV_CONTENT" IS '리뷰내용';
COMMENT ON COLUMN "REVIEW"."REV_REGIST" IS '리뷰등록날짜';
COMMENT ON COLUMN "REVIEW"."REV_IMAGE" IS '리뷰이미지';
COMMENT ON COLUMN "REVIEW"."REV_STAR" IS '리뷰별점';
COMMENT ON COLUMN "REVIEW"."USER_NO" IS '사용자번호';
COMMENT ON COLUMN "REVIEW"."CS_NO" IS '캠핑장번호';

CREATE SEQUENCE SEQ_REV_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '완전 강추','캠핑장 청결하고 너무 좋았어요', SYSDATE,'첨부파일3',5,1, 4);
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL,'사장님 짱', '캠핑장 정말 강추합니다. 사장님이 친절해요', SYSDATE,'첨부파일3',5,2,  3);
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '너무 좋아요','자연이랑 어우려져서 힐링하고 와서 너무 좋았어요', SYSDATE,'첨부파일3',5,1,5);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '후기제목1','후기내용테스트1', SYSDATE,'첨부파일3',5,1, 1);
INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '후기제목2','후기내용테스트2', SYSDATE,'첨부파일3',5,1, 1);
  
COMMIT;
SELECT * FROM REVIEW; 

--------------------------DML----------------------------

--  사용자가 작성한 리뷰 조회(확인완료)
--SELECT * FROM REVIEW WHERE USER_NO = ?;

--리뷰 작성(확인완료)
--INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL,?,?, DEFAULT,?,?,?,?);

-- 리뷰 내용 수정(확인완료)
--UPDATE REVIEW SET REV_CONTENT=? WHERE REV_NO=?;

-- 리뷰 삭제(확인완료)
--DELETE REVIEW  WHERE REV_NO=?;

-- 한 캠핑장에 해당하는 댓글 리스트 조회용 쿼리문( 미확인 )
/*
SELECT RV.REV_NO, RV.CS_NO,RV.REV_CONTENT, UT.USER_ID, RV.REV_REGIST,RV.REV_IMAGE,RV.REV_STAR
FROM REPLY RV
JOIN USER_T UT  ON(RV.USER_NO = UT.USER_NO)
WHERE  RV.CS_NO= ?
ORDER BY RV.REV_NO DESC;
*/

--=========================================================
-------------------(찜하기) LIKE_T 관련 테이블 ------------------
--------------------------DDL-------------------------------------
DROP TABLE LIKE_T CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_LIKE_NO;

CREATE TABLE LIKE_T(
    LIKE_NO NUMBER PRIMARY KEY ,              --찜번호
    USER_NO NUMBER ,                            --사용자번호
    CS_NO  NUMBER ,                          --캠핑장NO
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --작성자번호 외래키
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE  --캠핑장번호 외래키
);

COMMENT ON COLUMN "LIKE_T"."LIKE_NO" IS '찜번호';
COMMENT ON COLUMN "LIKE_T"."USER_NO" IS '사용자번호';
COMMENT ON COLUMN "LIKE_T"."CS_NO" IS '캠핑장NO';

CREATE SEQUENCE SEQ_LIKE_NO;

BEGIN
    FOR N IN 1..20
    LOOP
        INSERT INTO LIKE_T VALUES(SEQ_LIKE_NO.NEXTVAL,1,1);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO LIKE_T VALUES(SEQ_LIKE_NO.NEXTVAL,1,2);
INSERT INTO LIKE_T VALUES(SEQ_LIKE_NO.NEXTVAL,2,2);
  
COMMIT;
SELECT * FROM LIKE_T; 

------------------------마이페이지-찜한캠핑장-DML----------------------------
--찜한캠핑장 목록보기(확인완료)
--SELECT * FROM LIKE_T WHERE USER_NO = ?;

--찜한캠핑장 목록보기(아이디로 조회)-마이페이지(확인완료)

SELECT RNUM, LIKE_NO,USER_ID,CS_NAME,CS_SIGUNGU_NAME,CS_IMAGE
FROM (
    SELECT ROWNUM AS RNUM, LIKE_NO,USER_ID,CS_NAME,CS_SIGUNGU_NAME,CS_IMAGE
    FROM (
        SELECT LT.LIKE_NO,UT.USER_ID,CT.CS_NAME,CT.CS_SIGUNGU_NAME,CT.CS_IMAGE
        FROM LIKE_T LT 
        INNER JOIN USER_T UT ON(LT.USER_NO = UT.USER_NO)
        INNER JOIN CAMP_SITE CT ON(LT.CS_NO = CT.CS_NO)
        where UT.USER_NO=1
    )
)
WHERE RNUM BETWEEN 1 and 20;

--찜한캠핑장 삭제하기(확인완료)
DELETE LIKE_T  WHERE LIKE_NO=1;

------------------------마이페이지-예약보기-DML------------------------------
--RESERVATION
--예약목록보기(아이디로조회)(캠핑장,인원수,요금,체크인,체크아웃)

SELECT RNUM, RESVE_NO,USER_ID,CS_NAME,CS_IMAGE,RESVE_HEADCOUNT,RESVE_PAY,RESVE_CHECKIN,RESVE_CHECKOUT
FROM (
    SELECT ROWNUM AS RNUM,RESVE_NO,USER_ID,CS_NAME,CS_IMAGE,RESVE_HEADCOUNT,RESVE_PAY,RESVE_CHECKIN,RESVE_CHECKOUT
    FROM (
        SELECT RN.RESVE_NO,UT.USER_ID,CS.CS_NAME,CS.CS_IMAGE,RN.RESVE_HEADCOUNT,RN.RESVE_PAY,RN.RESVE_CHECKIN,RN.RESVE_CHECKOUT
        FROM RESERVATION RN 
        INNER JOIN USER_T UT ON(RN.USER_NO = UT.USER_NO)
        INNER JOIN CAMP_SITE CS ON(RN.CS_NO = CS.CS_NO)
        where UT.USER_NO=1
    )
)
WHERE RNUM BETWEEN 1 and 20;

--예약상세보기(체크인,체크아웃,인원수,주소,전화번호,홈페이지,캠핑장이름,결제일자,이용요금,부가세,결제금액)

--=========================================================
-----------------------------예약-------------------------------------------------
DROP TABLE RESERVATION;
DROP SEQUENCE SEQ_RES_NO;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_RES_NO
  START WITH 1 INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9999   
  CYCLE 
  NOCACHE;

-- 예약테이블 생성
CREATE TABLE RESERVATION (
	RESV_NO NUMBER	NOT NULL,
    USER_NO	NUMBER NOT NULL,
    CS_NO NUMBER NOT NULL,
	RESV_HEADCOUNT	NUMBER NOT NULL,
	RESV_PAY VARCHAR2(300) NOT NULL,
	RESV_CHECKIN DATE NOT NULL,
	RESV_CHECKOUT DATE NOT NULL
);
-- 예약테이블 데이터 삽입
INSERT INTO RESERVATION VALUES (1, 1, 1, 3, '300000',TO_DATE('2022.08.16', 'YYYY.MM.DD'), TO_DATE('2022.08.19', 'YYYY.MM.DD'));
-- 커밋
COMMIT;
-- 예약테이블 전체조회
SELECT * FROM RESERVATION;
-----------------예약 DML---------------------------------------------------------------
-- 예약하기
-- INSERT INTO RESERVATION VALUES (SEQ_RES_NO.NEXTVAL, ?, ?, ?, ?, ?, ?);
 
-- 예약 조회하기
-- SELECT RESV_NO, USER_NO, CS_NO, CS_IMAGE, RESV_HEADCOUNT, RESV_PAY, RESV_CHECKIN, RESV_CHECKOUT  
-- FROM RESERVATION
-- LEFT JOIN CAMP_SITE CS ON (R.CS_NO=CS.CS_NO);

-- 예약 상세조회
-- SELECT RESV_NO, USER_NO, CS.CS_NO, CS_IMAGE, CS.CS_INDUTY,  
-- RESV_HEADCOUNT, RESV_PAY, RESV_CHECKIN, RESV_CHECKOUT 
-- FROM RESERVATION R
-- LEFT JOIN CAMP_SITE CS ON (R.CS_NO = CS.CS_NO)
-- WHERE USER_NO = ?
-- ORDER BY RESV_NO;

-- 예약 수정하기
-- UPDATE RESERVATION SET CS_NO=?, RESV_HEADCOUNT=?, RESV_CHECKIN=?, RESV_CHECKOUT=?;

-- 예약 삭제하기
-- DELETE FROM RESERVATION WHERE RESV_NO = ?;

--=========================================================
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

-- SET DEFINE OFF; -- &넣을려면 이거 실행시키고 해야함

-- INSERT INTO camp_site VALUES (3068, '내원자동차야영장' , '숲과 계곡이 공존하는 즐거움이 가득한 지리산 내원야영장'
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

-- INSERT INTO camp_site VALUES (?, ? , ? , ? , ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
						+ ",?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? );
commit;

SELECT * FROM camp_site;

--=========================================================
------------------------------------여기 아래 부분으로는 세미프로젝트와 관련 없는 쿼리 입니다.
/*INSERT INTO MEMBER (
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
*/
------------------------------------------------
--------------- Board 관련 테이블 ---------------
------------------------------------------------
/*
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
*/
--------------------------------------------------------------------
------------------------- REPLY 관련 테이블 -------------------------
--------------------------------------------------------------------
/*
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
*/
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