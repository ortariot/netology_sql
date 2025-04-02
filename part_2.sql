CREATE DATABASE part_2;

USE part_2;

CREATE TABLE fn (id INT, first_name VARCHAR(50));

CREATE TABLE ln (id INT, last_name VARCHAR(50));

TRUNCATE ln;

INSERT INTO fn (id, first_name)
VALUES (1, 'Maxim'), (2, 'Igor'), (5, 'Pavel'), (9, 'Marina'), (10, 'Irina'); 

INSERT INTO ln (id, last_name)
VALUES (1, 'Petrov'), (3, 'Ivanov'), (5, 'Makarov'), (8, 'Frolov'), (10, 'Kuznecova');

SELECT * FROM fn;
SELECT * FROM ln;

-- 
SELECT CONCAT_WS(" ", "номер", id), first_name 
FROM fn
WHERE id > 3
ORDER BY first_name DESC
LIMIT 1, 3;
-- 

-- inner join
SELECT f.id, f.first_name, l.last_name FROM fn f
JOIN ln l ON f.id = l.id;

-- left join
SELECT f.id, f.first_name, l.last_name FROM fn f
LEFT JOIN ln l ON f.id = l.id;


-- right join
SELECT l.id, f.first_name, l.last_name FROM fn f
RIGHT JOIN ln l ON f.id = l.id;


-- right join
SELECT first_name, last_name FROM fn
CROSS JOIN ln;


-- full join
SELECT l.id, f.first_name, l.last_name FROM fn f
LEFT JOIN ln l ON f.id = l.id
UNION
SELECT f.id, f.first_name, l.last_name FROM fn f
RIGHT JOIN ln l ON f.id = l.id;


-- UNION
SELECT id FROM fn

SELECT id FROM ln;


SELECT id FROM fn
UNION 
SELECT id FROM ln;


SELECT id FROM fn
UNION ALL
SELECT id FROM ln;


SELECT id FROM fn
EXCEPT
SELECT id FROM ln;

SELECT id FROM fn
  WHERE id NOT IN (SELECT id FROM ln);

SELECT id FROM ln
EXCEPT
SELECT id FROM fn;

-- agg

SELECT * FROM ln;

SELECT COUNT(*) FROM ln
WHERE id < 5;

SELECT MAX(id) FROM ln;

SELECT MIN(id) FROM ln;

SELECT AVG(id) FROM ln;

SELECT SUM(id) FROM ln;


CREATE TABLE sal (
  id INT,
  dep VARCHAR(50),
  prof VARCHAR(50), 
  sallary INT
);


INSERT INTO sal (id, dep, prof, sallary) VALUES
(1, 'ЦЕХ', 'Руководитель', 80000),
(2, 'ЦЕХ', 'Мастер', 60000),
(3, 'ЦЕХ', 'Инженер', 50000),
(4, 'ЦЕХ', 'Руководитель', 90000),
(5, 'ИТ', 'Руководитель', 120000),
(6, 'ИТ', 'Инженер', 100000),
(7, 'ИТ', 'Мастер', 70000);

SELECT * FROM sal;


SELECT max(sallary) FROM sal;


SELECT dep, AVG(sallary), prof FROM sal
GROUP BY dep, prof;

SELECT dep, AVG(sallary) AS avg_sal, prof FROM sal
WHERE prof != 'Руководитель'
GROUP BY dep, prof
HAVING avg_sal > 70000;


SELECT dep, AVG(sallary) AS avg_sal, prof FROM sal
GROUP BY dep, prof
HAVING avg_sal > 70000 AND avg_sal < 120000;

SELECT AVG(sallary) FROM sal;


-- CASE 

SELECT *, 
  CASE 
  	WHEN sallary > 80000 THEN "OK"
  	WHEN sallary <= 80000 THEN "Attntion"
  END AS analys
FROM sal;

SELECT *, 
  CASE 
  	WHEN sallary > 80000 THEN sallary
  	WHEN sallary <= 80000 THEN 80001 
  END AS new_sallary
FROM sal;

-- ifnull


SELECT l.id,
       IFNULL(f.first_name, "Unknown"),
       l.last_name FROM fn f
RIGHT JOIN ln l ON f.id = l.id;


-- COALESCE

SELECT COALESCE (NULL, NULL, 22, 4, NULL, 8);


SELECT l.id,
       COALESCE(f.first_name, l.last_name),
       l.last_name FROM fn f
RIGHT JOIN ln l ON f.id = l.id;




