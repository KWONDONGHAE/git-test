create table tbl_product(p_code char(4) not null primary key,
								p_name Varchar2(20),
								p_size Varchar2(40),
								p_type Varchar2(20),
								p_price Number(7));

insert into tbl_product values('A001','A-1형소형박스','100 x 110 x 50','A골판지','5000');
insert into tbl_product values('A002','A-2형소형박스','100 x 110 x 70','A골판지','6000');
insert into tbl_product values('A003','A-3형소형박스','100 x 110 x 100','A골판지','7000');
insert into tbl_product values('B001','B-1형중형박스','150 x 130 x 50','B골판지','10000');
insert into tbl_product values('B002','B-2형중형박스','150 x 130 x 70','B골판지','11000');
insert into tbl_product values('B003','B-3형중형박스','150 x 130 x 100','B골판지','13000');
insert into tbl_product values('C001','C-1형대형박스','180 x 150 x 50','C골판지','15000');
insert into tbl_product values('C002','C-2형대형박스','180 x 150 x 70','C골판지','17000');
insert into tbl_product values('C003','C-3형대형박스','180 x 150 x 100','C골판지','20000');
								
select * from TBL_PRODUCT;

create table tbl_worklist(w_workno char(8) not null primary key,
								p_code char(4),
								w_quantity number(5),
								w_workdate date
								);
								
insert into tbl_worklist values('20190001','A001','100','19/11/01');								
insert into tbl_worklist values('20190002','A002','150','19/11/01');
insert into tbl_worklist values('20190003','A003','200','19/11/01');
insert into tbl_worklist values('20190004','B001','250','19/11/02');
insert into tbl_worklist values('20190005','B002','100','19/11/02');
insert into tbl_worklist values('20190006','B003','150','19/11/02');
insert into tbl_worklist values('20190007','A001','100','19/11/03');
insert into tbl_worklist values('20190008','A002','150','19/11/03');
insert into tbl_worklist values('20190009','A003','200','19/11/03');
																
select * from tbl_worklist;

create table tbl_process(w_workno char(8) not null primary key,
								p_p1 char(1),
								p_p2 char(1),
								p_p3 char(1),
								p_p4 char(1),
								p_p5 char(1),
								p_p6 char(1),
								w_lastdate char(8),
								w_lasttime char(4));


insert into tbl_process values('20190001','Y','Y','Y','Y','Y','Y','20191001','0930');
insert into tbl_process values('20190002','Y','Y','Y','Y','Y','Y','20191001','1030');
insert into tbl_process values('20190003','Y','Y','Y','Y','Y','Y','20191001','1130');
insert into tbl_process values('20190004','Y','Y','Y','Y','Y','N','20191002','1330');
insert into tbl_process values('20190005','Y','Y','Y','Y','Y','N','20191002','1430');
insert into tbl_process values('20190006','Y','Y','Y','Y','Y','N','20191002','1530');
insert into tbl_process values('20190007','Y','Y','Y','Y','N','N','20191003','1630');
insert into tbl_process values('20190008','Y','Y','Y','Y','N','N','20191003','1730');
								
select * from tbl_process;

select substr(w_workno,0,4)||'-'||substr(w_workno,5,4) as w_workno from TBL_WORKLIST;

select ascii('-')  from dual

select to_char(w_workno,'9999-9999') as w_workno, w.p_code, p.p_name,p.p_size,p.p_type,w.w_quantity, 
to_char(w_workdate, 'YYYY-MM-DD')as w_workdate from tbl_worklist w join  tbl_product p on p.p_code=w.p_code;

select substr(w.w_workno,0,4)||'-'||substr(w.w_workno,5,4) as w_workno, p.p_code, p.p_name,
		decode(p_p1,'Y','완료','N','~') as p_p1,decode(p_p2,'Y','완료','N','~') as p_p2,decode(p_p3,'Y','완료','N','~') as p_p3,
		decode(p_p4,'Y','완료','N','~') as p_p4,decode(p_p5,'Y','완료','N','~') as p_p5,decode(p_p6,'Y','완료','N','~') as p_p6,
		substr(r.w_lastdate,0,4)||'-'||substr(r.w_lastdate,5,2)||'-'||substr(r.w_lastdate,7,2) as w_lastdate,
		substr(r.w_lasttime,0,2)||':'||substr(r.w_lasttime,3,2) as w_lasttime from tbl_product p join tbl_worklist w on (p.p_code=w.p_code) join tbl_process r
		on w.w_workno = r.w_workno ;

delete TBL_PROCESS where w_workno = 20200020;

