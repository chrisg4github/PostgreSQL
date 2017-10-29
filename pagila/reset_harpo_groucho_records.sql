select * from actor
where first_name like '%GROUCHO';

update actor set first_name = 'GROUCHO' where actor_id in(78,106);

update actor set first_name = 'HARPO' where actor_id =172;

commit;

select a.actor_id, a.first_name, a.last_name from actor a
 where a.actor_id in (select fa.actor_id from film_actor fa
                      left join film f
                      on fa.film_id = f.film_id
                       where lower(f.title) = 'alone trip')
 order by a.last_name;


select s.title, s.actor_id, s.first_name, s.last_name
 from (select distinct f.title, a.actor_id, a.first_name, a.last_name
         from film f
       left join film_actor fa
       on f.film_id = fa.film_id
       left join actor a
       on a.actor_id = fa.actor_id) s
where upper(s.title) = 'ALONE TRIP'
order by s.last_name;



