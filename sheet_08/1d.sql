CREATE OR REPLACE FUNCTION rental_report_function(fromDate text, toDate text) 
RETURNS TABLE (
        category_name VARCHAR(100),
        mon bigint,
        tue bigint,
        wed bigint,
        thu bigint,
        fri bigint,
        sat bigint,
        sun bigint,
        total bigint
) AS $$
BEGIN 
    RETURN QUERY SELECT
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
		r.rental_date >= DATE(fromDate) and
		r.rental_date <= DATE(toDate)
	GROUP BY c.name
	ORDER BY c.name ASC;
END;
$$  LANGUAGE plpgsql