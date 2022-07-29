/*-- ���� ����
CREATE USER SEMI
IDENTIFIED BY SEMI
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp;
-- ���� ����
GRANT CONNECT TO SEMI;
GRANT RESOURCE TO SEMI;
GRANT dba TO SEMI;
GRANT CREATE TABLE TO SEMI;
ALTER USER SEMI DEFAULT TABLESPACE USERS;
*/
--=========================================================
--���---------------------------------------------------------------------------------------------
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

INSERT INTO USER_T VALUES (SEQ_UNO.NEXTVAL, 'dummy1', '1234', 'ȫ�浿', '010-1234-4321', 'abcd@gmail.com', '900101');
INSERT INTO USER_T VALUES (SEQ_UNO.NEXTVAL, 'dummy2', '2134', '��浿', '010-1234-4312', 'bcda@naver.com', '890202');

SELECT * FROM USER_T;

COMMIT;
--=========================================================
-----------------------USER-T---DML---(����������_��������)-----------------------------------
--������ȸ
-- SELECT * FROM USER_T WHERE USER_ID=? ;

-- ���� ����               
-- UPDATE USER_T SET USER_NAME=?,USER_PHONE=?,USER_EMAIL=?,USER_BIRTH=? WHERE USER_NO=?;

-- ���� �н����� ����
-- UPDATE USER_T WHERE USER_NO=?;

-- ȸ�� Ż��
-- DELETE USER_T  WHERE USER_NO=?;
--=========================================================
--------------- (���ǰԽ���)INQUIRY_BOARD ���� ���̺� ---------------
--------------------------DDL--------------------------------------

--���� �Խ���
DROP TABLE INQUIRY_BOARD CASCADE CONSTRAINTS;

CREATE TABLE INQUIRY_BOARD(
    INQUIRY_NO NUMBER PRIMARY KEY NOT NULL,  --���Ǳ۹�ȣ
    USER_NO   NUMBER,                        --���Ǳ� �ۼ��ڹ�ȣ
    CS_NO  NUMBER,                           --ķ�����ȣ
    INQUIR_TITLE VARCHAR2(1000) NOT NULL,    --���Ǳ� ����
    INQUIR_CONTENT VARCHAR2(1000) NOT NULL,  --���Ǳ� ����
    INQUIR_REGIST DATE DEFAULT SYSDATE,      --��ϳ�¥
    INQUIR_HIT NUMBER DEFAULT 0,             --��ȸ��
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --�ۼ��ڹ�ȣ �ܷ�Ű
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE    --ķ�������Ʈ �ܷ�Ű
);

COMMENT ON COLUMN INQUIRY_BOARD.INQUIRY_NO IS '���Ǳ۹�ȣ';
COMMENT ON COLUMN INQUIRY_BOARD.USER_NO IS '���Ǳ� �ۼ��ڹ�ȣ';
COMMENT ON COLUMN INQUIRY_BOARD.CS_NO IS 'ķ���� ��ȣ';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_TITLE IS '���Ǳ� ����';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_CONTENT IS '���Ǳ� ����';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_REGIST IS '��ϳ�¥';
COMMENT ON COLUMN INQUIRY_BOARD.INQUIR_HIT IS '���Ǳ� ��ȸ��';

--�Խñ� ��ȣ ����
DROP SEQUENCE SEQ_INQUIRY_BOARD_INQUIRY_NO;
CREATE SEQUENCE SEQ_INQUIRY_BOARD_INQUIRY_NO;

INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,1,1, '���Ǳ� SQL�׽�Ʈ �����Դϴ�1','���Ǳ� SQL �׽�Ʈ �����Դϴ�1',SYSDATE, 1);
INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,2,2, '���Ǳ� SQL�׽�Ʈ �����Դϴ�2','���Ǳ� SQL �׽�Ʈ �����Դϴ�2',SYSDATE, 1);

BEGIN
    FOR N IN 1..50
    LOOP
        INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,1,3, '���Ǳ� ����'||SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,'���Ǳ� ����'||SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,SYSDATE, 1 );
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

-- �� ���Ǳ� ����(Ȯ�ο�)
--SELECT COUNT(*) FROM INQUIRY_BOARD;

-- ��ȸ�� ����(Ȯ�ο�)
--UPDATE INQUIRY_BOARD SET INQUIR_HIT=3 WHERE INQUIRY_NO=1;

