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

