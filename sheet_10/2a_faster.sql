SELECT first_name, last_name, COUNT(DISTINCT film_id)
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE film_id NOT IN (SELECT film_id FROM film WHERE length < 120)
GROUP BY first_name, last_name
ORDER BY first_name, last_name;
