select f.title, sum(p.amount) as total_payment from film f
 left outer join inventory i on f.film_id = i.film_id
 left outer join rental r on i.inventory_id = r.inventory_id
 left outer join payment p on r.rental_id = p.rental_id
group by f.title  
order by total_payment asc , title asc 