SELECT id, title, cost_per_night, AVG(rating) 
FROM properties 
WHERE rating>= 4 
ORDER BY cost_per_night ASC 
LIMIT 10;