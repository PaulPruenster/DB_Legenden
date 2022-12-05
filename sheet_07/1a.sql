WITH RECURSIVE followers(person_id, following, path, steps) AS 
(
    SELECT f.person_id, f.followed_person_id, concat(f.person_id, '->', f.followed_person_id), 1 
    	FROM follow AS f
		JOIN person AS p ON p.firstname = 'Victor' AND p.lastname = 'Hall' AND f.person_id=p.id

    UNION ALL

    SELECT fs.following, step.followed_person_id, CONCAT(path, '->', step.followed_person_id), steps + 1
    	FROM followers AS fs 
		JOIN follow AS step ON fs.following = step.person_id
    	WHERE steps < 3
)

SELECT person_id, following, path, steps
	FROM followers
