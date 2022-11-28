SELECT
		c.name AS "category_name",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 1) AS "mon",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 2) AS "tue",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 3) AS "wed",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 4) AS "thu",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 5) AS "fri",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 6) AS "sat",
		COUNT(*) FILTER (WHERE EXTRACT(dow FROM r.rental_date) = 0) AS "sun",
		COUNT(*) total
	FROM rental AS r
	JOIN  inventory as i ON i.inventory_id=r.inventory_id
	JOIN  film_category AS fc ON fc.film_id = i.film_id
	JOIN  category AS c ON c.category_id = fc.category_id
	WHERE
		r.rental_date >= '2005.06.01' and
		r.rental_date <= '2005.06.30'
	GROUP BY c.name
	ORDER BY c.name ASC