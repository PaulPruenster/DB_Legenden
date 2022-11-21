select count(distinct film.rating) as different_ratings
	from film where 'Deleted Scenes' = ANY(film.special_features) 