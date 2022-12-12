INSERT INTO nation (name,flag) VALUES ('Italy', 'FLAG');
INSERT INTO team (nation_id,name) VALUES ((SELECT nation_id FROM nation WHERE nation.name = 'Italy'), 'dbs_ps');

INSERT INTO athlete (name, age) VALUES ('Max', 1);
INSERT INTO athlete (name, age) VALUES ('Hans', 2);
INSERT INTO athlete (name, age) VALUES ('Sepp', 3);
INSERT INTO athlete (name, age) VALUES ('Klaus', 4);
INSERT INTO athlete (name, age) VALUES ('Joseph', 5);
INSERT INTO athlete (name, age) VALUES ('Matthias', 6);
INSERT INTO athlete (name, age) VALUES ('Luca', 7);
INSERT INTO athlete (name, age) VALUES ('Paul', 8);
INSERT INTO athlete (name, age) VALUES ('Philipp', 9);
INSERT INTO athlete (name, age) VALUES ('Philip', 10);
INSERT INTO athlete (name, age) VALUES ('Manuel', 11);
INSERT INTO athlete (name, age) VALUES ('Fabian', 12);
INSERT INTO athlete (name, age) VALUES ('Fuchs', 13);
INSERT INTO athlete (name, age) VALUES ('Thomas', 14);
INSERT INTO athlete (name, age) VALUES ('Thumis', 15);
INSERT INTO athlete (name, age) VALUES ('Joe', 16);
INSERT INTO athlete (name, age) VALUES ('Goivanni', 17);
INSERT INTO athlete (name, age) VALUES ('Gan', 18);
INSERT INTO athlete (name, age) VALUES ('Paolo', 19);
INSERT INTO athlete (name, age) VALUES ('Lukas', 20);
INSERT INTO athlete (name, age) VALUES ('John', 21);

INSERT INTO athlete_in_team (athlete_id, team_id)
VALUES
	((SELECT athlete_id FROM athlete WHERE age = 1), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 2), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 3), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 4), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 5), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 6), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 7), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 8), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 9), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 10), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 11), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 12), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 13), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 14), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 15), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 16), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 17), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 18), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 19), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 20), (SELECT team_id FROM team WHERE team.name = 'dbs_ps')),
	((SELECT athlete_id FROM athlete WHERE age = 21), (SELECT team_id FROM team WHERE team.name = 'dbs_ps'));
