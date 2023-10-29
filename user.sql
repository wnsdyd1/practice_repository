CREATE TABLE `mydatabase`.`user` (
  `id` VARCHAR(10) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `passwordcheck` VARCHAR(25) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `birthdate` VARCHAR(10) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `phone` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  INSERT into mydatabase.user
  (id, password, passwordcheck, name, birthdate, email, phone)
  values
  ('asdf', 'as12', 'as12', '홍길동', '000428', 'nfare@naver.com', 01045218735),
  ('adae', 'aewq', 'aewq', '김철수', '980521', 'ahgda@naver.com', 01065721357),
  ('vsse', 'asdq', 'asdq', '아저씨', '750217', 'aqwez@naver.com', 01049875214),
  ('qwxz', '112', '112', '훈이', '041225', 'aassdfd@naver.com', 01078651367),
  ('adef', 'dsaf', 'dsaf', '유리', '781230', 'dfsaf@naver.com', 01095214624),
  ('aqwea', 'we12', 'we12', '아리', '001215', 'abdare@naver.com', 01045721655);
  
#테이블삭제
DROP TABLE mydatabase.user;

#테이블 초기화
TRUNCATE mydatabase.user;

#테이블 데이터 수정
UPDATE mydatabase.user
SET password = 'dska', passwordcheck = 'dska'
WHERE id = 'asdf';






 use mydatabase;
 
  select *
  from user;