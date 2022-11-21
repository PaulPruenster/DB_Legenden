select c.first_name, c.last_name from customer c where address_id in (
	select address_id from address where city_id in (
		select city_id from city where country_id in (
			select country_id from country where country like '%land')))
				order by c.first_name, c.last_name
