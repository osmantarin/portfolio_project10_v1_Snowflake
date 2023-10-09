-- ********************************** TASK 3 : Remove Unwanted Characters ********************************** 


-- Step 3.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

-- USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
-- USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
-- USE DATABASE COURSERA;
-- USE SCHEMA PUBLIC;



-- Step 3.2 Use CONCAT() to Visualize Spaces in the "NAME" COLUMN ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/concat.html 
	SYNTAX : CONCAT( <expr1> [ , <exprN> ... ] ) ;
    ** Note : the function CONCAT() is used to facilitiate extra Spaces detection 	
*/

-- <Your SQL Script Here> 



-- Step 3.3 Use TRIM() to Remove leading and trailing characters from column "NAME" ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/trim.html  
	SYNTAX : TRIM( <expr> [, <characters> ] )
	
*/

-- <Your SQL Script Here> 
