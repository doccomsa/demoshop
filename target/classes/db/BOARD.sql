CREATE SEQUENCE seq_board;

CREATE TABLE TBL_BOARD (
    BNO     NUMBER(10,0),       --일련번호
    TITLE   VARCHAR2(200)   NOT NULL,       -- 제목
    CONTENT VARCHAR2(2000)  NOT NULL,       -- 내용
    WRITER  VARCHAR2(50)    NOT NULL,       -- 작성자
    REGDATE DATE    DEFAULT SYSDATE,        -- 등록일자
    UPDATEDATE DATE DEFAULT SYSDATE        -- 수정일자
);

ALTER TABLE TBL_BOARD 
ADD CONSTRAINT PK_BOARD PRIMARY KEY(BNO);  -- primary key 제약조건이름으로 인덱스가 자동생성됨. 인덱스명 PK_BOARD


-- DUMMY 데이터추가작업
INSERT INTO TBL_BOARD(bno, title, content, writer)
VALUES(SEQ_BOARD.NEXTVAL, '제목 테스트', '내용 테스트', 'user00');


SELECT * FROM TBL_BOARD;

select * from tbl_board where bno > 0;
select bno, title, content, writer, regdate, updatedate from tbl_board where bno = 2;

-- 최신글 순서 화면출력
select bno, title, content, writer, regdate, updatedate from tbl_board order by bno desc;

COMMIT;

-- bno, title, content, writer, regdate, updatedate

-- 오름차순의 인덱스힌트
SELECT /*+ INDEX_ASC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
FROM TBL_BOARD;

-- 내림차순의 인덱스힌트
SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
FROM TBL_BOARD
WHERE ROWNUM <= 10;


-- 페이징
-- 선택 페이지번호, 게시물의 출력건수
/*
1   2   3   4   5
*/
-- ROWNUM : 조건식으로 사용할 경우에는 1 이 포함된 형태로 사용

-- 게시물의 건수를 10개씩 출력
--1)논리적인 문제가 발생
-- 페이지 1 의 쿼리
SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
FROM TBL_BOARD
WHERE ROWNUM >= 1 AND ROWNUM <=5;

-- 페이지 2 의 쿼리 : 논리적인 오류발생. 결과가 존재하지 않는다.
SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
FROM TBL_BOARD
WHERE ROWNUM >= 6 AND ROWNUM <= 10;


-- 대안.   인라인 뷰(FROM 절의 서브쿼리를 말함)
--2)문제가 없는 쿼리(정확한 쿼리)
-- 페이지 1 의 쿼리
SELECT bno, TITLE, CONTENT
FROM (
        SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
        FROM TBL_BOARD
)
WHERE RN >= 1 AND RN <= 5;

-- 페이지 2 의 쿼리
SELECT bno, TITLE, CONTENT
FROM (
        SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */  ROWNUM RN, bno, TITLE, CONTENT
        FROM TBL_BOARD
)
WHERE RN >= 6 AND RN <= 10;

-- 더미데이타 작업... 10회 미만 실행.
INSERT INTO TBL_BOARD (bno, TITLE, CONTENT, WRITER)
(SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM tbl_board);

commit;


/*
1   2   3   4   5

기본구문 : mybatis 문법
select 
bno, title, content, writer, regdate, updatedate
    from 
    (
    select /*+INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content, writer, regdate, updatedate 
    from 
    tbl_board -- 내림차순
    where rownum <= #{pageNum} * #{amount}
    )
where rn > (#{pageNum} -1) * #{amount} 
*/

/*
1   2   3   4   5
*/

-- pageNum = 1, amount = 5
select 
bno, title, content, writer, regdate, updatedate
    from 
    (
    select /*+INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content, writer, regdate, updatedate 
    from 
    tbl_board -- 내림차순
    where rownum <=  (1 * 5)  -- rownum <= 5
    )
where rn > ((1 -1) * 5) ;  -- rn > 0

-- pageNum = 2, amount = 5
select 
bno, title, content, writer, regdate, updatedate
    from 
    (
    select /*+INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content, writer, regdate, updatedate 
    from 
    tbl_board -- 내림차순
    where rownum <= (2 * 5)
    )
where rn > ((2 -1) * 5) ; -- rn > 5

-- pageNum = 3, amount = 5
select 
bno, title, content, writer, regdate, updatedate
    from 
    (
    select /*+INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content, writer, regdate, updatedate 
    from 
    tbl_board -- 내림차순
    where rownum <= (3 * 5)
    )
where rn > ((3 -1) * 5) ;  -- rn > 10




select 
bno, title, content, writer, regdate, updatedate
    from 
    (
    select /*+INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content, writer, regdate, updatedate 
    from 
    tbl_board -- 내림차순
    where rownum <= 1 * 10
    )
where rn > (1 -1) *10 ;

select count(*) from tbl_board;

--검색조건 사용
--1)제목검색
select count(*) from tbl_board where title like '%검색어%';
-- 2)작성자검색
select count(*) from tbl_board where writer like '%검색어%';
-- 3)내용검색
select count(*) from tbl_board where content like '%검색어%';
-- 4)제목+작성자 검색
select count(*) from tbl_board where title like '%검색어%' or writer like '%검색어%';
-- 5)제목+내용 검색
select count(*) from tbl_board where title like '%검색어%' or content like '%검색어%';
-- 6)제목+작성자+내용 검색
select count(*) from tbl_board 
where title like '%검색어%' or writer like '%검색어%' or content like '%검색어%';

CREATE TABLE TBL_REPLY (
    RNO     NUMBER(10,0),
    BNO     NUMBER(10,0) NOT NULL,
    REPLY   VARCHAR2(1000)  NOT NULL,
    REPLYER VARCHAR2(50)    NOT NULL,
    REPLYDATE   DATE    DEFAULT SYSDATE,
    UPDATEDATE  DATE    DEFAULT SYSDATE
);

CREATE SEQUENCE seq_reply;

ALTER TABLE TBL_REPLY
ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);

ALTER TABLE TBL_REPLY
ADD CONSTRAINT FK_REPLY_BOARD
FOREIGN KEY(BNO) REFERENCES TBL_BOARD(BNO);

-- rno, bno, reply, replyer


select * from tbl_reply where rownum <= 1 order by rno desc;







