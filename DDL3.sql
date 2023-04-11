CREATE TABLE Actor
( ID NUMBER(3) NOT NULL,
  LAST_NAME VARCHAR(10) NOT NULL,
  FIRST_NAME VARCHAR(10) NOT NULL,
  SECOND_NAME VARCHAR(10) NOT NULL,
  TITLE VARCHAR(100) NOT NULL,
  ROLE VARCHAR(100) NOT NULL
);

CREATE TABLE Stage_director
( ID NUMBER(3) NOT NULL,
  LAST_NAME VARCHAR(10) NOT NULL,
  FIRST_NAME VARCHAR(10) NOT NULL,
  SECOND_NAME VARCHAR(10) NOT NULL,
  LABORS VARCHAR(100) NOT NULL,
  AWARDS VARCHAR(100) NOT NULL
);

CREATE TABLE Staff
( ID NUMBER(10) NOT NULL,
  LAST_NAME VARCHAR(10) NOT NULL,
  FIRST_NAME VARCHAR(10) NOT NULL,
  SECOND_NAME VARCHAR(10) NOT NULL,
  SEX VARCHAR(10) NOT NULL,
  DATE_OF_BIRTH DATE,
  PASSWORD VARCHAR(10) NOT NULL,
  TRCN NUMBER(10) NOT NULL,
  POSITION VARCHAR(20) NOT NULL,
  DUTIES VARCHAR(20) NOT NULL,
  PHONE_NUMBER NUMBER(14) NOT NULL,
  STREET VARCHAR(20) NOT NULL,
  HOUSE NUMBER(10) NOT NULL,
  FLAT NUMBER(10) NOT NULL
);

CREATE TABLE Contract
( ID_ACTOR NUMBER(3),
  ID_STAGE_DIRECTOR NUMBER(3),
  ID_STAFF NUMBER(3),
  DATE_SIGNING DATE,
  DATE_EXPIRATION DATE,
  SALARY NUMBER(5) NOT NULL,
  NUMERATE NUMBER(3) NOT NULL
);

CREATE TABLE Staging
( ID_ACTOR NUMBER(3) NOT NULL,
  ID_STAGE_DIRECTOR NUMBER(3) NOT NULL,
  ID_SPECTACLE NUMBER(3) NOT NULL
);

CREATE TABLE Show
( ID_ACTOR NUMBER(3) NOT NULL,
  ID_STAGE_PROPERTY NUMBER(3) NOT NULL,
  ID_SPECTACLE NUMBER(3) NOT NULL
);

CREATE TABLE Stage_property
( ID NUMBER(3) NOT NULL,
  NAME VARCHAR(10) NOT NULL,
  SHAPE VARCHAR(10) NOT NULL
);

CREATE TABLE Spectacle
( ID NUMBER(3) NOT NULL,
  SHOW_DATE DATE,
  NAME VARCHAR(10) NOT NULL,
  STORY VARCHAR(10) NOT NULL,
  DURATION DATE
);

CREATE TABLE Purchase
( ID_VIEWER NUMBER(3) NOT NULL,
  ID_TICKET NUMBER(3) NOT NULL,
  ID_SEAT NUMBER(3) NOT NULL,
  ID_SPECTACLE NUMBER(3) NOT NULL,
  QUANTITY VARCHAR(10) NOT NULL
);

CREATE TABLE Seat
( ID NUMBER(3) NOT NULL,
  SWATH NUMBER(3) NOT NULL,
  NUMERATE NUMBER(3) NOT NULL,
  HALL NUMBER(3) NOT NULL,
  SECTOR NUMBER(3) NOT NULL,
  EMPLOYMENT VARCHAR(10) NOT NULL
);

CREATE TABLE Ticket
( ID NUMBER(3) NOT NULL,
  PRICE NUMBER(3) NOT NULL,
  STATUS VARCHAR(10) NOT NULL,
  SHOW_TIME DATE,
  SERIES NUMBER(3) NOT NULL,
  ITEM NUMBER(3) NOT NULL
);

CREATE TABLE Viewer
( ID NUMBER(3) NOT NULL,
  LAST_NAME VARCHAR(10) NOT NULL,
  FIRST_NAME VARCHAR(10) NOT NULL,
  SECOND_NAME VARCHAR(10) NOT NULL,
  PHONE_NUMBER NUMBER(12) NOT NULL
);

