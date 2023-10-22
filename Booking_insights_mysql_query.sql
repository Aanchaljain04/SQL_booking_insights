-- Q 1. Retrieve all bookings made by user 'u1'.

SELECT *
FROM booking_table
WHERE User_id = 'u1';


-- Q 2. Find the total number of bookings for each user.

SELECT u.User_id, COUNT(Booking_id)
FROM user_table u
LEFT JOIN booking_table b ON u.User_id = b.User_id
GROUP BY u.User_id;


-- Q 3. List all users who have made hotel bookings.

SELECT DISTINCT User_id
FROM booking_table
WHERE line_of_business = 'Hotel';


-- Q 4. Calculate the total number of flight bookings.

SELECT COUNT(*) AS no_of_flight_booking
FROM booking_table
WHERE Line_of_business = 'flight';


-- Q 5. Find the most recent booking date.

SELECT MAX(booking_date) AS 'Most Recent Booking'
FROM booking_table;


-- Q 6. List all bookings made in the month of April 2022.

SELECT *
FROM booking_table
WHERE YEAR(booking_date) = 2022
  AND MONTH(booking_date) = 04;


-- Q 7. Calculate the number of bookings for each segment.

SELECT u.Segment, COUNT(Booking_date) AS no_of_booking
FROM user_table u
LEFT JOIN booking_table b ON u.User_id = b.User_id
GROUP BY u.Segment;


-- Q 8. Find the user who made the first booking.

SELECT User_id
FROM booking_table
WHERE Booking_date = (
    SELECT MIN(Booking_date)
    FROM booking_table
);


-- Q 09. Calculate the average number of bookings per month for the year 2022.

SELECT COUNT(MONTH(booking_date)) / COUNT(DISTINCT MONTH(booking_date)) AS Avg_no_of_booking_per_month
FROM booking_table;


-- Q 10. Write a query to identify users whose first booking was a hotel booking.

-- Method 1 (Using Subquery):
SELECT User_id
FROM (
    SELECT *,
        RANK() OVER (PARTITION BY user_id ORDER BY booking_date) AS rn
    FROM booking_table
) AS a
WHERE rn = 1 AND Line_of_business = 'Hotel';

-- Method 2 (Using CTE - Common Table Expression):
WITH cte AS (
    SELECT *,
        RANK() OVER (PARTITION BY user_id ORDER BY booking_date) AS rn
    FROM booking_table
)

SELECT user_id
FROM cte
WHERE rn = 1 AND Line_of_business = 'Hotel';


-- Q 11. Write a query to calculate the days between first and last booking of each user.

SELECT
    user_id,
    MAX(booking_date) AS last_booking,
    MIN(booking_date) AS first_booking,
    DATEDIFF(MAX(booking_date), MIN(booking_date)) AS no_of_days
FROM booking_table
GROUP BY user_id;


/* Q 12. Write a query to count the number of flight and hotel bookings in each of the user segments 
for the year 2022. */

SELECT User_id, 
       COUNT(CASE WHEN Line_of_business = 'Flight' THEN User_id END) AS no_of_flight,
       COUNT(CASE WHEN Line_of_business = 'Hotel' THEN User_id END) AS no_of_hotel
FROM booking_table
GROUP BY User_id;


-- Q 13. Calculate the average number of bookings per user.

SELECT COUNT(DISTINCT b.Booking_id) / COUNT(DISTINCT u.user_id) AS Avg_booking_per_user
FROM user_table u
JOIN booking_table b;


-- Q 14. Find the users who have made both flight and hotel bookings.

SELECT DISTINCT T1.User_id
FROM booking_table AS T1
JOIN booking_table AS T2
ON T1.User_id = T2.User_id
WHERE T1.Line_of_business = 'Flight'
  AND T2.Line_of_business = 'Hotel';


-- Q 15. List all flight bookings made by users in segment 's1'.

SELECT u.Segment, b.*
FROM user_table u
JOIN booking_table b
ON u.User_id = b.User_id
WHERE u.Segment = 's1'
  AND Line_of_business = 'Flight';


-- Q 16. Calculate the percentage of hotel bookings out of the total bookings.

SELECT *
FROM (
  SELECT Line_of_business, 
         COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS Percentage
  FROM booking_table
  GROUP BY Line_of_business
) AS T1
WHERE Line_of_business = 'Hotel';


-- Q 17. List all bookings made by users who have made more than 5 bookings.

SELECT *
FROM booking_table
WHERE user_id IN (
    SELECT user_id
    FROM booking_table
    GROUP BY user_id
    HAVING COUNT(*) > 5
);


-- Q 18. Find the top 10 users by number of bookings.

SELECT User_id, COUNT(*) AS booking_count
FROM booking_table
GROUP BY User_id
ORDER BY booking_count DESC
LIMIT 10;


-- Q 19. Write a query to find the total number of bookings made in each month of 2022.

SELECT MONTH(Booking_date) AS Month_,
       COUNT(*) AS No_of_bookings
FROM booking_table
WHERE YEAR(Booking_date) = 2022
GROUP BY MONTH(Booking_date);


-- Q 20. Retrieve the user who made the last booking.

SELECT User_id, Booking_date
FROM booking_table
ORDER BY Booking_date DESC
LIMIT 1;


-- Q 21. List all users who have not made any bookings in the year 2022.

SELECT u.User_id
FROM user_table u
LEFT JOIN booking_table b
ON u.User_id = b.User_id
WHERE b.User_id IS NULL;


-- Q 22. Write a sql query to count no. of users per segment,no. of users who booked flight in April 2022.

SELECT
    Segment,
    COUNT(DISTINCT u.User_ID) AS total_Users,
    COUNT(DISTINCT CASE
        WHEN Line_of_business = 'Flight' AND YEAR(Booking_date) = '2022' AND MONTH(Booking_date) = '04'
        THEN b.User_id
    END) AS Count_User_April
FROM
    booking_table b
RIGHT JOIN
    User_table u ON b.User_id = u.User_id
GROUP BY Segment;


-- I hope this is helpful!
-- Thank You :)