-- ���Ǳ� �ۼ�(Ȯ�ο�)
--INSERT INTO INQUIRY_BOARD VALUES(SEQ_INQUIRY_BOARD_INQUIRY_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT);

-- ���Ǳ� ����_����������(Ȯ�ο�)
-- UPDATE INQUIRY_BOARD SET INQUIR_TITLE=?,INQUIR_CONTENT=? WHERE INQUIRY_NO=?;

-- ���Ǳ� ����_����������(Ȯ�ο�)
--DELETE INQUIRY_BOARD  WHERE INQUIRY_NO=?;

-- �Խñ� �� ��ȸ (Ȯ�ο�)

SELECT IB.INQUIRY_NO,UT.USER_ID,CS.CS_NAME,IB.INQUIR_TITLE,IB.INQUIR_CONTENT,IB.INQUIR_REGIST,IB.INQUIR_HIT
FROM INQUIRY_BOARD IB
INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO)
WHERE IB.INQUIRY_NO=1;

--��� ��ȸ(����¡) ����(Ȯ�ο�)
-- ���Ǳ۹�ȣ,���Ǳ�����,�ۼ���,�����,��ȸ��
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

--1��° ���� 10��° ���� ����

--���Խù���Ϻ���-����������(Ȯ�ο�)

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

--�Խ��� �˻����(Ȯ�ο�)

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
        AND IB.INQUIR_TITLE LIKE '%�׽�Ʈ%' 
         AND IB.INQUIR_CONTENT LIKE '%�׽�Ʈ%' 
        ORDER BY IB.INQUIRY_NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;

--�� ���� �����!+(Ȯ�ο�)

SELECT  COUNT(*)
FROM INQUIRY_BOARD IB
INNER JOIN USER_T UT ON(IB.USER_NO = UT.USER_NO)
INNER JOIN CAMP_SITE CS ON(IB.CS_NO = CS.CS_NO)
WHERE 1=1
	AND UT.USER_ID LIKE '%dummy1%' 
    AND IB.INQUIR_TITLE LIKE '%�׽�Ʈ%' 
    AND IB.INQUIR_CONTENT LIKE '%�׽�Ʈ%' ;
--=========================================================
-------------------(���ǰԽ��Ǵ��) INREPLY ���� ���̺� ------------------
--------------------------DDL-------------------------------------
DROP TABLE INREPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_INR_NO;

--���
CREATE TABLE INREPLY(
    INR_NO NUMBER PRIMARY KEY ,                  --��۹�ȣ
    INR_CONTENT VARCHAR2(1000) ,                 --��۳���
    INR_REGIST DATE DEFAULT SYSDATE,             --��۵�ϳ�¥
    USER_NO   NUMBER,                               --����ۼ��ڹ�ȣ(Ŀ�´�Ƽ�Խ��� ���̺� �÷�)
    INQUIRY_NO NUMBER ,                          --����� �ۼ��ȰԽñ۹�ȣ(Ŀ�´�Ƽ�Խ��� ���̺� �÷�)
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,     --�ۼ��ڹ�ȣ �ܷ�Ű
    FOREIGN KEY (INQUIRY_NO) REFERENCES INQUIRY_BOARD        --���Ǳ۹�ȣ �ܷ�Ű
);

COMMENT ON COLUMN "INREPLY"."INR_NO" IS '��۹�ȣ';
COMMENT ON COLUMN "INREPLY"."INR_CONTENT" IS '��۳���';
COMMENT ON COLUMN "INREPLY"."INR_REGIST" IS '��۵�ϳ�¥';
COMMENT ON COLUMN "INREPLY"."USER_NO" IS '����ۼ��ڹ�ȣ';
COMMENT ON COLUMN "INREPLY"."INQUIRY_NO" IS '����ۼ��ȰԽñ۹�ȣ';

CREATE SEQUENCE SEQ_INR_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '���Ǵ亯�޾ƿ�', SYSDATE,1, 1);
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '���Ǵ亯�Դϴ�', SYSDATE,2, 2);
        INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, '���Ǵ亯', SYSDATE,1, 3);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, 'SQL���Ǳ۴亯�׽�Ʈ1', SYSDATE, 1, 4);
INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL, 'SQL���Ǳ۴亯�׽�Ʈ2', SYSDATE, 2, 5);
  
COMMIT;
SELECT * FROM INREPLY; 
  
--------------------------DML----------------------------
--  ����ڰ� �ۼ��� ��� ��ȸ(Ȯ�οϷ�)
--SELECT * FROM INREPLY WHERE USER_NO =?;

