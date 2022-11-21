SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name, CONCAT(s.first_name,' ',s.last_name) AS staff_name, SUM(p.amount) AS total_amount
	FROM payment AS p
	JOIN staff AS s ON s.staff_id=p.staff_id
	JOIN customer AS c ON c.customer_id=p.customer_id
	GROUP BY customer_name, staff_name
	ORDER BY total_amount DESC
	LIMIT 1
