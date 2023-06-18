DROP PROCEDURE  IF EXISTS  get_cities_sp;

delimiter $$
CREATE PROCEDURE get_cities_sp (OUT cities INT , acity_id int)
BEGIN
          SELECT COUNT(*) from city   cities where acity_id is null or city_id = acity_id into cities;
          
          Select country.country as country_name           
          FROM city inner join country on country.country_id = city.country_id 
          where acity_id is null or city_id = acity_id;       
END$$