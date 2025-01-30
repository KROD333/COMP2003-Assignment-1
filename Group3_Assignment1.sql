/* Assignment 1 Submission
Date: 1/31/2025
Group 3	    
Student Name 		Student Number
Kevin Rodriguez		200563852
Roshan G C			200614949
Tobiloba Olayoriju 	200565955
Sumit Rokaya 		200597554
Shota Uchikawa 		200613595
	
*/

# **** Tips - You can remove this section when submitting ****
# Use comments to indicate the question number that each statement addresses.
# See the format provided for Q1 - Q2 to format the remainder of your SQL script
# Use proper SQL Standards when formatting your script

-- Q1(Kevin): This will create the main database for the script with the name barrie_weather_db.
CREATE DATABASE barrie_weather_db; 

-- Q2(Kevin): This will ensure that all queries will be executed in the created database.
USE barrie_weather_db;

-- Q3(Kevin): This successfully creates the barrie_weather table populated with the necessary data.
(--insert barrie weather script)

-- Q4(Shota):This will explain how the provided CREATE TABLE statement could be improved.
/* 
We can add size parameter for text, int, and double to specify the maximum column length in bytes. 
*/

-- Q5(Shota): This will explain how we could resturucture this commands.
/*
This INSERT statements is used Single-row insert. So, we can use Multi-row insert, which can insert several rows at one time with one INSERT statement, to run faster.
For example:
INSERT INTO `barrie_weather` (`longitude`, `latitude`, `station_name`, `climate_ID`, `date_time`, `year`, `month`, `day`, `time`, `temp`, `temp_flag`, `dew_pt`, `dew_pt_flag`, `rel_hum`, `rel_hum_flag`, `wind_dir_10d`, `wind_dir_flag`, `wind_spd_kmh`, `wind_spd_flag`, `visibility`, `vis_flag`, `pressure_kPa`, `pressure_flag`, `hmdx`, `hmdx_flag`, `wind_chill`, `wind_chill_flag`, `weather`) 
VALUES (-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 0:00',2019,9,1,'0:00',11.3,'',9.1,'',86,'','36','',4,'','','',99.22,'',NULL,'','','','NA'),
(-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 1:00',2019,9,1,'1:00',10.7,'',9.2,'',91,'',NULL,'M',0,'','','',99.21,'',NULL,'','','','NA'),
(-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 2:00',2019,9,1,'2:00',10.7,'',8.9,'',88,'','2','',3,'','','',99.2,'',NULL,'','','','NA');
*/


-- Q6(Shota): This will select all data for every hour of data where the temperature (temp) was greater than 26.5 and the number of rows returned.
SELECT * FROM barrie_weather WHERE temp > 26.5;
/*
SELECT COUNT(*) FROM barrie_weather WHERE temp > 26.5;
*/


-- Q7(Shota): This will select the date_time, temp, pressure_kPA and wind_spd_kmh for every hour of data where the temperature was 24 or less and the air pressure was greater than 96.83, and the number of rows returned.
SELECT date_time, temp, pressure_kPa, wind_spd_kmh FROM barrie_weather WHERE temp <= 24 AND pressure_kPa > 96.83;
/*
SELECT COUNT(*) FROM barrie_weather WHERE temp <= 24 AND pressure_kPa > 96.83;
*/

/*Q.8(Sumit): Select the date and time (date_time), temperature (temp) and temperature flag (temp_flag)
columns for every hour where temperature data has been marked as missing using an ‘M’
value in the temp_flag column.
In the report, record the date and time.
*/
SELECT date_time, temp, temp_flag
FROM barrie_weather
WHERE temp_flag = 'M';

/*This statement shows date, time, temperature and temperature flag where the temperature flag is 'M'. 
*/

/*Q.9(Sumit): Return the same results as in Question 8, except construct the query to return both ‘M’ and
‘Missing’ values. 
*/
SELECT date_time, temp, temp_flag
FROM barrie_weather
WHERE temp_flag LIKE 'M' OR temp_flag LIKE 'Missing';

/* This statement returns the same data as Q8 along with the 'Missing' values as well.
*/

/*Q.10(Roshan): Count (SELECT COUNT) the number of hours contained in this dataset, where the dew point
temperature (dew_pt) is greater than one.
*/
SELECT COUNT(*) 
FROM barrie_weather
WHERE dew_pt > 1;

/* This sql query counts the number of hours contained in the the table where dew point temperature is not singular and exceeds 1.
*/

/*Q.11(Roshan): Count the number of hours that the wind was blowing (wind_spd_kmh is greater than 0)
and from a direction ranging between north and east (wind_dir_10d is between 0 and 9)
*/
SELECT COUNT(*) 
FROM barrie_weather
WHERE wind_spd_kmh > 0
AND wind_dir_10d BETWEEN 0 AND 9;

/*The query counts the number of hours where the wind speed is more than 0 and
the wind direction is between north which is 0 and east which is 9.
*/

-- Roshan G C

/*Q.12(Roshan): In the report only, in Barrie what percent of the time are the conditions listed in Q11 true?
  Ans: In order to calculate the percentage of time the conditions in Q11 are true, the hours that the conditions in 
       Q11 are true is or where the wind speed is more than 0 and the wind direction is between north and east should 
       be divided by the total hours that the dataset has had a dew point temperature above 1 which is the answer for Q10.
       When the resulting number is multiplied by 100, it gives the percentage of time that the conditions for Q11 is true.
*/

/*Q.13(Tobi):Select all data for every hour of data where either the temperature (temp) is below freezing,
or wind chill (wind_chill) was below zero. Additionally, the wind speed flag (wind_spd_flag)
must indicate that there were no problems with the wind speed instrument (i.e. no M or
Missing values present)
*/
SELECT * FROM barrie_weather
WHERE (temp < 0 OR wind_chill < 0)
AND wind_spd_flag NOT IN ('M', 'Missing');
/*This query shows that where the temperature or wind chill is below freezing, also the wind speed flag shows no issues
*/

/*Q.14(Tobi):Fix the M vs Missing problem in the temperature flag field by using UPDATE to change any
instances of Missing values to just plain M.
*/
UPDATE barrie_weather
SET temp_flag = 'M'
WHERE temp_flag = 'Missing';
/*This query updates the temp_flag column to replace 'Missing' with 'M'
*/

/*Q.15(Tobi):Use an update statement to change all ' ' values in the temp_flag column to NULL (no quotes,
just the letters N-U-L-L) this will change. 
*/
UPDATE barrie_weather
SET temp_flag = NULL 
WHERE temp_flag = '';
/*The temp_flag '' after update changes empty strings to NULL using the hmdx column
*/

