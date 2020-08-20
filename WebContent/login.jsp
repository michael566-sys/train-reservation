<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!-- // THIS JSP IS MADE MY SONGYUAN ZHANG
 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Train Reservation Service Home Page</title>
	</head>
	
	<body>
	
	     <p>Group 10: Xiaoyu Sun, Michael Comatas, Songyuan Zhang</p>
	
		<% out.println("To log in as Customer, please enter the following:"); %>
		
		<form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     	</form>
		
		<% out.println("To register as a customer, please click the following:"); %>
		
		<form action="register.jsp" method="POST">
				<button>Create an Account</button>
     	</form>
	
		
	</body>
</html>
</body>
</html>