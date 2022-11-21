select c.last_name, return_date 
from customer c
	join rental on c.customer_id = rental.customer_id
	join staff on rental.staff_id = staff.staff_id 
		where staff.last_name = 'Stephens' 
			and DATE(rental.rental_date) = '2005-05-24'
order by last_name, return_date