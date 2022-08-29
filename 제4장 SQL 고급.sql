#날짜 : 2022/08/24
#이름 : 설우영
#내용 : 제4장 SQL 고급


#실습 4-1
create table `member`(
    `uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp`	varchar(13) unique not null,
    `pos`	varchar(10) not null, 
    `dep` tinyint,
    `rdate` datetime not null
);

create table `Department`(
	`depNo` tinyint,
    `name` varchar(10) not null,
    `tel` char(12) not null
);
create table `sales` (
	`seq` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int not null
);

#실습 4-2
insert into `member` values('a101','박혁거세','010-1234-1001','부장',101,now());
insert into `member` values('a102','김유신','010-1234-1002','차장',101,now());
insert into `member` values('a103','김춘추','010-1234-1003','사원',101,now());
insert into `member` values('a104','장보고','010-1234-1004','대리',102,now());
insert into `member` values('a105','강감찬','010-1234-1005','과장',102,now());
insert into `member` values('a106','이성계','010-1234-1006','차장',103,now());
insert into `member` values('a107','정철','010-1234-1007','차장',103,now());
insert into `member` values('a108','이순신','010-1234-1008','부장',104,now());
insert into `member` values('a109','허군','010-1234-1009','부장',104,now());
insert into `member` values('a110','정약용','010-1234-1010','사원',105,now());
insert into `member` values('a111','박지원','010-1234-1011','사원',105,now());

insert into `Department` values(101,'영업1부','051-512-1001');
insert into `Department` values(101,'영업2부','051-512-1002');
insert into `Department` values(101,'영업3부','051-512-1003');
insert into `Department` values(101,'영업4부','051-512-1004');
insert into `Department` values(101,'영업5부','051-512-1005');
insert into `Department` values(101,'영업지원부','051-512-1006');
insert into `Department` values(101,'인사부','051-512-1007');

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 1, 98100);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a102', 2018, 1, 136000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a103', 2018, 1, 80100);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a104', 2018, 1, 78000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a105', 2018, 1, 93000);

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 23500);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a102', 2018, 2, 126000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a103', 2018, 2, 18500);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a105', 2018, 2, 19000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a116', 2018, 2, 53000);

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2019, 1, 24000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a102', 2019, 1, 109000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a103', 2019, 1, 101000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a104', 2019, 1, 53500);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a107', 2019, 1, 24000);

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a102', 2019, 2, 160000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a103', 2019, 2, 101000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a104', 2019, 2, 43000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a105', 2019, 2, 24000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a106', 2019, 2, 109000);

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a106', 2020, 1, 201000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a102', 2020, 1, 63000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a104', 2020, 1, 74000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a105', 2020, 1, 122000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a106', 2020, 1, 111000);

insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 120000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 93000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 84000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 180000);
insert into `sales` (`uid`, `year`,`month`, `sale`) values('a101', 2018, 2, 76000);

#실습 4-3
select * from `Member` where `name` <> '김춘추'; 
select * from `member` where `pos` = '차장' and dep = 101;
select * from `member` where `pos` = '차장' or dep = 101;
select * from `member` where `name` != '김춘추';
select * from `member` where `pos` in('사원','대리');
select * from `member` where `pos` = '사원' or `pos` = '대리';
select * from `member` where `name` like '%신';
select * from `member` where `name` like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '_성_';
select * from `member` where `name` like '정_';
select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` >= 50000 and `sale` < 100000 and `month` = 1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `year` in(2020);
select * from `sales` where `month` in(1,2);


#실습 4-4
select * from `sales` order by `sale` asc;
select * from `sales` order by `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc;
select * from `member` order by `rdate`asc;
select * from `sales` where `sale` > 50000 order by `sale` desc;
select * from `sales` where `sale` > 50000 order by `year`, `month`, `sale` desc;


