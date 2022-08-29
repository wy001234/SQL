# 날짜 : 2022/08/29
# 이름 : 설우영
# 내용 : SQL 연습문제1

#실습 1-1
create database `java1_Shop`;
create user 'java1_admin1'@'%' identified by '1234';
grant all privileges on `java1_Shop`. * to 'java1_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
`custId` varchar(10) not null primary key,
`name` varchar(10) not null,
`hp` varchar(13) ,
`addr`varchar(100),
`rdate` datetime not null
);


create table `Product`(
`prodNo` int not null primary key,
`prodName` varchar(10) not null,
`stock` int not null,
`price` int,
`company` varchar(20) not null
);

create table `Order`(
`orderNo` int not null primary key,
`orderId` varchar(10) not null,
`orderProduct` int not null,
`orderCount` int not  null,
`orderDate` datetime not null
);
#실습 1-3
insert into `Customer` values('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `Customer` values('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `Customer` values('c103','장보고','010-1234-1003','완도군 정산면','2022-01-03');
insert into `Customer` values('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `Customer`(`custId`, `name`,`rdate`) values('c105','이성계','2022-01-05');
insert into `Customer` values('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `Customer`(`custId`, `name`,`rdate`) values('c107','허준','2022-01-07');
insert into `Customer` values('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `Customer` values('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `Customer` values('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `Product` values(1, '새우깡', 5000, 1500, '농심');
insert into `Product` values(2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values(3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values(4, '양파링', 1250, 1800, '농심');
insert into `Product` (`prodNo`,`prodName`, `stock`,`company`) values(5, '죠리퐁', 2200, '농심');
insert into `Product` values(6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `Order` values(1,'c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` values(2,'c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` values(3,'c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` values(4,'c109', 6, 6, '2022-07-02 10:46:36');
insert into `Order` values(5,'c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` values(6,'c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` values(7,'c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` values(8,'c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` values(9,'c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` values(10,'c107', 6, 1, '2022-07-05 14:21:03');


#실습 1-4
select * from  `Customer`;

#실습 1-5
select  `custId`, `name`, `hp`   from  `Customer`;

#실습 1-6
select *  from `Product`;

#실습 1-7

select `company` from `product`;

#실습 1-8
select distinct `company` from `product`; 
# 중복없이 제거

#실습 1-9
select `prodName`, `price` from `product`;

#실습 1-10
 SELECT `prodName`, `price` + 500 AS `조정단가` FROM `Product`;

#실습 1-11
select `prodName`,  `stock`, `price` from `product` where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`,`orderDate` from `order` where `orderId` = 'c102';
#실습 1-13
select `orderProduct`, `orderCount`,`orderDate` from `order` where `orderId` = 'c102' && `orderCount` >= 2;
#실습 1-14
select * from `product` where  1000 <= `price` <= 2000; 
#실습 1-15
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '김%';
#실습 1-16
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '__';
#실습 1-17
SELECT * FROM `customer` WHERE `hp` is null;
#휴대폰 번호가없는 사람 조회

#실습 1-18
SELECT * FROM `customer` WHERE `addr` is not null;

#실습 1-19
SELECT * FROM `customer`  order by `rdate` desc;

#실습 1-20
select * from `order` where `orderCount` >= 3 order by `orderCount` desc, `orderproduct` asc;

#실습 1-21
select avg(price) from `product`;
#실습 1-22
select sum(`stock`) as `재고량 합계` from `product` where `company` = '농심';
#실습 1-23
select count(`custId`) as `고객 수` from `customer`;
#실습 1-24
select count(distinct `company`) as `제조업체 수` from `product`;

#실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문 수량` from `order` group by `orderProduct`;
#실습 1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `product` group by `company`;
#실습 1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가`from `product` GROUP BY `company` HAVING `제품수` >= 2;
#실습 1-28
select `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문 수량` from `order` group by `orderProduct`, `orderId`;

#실습 1-29
select `orderId`,`prodName` from `order` as a 
join `product` as b
on a.`orderProduct` = b.`prodNo`
where `orderid` = 'c102';

#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE SUBSTR(`orderDate`, 1, 10) = '2022-07-03'

