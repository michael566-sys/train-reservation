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

	
	     <p>Welcome to Customer Home Page</p>
		
		<h1>Search and Browse Train Schedules</h1>
	
		<% out.println("To Search and Browse Train Schedules,please press the following:"); %>
		
		
	<!-- 	search for train schedules by origin, destination, date of travel (5 points)
[] browse the resulting schedules (5 points)
[] see all the stops a train will make, fare etc.
[] sort by different criteria (by arrival time, departure time, fare) (5 points)
 -->

			<form action="searchAndBrowse.jsp" method="POST">
				<button> Search and Browse</button>
     	</form>
     	
<!--      		<form action="reserve.jsp" method="POST">
				<button>Browse the resulting schedules</button>
     	</form> -->
     	
     	
     	<h1>Reservations</h1><br>
     	     	
     	<form action="manageReservation.jsp" method="POST">
				<button> Manage Reservation</button>
     	</form>
     	
     	
    		
	
		
	</body>
</html>
</body>
</html>