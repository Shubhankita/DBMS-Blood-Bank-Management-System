REM   Script: PLsql-Explicit Cursor
REM   PLsql-Explicit Cursor

create table stock_has ( stock_id varchar(10), bloodid varchar(10),qty number);

insert into stock_has values('S101','B101',125);

insert into stock_has values('S102','B102',230);

insert into stock_has values('S103','B103',900);

insert into stock_has values('S104','B104',100);

insert into stock_has values('S105','B105',55);

insert into stock_has values('S106','B106',112);

desc stock_has


DECLARE 
c_id stock_has.stock_id%type; 
c_bid stock_has.bloodid%type; 
c_qty stock_has.qty%type; 
 
CURSOR c_stock is 
SELECT stock_id,bloodid,qty FROM stock_has; 
BEGIN 
OPEN c_stock; 
LOOP 
FETCH c_stock into c_id,c_bid,c_qty; 
EXIT WHEN c_stock%notfound; 
dbms_output.put_line(c_id); 
dbms_output.put_line(c_bid); 
dbms_output.put_line(c_qty); 
 
END LOOP; 
CLOSE c_stock; 
END; 
/

