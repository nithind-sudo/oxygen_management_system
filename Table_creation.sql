
--------------------------------------------------------------------- OXYGEN CYLINDER PLANT TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure oxygen_cylinder_plant_table_creation
IS
    table_name varchar2(1000);
BEGIN
    table_name:= 'CREATE TABLE OXYGEN_CYLINDER_PLANT(
                                      plant_id NUMERIC(20,0) generated by default as identity,
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



-------------------------------------------------------------------- Orders Table ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure orders_table_creation
IS
    table_name varchar2(4000);
BEGIN
    table_name:= 'CREATE TABLE orders (
                              order_id NUMERIC(30,0) generated by default as identity,
                              account_id NUMERIC(20,0),
                              rental_price_id NUMERIC(16,0),
                              transaction_id NUMERIC(30,0),
                              payment_status_code NUMERIC(1,0),
                              cylinder_id NUMERIC(25,0),
                              plant_id NUMERIC(20,0),
                              covid_report_id NUMERIC(8,0),
                              booked_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              booking_end_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (order_id),
                              CONSTRAINT FK_orders_account_id FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_orders_cylinder_id FOREIGN KEY (cylinder_id) REFERENCES oxygen_cylinder_details(cylinder_id),
                              CONSTRAINT FK_orders_transcation_id FOREIGN KEY (transaction_id) REFERENCES renter_payment_checkout(transaction_id),
                              CONSTRAINT FK_orders_plant_id FOREIGN KEY (plant_id) REFERENCES oxygen_cylinder_plant(plant_id),
                              CONSTRAINT FK_orders_payment_status_code FOREIGN KEY (payment_status_code) REFERENCES payment_status(payment_status_code),
                              CONSTRAINT FK_orders_covid_report_id FOREIGN KEY (covid_report_id) REFERENCES patient_details(covid_report_id),
                              CONSTRAINT FK_orders_rental_price_id FOREIGN KEY (rental_price_id) REFERENCES rental_price(price_id))' ;
     EXECUTE IMMEDIATE table_name;
end orders_table_creation;
/
DECLARE
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Orders Table Creation Procedure------------------------------------------------------------------');
        t_name:='ORDERS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Orders table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Orders table');
                    orders_table_creation ;
                    dbms_output.put_line('Orders table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    orders_table_creation;
                    dbms_output.put_line('Table Orders is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Orders table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;
/
