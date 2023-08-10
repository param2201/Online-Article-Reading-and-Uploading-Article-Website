set search_path to public;

drop table if exists users cascade;

CREATE TABLE "users" (
  "user_id" serial PRIMARY KEY,
  "name" varchar,
  "gender" varchar,
  "email_id" varchar,
  "age" int,
  "event_id" int,
  "comp_id" int,
  "status" varchar
);

drop table if exists articles cascade;

CREATE TABLE "articles" (
  "article_id" serial PRIMARY KEY,
  "article_name" varchar,
  "author_id" int,
  "article_description" varchar,
  "length" int
);

drop table if exists roles cascade;

CREATE TABLE "roles" (
  "role_id" serial PRIMARY KEY,
  "role_type" varchar
);

drop table if exists users_roles cascade;

CREATE TABLE "users_roles" (
  "user_id" int,
  "role_id" int
);

drop table if exists events cascade;

CREATE TABLE "events" (
  "event_id" serial PRIMARY KEY,
  "event_name" varchar,
  "description" varchar
);

drop table if exists competitions cascade;

CREATE TABLE "competitions" (
  "comp_id" serial PRIMARY KEY,
  "comp_name" varchar
);

drop table if exists helps cascade;

CREATE TABLE "helps" (
  "help_id" serial PRIMARY KEY,
  "questions" varchar,
  "answers" varchar
);

drop table if exists glossaries cascade;

CREATE TABLE "glossaries" (
  "glossary_id" serial PRIMARY KEY,
  "hard_words" varchar,
  "meanings" varchar
);

CREATE TABLE "contains" (
  "article_id" int,
  "glossary_id" int
);

drop table if exists languages cascade;

CREATE TABLE "languages" (
  "language_id" serial PRIMARY KEY,
  "language_name" varchar,
  "link" varchar
);

drop table if exists libraries cascade;

CREATE TABLE "libraries" (
  "user_id" int,
  "article_id" int
);

drop table if exists replies cascade;

CREATE TABLE "replies" (
  "replies_id" serial PRIMARY KEY,
  "user_id" int,
  "article_id" int,
  "description" varchar
);

ALTER TABLE "users" 
ADD
	FOREIGN KEY ("event_id") 
	REFERENCES "events" ("event_id")
	on delete cascade
	on update cascade;

ALTER TABLE "users" 
ADD
	FOREIGN KEY ("comp_id") 
	REFERENCES "competitions" ("comp_id")
	on delete cascade
	on update cascade;

ALTER TABLE "users_roles" 
ADD 
	FOREIGN KEY ("user_id") 
	REFERENCES "users" ("user_id")
	on delete cascade
	on update cascade;

ALTER TABLE "users_roles" 
ADD 
	FOREIGN KEY ("role_id") 
	REFERENCES "roles" ("role_id")
	on delete cascade
	on update cascade;


ALTER TABLE "contains" 
ADD 
	FOREIGN KEY ("article_id") 
	REFERENCES "articles" ("article_id")
	on delete cascade
	on update cascade;

ALTER TABLE "contains" 
ADD 
	FOREIGN KEY ("glossary_id") 
	REFERENCES "glossaries" ("glossary_id")
	on delete cascade
	on update cascade;

ALTER TABLE "libraries" 
ADD 
	FOREIGN KEY ("user_id") 
	REFERENCES "users" ("user_id")
	on delete cascade
	on update cascade;

ALTER TABLE "libraries" 
ADD 
	FOREIGN KEY ("article_id") 
	REFERENCES "articles" ("article_id")
	on delete cascade
	on update cascade;


ALTER TABLE "replies" 
ADD 
	FOREIGN KEY ("user_id") 
	REFERENCES "users" ("user_id")
	on delete cascade
	on update cascade;


ALTER TABLE "replies" 
ADD 
	FOREIGN KEY ("article_id") 
	REFERENCES "articles" ("article_id")
	on delete cascade
	on update cascade;
	
ALTER TABLE "articles" 
ADD 
	FOREIGN KEY ("author_id") 
	REFERENCES "users" ("user_id")
	on delete cascade
	on update cascade;


copy events(event_name,description)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\events.csv'
DELIMITER ','
CSV HEADER;

copy competitions(comp_name)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\competitions.csv'
DELIMITER ','
CSV HEADER;

copy users(name,gender,email_id,age,event_id,comp_id,status)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\users.csv'
DELIMITER ','
CSV HEADER;

copy users(name,gender,email_id,age,event_id,comp_id,status)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\users.csv'
DELIMITER ','
CSV HEADER;

copy roles(role_type)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\roles.csv'
DELIMITER ','
CSV HEADER;

copy users_roles(user_id,role_id)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\users_roles.csv'
DELIMITER ','
CSV HEADER;

copy helps(questions,answers)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\helps.csv'
DELIMITER ','
CSV HEADER;

copy languages(language_name,link)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\languages.csv'
DELIMITER ','
CSV HEADER;

copy articles(article_name,author_id,article_description,length)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\articles.csv'
DELIMITER ','
CSV HEADER;

copy glossaries(hard_words,meanings)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\glossaries.csv'
DELIMITER ','
CSV HEADER;

copy languages(language_name,link)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\languages.csv'
DELIMITER ','
CSV HEADER;

copy contains(article_id,glossary_id)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\contains.csv'
DELIMITER ','
CSV HEADER;

copy libraries(user_id,article_id)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\libraries.csv'
DELIMITER ','
CSV HEADER;

copy replies(user_id,article_id,description)
from 'E:\Semester 5\Database Managment System (IT214)\Project\Data\replies.csv'
DELIMITER ','
CSV HEADER;






select u.name
from users as u
where gender = 'Male'

select *
from users 
where event_id IS NOT NULL;

select article_id,article_name,length
from articles
where length > 110;

select *
from articles
where author_id = '11';

select *
from replies
where description = 'good';

select *
from replies
where user_id = '42';

select *
from languages
where language_id % 2 = '0'

select *
from glossaries 
where hard_words like 'F%';

select *
from users
where comp_id IS NULL

select *
from events 
where event_name like 'S%';









