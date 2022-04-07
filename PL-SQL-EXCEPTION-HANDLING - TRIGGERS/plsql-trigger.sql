REM   Script: plsql-trigger
REM   plsql-trigger

create table manager (id varchar(20),name varchar(20), address varchar(20),salary number);

insert into manager values('101','Alex','US',50000);

insert into manager values('102','Mia','Uk',8799);

insert into manager values('103','Sia','Italy',56789);

CREATE OR REPLACE TRIGGER display_salary_changes  
 BEFORE DELETE OR INSERT OR UPDATE ON manager  
FOR EACH ROW  
WHEN (NEW.ID > 0)  
DECLARE  
sal_diff number;  
BEGIN  
 sal_diff := :NEW.salary  - :OLD.salary;  
dbms_output.put_line('Old salary: ' || :OLD.salary);  
dbms_output.put_line('New salary: ' || :NEW.salary);  
dbms_output.put_line('Salary difference: ' || sal_diff);  
END;  
/

DECLARE  
total_rows number(2);  
BEGIN  
UPDATE  manager 
SET salary = salary + 5000;  
IF sql%notfound THEN  
dbms_output.put_line('no manager updated');  
ELSIF sql%found THEN  
total_rows := sql%rowcount;  
dbms_output.put_line( total_rows || ' managers updated ');  
END IF;  
END;   
/