--��� �ۼ�(Ȯ�οϷ�)
--INSERT INTO INREPLY VALUES(SEQ_INR_NO.NEXTVAL,?, DEFAULT,?,?);

-- ��� ����(Ȯ�οϷ�)
--UPDATE INREPLY SET INR_CONTENT=? WHERE INR_NO=?;

-- ��� ����(Ȯ�οϷ�)
--DELETE INREPLY  WHERE INR_NO=?;
 
 -- �� �Խù��� �ش��ϴ� ��� ����Ʈ ��ȸ�� ������(Ȯ�οϷ�)
 /*
SELECT INR.INR_NO,INR.INR_CONTENT,INR.INR_REGIST, UT.USER_ID, INR.INQUIRY_NO
FROM INREPLY INR
INNER JOIN USER_T UT  ON(INR.USER_NO = UT.USER_NO)
WHERE  INR.INQUIRY_NO= ?
ORDER BY  INR.INR_NO DESC;
*/

--=========================================================
--------------- (Ŀ�´�Ƽ�Խ���)COMMU_BOARD ���� ���̺� ---------------
--------------------------DDL--------------------------------------
DROP TABLE COMMU_BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_COMMU_BOARD_CO_NO;

--Ŀ�´�Ƽ �Խ���
CREATE TABLE COMMU_BOARD(
    CO_NO NUMBER PRIMARY KEY NOT NULL,  --�Խñ۹�ȣ
    USER_NO   NUMBER,                 --�Խñ� �ۼ��ڹ�ȣ
    CO_TITLE  VARCHAR2(1000) NOT NULL,      --�Խñ� ����
    CO_CONTENT VARCHAR2(1000) NOT NULL,    --����
    CO_REGIST DATE DEFAULT SYSDATE,        --��ϳ�¥
    CO_HIT NUMBER DEFAULT 0,        --��ȸ��
    CONSTRAINT FK_BOARD_USER_NO FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL
);

COMMENT ON COLUMN COMMU_BOARD.CO_NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN COMMU_BOARD.USER_NO IS '�Խñ��ۼ��ڹ�ȣ';
COMMENT ON COLUMN COMMU_BOARD.CO_TITLE IS '�Խñ�����';
COMMENT ON COLUMN COMMU_BOARD.CO_CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN COMMU_BOARD.CO_REGIST IS '�Խñ۵�ϳ�¥';
COMMENT ON COLUMN COMMU_BOARD.CO_HIT IS '�Խñ���ȸ��';

--�Խñ� ��ȣ ����
CREATE SEQUENCE SEQ_COMMU_BOARD_CO_NO;

INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,1, 'ķ���忡�� ��� ���ְ� ���̴� ��� �ƽó���?','�ۿ��� ������ �ٸ��ִµ� Ȥ�� �� ���ְ� �Դ¹�� �ƽôº��� ��� �����ּ���!',SYSDATE, 1);
INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,2, 'ķ���忡�� ���׳��� �߾��µ� �� ��վ����','�Ҹ����� ������ ���ϰ� ����Ŭ�������ߴµ� �ʹ� ��վ����',SYSDATE, 1);

BEGIN
    FOR N IN 1..50
    LOOP
        INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,1, '�Խñ� ����'||SEQ_COMMU_BOARD_CO_NO.CURRVAL,'�Խñ� ����'||SEQ_COMMU_BOARD_CO_NO.CURRVAL,SYSDATE, 1 );
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

-- �� �Խñ� ����(Ȯ�οϷ�)
--SELECT COUNT(*) FROM COMMU_BOARD;

-- ��ȸ�� ����(Ȯ�οϷ�)
 --UPDATE COMMU_BOARD SET CO_HIT=3 WHERE CO_NO=1;

-- �Խñ� �ۼ�(Ȯ�οϷ�)
--INSERT INTO COMMU_BOARD VALUES(SEQ_COMMU_BOARD_CO_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT);

-- �Խñ� ����_����������(Ȯ�οϷ�)
-- UPDATE COMMU_BOARD SET CO_TITLE=?,CO_CONTENT='? WHERE CO_NO=?;

-- �Խñ� ����_����������(Ȯ�οϷ�)
-- DELETE COMMU_BOARD  WHERE CO_NO=?;

