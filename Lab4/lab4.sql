SELECT UPPER(name) AS name_upcase
FROM cities
ORDER BY name ASC
LIMIT 5 OFFSET 5;

SELECT name, FLOOR(LENGTH(name) / 2) AS name_length
FROM cities
WHERE FLOOR(LENGTH(name) / 2) NOT IN (8, 9, 10);

SELECT region, SUM(population) AS total_population
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region
ORDER BY region ASC;

SELECT FlOOR(AVG(population)) AS average_population
FROM cities
WHERE region = 'W'
ORDER BY name ASC;

SELECT COUNT(*) AS E_city_count
FROM cities
WHERE region = 'E'
ORDER BY name ASC;
