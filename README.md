# **Ola Ride Analysis**

## **Project Overview**
This project aims to analyze ride booking data from **Ola**, focusing on key factors such as customer behavior, ride cancellations, vehicle performance, payment trends, and driver ratings. The insights derived will help understand ride trends and enhance operational strategies.

### **Objectives**
- Identify successful and canceled bookings.
- Analyze customer preferences for vehicle types and payment methods.
- Evaluate driver performance based on ratings.
- Understand ride cancellation reasons.
- Assess revenue and booking trends.

## **Technologies Used**
- **SQL** – For querying and extracting insights from the database.
- **DAX (Data Analysis Expressions)** – For creating Power BI measures.
- **Power BI** – For data visualization and interactive dashboards.

---

## **SQL Queries for Data Analysis**

### 1️⃣ **Retrieve all successful bookings**  
```sql
SELECT * FROM bookings  
WHERE Booking_Status = 'success';
```

### 2️⃣ **Find the average ride distance for each vehicle type**  
```sql
SELECT Vehicle_Type, AVG(Ride_Distance) AS average_distance  
FROM bookings  
GROUP BY Vehicle_Type;
```

### 3️⃣ **Get the total number of rides canceled by customers**  
```sql
SELECT COUNT(*) AS cancelled_rides  
FROM bookings  
WHERE Booking_Status = 'Cancelled by Customer';
```

### 4️⃣ **List the top 5 customers who booked the highest number of rides**  
```sql
SELECT Customer_ID, COUNT(*) AS total_rides  
FROM bookings  
GROUP BY Customer_ID  
ORDER BY total_rides DESC  
LIMIT 5;
```

### 5️⃣ **Get the number of rides canceled by drivers due to personal and car-related issues**  
```sql
SELECT COUNT(*) AS cancelled  
FROM bookings  
WHERE `Reason_for_cancelling by Driver` = 'Personal & car related issues';
```

### 6️⃣ **Find the maximum and minimum driver ratings for Prime Sedan bookings**  
```sql
SELECT MAX(Driver_Ratings) AS maximum, MIN(Driver_Ratings) AS minimum  
FROM bookings  
WHERE Vehicle_Type = 'Prime Sedan';
```

### 7️⃣ **Retrieve all rides where payment was made using UPI**  
```sql
SELECT * FROM bookings  
WHERE Payment_Method = 'UPI';
```

### 8️⃣ **Find the average customer rating per vehicle type**  
```sql
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating  
FROM bookings  
GROUP BY Vehicle_Type;
```

### 9️⃣ **Calculate the total booking value of rides completed successfully**  
```sql
SELECT SUM(Booking_value) AS total_booking_value  
FROM bookings  
WHERE Booking_Status = 'success';
```

### 🔟 **List all incomplete rides along with the reason**  
```sql
SELECT Booking_ID, Incomplete_Rides_Reason  
FROM bookings  
WHERE Booking_Status != 'success';
```

---

## **DAX Measures for Power BI**

### **1️⃣ Average Driver Rating**  
```DAX
AverageDriverRating =  
AVERAGE (Bangalore_Booking_Data[Driver_Ratings])
```

### **2️⃣ Handling Errors in Driver Ratings Calculation**  
```DAX
AverageDriverRating =  
AVERAGEX (Bangalore_Booking_Data, IFERROR(VALUE(Bangalore_Booking_Data[Driver_Ratings]), 0))
```

---

## **Conclusion**
This analysis provides key insights into ride bookings on Ola, including:
- Preferred vehicle types and payment methods.
- Trends in successful and canceled bookings.
- Factors influencing ride cancellations.
- Customer and driver performance metrics.
- Overall revenue generated from bookings.

The data can be visualized using Power BI for better business decision-making. Future enhancements may include predictive modeling for ride demand, pricing optimization, and driver-customer engagement strategies.

🚀 **Future Scope:**
- Implement machine learning for ride demand forecasting.
- Identify peak hours and surge pricing effects.
- Improve driver allocation strategies for better service efficiency.