-- �Խñ� �� ��ȸ (Ȯ�οϷ�)
/*
SELECT  CB.CO_NO, UT.USER_ID, CB.CO_TITLE, CB.CO_CONTENT, CB.CO_REGIST, CB.CO_HIT
FROM COMMU_BOARD CB
JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
WHERE CB.CO_NO=1;
*/

--��� ��ȸ(����¡) ����(Ȯ�οϷ�)
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
--1��° ���� 10��° ���� ����

--���Խù���Ϻ���-����������(Ȯ�οϷ�)

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

--�Խ��� �˻����(Ȯ�οϷ�)
/*
SELECT RNUM, CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT  
FROM (
    SELECT ROWNUM AS RNUM,CO_NO,USER_ID, CO_TITLE,CO_CONTENT,CO_REGIST,CO_HIT  
    FROM (
        SELECT  CB.CO_NO,UT.USER_ID, CB.CO_TITLE,CB.CO_CONTENT,CB.CO_REGIST,CB.CO_HIT 
        FROM COMMU_BOARD CB JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO) 
        WHERE 1 = 1 
        --AND UT.USER_ID LIKE '%dummy1%' 
        --AND CB.CO_TITLE LIKE '%ķ��%' 
         AND CO_CONTENT LIKE '%����%' 
        ORDER BY  CB.CO_NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;
*/

--�� ���� �����!+(Ȯ�οϷ�)
/*
SELECT  COUNT(*)
FROM COMMU_BOARD CB
JOIN USER_T UT ON(CB.USER_NO = UT.USER_NO)
WHERE 1=1
	AND UT.USER_ID LIKE '%dummy1%' 
--	AND CB.CO_TITLE LIKE '%ķ��%' 
--	AND CO_CONTENT LIKE '%����%' ;
*/

--=========================================================
-------------------(Ŀ�´�Ƽ�Խ��Ǵ��) REPLY ���� ���̺� ------------------
--------------------------DDL-------------------------------------------------------
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_REP_NO;


--���
CREATE TABLE REPLY(
    REP_NO NUMBER PRIMARY KEY ,                  --��۹�ȣ
    REP_CONTENT VARCHAR2(1000) ,                 --��۳���
    REP_REGIST DATE DEFAULT SYSDATE,             --��۵�ϳ�¥
    USER_NO   NUMBER,                     --����ۼ��ڹ�ȣ(Ŀ�´�Ƽ�Խ��� ���̺� �÷�)
    CO_NO NUMBER ,                           --����� �ۼ��ȰԽñ۹�ȣ(Ŀ�´�Ƽ�Խ��� ���̺� �÷�)
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --�ۼ��ڹ�ȣ �ܷ�Ű
    FOREIGN KEY (CO_NO) REFERENCES COMMU_BOARD        --�Խù���ȣ �ܷ�Ű
);

COMMENT ON COLUMN "REPLY"."REP_NO" IS '��۹�ȣ';
COMMENT ON COLUMN "REPLY"."REP_CONTENT" IS '��۳���';
COMMENT ON COLUMN "REPLY"."REP_REGIST" IS '��۵�ϳ�¥';
COMMENT ON COLUMN "REPLY"."USER_NO" IS '����ۼ��ڹ�ȣ';
COMMENT ON COLUMN "REPLY"."CO_NO" IS '��� �ۼ��� �Խñ�';

CREATE SEQUENCE SEQ_REP_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '�亯�޾ƿ�~~~.', SYSDATE,1, 19);
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '�亯�̿�.', SYSDATE,2,  20);
        INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '��۳��ܿ�.', SYSDATE,1, 21);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '�亯����ϴ�1.', SYSDATE, 1, 18);
INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL, '�亯����ϴ�2.', SYSDATE, 2, 9);
  
COMMIT;
SELECT * FROM REPLY; 
  
--------------------------DML----------------------------
--  ����ڰ� �ۼ��� ��� ��ȸ(Ȯ�οϷ�)
--SELECT * FROM REPLY WHERE USER_NO = ?;

--��� �ۼ�(Ȯ�οϷ�)
--INSERT INTO REPLY VALUES(SEQ_REP_NO.NEXTVAL,?, DEFAULT,?, ?);

-- ��� ����(Ȯ�οϷ�)
--UPDATE REPLY SET REP_CONTENT=? WHERE REP_NO=?;

