SELECT DISTINCT c.email
	FROM rental AS r
	JOIN staff AS s ON s.staff_id=r.staff_id
	JOIN customer AS c ON c.customer_id=r.customer_id
	
	JOIN address AS a1 ON a1.address_id=s.address_id
	JOIN city AS city1 ON city1.city_id=a1.city_id
	JOIN country AS country1 ON city1.country_id=country1.country_id

	JOIN address AS a2 ON a2.address_id=c.address_id
	JOIN city AS city2 ON city2.city_id=a2.city_id
	JOIN country AS country2 ON city2.country_id=country2.country_id

	WHERE country1.country_id=country2.country_id
	ORDER BY email