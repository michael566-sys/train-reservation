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
		<title>Create Employee</title>
	</head>
<body>


<%
	// Get all registration data
	String firstName = request.getParameter("name_firstname");
	String lastName = request.getParameter("name_lastname");
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String ssn = request.getParameter("ssn");
    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st5 = con.createStatement();
    ResultSet rs5 = st5.executeQuery("SELECT * from Employee_Customer_Rep where username='" + userid + "';");
    if (userid==null||pwd==null||rs5.next()) {
    	rs5.close();
    	st5.close();
    	con.close();
    	out.println("<p>Sorry that user already exists or is invalid.</p>");
        out.println("<button onclick=\"window.location.href='successAdmin.jsp';\">Go Back</button>");
              
    } else {
    	Statement st2=con.createStatement();
    	String query;
    	query = "INSERT INTO Employee_Customer_Rep(ssn, First_Name, Last_Name, Username, Password) VALUES (\'" + 
        	    ssn + "\', \'" + firstName + "\', \'" + lastName + "\', \'" + userid + "\', \'" + 
    			pwd + "\');";   			
    	st2.executeUpdate(query);
    	st2.close();
    	rs5.close();
    	st5.close();
    	db.closeConnection(con);
    	out.println("<p>Account Created!</p>");
    	out.println("<button onclick=\"window.location.href='successAdmin.jsp';\">Go Back</button>");
    }  
%>

</body>
</html>