-- ��� ����(Ȯ�οϷ�)
--DELETE REPLY  WHERE REP_NO=?;
 
 -- �� �Խ��ǿ� �ش��ϴ� ��� ����Ʈ ��ȸ�� ������(Ȯ�οϷ�)
 /*
SELECT R.REP_NO, R.CO_NO,R.REP_CONTENT, UT.USER_ID, R.REP_REGIST
FROM REPLY R
JOIN USER_T UT  ON(R.USER_NO = UT.USER_NO)
WHERE  R.CO_NO= ?
ORDER BY R.REP_NO DESC;
*/
-- R.CO_NO= 20 ���� �׽�Ʈ�غ���

--=========================================================
-------------------(ķ���帮��) REVIEW ���� ���̺� ------------------
--------------------------DDL-------------------------------------
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_REV_NO;

--���
CREATE TABLE REVIEW(
    REV_NO NUMBER PRIMARY KEY ,              --�����ȣ
    REV_TITLE VARCHAR2(1000) ,               --��������
    REV_CONTENT  VARCHAR2(1000),             --���䳻��
    REV_REGIST DATE DEFAULT SYSDATE,         --�����ϳ�¥
    REV_IMAGE VARCHAR2(1000) ,               --�����̹���
    REV_STAR VARCHAR2(1000) ,                --���亰��
    USER_NO NUMBER ,                         --����ڹ�ȣ 
    CS_NO NUMBER ,                           --ķ�����ȣ
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --�ۼ��ڹ�ȣ �ܷ�Ű
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE  --ķ�����ȣ �ܷ�Ű
);

COMMENT ON COLUMN "REVIEW"."REV_NO" IS '�����ȣ';
COMMENT ON COLUMN "REVIEW"."REV_TITLE" IS '��������';
COMMENT ON COLUMN "REVIEW"."REV_CONTENT" IS '���䳻��';
COMMENT ON COLUMN "REVIEW"."REV_REGIST" IS '�����ϳ�¥';
COMMENT ON COLUMN "REVIEW"."REV_IMAGE" IS '�����̹���';
COMMENT ON COLUMN "REVIEW"."REV_STAR" IS '���亰��';
COMMENT ON COLUMN "REVIEW"."USER_NO" IS '����ڹ�ȣ';
COMMENT ON COLUMN "REVIEW"."CS_NO" IS 'ķ�����ȣ';

CREATE SEQUENCE SEQ_REV_NO;

BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '���� ����','ķ���� û���ϰ� �ʹ� ���Ҿ��', SYSDATE,'÷������3',5,1, 4);
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL,'����� ¯', 'ķ���� ���� �����մϴ�. ������� ģ���ؿ�', SYSDATE,'÷������3',5,2,  3);
        INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '�ʹ� ���ƿ�','�ڿ��̶� �������� �����ϰ� �ͼ� �ʹ� ���Ҿ��', SYSDATE,'÷������3',5,1,5);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '�ı�����1','�ı⳻���׽�Ʈ1', SYSDATE,'÷������3',5,1, 1);
INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL, '�ı�����2','�ı⳻���׽�Ʈ2', SYSDATE,'÷������3',5,1, 1);
  
COMMIT;
SELECT * FROM REVIEW; 

--------------------------DML----------------------------

--  ����ڰ� �ۼ��� ���� ��ȸ(Ȯ�οϷ�)
--SELECT * FROM REVIEW WHERE USER_NO = ?;

--���� �ۼ�(Ȯ�οϷ�)
--INSERT INTO REVIEW VALUES(SEQ_REV_NO.NEXTVAL,?,?, DEFAULT,?,?,?,?);

-- ���� ���� ����(Ȯ�οϷ�)
--UPDATE REVIEW SET REV_CONTENT=? WHERE REV_NO=?;

-- ���� ����(Ȯ�οϷ�)
--DELETE REVIEW  WHERE REV_NO=?;

-- �� ķ���忡 �ش��ϴ� ��� ����Ʈ ��ȸ�� ������( ��Ȯ�� )
/*
SELECT RV.REV_NO, RV.CS_NO,RV.REV_CONTENT, UT.USER_ID, RV.REV_REGIST,RV.REV_IMAGE,RV.REV_STAR
FROM REPLY RV
JOIN USER_T UT  ON(RV.USER_NO = UT.USER_NO)
WHERE  RV.CS_NO= ?
ORDER BY RV.REV_NO DESC;
*/

--=========================================================
-------------------(���ϱ�) LIKE_T ���� ���̺� ------------------
--------------------------DDL-------------------------------------
DROP TABLE LIKE_T CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_LIKE_NO;

