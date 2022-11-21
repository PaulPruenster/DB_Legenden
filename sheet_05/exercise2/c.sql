select * from customer where address_id in (
	select address_id from address where city_id in (
		select city_id from city where country_id in (
			select country_id from country c where c.country like '%land'))) 
