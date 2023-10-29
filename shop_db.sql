CREATE SCHEMA `shop_db` ;

CREATE TABLE `shop_db`.`member` (
  `member_id` VARCHAR(8) NOT NULL,
  `mamber_name` VARCHAR(5) NOT NULL,
  `mamber_addr` VARCHAR(20) NULL,
  PRIMARY KEY (`member_id`));


CREATE TABLE `shop_db`.`product` (
  `product_name` VARCHAR(4) NOT NULL,
  `cost` INT NOT NULL,
  `make_date` DATE NULL,
  `company` VARCHAR(5) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`product_name`));
  
INSERT INTO `shop_db`.`member` (`member_id`, `mamber_name`, `mamber_addr`) VALUES ('tess', '나훈아', '경기 부천시 중동');
INSERT INTO `shop_db`.`member` (`member_id`, `mamber_name`, `mamber_addr`) VALUES ('hero', '임영웅', '서울 은평구 증산동');
INSERT INTO `shop_db`.`member` (`member_id`, `mamber_name`, `mamber_addr`) VALUES ('iyou', '아이유', '인천 남구 주안동');
INSERT INTO `shop_db`.`member` (`member_id`, `mamber_name`, `mamber_addr`) VALUES ('jpy', '박진영', '경기 고양시 장항동');
INSERT INTO `shop_db`.`member` (`member_id`, `mamber_name`, `mamber_addr`) VALUES ('carry', '머라이어', '미국 텍사스 사막');

INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('바나나', '1500', '2021-07-01', '델몬트', '17');
INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('카스', '2500', '2022-03-01', 'OB', '3');
INSERT INTO `shop_db`.`product` (`product_name`, `cost`, `make_date`, `company`, `amount`) VALUES ('삼각김밥', '800', '2023-09-01', 'CJ', '22');
