<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<!-- // THIS JSP IS MADE MY SONGYUAN ZHANG
 -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Home Page</title>
	</head>
	
	<body>
	
	     <p>Welcome to Search And Browse Page for Customer</p>
	
	
		
	<!-- 	search for train schedules by origin, destination, date of travel (5 points)
[] browse the resulting schedules (5 points)
[] see all the stops a train will make, fare etc.
[] sort by different criteria (by arrival time, departure time, fare) (5 points)
 -->

		<section>

			<h1>Search for Train Schedules</h1>
			<% out.println("Please input origin ID, To Search and Browse Train Schedules,please press the following:"); %>	
			<form action="searchTrainSchedules.jsp" method="post">
				<label for="origin">Origin ID:</label>
  				<input name="origin" type="text"/>
  
  				<label for="destination">Destination ID:</label>
  				<input name="destination" type="text"/>
  	
				<label for="dateOfTravel">Date of Travel (YYYY-MM-DD):</label>
				<input name="dateOfTravel" type="text"/>	
				<br>			
				<button>Search</button>
			</form>
		</section>
	
	<section>
			
			<h1>Sort by Different Criteria (arrival time, departure time, fare) </h1>
			<form action="sortByDifferentCriteria.jsp" method="post">
				
				<label for="sortBy">Sort by:</label>

				<select name="sortBy">
  					<option value="arrivalTime">Arrival Time</option>
 					<option value="departureTime">Departure Time</option>
  					<option value="fare">Fare</option>
				</select>
				
				<label for="orderBy">Order by:</label>

				<select name="orderBy">
  					<option value="ascend">Ascend</option>
 					<option value="descend">Descend</option>
				</select>
				<br>
				<button>Search</button>
			</form>
		</section>
		
		<form action="CustomerHome.jsp" method="POST">
				<button>Return back to Customer Home Page</button>
     	</form>
		
	
		
	</body>
</html>
</body>
</html>