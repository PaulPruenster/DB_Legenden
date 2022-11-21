select title, c.name as category
from film 
	join film_category on film.film_id = film_category.film_id
	join category c on film_category.category_id = c.category_id 
		and (c.name = 'Documentary' or c.name = 'Comedy') 
where replacement_cost < 10.00
order by title, c.name