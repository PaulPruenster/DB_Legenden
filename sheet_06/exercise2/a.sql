select actor.first_name, actor.last_name 
from actor
where actor.actor_id in (
	select actor_id from film_actor
	join film on film_actor.film_id = film.film_id
	where film.title = 'QUEEN LUKE')