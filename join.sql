use market_db;

#내부조인 : 두테이블에 있는 조인이 되는것
select *
from buy
inner join member
on buy.mem_id = member.mem_id
where buy.mem_id = 'GRL';

select *
from buy
inner join member
on buy.mem_id = member.mem_id;

select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(phone1, phone2) as '연락처'
from buy B
inner join member M
on buy.mem_id = member.mem_id;

#외부조인 : 한쪽에만 있는 결과를 추출할때

select M.mem_id, M.mem_name, B.prod_name, M.addr
from member M
left outer join buy B
on M.mem_id = B.mem_id
order by M.mem_id;

select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B
right outer join member M
on M.mem_id = B.mem_id
order by M.mem_id;

#상호조인 테스트를 하기위해 대용량 데이터를 생성할때 , 랜덤 조인 
select *
from buy
cross join member;

select count(*)'데이터 개수'
from sakila.inventory
cross join world.city;

#자체조인 자신과 조인 

CREATE TABLE emp_table (emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

select A.emp '직원', B.emp "직속상관", B.phone "직속상관연락처"
from emp_table A
inner join emp_table B
on A.manager = B.emp
where A.emp = '경리부장';