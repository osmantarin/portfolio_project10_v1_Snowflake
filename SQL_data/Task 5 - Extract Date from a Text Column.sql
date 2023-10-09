-- ********************************** TASK 5 : Extract Date from a Text Column ********************************** 


-- Step 5.1 Setup the right context for your worksheet ---

/* IMPORTANT : Make Sure to setup the right context for this SQL Worksheet.
			The current role determines which operations can be performed on Snowflake objects based on the access control privileges granted to the role. 
			First select a role, then select a warehouse that the role has privileges to use. Then Select Database and the Schema.

*/ 

-- YOU CAN USE UI to setup the context OR run SQL SCRIPT BELOW : 

-- USE ROLE ACCOUNTADMIN; -- Or the same role you used to load the data. 
-- USE WAREHOUSE COMPUTE_WH; -- Or any other Virtual WAREHOUSE you can use. 
-- USE DATABASE COURSERA;
-- USE SCHEMA PUBLIC;



-- Step 5.2 Use TO_DATE() convert Text column into Date by defining the input format  ---
/* 
	DOCUMENTATION  : https://docs.snowflake.com/en/sql-reference/functions/to_date.html
	SYNTAX : TO_DATE( <string_expr> [, <format> ] );
    ** Notes : <format> Date format specifier for string_expr or AUTO, which specifies that Snowflake should automatically detect the format to use. For more information, see : 
					https://docs.snowflake.com/en/sql-reference/functions-conversion.html#label-date-time-format-conversion
*/

-- <Your SQL Script Here> 

