use market_db;

create table hongong(
toy_id int auto_increment primary key,
toy_name char(4),
age int);

insert into hongong values (Null, '보핍', 25);
insert into hongong values (Null, '슬링키', 22);
insert into hongong values (Null, '렉스', 21);

select * from hongong;

select last_insert_id();

#자동 숫자 입력 100부터
alter table hongong auto_increment=100;
insert into hongong values (Null, '재남', 35);
select * from hongong;

create table hongong2(
toy_id int auto_increment primary key,
toy_name char(4),
age int);
alter table hongong2 auto_increment=1000;
#auto_increment의 몇번쨰 뛰어넘을수있게 설정
set @@auto_increment_increment=3;

insert into hongong2 values (Null, '토마스', 20);
insert into hongong2 values (Null, '제임스', 23);
insert into hongong2 values (Null, '고든', 25);

select * from hongong2;

create table city_popul (city_name char(35),population int);

#select문을 같이 사용하여 다른 테이블에 있는 데이터를 가져올수있다
insert into city_popul
select Name, population from world.city;

select * from city_popul;

update city_popul
set city_name='서울'
where city_name='seoul';

select * from city_popul where city_name='서울';

update city_popul
set population = population/10000;
select * from city_popul limit 5;

delete from city_popul
where city_name like 'New%';
