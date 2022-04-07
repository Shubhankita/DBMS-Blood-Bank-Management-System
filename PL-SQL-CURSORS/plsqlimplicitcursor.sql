REM   Script: PLsql-Implicit Cursor
REM   PLsql-Implicit Cursor

create table stock_has ( stock_id varchar(10), bloodid varchar(10),qty number);

insert into stock_has values('S101','B101',125);

insert into stock_has values('S102','B102',230);

insert into stock_has values('S103','B103',900);

insert into stock_has values('S104','B104',100);

insert into stock_has values('S105','B105',55);

insert into stock_has values('S101','B101',125);

insert into stock_has values('S106','B106',112);

DECLARE   
   total_rows number(2);  
BEGIN  
   UPDATE STOCK_HAS  
   SET qty = qty + 500;  
   IF sql%notfound THEN  
      dbms_output.put_line('no stock selected');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount; 
      dbms_output.put_line( total_rows || ' stocks selected ');  
   END IF;   
END;  
/

