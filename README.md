# train-schedule-reservation-platform
Use AWS, MySQL, and ec2 to create a website that allow customers to browse and reserve train schedules. Java, HTML are implemented for the code

link to the webpage: http://ec2-54-179-144-39.ap-southeast-1.compute.amazonaws.com:8080/cs336Group10/


# Details
Group project for CS336 at Rutgers University with 2 other members.
We came up with the Entity Relation diagram and create schemas in AWS database via MySQL workbench together. 
We also manages our funcationality on Tomcat which is connected to AWS database via EC2. 

I am in charge of the following functions (all the codes displayed include solely the following functionalities):

I. Account functionality
- Register customers
- Login (for all customers)
- Logout (for all customers)

II. Browsing and search functionality
- search for train schedules by origin, destination, date of travel
- browse the resulting schedules
- see all the stops a train will make, fare etc.
- sort by different criteria (by arrival time, departure time, fare)

III. Reservations
- a customer should be able to make a reservation for a specific route (round-trip/one
way)
- get a discount in case of child/senior/disabled
- cancel existing reservation
- view current and past reservations with their details

# Testing Details

-Customers			

 Username: JB1,
 Password: 1234,
 First_name: Jason,
 Last_Name: Bourne,
 Email_Address: jasonbourne@gmail.com

 Username: JB2,
 Password: 1234,
 First_name: James,
 Last_Name: Bond,
 Email_Address: jamesbond@gmail.com

-Train schedule:

Line1: 
 Origin: sid1,
 Stop: sid2,
 destination: sid3,
 train_ID: 1003

Line2: 
 Origin: sid4,
 Stop: sid5,
 destination: sid6,
 train_ID: 1004

Line3: 
 Origin: sid7,
 Stop: sid8,
 destination: sid9,
 train_ID: 1005


-Reservation:
By transit line:
 Transit_line_name: line1,
 Transit_line_name: line2,
 Transit_line_name: line3
 
By customer name:
  Username: JB1






