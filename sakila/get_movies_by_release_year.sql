use sakila;
drop procedure if exists get_movies_by_release_year;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_movies_by_release_year`(arelease_year int , out movie_count int)
begin
	select film_id , title , description , release_year from film
    where arelease_year is null or release_year = arelease_year order by release_year desc;
end$$
DELIMITER ;