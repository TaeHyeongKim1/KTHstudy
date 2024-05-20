CREATE SEQUENCE car_numbers_seq
  START WITH 1
  INCREMENT BY 1;
  
 CREATE TABLE CarNumbers (
  id NUMBER PRIMARY KEY,
  carNumber VARCHAR2(20) NOT NULL,
 
);

CREATE OR REPLACE TRIGGER car_numbers_before_insert
BEFORE INSERT ON CarNumbers
FOR EACH ROW
BEGIN
  SELECT car_numbers_seq.NEXTVAL INTO :new.id FROM dual;
END;

INSERT INTO CarNumbers (carNumber) VALUES ('139바4032');

SELECT * FROM CarNumbers;	
SELECT * FROM CarNumbers;	

ALTER TABLE CarNumbers ADD CONSTRAINT unique_carNumber UNIQUE (carNumber);

SELECT  * FROM CarNumbers;

ALTER TABLE CarNumbers
ADD entryDate DATE;

ALTER TABLE CarNumbers
DEL exitDate DATE;

SELECT  * FROM CarNumbers;
DELETE FROM CarNumbers;
SELECT  * FROM CarNumbers;
DELETE FROM CarNumbers;
SELECT  * FROM CarNumbers_backup;

CREATE SEQUENCE parkingHistory_seq
  START WITH 1
  INCREMENT BY 1;
 
 CREATE TABLE parkingHistory (
  id NUMBER,
  carNumber VARCHAR2(20) NOT NULL,
  entryDate DATE,
  exitDate DATE,
  PRIMARY KEY (id)
);

CREATE OR REPLACE TRIGGER parkingHistory_trigger
BEFORE INSERT ON parkingHistory
FOR EACH ROW
BEGIN
  SELECT parkingHistory_seq.NEXTVAL INTO :new.id FROM dual;
END;

SELECT * FROM parkingHistory;
ALTER TABLE parkingHistory
ADD airport VARCHAR2(50);
ALTER TABLE parkingHistory
ADD parkingLot VARCHAR2(50);

SELECT  * FROM PARKINGHISTORY;	
DELETE FROM parkingHistory;
SELECT  * FROM PARKINGHISTORY;
DELETE FROM parkingHistory;
SELECT  * FROM PARKINGHISTORY;
SELECT  * FROM PARKINGHISTORY ORDER BY id;