ALTER TABLE Staff ADD CONSTRAINT PK_Staff PRIMARY KEY (ID);
ALTER TABLE Actor ADD CONSTRAINT PK_Actor PRIMARY KEY (ID);
ALTER TABLE Stage_director ADD CONSTRAINT PK_Stage_director PRIMARY KEY (ID);
ALTER TABLE Stage_property ADD CONSTRAINT PK_Stage_property PRIMARY KEY (ID);
ALTER TABLE Spectacle ADD CONSTRAINT PK_Spectacle PRIMARY KEY (ID);
ALTER TABLE Seat ADD CONSTRAINT PK_Seat PRIMARY KEY (ID);
ALTER TABLE Ticket ADD CONSTRAINT PK_Ticket PRIMARY KEY (ID);
ALTER TABLE Viewer ADD CONSTRAINT PK_Viewer PRIMARY KEY (ID);


ALTER TABLE Contract ADD CONSTRAINT Contract_ID_ACTOR_ID FOREIGN KEY (ID_ACTOR) REFERENCES Actor(ID);
ALTER TABLE Contract ADD CONSTRAINT Contract_ID_STAGE_DIRECTOR_ID FOREIGN KEY (ID_STAGE_DIRECTOR) REFERENCES Stage_director(ID);
ALTER TABLE Contract ADD CONSTRAINT Contract_ID_STAFF_ID FOREIGN KEY (ID_STAFF) REFERENCES Staff(ID);
ALTER TABLE Staging ADD CONSTRAINT Staging_ID_ACTOR_ID FOREIGN KEY (ID_ACTOR) REFERENCES Actor(ID);
ALTER TABLE Staging ADD CONSTRAINT Staging_ID_SPECTACLE_ID FOREIGN KEY (ID_SPECTACLE) REFERENCES SPECTACLE(ID);
ALTER TABLE Staging ADD CONSTRAINT Staging_ID_STAGE_DIRECTOR_ID FOREIGN KEY (ID_STAGE_DIRECTOR) REFERENCES Stage_director(ID);
ALTER TABLE Show ADD CONSTRAINT Show_ID_ACTOR_ID FOREIGN KEY (ID_ACTOR) REFERENCES Actor(ID);
ALTER TABLE Show ADD CONSTRAINT Show_ID_STAGE_PROPERTY_ID FOREIGN KEY (ID_STAGE_PROPERTY) REFERENCES Stage_PROPERTY(ID);
ALTER TABLE Show ADD CONSTRAINT Show_ID_SPECTACLE_ID FOREIGN KEY (ID_SPECTACLE) REFERENCES SPECTACLE(ID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_ID_VIEWER_ID FOREIGN KEY (ID_VIEWER) REFERENCES Viewer(ID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_ID_TICKET_ID FOREIGN KEY (ID_TICKET) REFERENCES Ticket(ID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_ID_SEAT_ID FOREIGN KEY (ID_SEAT) REFERENCES Seat(ID);
ALTER TABLE Purchase ADD CONSTRAINT Purchase_ID_SPECTACLE_ID FOREIGN KEY (ID_SPECTACLE) REFERENCES Spectacle(ID);




create SEQUENCE Staff_ID_SEQ START WITH 1;
create SEQUENCE Actor_ID_SEQ START WITH 1;
create SEQUENCE Stage_director_ID_SEQ START WITH 1;
create SEQUENCE Stage_property_ID_SEQ START WITH 1;
create SEQUENCE Spectacle_ID_SEQ START WITH 1;
create SEQUENCE Seat_ID_SEQ START WITH 1;
create SEQUENCE Ticket_ID_SEQ START WITH 1;
create SEQUENCE Viewer_ID_SEQ START WITH 1;
create SEQUENCE Ticket_ITEM_SEQ START WITH 53;
create SEQUENCE Ticket_SERIES_SEQ START WITH 168;

create trigger Staff_ID
    BEFORE INSERT ON Staff
    FOR EACH ROW
    BEGIN
        SELECT Staff_ID_SEQ.nextval
        INTO :new.ID
        FROM DUAL;
    END;
/

create trigger Actor_ID 
    BEFORE INSERT ON Actor
    FOR EACH ROW 
    BEGIN
        SELECT Actor_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Stage_director_ID 
    BEFORE INSERT on Stage_director
    FOR EACH ROW
    BEGIN
        SELECT Stage_director_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Stage_property_ID 
    BEFORE INSERT on Stage_property
    FOR EACH ROW
    BEGIN
        SELECT Stage_property_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Spectacle_ID 
    BEFORE INSERT on Spectacle
    FOR EACH ROW
    BEGIN
        SELECT Spectacle_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Seat_ID 
    BEFORE INSERT on Seat
    FOR EACH ROW
    BEGIN
        SELECT Seat_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Ticket_ID 
    BEFORE INSERT on Ticket
    FOR EACH ROW
    BEGIN
        SELECT Ticket_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Viewer_ID 
    BEFORE INSERT on Viewer
    FOR EACH ROW
    BEGIN
        SELECT Viewer_ID_SEQ.nextval
        INTO :new.ID
        FROM dual;
    END;
/
create trigger Ticket_ITEM 
    BEFORE INSERT on Ticket
    FOR EACH ROW
    BEGIN
        SELECT Ticket_ITEM_SEQ.nextval
        INTO :new.ITEM
        FROM dual;
    END;
/
create trigger Ticket_SERIES
    BEFORE INSERT on Ticket
    FOR EACH ROW
    BEGIN
        SELECT Ticket_ITEM_SEQ.nextval
        INTO :new.SERIES
        FROM dual;
    END;
/

INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('1', 'Kutsyk', 'Mykola', 'Serg', 'man', '12345678', '4546768176', 'Cleaner', 'Toilets', '+380684469140', 'Kalnysh', '19', '48')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('2', 'Knysh', 'Nazar', 'Andr', 'man', '124465411', '4545342376', 'Cleaner', 'Hall', '+380687941140', 'Rivno', '9', '4')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('3', 'Pupin', 'Vasyl', 'Vasyl', 'man', '1345345678', '7351768176', 'Cashier', 'Popcorn', '+380789469140', 'Kariv', '1', '8')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('4', 'Ivanenko', 'Ivanka', 'Ivan', 'woman', '91345678', '4576289176', 'Cashier', 'Cash regis', '+380681234140', 'Mysh', '78', '12')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('5', 'Chernyk', 'Olga', 'Serg', 'woman', '78345692', '1248668176', 'Cashier', 'Cash regis', '+380687416140', 'Kyiv', '102', '62')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('6', 'Bylach', 'Volodymr', 'Anton', 'man', '46913678', '9741238176', 'Cloakroom attendant', 'Wardrobe', '+380856469140', 'Odess', '105', '32')
/
INSERT INTO staff (ID, LAST_NAME, FIRST_NAME, SECOND_NAME, SEX, password, TRCN, position, DUTIES, PHONE_NUMBER, STREET, HOUSE, FLAT) 
VALUES ('7', 'Shev', 'Taras', 'Grygor', 'man', '19436678', '5632168176', 'Cloakroom attendant', 'Wardrobe', '+380923569140', 'Dnipro', '92', '83')
/ 
INSERT INTO SPECTACLE (ID, SHOW_DATE, DURATION, NAME, STORY) 
VALUES ('1', to_date('02-09-2022 16:30', 'dd-mm-yy hh24:mi'), to_date('2:02', 'hh24:mi'), 'Pogani dorogy', 'Pro tragichni podii ostanih rokiv')
/
INSERT INTO SPECTACLE (ID, SHOW_DATE, DURATION, NAME, STORY) 
VALUES ('3', to_date('02-01-2022 16:30', 'dd-mm-yy hh24:mi'), to_date('1:42', 'hh24:mi'), 'Кохаець', 'Pro nalagodshenya stosunkivv')
/
INSERT INTO SPECTACLE (ID, SHOW_DATE, DURATION, NAME, STORY) 
VALUES ('4', to_date('08-03-2022 16:30', 'dd-mm-yy hh24:mi'), to_date('1:35', 'hh24:mi'), 'Nahlibnuk', 'Klasuka za prozou Turgeneva')
/
INSERT INTO SPECTACLE (ID, SHOW_DATE, DURATION, NAME, STORY) 
VALUES ('5', to_date('02-06-2022 16:30', 'dd-mm-yy hh24:mi'), to_date('1:53', 'hh24:mi'), 'Stalkeru', 'Pro zonu vidchuzhenya')
/
INSERT INTO SPECTACLE (ID, SHOW_DATE, DURATION, NAME, STORY) 
VALUES ('2', to_date('02-11-2022 16:30', 'dd-mm-yy hh24:mi'), to_date('1:25', 'hh24:mi'), 'Ukradene shchacta', 'Spectacle za pesou Franka')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('1', '1', '1', '1', '1', 'place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('2', '1', '2', '1', '1', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('3', '2', '1', '1', '1', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('4', '2', '2', '1', '1', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('5', '1', '1', '1', '2', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('6', '1', '2', '1', '2', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('7', '2', '1', '1', '2', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('8', '2', '2', '1', '2', 'place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('9', '1', '1', '2', '3', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('10', '1', '2', '2', '3', 'place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('11', '2', '1', '2', '3', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('12', '2', '2', '2', '3', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('13', '1', '1', '2', '4', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('14', '1', '2', '2', '4', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('15', '2', '1', '2', '4', 'free place')
/
INSERT INTO SEAT (ID, SWATH, NUMERATE, HALL, SECTOR, EMPLOYMENT) VALUES ('16', '2', '2', '2', '4', 'free place')
/
INSERT INTO ACTOR VALUES('1', 'Sins', 'Johnny', 'Damian', 'XBIZ Award', 'Doctor, Teacher')
/
INSERT INTO ACTOR VALUES('2', 'Depp', 'Johnny', 'Chistopher', 'Donostia Award', 'Grindelwald')
/
INSERT INTO ACTOR VALUES('3', 'Hathaway', 'Anne', 'Jacqueline', 'Scream Award', 'Jules Austin')
/
INSERT INTO ACTOR VALUES('4', 'Cumberbach', 'Benedict', 'Timothy', 'British Academy Television Awards', 'Sherlock')
/
INSERT INTO STAGE_DIRECTOR VALUES('1', 'Tarantino', 'Quentin ', 'Jerome', 'Saturn Awards', 'Pogani dorogy')
/
INSERT INTO STAGE_DIRECTOR VALUES('1', 'Columbus', 'Chris ', 'Joseph', 'Best Feature Film', 'Stalkeru')
/
INSERT INTO STAGE_PROPERTY VALUES('1', 'costume1', 'GOOD')
/
INSERT INTO STAGE_PROPERTY VALUES('1', 'costume2', 'GOOD')
/
INSERT INTO STAGE_PROPERTY VALUES('1', 'costume3', 'GOOD')
/
INSERT INTO STAGE_PROPERTY VALUES('1', 'costume4', 'GOOD')
/
INSERT INTO TICKET VALUES('1', '200', 'standard', to_date('16:30', 'hh24:mi'), '2' ,'4')
/
INSERT INTO TICKET VALUES('1', '200', 'standard', to_date('16:30', 'hh24:mi'), '2' ,'4')
/
INSERT INTO TICKET VALUES('1', '200', 'standard', to_date('16:30', 'hh24:mi'), '2' ,'4')
/
INSERT INTO TICKET VALUES('1', '600', 'prime', to_date('16:30', 'hh24:mi'), '2' ,'4')
/
INSERT INTO TICKET VALUES('1', '600', 'prime', to_date('16:30', 'hh24:mi'), '2' ,'4')
/
INSERT INTO TICKET VALUES('1', '600', 'prime', to_date('16:30', 'hh24:mi'), '2' ,'4')

/
INSERT INTO VIEWER VALUES('6', 'Ostapenko', 'Stanislav', 'Prytula','380978464312')
/
INSERT INTO VIEWER VALUES('7', 'Kyrylovych', 'Mykola', 'Dub', '380978445319')
/
INSERT INTO VIEWER VALUES('8', 'Vitaliivna', 'Daria', 'Koliada', '38097831892')
/
INSERT INTO VIEWER VALUES('9', 'Ostapenko', 'Dmytro', 'Prytula', '380945364344')
/
INSERT INTO VIEWER VALUES('10', 'Oleksand', 'Stepan', 'Shuliak', '380114554121')
/
INSERT INTO VIEWER VALUES('11', 'Myroslav', 'Olena', 'Teliga', '380358463378')
/

select t.price, s.swath, s.numerate, c.name from TICKET t, SEAT s, SPECTACLE c
    where s.swath = 1 and s.numerate = 2;

select s.duration, s.name, s.story from spectacle s
    where show_date > '02.06.2022';
    
select s.duration, s.name, s.story from spectacle s
    where show_date < '02.06.2022';
    
select s.position, s.duties, s.first_name, s.last_name from staff s
    where s.last_name = 'Kutsyk' and s.first_name = 'Mykola' and s.second_name = 'Serg'; 
    
select s.swath, s.numerate, s.hall, s.sector from seat s
    where s.employment = 'place';
    
update stage_property
    set shape = 'tear'
    where name = 'costume2';
    
select s.name from stage_property s
    where s.shape = 'GOOD';
    
    
INSERT INTO CONTRACT VALUES('1', '', '', '', '', '500', '892') 
/
INSERT INTO CONTRACT VALUES('3', '', '', '', '', '500', '895') 
/
INSERT INTO CONTRACT VALUES('4', '', '', '', '', '500', '896') 
/
INSERT INTO CONTRACT VALUES('5', '', '', '', '', '500', '897') 
/
INSERT INTO CONTRACT VALUES('', '1', '', '', '', '700', '898') 
/
INSERT INTO CONTRACT VALUES('', '2', '', '', '', '700', '899') 
/
INSERT INTO CONTRACT VALUES('', '', '121', '', '', '200', '901') 
/
INSERT INTO CONTRACT VALUES('', '', '122', '', '', '200', '902')
/
INSERT INTO CONTRACT VALUES('', '', '123', '', '', '300', '903') 
/
INSERT INTO CONTRACT VALUES('', '', '124', '', '', '300', '904')
/
INSERT INTO CONTRACT VALUES('', '', '125', '', '', '300', '905') 
/
INSERT INTO CONTRACT VALUES('', '', '126', '', '', '300', '906')
/
INSERT INTO CONTRACT VALUES('', '', '127', '', '', '300', '907')
/
INSERT INTO SHOW VALUES ('1', '3', '5')
/
INSERT INTO SHOW VALUES ('3', '2', '5')
/
INSERT INTO SHOW VALUES ('4', '1', '5')
/
INSERT INTO SHOW VALUES ('5', '4', '5')
/
INSERT INTO SHOW VALUES ('1', '3', '4')
/
INSERT INTO SHOW VALUES ('3', '2', '4')
/
INSERT INTO SHOW VALUES ('4', '1', '4')
/
INSERT INTO SHOW VALUES ('5', '4', '4')
/
INSERT INTO SHOW VALUES ('1', '3', '3')
/
INSERT INTO SHOW VALUES ('3', '2', '3')
/
INSERT INTO SHOW VALUES ('4', '1', '3')
/
INSERT INTO SHOW VALUES ('5', '4', '3')
/
INSERT INTO SHOW VALUES ('1', '3', '2')
/
INSERT INTO SHOW VALUES ('3', '2', '2')
/
INSERT INTO SHOW VALUES ('4', '1', '2')
/
INSERT INTO SHOW VALUES ('5', '4', '2')
/
INSERT INTO SHOW VALUES ('5', '3', '1')
/
INSERT INTO SHOW VALUES ('1', '2', '1')
/
INSERT INTO SHOW VALUES ('3', '1', '1')
/
INSERT INTO SHOW VALUES ('4', '4', '1')
/

INSERT INTO PURCHASE VALUES ('1', '1', '2', '2', '1')
/
INSERT INTO PURCHASE VALUES ('2', '2', '3', '1', '2')
/
INSERT INTO PURCHASE VALUES ('3', '3', '4', '3', '3')
/
INSERT INTO PURCHASE VALUES ('4', '5', '5', '5', '4')
/
INSERT INTO PURCHASE VALUES ('5', '6', '6', '4', '5')

/
INSERT INTO STAGING VALUES ('1', '1', '1')
/
INSERT INTO STAGING VALUES ('3', '1', '1')
/
INSERT INTO STAGING VALUES ('4', '1', '1')
/
INSERT INTO STAGING VALUES ('5', '1', '1')
/
INSERT INTO STAGING VALUES ('1', '1', '2')
/
INSERT INTO STAGING VALUES ('3', '1', '2')
/
INSERT INTO STAGING VALUES ('4', '1', '2')
/
INSERT INTO STAGING VALUES ('5', '1', '2')
/
INSERT INTO STAGING VALUES ('1', '2', '3')
/
INSERT INTO STAGING VALUES ('3', '2', '3')
/
INSERT INTO STAGING VALUES ('4', '2', '3')

/
INSERT INTO STAGING VALUES ('1', '2', '4')
/
INSERT INTO STAGING VALUES ('3', '2', '4')
/
INSERT INTO STAGING VALUES ('4', '2', '4')
/
INSERT INTO STAGING VALUES ('5', '2', '4')

/
INSERT INTO STAGING VALUES ('3', '1', '5')
/
INSERT INTO STAGING VALUES ('4', '1', '5')
/
INSERT INTO STAGING VALUES ('5', '1', '5')
/



delete from spectacle
    where show_date > '02.06.2022';






