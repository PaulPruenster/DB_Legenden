select category.name, avg(film.length) as avg_film_length from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id

group by category.category_id

order by avg_film_length desc