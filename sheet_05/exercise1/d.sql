delete from working;

insert into working(employee_id, project_id, start_date) values(
	(select employee_id from employee where firstname = 'Erika' and lastname = 'Mustermann'),
	(select project_id from project where name = 'project2'),
	'11.11.2021'
);

select * from working; 
