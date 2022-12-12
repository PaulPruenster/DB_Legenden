CREATE TABLE nation (
	nation_id SERIAL PRIMARY KEY NOT NULL,
	name varchar(255),
	flag varchar(255)
);

CREATE TABLE team (
	team_id SERIAL PRIMARY KEY NOT NULL,
	nation_id int NOT NULL,
	name varchar(255),
	CONSTRAINT nation_id
		FOREIGN KEY (nation_id)
		REFERENCES nation(nation_id)
);

CREATE TABLE athlete (
	athlete_id SERIAL PRIMARY KEY NOT NULL,
	name varchar(255),
	age int
);

CREATE TABLE event (
	event_id SERIAL PRIMARY KEY NOT NULL,
	title varchar(255),
	date date,
	is_team_event boolean
);

CREATE TABLE athlete_in_team (
	athlete_id int NOT NULL,
	team_id int NOT NULL,
	CONSTRAINT team_id
		FOREIGN KEY (team_id)
		REFERENCES team(team_id),
	CONSTRAINT athlete_id
		FOREIGN KEY (athlete_id)
		REFERENCES athlete(athlete_id)
);

CREATE TABLE athlete_in_event (
	athlete_id int NOT NULL,
	event_id int NOT NULL,
	CONSTRAINT event_id
		FOREIGN KEY (event_id)
		REFERENCES event(event_id),
	CONSTRAINT athlete_id
		FOREIGN KEY (athlete_id)
		REFERENCES athlete(athlete_id),
	rank int
);

CREATE TABLE team_in_event (
	event_id int NOT NULL,
	team_id int NOT NULL,
	CONSTRAINT team_id
		FOREIGN KEY (team_id)
		REFERENCES team(team_id),
	CONSTRAINT event_id
		FOREIGN KEY (event_id)
		REFERENCES event(event_id),
	rank int
);
