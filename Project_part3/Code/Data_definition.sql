CREATE DATABASE CAR_RENTALDB;
USE CAR_RENTALDB;

-- Create table statements with restrictions
CREATE TABLE CUSTOMER
	(CustID       INT          NOT NULL       UNIQUE        AUTO_INCREMENT,
     Name         VARCHAR(60)  NOT NULL,
	 Phone        VARCHAR(14)  NOT NULL,
	 PRIMARY KEY(CustID));

CREATE TABLE VEHICLE
	(VehicleID    VARCHAR(18)   NOT NULL       UNIQUE,
     Description  VARCHAR(100)  NOT NULL,
     Year		  INT           NOT NULL,
     Type		  TINYINT       NOT NULL       DEFAULT 1,
     Category	  TINYINT       NOT NULL       DEFAULT 0,
     CHECK (Category IN (0,1)),
     PRIMARY KEY (VehicleID));
     
CREATE TABLE RATE
	(Type		  TINYINT       NOT NULL       DEFAULT 1
     CHECK (Type IN (1,2,3,4,5,6)),
     Category	  TINYINT       NOT NULL       DEFAULT 0 
     CHECK (Category IN (0,1)), 
     Weekly		  FLOAT         NOT NULL,
     Daily        FLOAT         NOT NULL);
     
     
-- the table that has most foreign keys should be created last
CREATE TABLE RENTAL
	(RentalID     INT          NOT NULL       UNIQUE       AUTO_INCREMENT,
     CustID       INT          NOT NULL,
     VehicleID    VARCHAR(18)  NOT NULL,
	 StartDate	  DATE         NOT NULL,
     OrderDate	  DATE         NOT NULL,
     RentalType	  TINYINT	   NOT NULL       DEFAULT 1     
     CHECK (RentalType IN (1,7)),
     Qty		  TINYINT	   NOT NULL       DEFAULT 1,
     ReturnDate   DATE         NOT NULL,
     TotalAmount  FLOAT        NOT NULL,
     PaymentDate  DATE,
     PRIMARY KEY(RentalID),
     FOREIGN KEY(VehicleID) REFERENCES VEHICLE(VehicleID),
     FOREIGN KEY(CustID) REFERENCES CUSTOMER(CustID));

     
