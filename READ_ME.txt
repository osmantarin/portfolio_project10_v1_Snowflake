Scenario: We have been assigned to find the list of inactive customers (no transactions
for the past 90 days). In order to produce this list, we must first clean the data in Snowflake
using SQL functions.

1) First we create a customers table 

CREATE OR REPLACE TABLE CUSTOMERS (
  id INT AUTOINCREMENT START 1 INCREMENT 1 NOT NULL,
  Name VARCHAR(255),
  Phone VARCHAR(100),
  Email VARCHAR(255),
  Address VARCHAR(255),
  PostalZip VARCHAR(50),
  Region VARCHAR(50),
  Country VARCHAR(100),
  Company VARCHAR(255),
  LastTransaction VARCHAR(255),
  DoB VARCHAR(255)
);


2) We insert our data into the customers table:

INSERT INTO CUSTOMERS (name,phone,email,address,postalZip,region,country,Company,LastTransaction,DoB)
VALUES
  ('   Kline, Alisa T.','00448454643','tempor.bibendum@yahoo.ca','Ap #671-8278 Nec St.','8386-3377','Pernambuco','United Kingdom','','2022-09-21 23:00:00','February 10, 1996'),
  (' Whitney, Kaitlin T.','+481513245743','sapien@yahoo.org','Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland',NULL,'2022-03-15 22:11:00','January 23, 1969'),
  ('Curtis, Anthony T.   ','+448001111','ut.ipsum@yahoo.net','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company',Concat(TO_VARCHAR(current_date()),' 01:04:15'),'June 22, 1975'),
  ('000Bennett, Nasim Z.','+47169772165','elementum.sem@hotmail.org','Ap #138-7239 Integer St.','4114 DC','Mexico City','Norway','Cursus Diam At Ltd','2021-12-21 09:00:00','October 21, 1951'),
  ('Brock, Alec N.','00551366269750','enim.nunc.ut@yahoo.couk','597-548 Egestas. Rd.','2892','Vorarlberg','Brazil','Nec Ante Blandit Company','2022-10-01 12:21:00','December 30, 1999'),
  ('Golden, Lane H.','00638811661136','lacus.varius@outlook.net','518-7417 Arcu Av.','82454','San José','Philippines','Risus Associates','2022-10-01 09:44:00','September 12, 1970'),
  ('Mayer, Dominique V.','0063171546824','ipsum.phasellus@aol.edu','P.O. Box 443, 6497 Elementum, Rd.','374482','Kaluga Oblast','China','Iaculis Quis Corporation','2022-09-01 18:10:00','November 27, 1997'),
  ('Whitfield, Len F.','00521375483625','quisque.fringilla@protonmail.org','Ap #246-753 Arcu. Avenue','Y2L 5R6','Akwa Ibom','Mexico','Nec Ante Institute','2022-10-12 13:11:00','July 19, 1975'),
  ('Hyde, Angelica E.','+445508611528','odio.aliquam@hotmail.edu','Ap #671-6622 Feugiat Road','1898-8474','Hatay','United Kingdom','Magna Limited','2022-06-19 13:11:00','January 31, 1951'),
  ('Alford, Reece S.','+903069949880','vel@outlook.edu','P.O. Box 427, 691 Vel Av.','43021','Sumy oblast','Turkey','Amet Corporation','2022-07-18 13:11:00','October 20, 1967'),
  ('Huber, Nora Y.','00481515895743','noray32@yahoo.org','Ap 10 Dignissim. Rd.','65-168','Santa Catarina','Poland','LETNI','2022-05-29 23:50:00','December 23, 1999'),
  ('Tate, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates',Concat(TO_VARCHAR(current_date()),' 00:44:00'),'September 25, 1959'),
  ('T, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates','2022-11-11 13:11:00','September 25, 1959'),
  ('Kirby, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:55:45'),'December 10, 1955'),
  ('Kirbi, Shea Y.','','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2022-12-01 13:11:00','December 10, 1955'),
  ('K, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2020-04-18 13:11:00','December 10, 1955'),
  (Null,'',Null,'722-6870 Amet Road','091952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:23:45'),'December 10, 1955'),
  ('Booker, Bradley R. ','00448001111','','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company','2022-11-01 13:11:00','June 22, 1975'),
  (Null,Null,Null,'Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland','Aptent Taciti PC','2022-12-15 13:11:00','January 23, 1969'),
  ('Sandoval, Quinlan Z.','0015567878637','ut@protonmail.edu','166-7842 Eget Road','537423','Huádōng','United States','Suspendisse Foundation','2022-10-12 01:58:45','May 14, 2000'),
  ('Small, Gil U.','00317042618694','id.risus@google.ca','906-9695 Velit. Street','36362','Emilia-Romagna','Netherlands','Aliquam Gravida Associates','2022-09-22 19:29:58','March 17, 1994'),
 ('Kirby, Cameron D.','001800473297','nunc@hotmail.com','5034 Lacus. Rd.','95804','Khyber Pakhtoonkhwa','United States','Suspendisse Foundation','2022-10-22 17:02:07','December 1, 1989')



3) We verify the data was loaded correctly 

Select * from CUSTOMERS



4) We investigate the dataset for any potential issues and notice multiple columns with "NULL" and blank values 


