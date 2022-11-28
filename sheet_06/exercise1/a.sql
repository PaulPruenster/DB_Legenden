select film.title as title, sum(payment.amount) as total_payment 
from film
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
inner join payment on rental.rental_id = payment.rental_id
where payment.amount > 210
group by film.title, payment.amount
order by sum(payment.amount) ASC