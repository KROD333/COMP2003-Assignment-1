/* Assignment 1 Submission
Date: 1/31/2025
Group 3	    
Student Name 		Student Number
Kevin Rodriguez		200563852
Roshan G C		200614949
Tobiloba Olayoriju 	200565955
Sumit Rokaya 		200597554
Shota Uchikawa 		200613595
	
*/

# **** Tips - You can remove this section when submitting ****
# Use comments to indicate the question number that each statement addresses.
# See the format provided for Q1 - Q2 to format the remainder of your SQL script
# Use proper SQL Standards when formatting your script

Kevin. R
-- This will create the main database for the script with the name barrie_weather_db.
CREATE DATABASE barrie_weather_db; 

Kevin. R
-- This will ensure that all queries will be executed in the created database.
USE barrie_weather_db;

Shota. U
-- This will explain how the provided CREATE TABLE statement could be improved.
/* 
We can add size parameter for text, int, and double to specify the maximum column length in bytes. 
*/

Shota. U
-- This will explain how we could resturucture this commands.
/*
This INSERT statements is used Single-row insert. So, we can use Multi-row insert, which can insert several rows at one time with one INSERT statement, to run faster.
For example:
INSERT INTO `barrie_weather` (`longitude`, `latitude`, `station_name`, `climate_ID`, `date_time`, `year`, `month`, `day`, `time`, `temp`, `temp_flag`, `dew_pt`, `dew_pt_flag`, `rel_hum`, `rel_hum_flag`, `wind_dir_10d`, `wind_dir_flag`, `wind_spd_kmh`, `wind_spd_flag`, `visibility`, `vis_flag`, `pressure_kPa`, `pressure_flag`, `hmdx`, `hmdx_flag`, `wind_chill`, `wind_chill_flag`, `weather`) 
VALUES (-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 0:00',2019,9,1,'0:00',11.3,'',9.1,'',86,'','36','',4,'','','',99.22,'',NULL,'','','','NA'),
(-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 1:00',2019,9,1,'1:00',10.7,'',9.2,'',91,'',NULL,'M',0,'','','',99.21,'',NULL,'','','','NA'),
(-79.55,44.48,'BARRIE-ORO',6117700,'9/1/2019 2:00',2019,9,1,'2:00',10.7,'',8.9,'',88,'','2','',3,'','','',99.2,'',NULL,'','','','NA');
*/

