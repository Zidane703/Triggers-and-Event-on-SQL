-- TRIGGERS 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
	BEFORE INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (19, 'Lalu', 'Zidane', 'Creative Worker', 100000000, null);

-- EVENT
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE EVENT delete_retires_three
ON SCHEDULE EVERY 2 SECOND
DO
BEGIN
    DELETE 
    FROM employee_demographics
    WHERE age > 50;
END $$
DELIMITER ;

SHOW EVENTS;

SELECT *
FROM employee_demographics;

SHOW variables like 'EVENT%';






