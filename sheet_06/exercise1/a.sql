select f.title, sum(p.amount) as total_payment from film f
 join inventory i on f.film_id = i.film_id
 join rental r on i.inventory_id = r.inventory_id
 join payment p on r.rental_id = p.rental_id
group by f.title  
having sum(p.amount) > 210
order by total_payment desc
