select subquery.first_name, subquery.last_name, max(subquery.avg_amount) as highest_avg_payment_from_customer
from (
	select staff.first_name, staff.last_name, avg(payment.amount) as avg_amount
	  from payment 
	join staff on payment.staff_id = staff.staff_id
	GROUP BY staff.staff_id, payment.customer_id
    ORDER BY avg_amount DESC
	 ) as subquery
GROUP BY subquery.first_name, subquery.last_name