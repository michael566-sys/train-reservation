<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!-- // THIS JSP IS MADE MY SONGYUAN ZHANG 
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Register an Account Page</title>
	</head>
	<body>
	
	
				<form action="checkRegister.jsp" method="POST">
			    Username: <input type="text" name="username"/> <br/>
			    Password:<input type="password" name="password"/> <br/>
			    First Name:<input type="text" name="first_name"/> <br/>
			    Last Name:<input type="text" name="last_name"/> <br/>
			   	Email Address: <input type="text" name="email"/> <br/>
			   				    
			    <input type="submit" value="Submit"/>
			    </form>
	

	</body>
</html>