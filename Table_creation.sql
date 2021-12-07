--------------------------------------------------------------------- CREATING ROLE TABLE ----------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

create or replace procedure role_table_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE ROLE (
                              role_id NUMBER(16,0) generated by default as identity,
                              role_description VARCHAR2(500),
                              display_name VARCHAR2(50),
                             created_by_id NUMBER(16,0),
                             created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (role_id))' ;
     EXECUTE IMMEDIATE table_name;
end role_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Role Table Creation Procedure------------------------------------------------------------------');
        t_name:='ROLE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table Role exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    DBMS_OUTPUT.PUT_LINE('Inside block to create role table');
                    role_table_creation;
                    dbms_output.put_line('Table ROLE is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    role_table_creation;
                    dbms_output.put_line('Table ROLE is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in role table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;    
/


--------------------------------------------------------------------- OXYGEN CYLINDER PLANT TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure oxygen_cylinder_plant_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE OXYGEN_CYLINDER_PLANT(
                                      plant_id NUMERIC(20,0),
                                        name VARCHAR2(500),
                                        address VARCHAR2(1000),
                                        phone_number NUMERIC(10,0),
                                        county VARCHAR2(500),
                                        email_id VARCHAR2(500),
                                        created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        PRIMARY KEY (plant_id))' ;
     EXECUTE IMMEDIATE table_name;
end oxygen_cylinder_plant_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXygen Cylinder Plant Table Creation Procedure------------------------------------------------------------------');
        t_name:='OXYGEN_CYLINDER_PLANT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table OXygen Cylinder Plant exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    oxygen_cylinder_plant_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_PLANT is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    oxygen_cylinder_plant_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_PLANT is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line('Something went wrong in OXYGEN_CYLINDER_PLANT table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

--------------------------------------------------------------------- OXYGEN CYLINDER DETAILS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure oxygen_cylinder_details_table_creation 
IS 
    table_name varchar2(5000);
BEGIN 
    table_name:= 'CREATE TABLE OXYGEN_CYLINDER_DETAILS (
                              cylinder_id NUMERIC(25,0) generated by default as identity,
                              plant_id NUMERIC(20,0),
                              quantity NUMERIC,
                              available_status NUMERIC(1,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT OXYGEN_CYLINDER_DETAILS_PK PRIMARY KEY (CYLINDER_ID),
                              CONSTRAINT OXYGEN_CYLINDER_DETAILS_FK_PLANT_ID FOREIGN KEY(PLANT_ID)
                                    REFERENCES OXYGEN_CYLINDER_PLANT(PLANT_ID))' ;     
     EXECUTE IMMEDIATE table_name;
end oxygen_cylinder_details_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXygen Cylinder Details Table Creation Procedure------------------------------------------------------------------');
        t_name:='OXYGEN_CYLINDER_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table OXygen Cylinder Details exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create oxygen_cylinder_details_table');
                    oxygen_cylinder_details_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_DETAILS is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    oxygen_cylinder_details_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_DETAILS is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in OXYGEN_CYLINDER_DETAILS table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


--------------------------------------------------------------------- PAYMENT STATUS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure payment_status_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE PAYMENT_STATUS (
                                  payment_status_code NUMERIC(1,0) generated by default as identity,
                                  status_description VARCHAR2(1500),
                                  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (payment_status_code))' ;     
     EXECUTE IMMEDIATE table_name;
end payment_status_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Payment status table Creation Procedure------------------------------------------------------------------');
        t_name:='PAYMENT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table payment status exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create payment status table');
                    payment_status_table_creation;
                    dbms_output.put_line('Table payment status is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    payment_status_table_creation;
                    dbms_output.put_line('Table Payment statys table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in Payment status table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

--------------------------------------------------------------------- PATIENT DETAILS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure patient_details_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE patient_details (
                              covid_report_id NUMERIC(8,0) generated by default as identity,
                              name VARCHAR2(100),
                              address VARCHAR2(1000),
                              covid_status NUMERIC(1,0),
                              county VARCHAR2(500),
                              PRIMARY KEY (covid_report_id))' ;     
     EXECUTE IMMEDIATE table_name;
end patient_details_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Patient details table Creation Procedure------------------------------------------------------------------');
        t_name:='PATIENT_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Patient details table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create patient details table');
                    patient_details_table_creation;
                    dbms_output.put_line('Table patient details is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    patient_details_table_creation;
                    dbms_output.put_line('Table patient details is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in Patient table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/



--------------------------------------------------------------------- RENTAL PRICE TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure rental_price_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE rental_price (
                              price_id NUMERIC(16,0) generated by default as identity,
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              price NUMERIC,
                              PRIMARY KEY (price_id))' ;     
     EXECUTE IMMEDIATE table_name;
end rental_price_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Patient details table Creation Procedure------------------------------------------------------------------');
        t_name:='RENTAL_PRICE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Rental Price table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create rental price table');
                    rental_price_table_creation ;
                    dbms_output.put_line('Rental price table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    rental_price_table_creation;
                    dbms_output.put_line('Table rental price is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating rental price table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


  
-------------------------------------------------------------------- ACCOUNT STATUS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_status_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE account_status (
                              status_id NUMBER(2,0) generated by default as identity,
                              status_description VARCHAR2(500),
                                created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (status_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_status_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing ACCOUTN STATUS table Creation Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Account status table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Account status table');
                    account_status_table_creation ;
                    dbms_output.put_line('Account status table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_status_table_creation;
                    dbms_output.put_line('Table Account status is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating account status table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- PASSWORD TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure password_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE password (
                                  password_id NUMBER(20,0) generated by default as identity,
                                  password_hash VARCHAR2(500),
                                  password_salted VARCHAR2(500),
                                  password_question VARCHAR2(500),
                                  passsword_answer_hash VARCHAR2(500),
                                  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (password_id))' ;     
     EXECUTE IMMEDIATE table_name;
end password_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing PASSWORD table Creation Procedure------------------------------------------------------------------');
        t_name:='PASSWORD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Password table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Password table');
                    password_table_creation ;
                    dbms_output.put_line('Password table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    password_table_creation;
                    dbms_output.put_line('Table Password is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Password table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- Payment method TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure payment_method_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE payment_method (
                              payment_method_id NUMERIC(2,0) generated by default as identity,
                              description VARCHAR2(500),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (payment_method_id)
                            )' ;     
     EXECUTE IMMEDIATE table_name;
end payment_method_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Payment Method table Creation Procedure------------------------------------------------------------------');
        t_name:='PAYMENT_METHOD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Payment method table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Payment method table');
                    payment_method_creation ;
                    dbms_output.put_line('Payment method table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    payment_method_creation;
                    dbms_output.put_line('Table Payment method is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Payment method table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- Permissions method TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure permissions_method_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE permissions (
                              permission_id NUMBER(8,0) generated by default as identity,
                              role_id NUMBER(16,0),
                              type VARCHAR2(10),
                              description VARCHAR2(1000),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT PERMISSIONS_FK_ROLE_ID FOREIGN KEY(ROLE_ID)
                                    REFERENCES ROLE(ROLE_ID),
                              PRIMARY KEY (permission_id))' ;     
     EXECUTE IMMEDIATE table_name;
end permissions_method_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='PERMISSIONS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Permissions table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Permissions table');
                    permissions_method_creation ;
                    dbms_output.put_line('Permissions table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    permissions_method_creation;
                    dbms_output.put_line('Table Permissions method is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Permissions table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/



-------------------------------------------------------------------- Account TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_table_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE Account (
                              account_id NUMBER(20,0) generated by default as identity,
                              display_name VARCHAR2(50),
                              email_id VARCHAR2(500),
                              phone_number NUMBER(10,0),
                              address VARCHAR2(500),
                              county VARCHAR2(100),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              role_id NUMBER(2,0),
                              modified_by_id NUMBER(16,0),
                              modified_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              account_status_id NUMBER(2,0),
                              password_id NUMBER(20,0),
                              PRIMARY KEY (account_id),
                              CONSTRAINT FK_Account_status_id FOREIGN KEY (account_status_id) REFERENCES account_status(status_id),
                              CONSTRAINT FK_Account_password_id FOREIGN KEY (password_id) REFERENCES PASSWORD(password_id),
                              CONSTRAINT FK_Account_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Permissions table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Account table');
                    account_table_creation ;
                    dbms_output.put_line('Account table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_table_creation;
                    dbms_output.put_line('Table Account is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Account table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- Account Role Mapping History TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_role_mapping_history_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE account_role_mapping_history (
                              mapping_id NUMBER(10, 0) generated by default as identity,
                              account_id NUMBER(20, 0),
                              role_id NUMBER(2,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              created_by_id NUMBER(16,0),
                              PRIMARY KEY (mapping_id),
                              CONSTRAINT FK_account_role_mapping_history.role_id FOREIGN KEY (role_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_account_role_mapping_history.role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_role_mapping_history_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT_ROLE_MAPPING';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Account Role Mapping table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Account Role Mapping table');
                    account_role_mapping_history_creation ;
                    dbms_output.put_line('Account Role Mapping table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_role_mapping_history_creation;
                    dbms_output.put_line('Table Account Role Mapping is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Account Role Mapping table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

