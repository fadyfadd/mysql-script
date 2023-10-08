use sakila;
drop procedure if exists get_actors_by_movie;
DELIMITER $$
create procedure get_actors_by_movie(amovie_id int , out actor_count int , out f int)
begin
		set actor_count = 0;   
end$$
DELIMITER ;