5) We clean the name column. While investingating earlier, we noticed three issues with the name column (spaces before names, numbers with the first name, and null values). 
Our goal is to resolve the issues into a new clean column. 

SELECT NAME, TRIM(NAME, ' 0') AS N, CONCAT('>', N, '<') FROM CUSTOMERS;


6) Using the previous code, we created a nested function in order to split the raw name column into two cleaned columns containing first and last names 


SELECT NAME, SPLIT_PART(TRIM(NAME, ' 0'), ',', 1) AS First_name, SPLIT_PART(TRIM(NAME, ' 0'), ', ', 2) AS Last_name FROM CUSTOMERS;


7) Next we standardize the phone numbers column by removing leading zeros and plus signs 

SELECT PHONE, LTRIM(PHONE, '0+') AS Standardized_Phone FROM CUSTOMERS;


8) We notice two different date formats in our "DOB" and "LASTTRANSACTION" columns and decide to standardize the date format for both columns 

SELECT to_date(DOB, 'MMMM DD, YYYY'), to_date(LASTTRANSACTION, 'AUTO') FROM CUSTOMERS;


9) We convert the "LASTTRANSACTION" values into a date data type and calculate the number of days that have passed since the last transaction. 
This will help us identify the number of inactive customers (no activity greater than 90 days)

SELECT TO_DATE(LASTTRANSACTION, 'AUTO') AS LASTTRANS_DATE,
       datediff(days, TO_DATE(LASTTRANSACTION, 'AUTO'), current_date()) AS DAYSINCELASTTRANS
FROM CUSTOMERS;


10) We have almost all elements of our final code in order to answer the question we initially set out to produce:


SELECT ID,
       SPLIT_PART(TRIM(NAME, ' 0'), ', ', 1) AS FIRST_NAME,
       SPLIT_PART(TRIM(NAME, ' 0'), ', ', 2) AS LAST_NAME,
       EMAIL,
       TO_DATE(DOB, 'MMMM DD, YYYY') AS DOB,
       TO_DATE(LastTransaction, 'AUTO') AS LastTransaction,
       DATEDIFF(days, TO_DATE(LastTransaction, 'AUTO'), current_date()) AS DaysSinceLastTrans,
       LTRIM(PHONE, '0+') AS Standardized_Phone,
       ADDRESS,
       REGION,
       COUNTRY,
       COMPANY
FROM CUSTOMERS
WHERE DATEDIFF(days, TO_DATE(LastTransaction, 'AUTO'), current_date()) > 90;



11) We notice blank or missing data in two areas: the company section and the e-mail section. We use the code below to identify the areas with blank or NULL data

FROM CUSTOMERS 
WHERE EMAIL IS NULL OR EMAIL ='';


SELECT COMPANY,
IFF(COMPANY IS NULL OR COMPANY = '', 'NA', COMPANY) AS CLEAN_COMPANY
FROM Customers;

12) We also want to identify customers that have been duplicated in the dataset, such as customers with the same e-mail or company. The second line of code below ranks the data based on the
most recent transaction. Any result with a rank greater than 1 is a duplicate. We can use the second line of code to identify and remove duplicates. Note due to the syntax of snowflake, 
wee use a QUALIFY clause instead of a WHERE clause


SELECT EMAIL, COUNT(ID) FROM CUSTOMERS GROUP BY EMAIL HAVING COUNT(ID) >1;

SELECT ID,NAME,EMAIL,LASTTRANSACTION, rank() over (partition by EMAIL order by to_date(LASTTRANSACTION,'AUTO') desc) as RANK from CUSTOMERS

SELECT ID,NAME,EMAIL,LASTTRANSACTION, rank() over (partition by EMAIL order by to_date(LASTTRANSACTION,'AUTO') desc) as RANK from CUSTOMERS QUALIFY RANK =1;


13) The final code to create a new dataset with only the inactive customers (no activity for the past 90 days) is pasted below: 



CREATE OR REPLACE VIEW CUSTOMERS_VW AS (
  WITH LISTIDs AS (
    SELECT
      ID, Name, Email, LastTransaction,
      RANK() OVER (PARTITION BY email ORDER BY TO_DATE(LastTransaction, 'AUTO') DESC) RANK
    FROM CUSTOMERS
    QUALIFY RANK = 1
  )
  
  SELECT
    ID,
    SPLIT_PART(TRIM(NAME, ' 0'), ', ', 1) AS FIRST_NAME,
    SPLIT_PART(TRIM(NAME, ' 0'), ', ', 2) AS LAST_NAME,
    EMAIL,
    TO_DATE(DOB, 'MMMM DD, YYYY') AS DOB,
    TO_DATE(LastTransaction, 'AUTO') AS LastTransaction,
    DATEDIFF(days, TO_DATE(LastTransaction, 'AUTO'), CURRENT_DATE()) AS DaysSinceLastTrans,
    IFF(((COMPANY IS NULL) OR (COMPANY = '')), 'N/A', COMPANY) AS Standardized_Company,
    LTRIM(PHONE, '0+') AS Standardized_Phone,
    ADDRESS,
    REGION,
    COUNTRY
  FROM CUSTOMERS
  WHERE NOT (EMAIL IS NULL OR EMAIL = '') AND ID IN (SELECT ID FROM LISTIDs)
);


























