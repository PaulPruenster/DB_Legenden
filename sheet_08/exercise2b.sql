CREATE OR REPLACE FUNCTION  max_athletes_in_team()
	RETURNS trigger AS
$func$
BEGIN
	IF(SELECT COUNT(*) FROM "athlete_in_team" WHERE team_id=NEW."team_id") > 20 THEN
	RAISE EXCEPTION 'NOT MORE THEN 20 PER TEAM';
	END IF;
	RETURN NEW;
END
$func$ LANGUAGE plpgsql;


CREATE TRIGGER max_athletes_in_team AFTER INSERT ON athlete_in_team
	FOR EACH ROW EXECUTE FUNCTION max_athletes_in_team();
