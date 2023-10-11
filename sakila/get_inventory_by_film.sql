use sakila;
drop procedure if exists get_inventory_by_film;
DELIMITER $$
create procedure get_inventory_by_film(out film_count int , afilm_id int , out random_value numeric(10,8))
begin
		  set random_value = rand();
		  SELECT COUNT(*)
		  into film_count from inventory where afilm_id is null or film_id = afilm_id;
		  
          select film.film_id , film.title , count(*) as count from inventory
          inner join film
          on film.film_id = inventory.film_id
          where afilm_id is null or film.film_id = afilm_id
          group by film.film_id , film.title;  
end$$
DELIMITER ;