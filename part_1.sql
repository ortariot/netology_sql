SELECT 1;

SELECT (SELECT 1);

SELECT * FROM actor;

SELECT actor_id, first_name, last_name FROM actor;

SELECT actor_id AS номер,
       first_name AS имя,
       last_name AS фамилия 
FROM actor;

SELECT actor_id AS номер,
       first_name AS имя,
       last_name AS фамилия 
FROM actor
ORDER BY first_name DESC, actor_id ASC;

SELECT actor_id AS номер,
       first_name AS имя,
       last_name AS фамилия 
FROM actor
LIMIT 5
OFFSET 10;

SELECT actor_id AS номер,
       first_name AS имя,
       last_name AS фамилия 
FROM actor
LIMIT 5, 5;


SELECT DISTINCT last_name FROM actor;
SELECT last_name FROM actor;


SELECT actor_id AS номер,
       first_name AS имя,
       last_name AS фамилия 
FROM actor
WHERE first_name = "ED" OR last_name = "DAVIS";

SELECT * FROM payment;

SELECT * FROM payment
WHERE amount > 2 AND amount <3 AND staff_id = 2;

SELECT * FROM payment
WHERE amount BETWEEN 2 AND 3;

SELECT payment_id, CAST(payment_date AS DATE) 
FROM payment;

SELECT payment_id, CAST(payment_date AS TIME) 
FROM payment;

-- part 2

SELECT 100.567;

SELECT ROUND(100.567);
SELECT ROUND(100.567, 1);

SELECT TRUNCATE(100.567, 0);

SELECT FLOOR(100.567);
SELECT CEIL(100.567);

SELECT ABS(-100.567);

SELECT payment_id, ROUND(amount), FLOOR(amount) * 2
FROM payment;

SELECT 2 + 2;
SELECT 2 - 2;
SELECT 2 * 2;
SELECT 2 / 2;

SELECT POWER(2, 10);
SELECT POWER(5, 2);
SELECT SQRT(25);
SELECT POWER(1024, 1/10);

SELECT POWER(8, 1/3);
SELECT POWER(16, 1/4);
SELECT POWER(32, 1/5);

SELECT 1024 DIV 100;

SELECT 1024 % 100;


SELECT GREATEST(1, 2, 3, 100, 8);

SELECT LEAST(1000, 2, 3, 100, 8);


SELECT RAND();

SELECT RAND() * 100 + 1;

-- part 3

SELECT first_name, last_name FROM actor;

SELECT CONCAT(first_name, last_name)
FROM actor;

SELECT CONCAT_WS("_", first_name, last_name, actor_id)
FROM actor;

SELECT CONCAT(first_name, "_", last_name, "--", actor_id)
FROM actor;

SELECT LENGTH(first_name),
       CHAR_LENGTH(first_name),
       first_name 
FROM actor;

SELECT LENGTH("hello"), CHAR_LENGTH("hello");

SELECT LENGTH("привет"), CHAR_LENGTH("привет");

SELECT POSITION("D" IN "AIDDITIONDDD");

SELECT last_name, SUBSTR(last_name, 2, 3), LEFT(last_name, 3), RIGHT(last_name, 3) 
FROM actor;



SELECT UPPER(LOWER(last_name))
FROM actor;

SELECT last_name,
       INSERT(last_name, 2, 3, "MAX"),
       REPLACE(last_name, "A", "F")
FROM actor;


SELECT TRIM("      aaaaaa      ");

SELECT SUBSTRING_INDEX("aaa | bbb | ccc |", "|", 3);


SELECT * FROM actor
WHERE first_name LIKE "__КСИ_";

-- part 4

SELECT NOW();

SELECT TIME(NOW());

SELECT DATE(NOW());

SELECT DATE_ADD(NOW(), INTERVAL 3 DAY);

SELECT DATE_ADD(NOW(), INTERVAL 3 MONTH);

SELECT DATE_SUB(NOW(), INTERVAL 3 MONTH);

SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());


SELECT EXTRACT(HOUR FROM NOW()), EXTRACT(DAY_SECOND FROM NOW());


SELECT DATEDIFF(return_date, rental_date),
       QUARTER(return_date)
FROM rental;


SELECT DATE_FORMAT(return_date, '%D : %a : %M - %Y'),
	   TIME_FORMAT(TIME(return_date), '%H-%i minutes %s')
return_date
FROM rental;




































