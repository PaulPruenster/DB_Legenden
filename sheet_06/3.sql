select f.title, c."name" as category_name, sum(p.amount) as total_earnings, avg(p.amount) as average_payment from film f
 join inventory i on f.film_id = i.film_id
 join rental r on i.inventory_id = r.inventory_id
 join payment p on r.rental_id = p.rental_id
 join film_category fc on fc.film_id = f.film_id 
 join category c on c.category_id = fc.category_id 
group by f.title, c."name"

union all 

select 'Category Pricings' as title, c."name" as category_name, sum(p.amount) as total_earnings, avg(p.amount) as average_payment from category c 
	join film_category fc on c.category_id = fc.category_id 
	join film f on f.film_id = fc.film_id 
 	join inventory i on f.film_id = i.film_id
 	join rental r on i.inventory_id = r.inventory_id
 	join payment p on r.rental_id = p.rental_id
group by c."name"  

order by total_earnings desc, title asc, category_name asc