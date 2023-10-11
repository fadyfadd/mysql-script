use sakila;
drop procedure if exists get_actor_count_by_film;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_actor_count_by_film`(afilm_id int , out film_count int)
begin
	select count(*) into film_count from film_actor where film_id = afilm_id or afilm_id is null;    
end$$
DELIMITER ;