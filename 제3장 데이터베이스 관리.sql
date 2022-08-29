#날짜 : 2022/08/24
#이름 : 설우영
#내용 : 제 3장 데이터베이스 관리


#실습 3 -1
create database `java1_Test_DB`; 
create user 'java1_test'@'%'identified by '1234';
grant all privileges on `java1_test_db`. * to 'java1_test'@'%';
flush privileges;

#실습 3 -2
set password for 'java1_test'@'%' = password('12345');
drop user 'java1_test'@'%';
flush privileges;

#실습 3 -3