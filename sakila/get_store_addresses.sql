use sakila;
drop procedure if exists get_store_addresses;
DELIMITER $$
create procedure get_store_addresses(out store_count int , astore_id int , out random_value numeric(10,8))
begin
		  set random_value = rand();
		  SELECT COUNT(*)
		  into store_count from store where astore_id is null or store_id = astore_id;
		  
          select "Sakila" as company ,  store.store_id , address.address_id ,  address.address from store
          inner join address
          on store.address_id = address.address_id
          where astore_id is null or store.store_id = astore_id;
end$$
DELIMITER ;