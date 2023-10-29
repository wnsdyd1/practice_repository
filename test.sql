use sakila;

SELECT *from actor;

SELECT first_name FROM actor;

SELECT first_name, 1, 'Hello', NuLL FROM actor;

SELECT * 
FROM actor
Where first_name = "NICK";

select *
From actor 
order by actor_id ASC;

select *
From actor 
order by actor_id DESC;

select *
from address
limit 10;

select *
from address
limit 10, 30;

select address_id as 주소번호, address as 주소, city_id as 도시번호
from address;

select address_id as 주소번호, address as 주소, city_id as 도시번호
from address
where city_id = 300
order by address_id Desc;


#TRUNCATE(N, n)	N을 소숫점 n자리까지 선택
SELECT 
    TRUNCATE(1234.5678, 1),
    TRUNCATE(1234.5678, 2),
    TRUNCATE(1234.5678, 3),
    TRUNCATE(1234.5678, - 1),
    TRUNCATE(1234.5678, - 2),
    TRUNCATE(1234.5678, - 3);

#UCASE, UPPER	모두 대문자로
#LCASE, LOWER	모두 소문자로  
SELECT
  UCASE(email),
  LCASE(first_name)
FROM Customer;

#CONCAT(...)	괄호 안의 내용 이어붙임
#CONCAT_WS(S, ...)	괄호 안의 내용 S로 이어붙임
SELECT CONCAT('HELLO', ' ', 'THIS IS ', 2021);
SELECT
  CONCAT_WS(' ', First_Name, Last_Name) AS FullName
FROM customer;


#SUBSTR, SUBSTRING	주어진 값에 따라 문자열 자름
#LEFT	왼쪽부터 N글자
#RIGHT	오른쪽부터 N글자
SELECT
  last_update,
  LEFT(last_update, 4) AS Year,
  SUBSTR(last_update, 6, 2) AS Month,
	SUBSTR(last_update, 9, 2) AS day,
    SUBSTR(last_update, 12, 2) AS hour,
    SUBSTR(last_update, 15, 2) AS minute,
  RIGHT(last_update, 2) AS second
FROM address;

#REPLACE(S, A, B)	S중 A를 B로 변경
select REPLACE(last_update, ':','-' )
from address;

#LENGTH	문자열의 바이트 길이
#CHAR_LENGTH, CHARACTER_LEGNTH	문자열의 문자 길이
SELECT
  LENGTH('안녕하세요'), 
  CHAR_LENGTH('안녕하세요'), 
  CHARACTER_LENGTH('안녕하세요'); 
  
  #비상관 서브쿼리
  select staff_id, first_name, last_name
  from staff
  where store_id = (select store_id from store where manager_staff_id = '1' );
  
  #상관 서브쿼리
  select city,(
  select country from country con
  where ci.country_id = con.country_id) as country
  from city ci;
  


  

  

