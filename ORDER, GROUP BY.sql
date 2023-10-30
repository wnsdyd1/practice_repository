use market_db;

#order by절은 결과의 출력되는 순서 조절

select mem_id, mem_name, debut_date
from member
order by debut_date;

select mem_id, mem_name, debut_date
from member
order by debut_date Desc;

#키가 164보다크고 데뷔일은 내림차순
select mem_id, mem_name, debut_date
from member
where height >= 164
order by debut_date Desc;

#키순은 내림차순 데뷔일은 오른차순으로 정렬
select mem_id, mem_name, debut_date
from member
where height >= 164
order by height Desc,debut_date asc;

#데뷔일 빠른순으로 3번째까지
select  mem_name, debut_date
from member
order by debut_date
limit 3;


#키역순 3번째에서 2명까지
select  mem_name, debut_date
from member
order by height desc
limit 3, 2;

#중복 제거
select distinct addr from member;

#group by절은 그룹으로 묶어주는 역할

select mem_id, sum(amount) from buy group by mem_id;

select mem_id, sum(price*amount) 
from buy group by mem_id;

select mem_id, avg(amount) 
from buy group by mem_id;

select count(phone1)"연락처가 있는 회원" from member;

select mem_id "회원아이디", sum(price*amount)"총구매 금액"
from buy
group by mem_id 
having sum(price*amount) > 1000;

select mem_id "회원아이디", sum(price*amount)"총구매 금액"
from buy
group by mem_id 
having sum(price*amount) > 1000
order by sum(price*amount)desc;