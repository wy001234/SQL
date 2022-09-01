#날짜 : 2022/09/01
#이름 : 설우영
#내용 : SQL 연습문제 3

#실습 3-1
create database `java1_College`;
create user 'java1_admin3'@'%'identified by '1234';
grant all privileges on `java1_College`.*to 'java1_admin3'@'%';
flush privileges;

#실습 3-2
create table `Student`(
	`stdNo` varchar(8) not null primary key,
    `stdName` varchar(20) not null,
    `stdHp` varchar(13) not null,
    `stdYear` int not null,
    `stdAddress` varchar(100)
);

create table `Lecture`(
`lecNo` int not null primary key,
`lecName` varchar(20) not null,
`lecCredit` int not null,
`lecTime` int not null,
`lecClass` varchar(10)
);

create table `Register`(
`regStdNo` varchar(8) not null,
`regLecNo` int not null,
`regMidScore` int,
`regFinalScore` int,
`regTotalScore` int,
`regGrade` varchar(1)
);

#실습 3-3
insert into `Student`(`stdNo`,`stdName`,`stdHp`,`stdYear`) values('20201016','김유신','010-1234-1001',3);
insert into `Student` values('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `Student` values('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
insert into `Student` values('20210326','강감찬','010-1234-1004',2,'서울시 영동포구');
insert into `Student` values('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
insert into `Student` values('20220521','송상현','010-1234-1006',1,'부산시 동래');

insert into `Lecture` values('159','인지행동심리학','3',40,'본304');
insert into `Lecture` values('167','운영체제론','3',25,'본B04');
insert into `Lecture` values('234','중급 영문법','3',20,'본201');
insert into `Lecture` values('239','세법개론','3',40,'본204');
insert into `Lecture` values('248','빅데이터개론','3',20,'본B01');
insert into `Lecture` values('253','컴퓨팅사고와 코딩','2',10,'본B02');
insert into `Lecture` values('349','사회복지 마케팅','2',50,'본301');

insert into `Register`(`regStdNo`, `regLecNo`) values('20201126', 234);
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016',248);
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016',253);
insert into `Register`(`regStdNo`, `regLecNo`) values('20201126',239);
insert into `Register`(`regStdNo`, `regLecNo`) values('20210216',349);
insert into `Register`(`regStdNo`, `regLecNo`) values('20210326',349);
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016',167);
insert into `Register`(`regStdNo`, `regLecNo`) values('20220416',349);

#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdYear` = 3;

#실습 3-8
select * from `lecture` where `lecCredit` = 2;

#실습 3-9
update `register` set `regMidScore` = 36, `regFinalScore`= 42 WHERE 
`regStdNo`='20201126' AND `regLecNo`=234;
update `register` set `regMidScore` = 24, `regFinalScore`= 62 WHERE 
`regStdNo`='20201016' AND `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE 
`regStdNo`='20201016' AND `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore`= 57 WHERE 
`regStdNo`='20201126' AND `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE 
`regStdNo`='20210216' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE 
`regStdNo`='20210326' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE 
`regStdNo`='20201016' AND `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE 
`regStdNo`='20220416' AND `regLecNo`=349;

select * from `register`;

#실습 3-10
update `register` set `regTotalScore` = `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
			if(`regTotalScore` >= 80, 'B',
            if(`regTotalScore` >= 70, 'C',
            if(`regTotalScore` >= 60, 'D', 'F'))));
            
select * from `register`;

#실습 3-11
select * from `register` order by `regTotalScore` desc;

#실습 3-12
select * from `register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습 3-13
select * from `lecture` where `lecTime` >= 30;

#실습 3-14
select `lecName`,`lecClass` from `lecture`;

#실습 3-15
select `stdNo`, `stdName`  from `student`;

#실습 3-16
select * from `student` where `stdAddress` is null;

#실습 3-17
select * from `student` where `stdAddress` like '부산시%';

#실습 3-18
select * from `student` as a
left join `register` as b
on a.stdNo = b.regStdNo ;

#실습 3-19
select `stdNo`, `stdName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade` 
from `student` as a,
`register` as b
where a.stdNo = b.regStdNo;

#실습 3-20
select `stdName`, `stdNo`, `regLecNo` from `student` as a
join `register` as b
on a.stdNo = b.regstdNo where `regLecNo` = 349;

#실습 3-21

select `stdNo`, `stdName`,
count(`stdno`) as `수강신청건수`,
sum(`regTotalScore`) as `종합 점수`,
sum(`regTotalScore`)/ count(`stdNo`) as `평균` 
from `student` as a
join `register` as b
on a.stdNo= b.regStdNo group by `stdNo`;

#실습 3-22
select * from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

#실습 3-23
select 
`regStdNo` , `regLecNo`, `lecName`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

#실습 3-24
select 
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `register` as a
join `lecture` as b
on a.regLecNo =  b.lecNo where `regLecNo` = 349;


#실습 3-25
select `regStdNo`, `lecName` from `register` as a
join `lecture` as b
on a.regLecNo =  b.lecNo where `regGrade` = 'A';

#실습 3-26
select * from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo ;

#실습 3-27

select 
`stdNo`, `stdName`, `lecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
 from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo ;

#실습 3-28
select 
`stdNo`, `stdname`, `lecName`, `regTotalScore`, `regGrade`
from `student` as a
join `register` as b on a.stdNo =  b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo where `regGrade` ='f';

#실습 3-29
select 
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
 from `student` as a
join `register` as b on a.stdNo =  b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` != 'f'
group by `stdNo`;


#실습 3-30

select 
`stdNo`, `stdName`,
group_concat(`lecName`) as `신청과목`, #문자열을 연결해주는 함수
group_concat(if(`regtotalscore` >= 60, `lecName`, null)) as `이수과목` 
from `student` as a
join `register` as b on a.stdNo =  b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
group by `stdNo`;