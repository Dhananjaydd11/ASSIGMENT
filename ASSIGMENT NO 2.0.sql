----------ASSIGMENT NO 2--------
--Q1-
CREATE DATABASE ORDER_STORES_DATA

--Q2--
CREATE TABLE ORDER_TABLE
(
ORDER_DATE DATE ,
REGION VARCHAR(100) ,
REP VARCHAR(50) ,
ORDER_ITEM VARCHAR(50),
UNIT INT,
UNIT_COST INT,
TOTAL_PRICE MONEY,
ORDER_ID INT NOT NULL
)

CREATE TABLE STORES_TABLE
(
STORE_ID INT,
STORE_TYPE CHAR(10),
ASSORTMENT INT,
COMPETITIONDISTANSE INT,
MONTH INT,
YEAR INT,
PROMOINTERVAL VARCHAR (250)
)
SELECT * FROM STORES_TABLE
SELECT * FROM ORDER_TABLE

----Q3---
SELECT * FROM ORDER_TABLE
INSERT INTO ORDER_TABLE VALUES ('1-6-21', 'EAST', 'ARUNA', 'PENCIL', 95, 1.99, 189.05, 1),
                               ('1-23-21', 'CENTRAL', 'KIVELL', 'ERASER', 50, 19.99, 999.50, 2),
                               ('2-9-21', 'CENTRAL', 'GANESH', NULL , 36, 4.99, 179.64, 3),
                               ('2-26-21', 'Central',  'Payal', NULL, 27, 19.99, 539.73, 4),
                               ('3-15-21', 'West', 'Sorvino', NULL,	56,	 2.99, 	 167.44, 5),
							   ('4-1-21', 'East', 'Hitesh', 'Pencil',	60,	 4.99, 	299.40, 6),	
                               ('4-18-21',	'Central',	'Akshita', NULL, 75, 1.99,  149.25, 7),	
                               ('5-5-21', 'Central', 'Ruchika',	'Books', 90, 4.99, 	449.10, 8),	
                               ('5-22-21',	'West',	'Surbhi', NULL, 32,	 1.99, 	 63.68, 9),	
                               ('6-8-21', 'East', 'Jones',	'Suitcase',	60,	 8.99, 539.40, 10)

SELECT * FROM STORES_TABLE
INSERT INTO STORES_TABLE VALUES (1,	'c',    47, 1270,	9,	2008,	'Jan'),
                               (2,	'a',	38,	570,	11,	2007,	'Feb'),
                               (3,	'a',	33,	14130,	12,	2006,	'Mar'),
                               (4,	'c',	44,	620,	9,	2009,	NULL),
                               (5,	'a',	36,	29910,	4,	2015,	'May'),
                               (6,	'a',	21,	310,	12,	2013,	'June'),
                               (7,	'a',	36,	24000,	4,	2013,	NULL),
                               (8,	'a',	10,	7520,	10,	2014,	'Aug'),
                               (9,	'a',	27,	2030,	8,	2000,	NULL),
                               (10,	'a',	22,	3160,	9,	2009,	'Oct')

--Q3 Make Order_Id  Column as Primary Key.
ALTER TABLE ORDER_TABLE
ADD PRIMARY KEY (ORDER_ID) ---(Primary keys must contain UNIQUE values, and cannot contain NULL values. A table can have only ONE primary key; and in the table, this primary key can consist ...)

--Q4-) Add one Column Name  as Store_Names and insert the records given above in Stores table.

ALTER TABLE STORES_TABLE 
ADD STORE_NAME varchar(100)

--Q5--Make Stored_Id as a Foreign Key with reference too Orders_Table 
ALTER TABLE STORES_TABLE
ADD FOREIGN KEY (STORE_ID) REFERENCES ORDER_TABLE

--Q6-Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
SELECT * FROM ORDER_TABLE

--Q7--Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

SELECT * FROM STORES_TABLE
--Q8--Rename the column name  of Assortment to Store_Nos in Stores_Table.

EXEC sp_rename 'STORES_TABLE.ASSORTMENT', 'STORE_NOS', 'COLUMN'

---Q9-- Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table
EXEC SP_RENAME 'ORDER_TABLE.ORDER_ITEM', 'ITEM_NAME','COLUMN'
EXEC SP_RENAME 'ORDER_TABLE.REP', 'CUSTOMER_NAME','COLUMN'

--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.

SELECT * FROM ORDER_TABLE
ORDER BY UNIT_COST DESC , TOTAL_PRICE ASC 

--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.


EXEC SP_RENAME 'ORDER_TABLE.CUSTOMER_NAME', 'CUS_NAME','COLUMN'
SELECT Region, COUNT(cus_name) AS NumberOfCustomers
FROM Order_Table
GROUP BY Region;

-- Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table --
SELECT SUM(TOTAL_PRICE + UNIT_COST) FROM ORDER_TABLE

SELECT SUM(TOTAL_PRICE) FROM ORDER_TABLE
SELECT SUM(UNIT_COST) FROM ORDER_TABLE

SELECT * FROM ORDER_TABLE
SELECT * FROM STORES_TABLE

--Q13-) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.


SELECT
    T1.ORDER_DATE,
    T1.UNIT_COST,
    T2.STORE_TYPE,
    T2.YEAR
FROM
    ORDER_TABLE AS T1
INNER JOIN
    STORES_TABLE AS T2
ON
    T1.ORDER_ID = T2.Store_ID

--Q14--Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9


SELECT ITEM_NAME, REGION
FROM ORDER_TABLE
WHERE ORDER_ID IN (4, 5, 6, 9);

--Q15--) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
SELECT * FROM STORES_TABLE

SELECT YEAR FROM STORES_TABLE
WHERE COMPETITIONDISTANSE IN (29910, 310, 3160);

--Q 16--Give me that Item_name whose  Total_Price is greater than 200 and less than 400

SELECT * FROM ORDER_TABLE

SELECT ITEM_NAME FROM ORDER_TABLE
WHERE
TOTAL_PRICE > 200 AND TOTAL_PRICE < 400;

--Q 17-) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

SELECT SUM(COMPETITIONDISTANSE) AS CD FROM STORES_TABLE

--Q18-) What is the Total Count of Stores_Type and CD columns

SELECT
    COUNT(STORE_TYPE) AS TOTAL_COUNT_Store_STORE_TYPE,
    COUNT(COMPETITIONDISTANSE) AS TOTAL_COUNT_COMPETITIONDISTANSE
FROM STORES_TABLE;

--Q19-) Apply the Cross Join in  Orders_Table and Stores_Table.
 
 SELECT * FROM ORDER_TABLE
 CROSS JOIN STORES_TABLE
 
 --Q20-DROP both the databases

 DROP DATABASE ORDER_STORES_DATA