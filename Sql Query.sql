/*11*/
select (
	select a.article_name
	from articles as a
	where a.article_id=r.article_id
)as replied_on,(
	select u.name
	from users as u
	where u.user_id=r.user_id
)as replied_by, r.description as comment 
from replies as r;


/*12*/
select (
		select u.name 
		from users as u	
		where u.user_id = ur.user_id
) as username, (
		select r.role_type
		from roles as r
		where r.role_id = ur.role_id
)
from users_roles as ur


/*13*/

select (
		select r.role_type
		from roles as r
		where r.role_id = ur.role_id
), count(ur.user_id) as number_of_users
   from users_roles as ur
   group by ur.role_id;
   

/*14*/

select u.name,u.email_id,u.gender,u.age,co.comp_name,u.status
from users as u join competitions as co 
on u.comp_id = co.comp_id;

/*15*/

select u.name,u.age,u.email_id,e.event_name
from users as u 
natural right outer join 
events as e;

/*16*/

select a.article_id,a.article_name,a.length,g.hard_words,g.meanings
from articles as a natural join contains natural join glossaries as g
order by a.article_id ASC;

/*17*/
select (
		select u.name
		from users as u
		where u.user_id = l.user_id
) as username, (
		select a.article_name
		from articles as a
		where a.article_id = l.article_id
)
from libraries as l;


/*18*/
select(
		select u.name as author_name 
		from users as u join articles as a1
		on u.user_id = a1.author_id and a1.article_id = a.article_id
), a.article_name, count(g.glossary_id) as number_of_glossaries
	from articles as a 
	natural join contains 
	natural join glossaries as g
group by a.article_id


/*19*/
drop function if exists GetallArticles(int);
create or replace function GetallArticles(users_id int)
returns table(
		username varchar,
		age int,
		article_name varchar
)
as
$$
begin
	return query
	select u.name as username,u.age,a.article_name 
	from users as u join articles as a 
	on a.author_id = users_id and u.user_id = a.author_id;
end;
$$
language plpgsql;

select *
from GetallArticles(11);

select *
from GetallArticles(67);


/*20*/
drop function if exists ageValidator() cascade;
create or replace function ageValidator()
returns trigger
as 
$$
begin
	if(new.age < 15)
	then raise exception 'Age of user should be greater than equals to 15';
	end if;
	return new;
end;
$$
language plpgsql;

create or replace trigger validateAge
before insert
on users
for each row
execute function ageValidator();

insert into users(name,age)
values ('test',13);


insert into users(name,age)
values ('test1',20);

	

