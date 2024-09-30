DELIMITER &&
CREATE PROCEDURE emppro3(in peno int(5), in pename varchar(20),in page int(3),in pgender varchar(10), in psalary varchar(50), 
	in pworkmode varchar(10), in ppassport varchar(10), out excelr varchar(10))
	BEGIN
	insert into jdbcemployee (eno, ename, age, gender, salary, workmode, passport)
			values(peno, pename, page, pgender, psalary, pworkmode, ppassport);
            set excelr='inserted';
END &&
DELIMITER ;


