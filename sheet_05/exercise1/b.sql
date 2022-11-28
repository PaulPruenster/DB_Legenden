CREATE TABLE employee(
   employee_id 			SERIAL PRIMARY KEY  NOT NULL,
   firstname      	CHAR(255)    				NOT NULL,
   lastname       	CHAR(255)     			NOT NULL,
   main_location  	CHAR(255)
);

CREATE TABLE project(
   project_id 		SERIAL PRIMARY KEY    NOT NULL,
   name		      	CHAR(255)    					NOT NULL,
   main_location  CHAR(255)
);

CREATE TABLE working(
   	employee_id 		INT     NOT NULL,
   	project_id 			INT     NOT NULL,
   	start_date  		DATE		NOT NULL,
	
	PRIMARY KEY(employee_id, project_id),
	
	CONSTRAINT employee_id 
		FOREIGN KEY(employee_id) 
		REFERENCES employee(employee_id),
	
	CONSTRAINT project_id
      FOREIGN KEY(project_id) 
	  REFERENCES project(project_id)
);
