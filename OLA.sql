CREATE DATABASE Ola;
use Ola;

DESC BOOKINGS;

-- 1. retrieve all successful bookings  
 SELECT * FROM  SUCCESSFUL_BOOKINGS;
 
 -- 2.  find the avg rides distance for each vehicle type  
  SELECT * FROM VEHICLR_DISTANCES_FOR_EACH_RIDE;
 
-- 3. get the total number of canceled rides by customers 
SELECT * FROM CANCELED_RIDES_BY_CUSTOMERS_1 ;

-- 4. list the top 5 customers who booked the highest number of rides
 SELECT * FROM TOP_5_CUSTOMERS;

-- 5. get the number of rides canacelled by drieves due to personal and car- related issues
SELECT *  FROM CANELLED_RIDES_BY_DRIVER_p;

-- 6. find the maximum and minimum drivers ratings for prime sedan bookings
SELECT * FROM MAX_MIN_RATING_IN_PRIME_SEDAN;

-- 7. retrieve all rides where payment was made using UPI
SELECT * FROM PAYMENT_BY_UPI;

-- 8. find the average customer rating per vehicle type 
SELECT * FROM CUSTOMER_RATING_PER_VEHICLES;
 
-- 9. calculate the total bookings of rides completed successfulLY
 SELECT * FROM BOOKED_RIDES_SUCCESSFULLY;
 
-- 10.list all imcomplete rides along with the reason 
  SELECT * FROM INCOMPLETE_RIDES;













-- retrieve all successful bookings  
CREATE VIEW SUCCESSFUL_BOOKINGS AS 
SELECT * FROM BOOKINGS
 WHERE BOOKING_STATUS = 'SUCCESS';
 
 SELECT * FROM  SUCCESSFUL_BOOKINGS;

 -- find the avg rides distance for each vehicle type  
 CREATE VIEW VEHICLR_DISTANCES_FOR_EACH_RIDE AS 
 SELECT VEHICLE_TYPE , avg(RIDE_DISTANCE)AS AVG_DISTANCE 
 FROM BOOKINGS 
 GROUP BY VEHICLE_TYPE ;
 
 SELECT * FROM VEHICLR_DISTANCES_FOR_EACH_RIDE;
 
-- get the total number of canceled rides by customers 
CREATE VIEW CANCELED_RIDES_BY_CUSTOMERS_1 AS 
SELECT COUNT(*) FROM BOOKINGS
 WHERE BOOKING_STATUS = 'CANCELED BY CUSTOMER';

SELECT * FROM CANCELED_RIDES_BY_CUSTOMERS_1 ;

-- list the top 5 customers who booked the highest number of rides
CREATE VIEW TOP_5_CUSTOMERS AS 
SELECT CUSTOMER_ID, count(BOOKING_ID) AS TOTAL_RIDES
 FROM BOOKINGS
 GROUP BY CUSTOMER_ID 
 ORDER BY TOTAL_RIDES DESC
 LIMIT 5;
 
  SELECT * FROM TOP_5_CUSTOMERS;
  
-- get the number of rides canacelled by drieves due to personal and car- related issues
CREATE VIEW CANELLED_RIDES_BY_DRIVER_p AS 
SELECT count(*) FROM BOOKINGS 
WHERE CANCELED_RIDES_BY_DRIVER = 'Personal & Car related issue' ;

SELECT *  FROM CANELLED_RIDES_BY_DRIVER_p;

-- find the maximum and minimum drivers ratings for prime sedan bookings
CREATE VIEW MAX_MIN_RATING_IN_PRIME_SEDAN AS 
SELECT max(DRIVER_RATINGS) AS MAX_RATING,
min(DRIVER_RATINGS) AS MIN_RATINGS FROM BOOKINGS 
WHERE VEHICLE_TYPE = 'Prime Sedan';

SELECT * FROM MAX_MIN_RATING_IN_PRIME_SEDAN;

-- retrieve all rides where payment was made using UPI
CREATE VIEW PAYMENT_BY_UPI AS
SELECT * FROM BOOKINGS
 WHERE PAYMENT_METHOD = 'UPI';

SELECT * FROM PAYMENT_BY_UPI;

-- find the average customer rating per vehicle type 
 CREATE VIEW CUSTOMER_RATING_PER_VEHICLES AS 
 SELECT VEHICLE_TYPE, avg(CUSTOMER_RATING) AS CUSTOMER_RATING
 FROM BOOKINGS 
 GROUP BY VEHICLE_TYPE;
 
 SELECT * FROM CUSTOMER_RATING_PER_VEHICLES;
 
-- calculate the total bookings of rides completed successfulLY
 CREATE VIEW BOOKED_RIDES_SUCCESSFULLY AS
SELECT SUM(BOOKING_VALUE) AS TOTAL_SUCCESSFUL_VALUE 
FROM BOOKINGS 
WHERE BOOKING_STATUS = 'Success';

 SELECT * FROM BOOKED_RIDES_SUCCESSFULLY;
 
-- list all imcomplete rides along with the reason 
CREATE VIEW INCOMPLETE_RIDES AS 
 SELECT BOOKING_ID , INCOMPLETE_RIDES_REASON 
  FROM BOOKINGS
  WHERE INCOMPLETE_RIDES = 'YES';
  
  SELECT * FROM INCOMPLETE_RIDES;
  