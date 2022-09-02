# 날짜 : 2022/09/02
# 이름 : 설우영
# 내용 : SQL 연습문제 4

#실습 4-1
create database `java1_Bookstore`;
create user `java1_admin4`@'%' identified by '1234';
grant all privileges on `java1_BookStore`. * to 'java1_admin4'@'%';
flush privileges;

#실습 4-2
create table `Customer`(
`custId` int not null primary key,
`name` varchar(10) not null,
`address` varchar(20),
`phone` varchar(13)
);

create table `Book`(
`bookId` int not null primary key,
`bookName` varchar(30) not null,
`publisher` varchar(20) not null,
`price` int
); 

create table `Order`(
`orderId` int not null primary key,
`custId` int not null,
`bookId` int not null,
`salePrice` int not null,
`orderDate` datetime not null
);


#실습 4-3
insert into `Customer` values('1', '박지성','영국 멘체스타', '000-5000-0001');
insert into `Customer` values('2', '김연아','대한민국 서울', '000-6000-0001');
insert into `Customer` values('3', '장미란','대한민국 강원도', '000-7000-0001');
insert into `Customer` values('4', '추신수','미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`custId`, `name`, `address`) values('5', '박세리','대한민국 대전');

insert into `Book` values('1', '축구의 역사','굿스포츠', 7000);
insert into `Book` values('2', '축구아는 여자','나무수', 13000);
insert into `Book` values('3', '축구의 이해','대한미디어', 22000);
insert into `Book` values('4', '골프 바이블','대한미디어', 35000);
insert into `Book` values('5', '피겨 교본','굿스포츠', 8000);
insert into `Book` values('6', '역도 단계별기술','굿스포츠', 6000);
insert into `Book` values('7', '야구의 추억','이상미디어', 20000);
insert into `Book` values('8', '야구를 부탁해','이상미디어', 13000);
insert into `Book` values('9', '올림픽 이야기','삼성당', 7500);
insert into `Book` values('10', 'Olymic Champions','Pearson', 13000);

insert into `order` values(1, 1, 1, 6000,'2014-07-01');
insert into `order` values(2, 1, 3, 21000,'2014-07-03');
insert into `order` values(3, 2, 5, 8000,'2014-07-03');
insert into `order` values(4, 3, 6, 6000,'2014-07-04');
insert into `order` values(5, 4, 7, 20000,'2014-07-05');
insert into `order` values(6, 1, 2, 12000,'2014-07-07');
insert into `order` values(7, 4, 8, 13000,'2014-07-07');
insert into `order` values(8, 3, 10, 12000,'2014-07-08');
insert into `order` values(9, 2, 10, 7000,'2014-07-09');
insert into `order` values(10, 3, 8, 13000,'2014-07-10');


#실습 4-4
select `custId`, `name`, `address` from `customer`;

#실습 4-5
select `bookName`, `price` from `book`;

#실습 4-6
select `price`, `bookName` from `book`;

#실습 4-7
select * from `book`;

#실습 4-8
select `publisher` from `book`;


#실습 4-9
select distinct `publisher` from `book`;

#실습 4-10
select * from `book` where `price` >= 20000;

#실습 4-11
select * from `book` where `price` < 20000;

#실습 4-12
select * from `book` where 10000 <= `price`&& `price` <=20000;

#실습 4-13
select `bookId`, `bookName`, `price` from `book` where 15000<= `price` && `price` <= 30000;

#실습 4-14
select * from `book` where `bookId` = 2 ||`bookId` = 3 || `bookId` = 5;
select * from `book` where `bookid` in(2,3,5);

#실습 4-15
select * from `book` where mod(`bookId`,2) = 0 ;

#실습 4-16
select * from  `customer` where `name` like '박%';

#실습 4-17
select * from `customer` where `address` like '대한민국%';

#실습 4-18
select * from `customer` where `phone` is not null;

#실습 4-19
select * from `book` where `publisher` = '굿스포츠' || `publisher` = '대한미디어';

#실습 4-20
select `publisher` from `book` where `bookName` = '축구의 역사';
#실습 4-21

select `publisher` from `book` where `bookName` like '축구%';

#실습 4-22

select * from `book` where `bookName` like '_구%';

#실습 4-23
select * from `book` where `price` >= 20000 && `bookname `like '축구%';

#실습 4-24
select * from `book` order by `bookName` asc ;

#실습 4-25
select * from `book` order by `price` asc , `bookName` asc; 

#실습 4-26
select * from `book` order by `price` desc, `publisher` asc;

#실습 4-27
select * from `book` order by `price` desc limit 3;

#실습 4-28
select * from `book` order by `price` asc limit 3;

#실습 4-29
select sum(`salePrice`) as `총 판매랙` from `order`;

#실습 4-30
select 
sum(`salePrice`) as `총판매액` ,
avg(`saleprice`) as `평균값`,
min(`saleprice`) as `최저가`,
max(`saleprice`) as `최고가`
from `order`;

#실습 4 -31
select count(`orderId`) as `도서 판매 건수` from `order`;

#실습 4 -32
select `bookid`,
replace(`bookname`,`야구`,`농구`) as `bookname`, `publisher`
from `book`;

select * from `book`;

#실습 4 -33
select * from `order`;

#실습 4 -34
select * from `customer` as a
join `order` as b
on a.custId = b.custId;

#실습 4 -35
select * from `customer` as a
join `order` as b
on a.custId = b.custId order by `custId` desc;

#실습 4 -36
select `name`, `salePrice` from `customer` as a
join `order` as b
on a.custId = b.custId;

#실습 4 -37
select 
`name`,
sum(`salePrice`)
from `customer` as a
join `order` as b
on a.custId = b.custId
group by `name`
order by `name` ;

#실습 4 -38
select `name`, `bookName` from `customer` as a
join `order` as b
on a.custId = b.custId
join `book` as c
on b.bookId =  c.bookId;

#실습 4 -39
select `name`, `bookname` from `customer` as a
join `order` as b
on a.custId = b.custId
join `book` as c
on b.bookId =  c.bookId 
where `salePrice` = 20000;

#실습 4 -40
select `name`, `salePrice` from `customer` as a
left join `order` as b
on a.custId = b. custId;

#실습 4 -41
select `bookName` from `book` where `price` =(select max(`price`) from `book`);


#실습 4 -42
select `name` from `customer` where `custId` not in(select distinct `custId` from `order`);


#실습 4 -43
select 
sum(`salePrice`) as `총매출`
from `customer` as a
join `order` as b
on a.custId = b.custId
join `book` as c
on b.bookId =  c.bookId
where `name` = '김연아';

select sum(`salePrice`) as `총합` from `order` where `custId` =(select `custid` from `customer` where `name` ='김연아');

#실습 4 -44
update `book` set `bookid` = 11, `bookname` = '스포츠 의학' , `publisher` = '한솔의학서적', `price` = null; 


#실습 4 -45
update `customer`  set `address` = '대한민국 부산' where `custid` = 5;


#실습 4 -46
delete from `customer` where `custid` = 5;