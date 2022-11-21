SELECT COUNT(*)as returned_friday_13
	FROM rental
	WHERE extract(day from return_date)=13
		AND extract(dow from return_date)=5