#실습 4-5
select * from `sales` limit 3;
select * from `sales` limit 0,3;
select * from `sales` limit 1,2;
select * from `sales` limit 5,3;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales` where `sale` > 50000 order by `year` desc, `month`, `sale` desc limit 5;


#실습 4-6
select sum(`sale`) as '합계' from `sales`;


#실습 4-7
select sum(`sale`) as `2018년 1월 매출총합` from `Sales` where `year`=2018 and `month`=1;

#실습 4-8
select sum(`sale`)as `총합`, avg(`sale`) as `평균` from `sales` where `year` = 2019 and `month` = 2 and `sale` >= 50000;
#실습 4-9
select min(`sales`) as `최저`, max(`sale`) as `최고` from `sales` where `year` in(2020);

#실습4-10
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;
select `uid`, count(`seq`) as `건수` from `Sales` group by `uid`;
select `uid`, sum(`seq`) as `합계` from `Sales` group by `uid`;
select `uid`, avg(`seq`) as `평균` from `Sales` group by `uid`;

select 
	`uid`, 
    `year`,
    SUM(`sale`) as `합계`
from `Sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc
limit 3;

#실습4-11
select `uid`, sum(`sale`) as `합계`
from `Sales`
group by `uid`
having `합계` >= 200000;

SELECT `uid`, `year`, SUM(sale) AS `합계` FROM `Sales` WHERE `sale` >= 100000
GROUP BY `uid`, `year` 
HAVING `합계` >= 200000
ORDER BY `합계` DESC;

#실습4-12
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
update `Sales2` set `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
(select * from `Sales`) union (select * from `Sales2`);
SELECT `uid`, `year`, `sale` FROM `Sales`
UNION 
SELECT `uid`, `year`, `sale` FROM `Sales2`;

SELECT `uid`, `year`, SUM(`sale`) AS `합계` 
FROM `Sales` 
GROUP BY `uid`, `year` UNION
SELECT `uid`, `year`, SUM(`sale`) AS `합계` 
FROM `Sales2` 
GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;

#실습4-13
SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales`.uid = `Member`.uid;
SELECT * FROM `Member` INNER JOIN `Department` ON `Member`.dep = `Department`.depNo;
SELECT * FROM `Sales` AS a JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Member` AS a JOIN `Department` AS b ON a.dep = b.depNo;
SELECT * FROM `Sales` AS a, `Member` AS b WHERE a.uid = b.uid;
SELECT * FROM `Member` AS a, `Department` AS b WHERE a.dep = b.depNo;
SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
JOIN `Member` AS b ON a.`uid` = b.`uid`;

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
JOIN `Member` AS b USING (uid);

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
JOIN `Member` AS b ON a.`uid` = b.`uid`
WHERE `sale` >= 100000;

SELECT a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, SUM(`sale`) AS `합계` FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
GROUP BY a.`uid`, a.`year` HAVING `합계` >= 100000
ORDER BY a.`year` ASC, `합계` DESC;

SELECT * FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo
WHERE `sale` > 100000
ORDER BY `sale` DESC;

#실습4-14
SELECT * FROM `Sales` AS a LEFT JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Sales` AS a RIGHT JOIN `Member` AS b ON a.uid = b.uid;
SELECT a.seq, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
LEFT JOIN Member AS b USING(uid);

SELECT a.seq, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
RIGHT JOIN Member AS b USING(uid);

#실습4-15
select 
	a.`uid`,
    a.`name`,
    a.`pos`,
    b.`name`
from `Member` as a
join `department` as b
on a.dep = b.depNo;

#실습4-16
select 
	sum(`sale`) as `김유신 2019 매출합`
from `Sales` as a
join `Member` as b
on a.uid = b.uid
where `name` = '김유신' and `year`=2019;

#실습4-17
select 
	b.`name`,
    c.`name`,
    b.`pos`,
    a.`year`,    
	sum(`sale`) as `매출합` 
from `Sales` as a
join `Member` as b on a.uid = b.uid
join `Department` as c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `매출합` >= 100000
order by `매출합` desc;

