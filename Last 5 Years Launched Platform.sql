CREATE TABLE education_platforms (
         platform_id INT PRIMARY KEY, 
         platform_name VARCHAR(100), 
         launch_year INT
     );
     INSERT INTO education_platforms VALUES 
         (1, 'Unacademy', 2015), 
         (2, 'Vedantu', 2016), 
         (3, 'Coursera', 2012);


SELECT * FROM EDUCATION_PLATFORMS


/*
List all online education platforms launched in the last 5 years.
*/

SELECT PLATFORM_NAME,
       LAUNCH_YEAR
FROM EDUCATION_PLATFORMS
WHERE LAUNCH_YEAR >= EXTRACT(YEAR FROM CURRENT_DATE) - 5