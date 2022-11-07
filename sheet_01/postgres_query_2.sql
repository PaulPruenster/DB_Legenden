select
    name,
    subdivision,
    two_letter,
    subcountry_name
from
    country
join subcountry on
    country.two_letter = subcountry.country
where
    two_letter = 'AT';
