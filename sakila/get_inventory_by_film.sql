use sakila;
drop procedure if exists get_inventory_by_film;
DELIMITER $$
create procedure get_inventory_by_film(out movie_count int , amovie_id int , out random_value numeric(10,8))
begin
		  set random_value = rand();
		  SELECT COUNT(*)
		  into movie_count from inventory where amovie_id is null or film_id = amovie_id;
		  
          select film.film_id , film.title , count(*) as count from inventory
          inner join film
          on film.film_id = inventory.film_id
          where amovie_id is null or film.film_id = amovie_id
          group by film.film_id , film.title;  
end$$
DELIMITER ;