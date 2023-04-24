-- 테이블(엔터티) 생성
-- 성적정보 저장 테이블

create table tbl_score (
    name varchar2(4) NOT NULL,
    kor number(3) not null check(kor > 0 and kor <= 100),
    eng number(3) not null check(eng >0 and eng <= 100),
    math number(3) not null check(math>0 and math <= 100),
    total number(3) null,
    average number(5,2),
    grade char(1),
    stu_num number(6),
    --pk 거는법
    constraint pk_stu_num
    primary key (stu_num)
);

-- 테이블 생성 후 PK 적용하기 : CONSTRAINT 앞에 ADD만 붙여주면 됨
ALTER TABLE TBL_SCORE
    ADD constraint pk_stu_num
    primary key (stu_num);

--컬럼 추가하기
ALTER TABLE TBL_SCORE
add (sci number(3) not null);

--컬럼 제거하기
ALTER TABLE TBL_SCORE
DROP COLUMN SCI;

--테이블 복사 (tb_emp)
--CTAS
create table TB_EMP_COPY
as select * from TB_EMP;

-- 복사 테이블 조회
SELECT * FROM tb_emp_copy;
select * from tb_emp;

-- drop table
DROP table TB_EMP_COPY;

--truncate table
-- 구조는 냅두고 내부데이터만 전체 삭제 // rollback 복구가 안됨
truncate table tb_emp_copy;

-- 예시 테이블
create table goods (
    id number(6) primary key,
    g_name varchar2(10) not null,
    price number(10) default 1000,
    reg_date date
);

select * from goods;

--insert
INSERT INTO GOODS
        (id,g_name,price,reg_date)
values (1, '선풍기', '120000', SYSDATE);

INSERT INTO GOODS
(id,g_name,reg_date)
values (2, '달고나',SYSDATE);

INSERT INTO GOODS
(id,g_name, price)
values (3, '후리',500);

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함

INSERT INTO GOODS
values (4, '세탁기', 1000, sysdate);

INSERT INTO GOODS
VALUES ();

select * from goods;

--수정 UPDATE
update goods
set g_name = '냉장고'
where id=3;

update goods
set g_name='콜라', price = 2500
where id=2;
-- 주의사항 where 절이 없으면 모든 것이 수정됨

--행을 삭제하는 delete : delete from  사이에 아무것도 넣으면 안됨 : 행이 싹 날라감
Delete from goods
where id = 3;

-- 모든 행 삭제
DELETE from goods;

-- select 조회
SELECT CERTI_CD,
       CERTI_NM,
       ISSUE_INSTI_NM
    FROM TB_CERTI;

SELECT CERTI_NM,
       ISSUE_INSTI_NM,
        CERTI_CD
FROM TB_CERTI;

-- 중복 제거 키워드 : distinct / all 은 중복제거 하지 않은 거임 : 생략 가능
select distinct ISSUE_INSTI_NM
FROM TB_CERTI;

-- 모든 컬럼 조회 // 실무에서는 사용하지 말것
select * from TB_CERTI;

-- 열에 별칭 부여 (ALIAS) : 엑셀 뽑듯이 뽑을 때~! AS는 생략 가능
SELECT
    te.EMP_NM AS "사원이름",
      te.ADDR AS "사원의 거주지 주소"
FROM TB_EMP te; --별칭 te 설정하기

-- 문자열 연결하기 : 하나의 열만 조회 하기
select
    CERTI_NM || '(' || ISSUE_INSTI_NM || ')' as "자격증정보"
    from TB_CERTI;




