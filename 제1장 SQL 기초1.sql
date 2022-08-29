# 날짜 : 2022/08/22
# 이름 : 설우영
# 내용 : 제1장 SQL 기초


#실습 1-1
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습 1-2
CREATE TABLE `User1` (
	`uid`  varchar(10),
    `name` VARCHAR(10),
    `hp`  CHAR(13),
    `age` INT

);

DROP TABLE `User1`;

#실습 1-3
INSERT INTO `User1` VALUES('A101','김유신','010-1234-1111',25);
INSERT INTO `User1` VALUES('A102','김춘추','010-1234-2222',23);
INSERT INTO `User1` VALUES('A103','장보고','010-1234-3333',32);
INSERT INTO `User1` (`uid`,`name`,`age`) VALUES ('A104','강감찬',45);
INSERT INTO `User1` SET `uid` = 'A105', `name` = '이순신', `hp` = '010-1234-5555';


#실습 1-4
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT`uid`,`name`,`age` FROM `User1`;
#실습 1-5
UPDATE `User1` SET`hp` = '010-1234-4444' WHERE `uid`= 'A104';
UPDATE `User1` SET `age`=51 WHERE `uid` = 'A105';
UPDATE `User1` SET `hp` = '010-1234-1001', `age` = 27  WHERE `uid`='A101';

#실습 1-6
DELETE from `user1` where `uid` = 'A101';
delete from `User1` where `uid` = 'A102' and `age` = 25;
delete from `User1` where `age` >= 30;
#실습 1-7
create table `TblUSer`(
	`userId` varchar(10),
    `userName` varchar(10),
    `userHp` char(13),
    `userAge` tinyint,
    `userAddr` varchar(20)
);

create table `TblProduct`(
	`prdCode` int,
    `prdName` varchar(10),
    `prdPrice` int,
    `prdAmount` int,
    `prdCompany` varchar(10),
    `prdMakeDate` date
);

#실습 1-8
insert into `tbluser` values('p101','김유신','010-1234-1001','25','서울시 중구');
insert into `tbluser` values('p102','김춘추','010-1234-1002','23','부산시 금정구');
insert into `tbluser` set `userId` = 'P103', `userName` = '장보고', `userAge` = 31 , `userAddr` = '경기도 광주군';
insert into `tbluser` set `userId` = 'P104', `userName` = '강감찬', `userAddr` = '경남 창원시';
insert into `tbluser` set `userId`='p105', `userName` = '이순신', `userAge` = 50 ;

insert into `TblProduct` values(1,'냉장고',800,10,'LG' ,now());
insert into `tblproduct` values(2,'노트북',1200,20,'삼성',now());
insert into `tblproduct` values(3,'TV',1400,6,'LG',now());
insert into `tblproduct` values(4,'세탁기',1000,8,'LG',now());
insert into `tblproduct` set `prdCode` = 5, `prdName` = '컴퓨터', `prdPrice` = 1100;
insert into `tblproduct` set `prdCode` = 6, `prdName` = '휴대폰', `prdPrice` = 900, `prdAmount` = 102, `prdCompany` = '삼성', `prdMakeDate` = now(); 

update `tbluser` set `userHp` = '010-1234-1005' where `userId` = 'p105';
update `tblproduct` set `prdAmount` = 0 where `prdCode` = 5;
#실습 1-9

select * from `tbluser`;
select `userName` from `tbluser`;
select `userName`, `userHp` from `tbluser`;
select * from `tbluser` where `userId` = 'p102';
select * from `tbluser` where `userId` = 'p104' or `userId` = 'p105';
select * from `tbluser` where `userAddr` = '신라';
select * from `tbluser` where `userAge` > 30;
select * from `tbluser` where `userHp` is null;
update `tbluser` set `userAge` = 42 where `userId` = 'p104';
update `tbluser` set `userAddr` = '경남 김해시' where `userId` = 'p105';
delete from `tbluser` where `userId` = 'p103';

select * from `tblproduct`;


#연습문제



