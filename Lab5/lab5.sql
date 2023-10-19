SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region;

SELECT r.name AS regions_name, SUM(c.population) AS total_population
FROM regions r, cities c
WHERE c.region = r.uuid
GROUP BY r.name;

SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10;

SELECT c.name AS city_name, c.population
FROM cities c, regions r
WHERE c.region = r.uuid AND r.area_quantity >= 5
ORDER BY c.population DESC
LIMIT 5 OFFSET 10;

SELECT r.name AS region_name, SUM(c.population) AS total_population
FROM regions r, cities c
WHERE c.region = r.uuid AND c.population > 300000
GROUP BY r.name;

SELECT c.name AS city_name, SUM(c.population) AS total_population
FROM regions r, cities c
WHERE c.region = r.uuid AND r.area_quantity <= 5 AND (c.population < 150000 OR c.population > 500000)
GROUP BY r.name;