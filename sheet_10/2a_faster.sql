WITH subquery AS (
  SELECT film_id FROM film WHERE length < 120
)
SELECT first_name, last_name, COUNT(DISTINCT film_id) as film_count
FROM film_actor
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE NOT EXISTS (SELECT 1 FROM subquery WHERE subquery.film_id = film_actor.film_id)
GROUP BY first_name, last_name
ORDER BY first_name, last_name;
