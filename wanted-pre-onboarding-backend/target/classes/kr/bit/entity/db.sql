-- tblBoard --
create table tblBoard(
	idx int not null,
	companyID varchar(50) not null,
	companyName varchar(50) not null,
	nation varchar(50) not null,
	region varchar(50) not null,
	position varchar(50) not null,
	reward varchar(50) not null,
	skill varchar(50) not null,
	content varchar(2000) not null,
	primary key(idx)
);

select * from tblBoard;

-- tblMember --
create table tblMember(
  memID varchar(50) not null, -- 회원ID
  memPwd varchar(50) not null, -- 회원비번
  memName varchar(50) not null, -- 회원이름
  primary key(memID)
);

-- tblCompany --
create table tblCompany(
	companyID varchar(50) not null,
	companyPwd varchar(50) not null,
	companyName varchar(50) not null,
	nation varchar(50) not null,
	region varchar(50) not null,
	primary key(companyID)	
);

-- applyList --
create table applyList(
	idx int not null,
	memID varchar(50) not null,
	primary key(idx)
);

drop table tblBoard;
drop table tblMember;
drop table tblCompany;

select * from applyList;
select * from tblMember;
select * from tblBoard;
select * from tblCompany;


insert into tblMember values('user', 'user', '사용자');	
insert into tblCompany values('ceo', 'ceo', '원티드', '한국', '서울');	