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
		<title>Log In Status</title>
	</head>
	<body>
		<% try {%>
	
				<%
			    if ((session.getAttribute("user") == null)) {
				%>
					You are not logged in<br/>
					<a href="login.jsp">Please Login</a>
				<%} else {
					%>
					Welcome <%=session.getAttribute("user")%>, you are now at Customer Interface
					<a href='CustomerHome.jsp'>Click here to go to Customer HomePage</a>
					
					<a href='logout.jsp'>Log out</a>
					
					<%
			    }
				%>

		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>


