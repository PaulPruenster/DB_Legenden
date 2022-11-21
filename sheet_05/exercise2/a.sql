select f.title, f.length from film f where film_id in (
	select film_id from film_actor where actor_id in (
		select actor_id from actor where first_name = 'AUDREY'))
