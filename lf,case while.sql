#if문
drop procedure if exists ifproc1;
DELIMITER \\
create procedure ifproc1()
begin
if 100=100 then
select '100은 100과 같습니다.';
end if;
end\\
DELIMITER ;
call ifproc1;

#if ~else문
drop procedure if exists ifproc2;
DELIMITER \\
create procedure ifproc2()
begin
declare myNum int;
set myNum = 200;
if myNum = 100 then
	select '100입니다.';
else
	select'100이 아닙니다.';
end if;
end\\
DELIMITER ;
call ifproc2();

select * from member;

DROP PROCEDURE IF EXISTS ifProc3; 
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE debutDate DATE; 
    DECLARE curDate DATE; 
    DECLARE days INT; 

    SELECT debut_date INTO debutDate 
       FROM market_db.member
       WHERE mem_id = 'APN';

    SET curDATE = CURRENT_DATE(); 
    SET days =  DATEDIFF(curDATE, debutDate); 

    IF (days/365) >= 5 THEN -- 5년이 지났다면
          SELECT CONCAT('데뷔한지 ', days, '일이나 지났습니다. 핑순이들 축하합니다!');
    ELSE
          SELECT '데뷔한지 ' + days + '일밖에 안되었네요. 핑순이들 화이팅~' ;
    END IF;
END $$
DELIMITER ;
CALL ifProc3();

#case문
DROP PROCEDURE IF EXISTS caseProc; 
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN 
    DECLARE point INT;
    DECLARE credit char(1); 
     set point =88;
     
     case 
     when point >= 90 then
		set credit = 'A';
     when point >= 80 then
		set credit = 'B';
     when point >= 70 then
		set credit = 'C';
     when point >= 60 then
		set credit = 'D';
     else
		set credit = 'F';
     
     end case;
     select concat('취득점수==>', point), concat('학점==>', credit);
end$$
DELIMITER ;
CALL caseProc();

SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
        CASE  
           WHEN (SUM(price*amount)  >= 1500) THEN '최우수고객'
           WHEN (SUM(price*amount)  >= 1000) THEN '우수고객'
           WHEN (SUM(price*amount) >= 1 ) THEN '일반고객'
           ELSE '유령고객'
        END "회원등급"
   FROM buy B
         RIGHT OUTER JOIN member M
         ON B.mem_id = M.mem_id
   GROUP BY M.mem_id
   ORDER BY SUM(price*amount) DESC ;
   
#while문
DROP PROCEDURE IF EXISTS whileProc; 
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
    DECLARE i INT; 
    DECLARE hap INT;
    SET i = 1;
    SET hap = 0;

    WHILE (i <= 100) DO
        SET hap = hap + i;  
        SET i = i + 1;     
    END WHILE;

    SELECT '1부터 100까지의 합 ==>', hap;   
END $$
DELIMITER ;
CALL whileProc();

DROP PROCEDURE IF EXISTS whileProc2; 
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT; 
    DECLARE hap INT; 
    SET i = 1;
    SET hap = 0;

    myWhile: 
    WHILE (i <= 100) DO  
       IF (i%4 = 0) THEN
         SET i = i + 1;     
         ITERATE myWhile; 
       END IF;
       SET hap = hap + i; 
       IF (hap > 1000) THEN 
         LEAVE myWhile; 
       END IF;
       SET i = i + 1;
    END WHILE;
        SELECT '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==>', hap; 
END $$
DELIMITER ;
CALL whileProc2();

#동정SQL
PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;


DROP TABLE IF EXISTS gate_table;
CREATE TABLE gate_table (id INT AUTO_INCREMENT PRIMARY KEY, entry_time DATETIME);

SET @curDate = CURRENT_TIMESTAMP();

PREPARE myQuery FROM 'INSERT INTO gate_table VALUES(NULL, ?)';
EXECUTE myQuery USING @curDate;
DEALLOCATE PREPARE myQuery;

SELECT * FROM gate_table;



