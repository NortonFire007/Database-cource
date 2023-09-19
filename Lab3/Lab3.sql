SELECT name
FROM cities
WHERE name LIKE '%ськ%';

SELECT name
FROM cities
WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') AS city_region
FROM cities
WHERE population > 100000
ORDER BY city_region ASC;

SELECT name, (population / 40000000 * 100) AS population_percentage
FROM cities
ORDER BY population DESC
LIMIT 50;

SELECT CONCAT(name, ' - ',(population / 40000000 * 100), '%') AS population_percentage
FROM cities
WHERE population / 40000000 * 100 >= 0.1
ORDER BY population_percentage DESC;