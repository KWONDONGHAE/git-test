create table board(id number(10) primary key,
						name varchar2(20) not null,
						password varchar2(20),
						email varchar2(30),
						subject varchar2(30) not null,
						content clob not null,
						inputdate varchar2(50) not null,
						masterid number(10),
						readcount number(10),
						replynum number(10),
						step number(10)
						);
select * from board;
desc board;

select count(*) as totalcount from board;

drop table board;
select max(id) from  board;