CREATE TABLE LIKE_T(
    LIKE_NO NUMBER PRIMARY KEY ,              --���ȣ
    USER_NO NUMBER ,                            --����ڹ�ȣ
    CS_NO  NUMBER ,                          --ķ����NO
    FOREIGN KEY(USER_NO) REFERENCES  USER_T,  --�ۼ��ڹ�ȣ �ܷ�Ű
    FOREIGN KEY (CS_NO) REFERENCES CAMP_SITE  --ķ�����ȣ �ܷ�Ű
);

COMMENT ON COLUMN "LIKE_T"."LIKE_NO" IS '���ȣ';
COMMENT ON COLUMN "LIKE_T"."USER_NO" IS '����ڹ�ȣ';
COMMENT ON COLUMN "LIKE_T"."CS_NO" IS 'ķ����NO';

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

------------------------����������-����ķ����-DML----------------------------
--����ķ���� ��Ϻ���(Ȯ�οϷ�)
--SELECT * FROM LIKE_T WHERE USER_NO = ?;

--����ķ���� ��Ϻ���(���̵�� ��ȸ)-����������(Ȯ�οϷ�)

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

--����ķ���� �����ϱ�(Ȯ�οϷ�)
DELETE LIKE_T  WHERE LIKE_NO=1;

------------------------����������-���ຸ��-DML------------------------------
--RESERVATION
--�����Ϻ���(���̵����ȸ)(ķ����,�ο���,���,üũ��,üũ�ƿ�)

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

--����󼼺���(üũ��,üũ�ƿ�,�ο���,�ּ�,��ȭ��ȣ,Ȩ������,ķ�����̸�,��������,�̿���,�ΰ���,�����ݾ�)

--=========================================================
-----------------------------����-------------------------------------------------
DROP TABLE RESERVATION;
DROP SEQUENCE SEQ_RES_NO;

-- ������ ����
CREATE SEQUENCE SEQ_RES_NO
  START WITH 1 INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9999   
  CYCLE 
  NOCACHE;

-- �������̺� ����
CREATE TABLE RESERVATION (
	RESV_NO NUMBER	NOT NULL,
    USER_NO	NUMBER NOT NULL,
    CS_NO NUMBER NOT NULL,
	RESV_HEADCOUNT	NUMBER NOT NULL,
	RESV_PAY VARCHAR2(300) NOT NULL,
	RESV_CHECKIN DATE NOT NULL,
	RESV_CHECKOUT DATE NOT NULL
);
-- �������̺� ������ ����
INSERT INTO RESERVATION VALUES (1, 1, 1, 3, '300000',TO_DATE('2022.08.16', 'YYYY.MM.DD'), TO_DATE('2022.08.19', 'YYYY.MM.DD'));
-- Ŀ��
COMMIT;
-- �������̺� ��ü��ȸ
SELECT * FROM RESERVATION;
-----------------���� DML---------------------------------------------------------------
-- �����ϱ�
-- INSERT INTO RESERVATION VALUES (SEQ_RES_NO.NEXTVAL, ?, ?, ?, ?, ?, ?);
 
-- ���� ��ȸ�ϱ�
-- SELECT RESV_NO, USER_NO, CS_NO, RESV_HEADCOUNT, RESV_PAY, RESV_CHECKIN, RESV_CHECKOUT FROM RESERVATION;

-- ���� ����ȸ
-- SELECT RESV_CHECKIN, RESV_CHECKOUT, RESV_HEADCOUNT, CS_NAME, CS_ADDR1, CS_ADDR2, CS_TEL, CS_HOMEPAGE, CS_ACCOM_FEE
-- FROM RESERVATION R
-- LEFT JOIN CAMP_SITE CS ON (R.CS_NO=CS.CS_NO)
-- WHERE R.RESV_NO = ?;

-- ���� �����ϱ�
-- UPDATE RESERVATION SET CS_NO=?, RESV_HEADCOUNT=?, RESV_CHECKIN=?, RESV_CHECKOUT=?;

-- ���� �����ϱ�
-- DELETE FROM RESERVATION WHERE RESV_NO = ?;

--=========================================================
--------------- camp_site ���� ���̺� ---------------
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

-- SET DEFINE OFF; -- &�������� �̰� �����Ű�� �ؾ���

