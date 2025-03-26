--회원관리
create table smember(
 num number not null,
 id varchar2(12) unique not null,
 name varchar2(30) not null,
 passwd varchar2(12) not null,
 email varchar2(50) not null,
 phone varchar2(15),
 reg_date date default sysdate not null,
 constraint smember_pk primary key (num) --PK 설정 정식표현
);
create sequence smember_seq;
-- num,id - not null 생략 가능