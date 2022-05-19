--작가 테이블 삭제
drop table author;
--작가 시퀀스 삭제
drop sequence seq_author_id;

--작가 테이블 생성
CREATE TABLE author(
    author_id number(10),
    author_name varchar2(500),
    author_desc varchar2(500),
    PRIMARY KEY(author_id)
);

--작가 시퀀스 생성
create sequence seq_author_id
increment by 1
start with 1
nocache;

--작가 데이터 추가
insert into author
values(seq_author_id.nextval, '김문열', '경북 양양');

insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values(seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval, '김영하', '알쓸신잡');

select *
from author;

-- 책 테이블삭제
drop table book;
-- 책 시퀀스 삭제
drop sequence seq_book_id;

--책 테이블생성
create table book(
    book_id number(10),
    title varchar2(500),
    pubs varchar2(500),
    pub_date date,
    author_id NUMBER(10),
    PRIMARY KEY(book_id),
    CONSTRAINT book_fk FOREIGN KEY (author_id)
    REFERENCES author(author_id)
);

--책 시퀀스 생성
create sequence seq_book_id
increment by 1
start with 1
nocache;

--책 데이터 추가
insert into book
values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values(seq_book_id.nextval, '삼국지', '민음사', '2022-03-01', 1);

insert into book
values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);

select *
from book;

--테이블 불러오기
select  book_id,
        title,
        pubs,
        to_char(pub_date, 'yyyy-mm-dd') pub_date,
        b.author_id author_id,
        author_name,
        author_desc
from book b, author a
where b.author_id = a.author_id;

--강풀 정보 변경
update author
set author_desc = '서울특별시'
where author_id = 5;

--기안 정보 삭제(오류)
DELETE FROM author
WHERE author_id = 4 ; 

--테이블 불러오기
select  book_id,
        title,
        pubs,
        to_char(pub_date, 'yyyy-mm-dd') pub_date,
        b.author_id author_id,
        author_name,
        author_desc
from book b, author a
where b.author_id = a.author_id;