-- INSERT INTO camp_site VALUES (3068, '�����ڵ����߿���' , '���� ����� �����ϴ� ��ſ��� ������ ������ �����߿���'
, '�����걹������ ������ �� ��������� ���� �ִ� �����ڵ����߿����� �Ϲݾ߿����� 2007�⿡ �ڵ����߿���� �Ϲݾ߿����� 
ȥ�������� ���� ķ�����̴�. ��� �ü��� �̿��� �ɾ 2~3�� ���� ��ġ�ϰ� �־� ���ϸ�, ��� ���ǽü��� �����ϰ� ����������
�� �Ǿ� �ִ�. �߿��峻 �������� ���� ���õǾ� ������ �Ϲ�ķ���� 32���ҿ� ī��� ��� ����Ʈ 5����, ��ũ����Ʈ(��) 11����,
��ũ����Ʈ(��) 5���Ұ� �ִ�.    �����ڵ����߿����� �������� �߿����ӿ��� �ұ��ϰ� �޾縲 ���� �����Ⱑ���� ���̴�. 
�� �� ����Ʈ�� ��ũ�� ��������Ʈ ��� �������̺��� ��ġ�Ǿ� �־� ���̺��� ���� �غ����� �ʾƵ� �ȴ�. ����Ʈ ������ �帣�� ���
�� ���Ҹ��� ���� �� �ְ� ��ũ�� �ɾ� ���� ���̷� ���̴� ������ ������ �� �ִ� ���� ķ�����̴�. 
���ӻ���Ʈ �̿��ڵ��� ���Ǹ� ���� ����ī �� �밡 �غ�Ǿ� �ִ�. �ݵ�� ���� ������ �� �ڿ��� ���ڸ��� ������ �ξ�� ���� 
����� ���ϰ� �̿��� �� �ִ�. ������ ���� ������ ����ϱ� ������ �ļ��� ������ �ݵ�� ������ �Ѵ�. �������� ���ᰡ 
�ƴ� ����� ��ǰ� �־� ���� 1õ���� ���� �̿��� �����ϴ�. (�¼��� ������ �ʾ� �ü� ������ ����)' , '0', 'Y'
, '61-38-03639', '�', '','�ڵ����߿���,ī���','��,��,���', '��󳲵�','��û��','666921','��󳲵� ��û�� ����� ������',
'�� 106-2' , '127.8124104', '35.2967767', '055-972-7775', 'http://www.knps.or.kr/front/portal/visit/visitCourseMain.do?parkId=120100&parkNavGb=park_facView&vnewsId=186'
,'http://reservation.knps.or.kr', '', 0, 32, 16, 0, 0, 5, '�Ұ���','��� ������,��å��,�����ü��ü�'
,'����,�������ͳ�'
);

-- INSERT INTO camp_site VALUES (?, ? , ? , ? , ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
						+ ",?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? );
commit;

SELECT * FROM camp_site;

--=========================================================
------------------------------------���� �Ʒ� �κ����δ� ����������Ʈ�� ���� ���� ���� �Դϴ�.
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
    '������', 
    '010-1234-4341', 
    'admin@iei.or.kr', 
    '����� ������ ���ﵿ',
    NULL,
    DEFAULT,
    DEFAULT,
    DEFAULT
);

COMMIT;

SELECT * FROM MEMBER;
*/
------------------------------------------------
--------------- Board ���� ���̺� ---------------
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

COMMENT ON COLUMN BOARD.NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN BOARD.WRITER_NO IS '�Խñ��ۼ���';
COMMENT ON COLUMN BOARD.TITLE IS '�Խñ�����';
COMMENT ON COLUMN BOARD.CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN BOARD.TYPE IS '�Խñ� Ÿ��';
COMMENT ON COLUMN BOARD.ORIGINAL_FILENAME IS '÷�����Ͽ����̸�';
COMMENT ON COLUMN BOARD.RENAMED_FILENAME IS '÷�����Ϻ����̸�';
COMMENT ON COLUMN BOARD.READCOUNT IS '��ȸ��';
COMMENT ON COLUMN BOARD.STATUS IS '���°�(Y/N)';
COMMENT ON COLUMN BOARD.CREATE_DATE IS '�Խñۿø���¥';
COMMENT ON COLUMN BOARD.MODIFY_DATE IS '�Խñۼ�����¥';

DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO;

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '�Խñ� '||SEQ_BOARD_NO.CURRVAL , '�Խñ� �׽�Ʈ�Դϴ�.'||SEQ_BOARD_NO.CURRVAL, 'B'||SEQ_BOARD_NO.CURRVAL, null, null, DEFAULT, 'Y', SYSDATE, SYSDATE);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[�Ǹ�] ���� ��Ʈ�� �Ⱦƿ�.',  '��Ʈ�� �ƺ� �ֽ��Դϴ�. �����Ͻø� �ȵ˴ϴ�.', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[�Ǹ�] �Ｚ ��Ʈ�� �Ⱦƿ�.',  '�Ｚ ��Ʈ�� �˴ϴ�. ��ġ �˴ϴ�.', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[�Ǹ�] ������ �Ⱦƿ�.',  '������13 �˴ϴ�. ', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[�Ǹ�] ������ �Ⱦƿ�.',  '������ �ø�3 �˴ϴ�. ', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[����] ���� ��Ʈ�� ��ϴ�.',  '�ƺ� ���ӿ����� ��ϴ�. �̰� ���� �ߵ��ư�����?', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[����] �Ｚ ��Ʈ�� ��ϴ�.',  '�Ｚ ��Ʈ�� ��ϴ�. ������ �����Ϸ� ��ϴ�.', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[����] ������ ��ϴ�.',  '������3���. 30������ �װ��մϴ�. ', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 1, '[����] ������ ��ϴ�.',  '������ ��ϴ�. �ƹ� �����̳� ��������. ', 'B1', '�������ϸ�.txt', '��������ϸ�.txt', DEFAULT, 'Y', SYSDATE, SYSDATE);

COMMIT;
SELECT * FROM BOARD;
*/
--------------------------------------------------------------------
------------------------- REPLY ���� ���̺� -------------------------
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

COMMENT ON COLUMN "REPLY"."NO" IS '��۹�ȣ';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '������ۼ��ȰԽñ�';
COMMENT ON COLUMN "REPLY"."WRITER_NO" IS '����ۼ���';
COMMENT ON COLUMN "REPLY"."CONTENT" IS '��۳���';
COMMENT ON COLUMN "REPLY"."STATUS" IS '���°�(Y/N)';
COMMENT ON COLUMN "REPLY"."CREATE_DATE" IS '��ۿø���¥';
COMMENT ON COLUMN "REPLY"."MODIFY_DATE" IS '��ۼ�����¥';

INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, 51, 22, '�ȳ��ϼ���.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, 50, 1, '�ݰ����ϴ�.', DEFAULT, DEFAULT, DEFAULT);

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '�ȳ��ϼ���.', DEFAULT, DEFAULT, DEFAULT);
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '�ȳ��ϼ���.', DEFAULT, DEFAULT, DEFAULT);
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, N, 1, '�ȳ��ϼ���.', DEFAULT, DEFAULT, DEFAULT);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;

SELECT * FROM REPLY;
*/
--------------------------------DDL ��-------------------------------------------

-- MEMBER 

-- ��� ��ȸ
-- SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'

-- ��� �߰�
-- INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)

-- ��� ����               
-- UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?

-- ��� �н����� ����
-- UPDATE MEMBER SET PASSWORD=? WHERE NO=?

-- ��� ����
-- UPDATE MEMBER SET STATUS=? WHERE NO=?

-- BOARD DML

-- �� �Խñ� ����
-- SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'

-- ��ȸ�� ����
-- UPDATE BOARD SET READCOUNT=? WHERE NO=?

-- �Խñ� �ۼ�
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)

-- �Խñ� ����
-- UPDATE BOARD SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?

-- �Խñ� ����
-- UPDATE BOARD SET STATUS=? WHERE NO=?

-- �� ��ȸ
/*
SELECT  B.NO, B.TITLE, M.ID, B.READCOUNT, B.ORIGINAL_FILENAME, B.RENAMED_FILENAME, B.CONTENT, B.CREATE_DATE, B.MODIFY_DATE
FROM BOARD B
JOIN MEMBER M ON(B.WRITER_NO = M.NO)
WHERE B.STATUS = 'Y' AND B.NO=?
*/

/* 
��� ��ȸ(����¡) ����
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

-- �� �Խ��ǿ� �ش��ϴ� ��� ����Ʈ ��ȸ�� ������
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
        --	AND B.TITLE LIKE '%����%' 
        -- AND B.CONTENT LIKE '%������%' 
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
--	AND B.TITLE LIKE '%����%' 
	AND B.CONTENT LIKE '%������%' 
*/