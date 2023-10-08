use sakila;
DROP PROCEDURE  IF EXISTS  get_cities_by_country;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cities_by_country`(OUT city_count INT , acity_id int , out random_value numeric(10,8))
BEGIN
		  set random_value = rand();
		  SELECT COUNT(*)
		  into city_count from city where acity_id is null or city_id = acity_id;
          Select country.country as country_name , city.city_id as city_id , city.city as city_name , country.country_id as country_id      
          FROM city inner join country on country.country_id = city.country_id 
          where acity_id is null or city_id = acity_id;          
END$$
DELIMITER ;