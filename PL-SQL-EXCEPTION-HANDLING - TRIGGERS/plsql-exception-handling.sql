REM   Script: plsql-exception handling
REM   plsql-exception handling

create table stock_has ( stock_id varchar(10), bloodid varchar(10),qty number) ;

insert into stock_has values('S101','B101',125) ;

insert into stock_has values('S102','B102',230) ;

insert into stock_has values('S103','B103',900) ;

insert into stock_has values('S104','B104',100) ;

insert into stock_has values('S105','B105',55) ;

insert into stock_has values('S106','B106',112) ;

DECLARE  
c_id stock_has.stock_id%type := 'S109';  
c_bid stock_has.bloodid%type;  
c_qty stock_has.qty%type;  
BEGIN 
SELECT STOCK_ID,BLOODID INTO c_id,c_bid 
FROM stock_has 
WHERE stock_id =c_id; 
DBMS_OUTPUT.PUT_LINE('Blood ID'||c_bid); 
DBMS_OUTPUT.PUT_LINE('Qty'||c_qty); 
EXCEPTION 
WHEN no_data_found THEN 
dbms_output.put_line('No such stock!'); 
WHEN others THEN 
dbms_output.put_line('Error!'); 
END; 
/

