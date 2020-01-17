insert into device_details values(92,'smartBand_03',0,0,0,'2019-06-26',0,0,0,0,0,0,0,0,0,0,0,0,70,0,0,60,0,50,0,0,0,0,0,75);
  
 select * from public."device_agg_yearly" where user_id = 97
 
 drop trigger trigger_update_quantity on device_details
drop function update_quantity()


 
CREATE OR REPLACE FUNCTION update_quantity2() RETURNS TRIGGER AS $quantity_update$
      DECLARE "trigger_device" varchar(30);
   begin
   insert into public."trigger_device" select * from  device_details ;
 RETURN NEW;
      END;
      $quantity_update$
    LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_quantity2 AFTER INSERT ON device_details
    FOR EACH ROW EXECUTE PROCEDURE update_quantity2();