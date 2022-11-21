select language.name
from language
	left join film on language.language_id = film.language_id
	where film.film_id is NULL
	
order by language.name ASC