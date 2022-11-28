select actor.first_name, actor.last_name, count(film.film_id) as movie_count
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
		
group by actor.actor_id

order by movie_count desc, actor.first_name asc, actor.last_name asc