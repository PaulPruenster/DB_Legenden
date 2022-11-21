delete from employee;
delete from project;

insert into employee(firstname, lastname, main_location) values('Erika', 'Mustermann', 'Innsbruck');
insert into employee(firstname, lastname, main_location) values('Paul', 'Ebner', 'Innsbruck');
insert into employee(firstname, lastname, main_location) values('Luca', 'Gasser', 'Innsbruck');

insert into project(name, main_location) values('project2', 'Innsbruck');
insert into project(name, main_location) values('project3', 'Jenesien');
insert into project(name, main_location) values('project4', 'Eppan');

select * from employee;
select * from project; 
