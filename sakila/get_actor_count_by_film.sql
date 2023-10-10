use sakila;
drop procedure if exists get_actor_count_by_film;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_actor_count_by_film`(amovie_id int , out movie_count int)
begin
	select count(*) into movie_count from film_actor where film_id = amovie_id or amovie_id is null;    
end$$
DELIMITER ;