# Movie Ticket Booking Application

## Description
This Movie Ticket Booking application allows users to book movie tickets online, manage bookings, and perform administrative tasks. It is built using servlets, JAX, JRE, MySQL, and is deployed on JBoss server.

## Technologies Used
- Servlets
- JAX
- JRE
- com.admin
- com.customer
- com.connection
- MySQL
- JBoss server

## Prerequisites
- Java Development Kit (JDK)
- JBoss server
- MySQL database server

## Setup and Execution

Step 1: Clone the Repository
git clone https://github.com/yourusername/movie-ticket-booking.git
cd movie-ticket-booking

Step 2: Configure the MySQL Database
1. Create a new database in MySQL:
CREATE DATABASE mtbsdb;

2. Import the database schema from the provided SQL file:
mysql -u root -p mtbsdb < movie_booking_schema.sql

3. Verify the tables are created:
USE mtbsdb;
SHOW TABLES;

 Tables_in_mtbsdb 

 tbladmin         
 tblcaptcha       
 tblcustomer      
 tblmovie         
 tblmoviebooking  
 tblreview        

   
Step 3: 
1. Configure Database Connection
2. Open the com/connection/DBConnection.java file.
3. Update the database URL, username, and password as per your MySQL configuration.

Step 4: 
1. Deploy the Application on JBoss
2. Package the application into a WAR file using your IDE or build tool.
3. Copy the WAR file to the standalone/deployments directory of your JBoss server.
4. Start the JBoss server.

Step 5: 
1. Access the Application
2. Open your web browser.
3. Navigate to http://localhost:8080/MovieTicketBookingSystem.
4. You should see the application homepage where you can book tickets or perform administrative tasks.
