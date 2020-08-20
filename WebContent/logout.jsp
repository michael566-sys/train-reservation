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
		<title>Log Out Page</title>
	</head>
	
	<body>
		<% out.println("Logging out"); 
		
		session.invalidate();

		response.sendRedirect("login.jsp");
		
		%>
		
	
	
	
		
	</body>
</html>
</body>
</html>