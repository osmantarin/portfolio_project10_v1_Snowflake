-- ********************************** TASK 4 : Extract First and Last Names from "Name" Column ********************************** 


-- Step 4.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

-- USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
-- USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
-- USE DATABASE COURSERA;
-- USE SCHEMA PUBLIC;



-- Step 4.2 Use SPLIT_PART() to split a Text column into 2 parts using ',' as a delimiter ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/split_part.html 
	SYNTAX : SPLIT_PART(<string>, <delimiter>, <partNumber>);
    ** Notes : <partNumber> : If the value is negative, the parts are counted backward from the end of the string.
*/

-- <Your SQL Script Here> 

