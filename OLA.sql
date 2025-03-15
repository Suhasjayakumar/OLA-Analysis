select * from bookings;
alter table bookings add column Payment_Method text;
DESC bookings;
UPDATE bookings
SET Payment_Method = CASE 
    WHEN RAND() < 0.25 THEN 'Cash'
    WHEN RAND() < 0.5 THEN 'Card'
    WHEN RAND() < 0.75 THEN 'UPI'
    ELSE 'Wallet'
END;


#Retrieve all successful bookings:
select * from bookings
where Booking_Status='success';

#Find the average ride distance for each vehicle type:
select Vehicle_Type,avg(Ride_Distance)as average_distance from bookings
group by Vehicle_Type;

#Get the total number of cancelled rides by customers:
select count(*)as cancelled_rides from bookings
where Booking_Status='Cancelled by Customer';

#List the top 5 customers who booked the highest number of rides:
select Customer_ID,count(*)as total_rides from bookings
group by Customer_ID
order by total_rides desc
limit 5;

#Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) AS cancelled
FROM bookings
WHERE `Reason_for_cancelling by Driver` = 'Personal & car related issues';

#. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings)as maximum,min(Driver_Ratings)as minimum from bookings
where Vehicle_Type='Prime Sedan';

#Retrieve all rides where payment was made using UPI:
select * from bookings
where Payment_Method='UPI';

#Find the average customer rating per vehicle type:
select Vehicle_Type,avg(Customer_Rating)as avg_customer_rating from bookings
group by Vehicle_Type;
 
#Calculate the total booking value of rides completed successfully:
select sum(Booking_value)as total_booking_value from bookings
where Booking_Status='success';

#List all incomplete rides along with the reason:
select Booking_ID,Incomplete_Rides_Reason from bookings;