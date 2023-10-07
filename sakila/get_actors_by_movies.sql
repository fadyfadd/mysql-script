drop procedure if exists get_actors_by_movie;
DELIMITER $$
create procedure get_actors_by_movie(out actor_count int , amovie_id int , out random_value numeric(10,8))
begin
		  set random_value = rand();
		  SELECT COUNT(*)
		  into actor_count from film_actor where amovie_id is null or actor_id = amovie_id;
		  
          Select actor.actor_id as actor_id ,  actor.first_name as first_name , actor.last_name as last_name ,  film.film_id as film_id , film.title as title
          FROM actor inner join film_actor on actor.actor_id = film_actor.actor_id
          inner join film on film.film_id = film_actor.film_id
          where amovie_id is null or film.film_id = amovie_id;        
end$$
DELIMITER ;