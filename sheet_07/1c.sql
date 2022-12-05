WITH RECURSIVE followers(followed_person_id, firstname, lastname, following, steps) AS
(
     SELECT Distinct f.followed_person_id as root_person_id, p.firstname, p.lastname, f.person_id, 0
        FROM follow AS f
		INNER JOIN person AS p ON f.followed_person_id=p.id
		WHERE f.follows_since BETWEEN '01.06.2015' AND '01.06.2016' AND p.year_of_birth=1990

    UNION ALL

    SELECT Distinct fs.followed_person_id, fs.firstname, fs.lastname, step.person_id, steps + 1
        FROM followers AS fs
		INNER JOIN follow AS step ON fs.following = step.followed_person_id
        WHERE steps < 5 AND step.follows_since BETWEEN '01.06.2015' AND '01.06.2016'
),
above550(followed_person_id) AS
(
	Select followed_person_id, count(following)
	FROM followers
	Group BY followed_person_id
	HAVING count(following) > 550
)
SELECT Distinct f.followed_person_id, f.firstname, f.lastname,  f.steps, count(f.following)
        FROM followers as f
	JOIN above550 ON above550.followed_person_id=f.followed_person_id
		Group BY f.followed_person_id, f.firstname, f.lastname, f.steps
		order by f.followed_person_id, f.steps