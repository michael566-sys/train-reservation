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
		
		
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
		
		<title>List of Reservation</title>
	</head>
<body>


<%
	String type = request.getParameter("type"); 
	String key = request.getParameter("key"); 
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	
	if(type.equals("customerName")){
	     rs= st.executeQuery("select  * from Reservation_Portfolio as res left outer join Trip_Has_Origin_Destination_Includedin as trip on trip.Reservation_number = res.Reservation_number where res.Username =\""+key+"\";;");

	}else{
		rs= st.executeQuery("select  * from Reservation_Portfolio as res left outer join Trip_Has_Origin_Destination_Includedin as trip on trip.Reservation_number = res.Reservation_number where trip.Transit_line_name =\""+key+"\"; ");
	}
	rs.beforeFirst();
	out.println("<table><tr> <th>Reservation</th> <th>Date</th> <th>Username</th>  <th>Origin</th> <th>Destination</th> <th>Transit_line</th> <th>Arrival</th> <th>Departure</th></tr>");
		while(rs.next()){
		out.println("<tr><td> "+rs.getString("Reservation_number")+"</td><td>"+rs.getString("Date")+"</td><td>"+rs.getString("Username")
		+"</td><td>"+rs.getString("Trip_Origin_Station_ID")+"</td><td>"+rs.getString("Trip_Destination_Station_ID")+"</td><td>"+rs.getString("Transit_line_name")+"</td><td>"+rs.getString("Arrival_datetime")+"</td><td>"+rs.getString("Departure_datetime")+"</td></tr>");
		}
	out.println("</table>");
	
%>

<%  
	out.println("<button onclick=\"window.location.href='successAdmin.jsp';\">Go Back</button>");
    rs.close();
	st.close();
	con.close();
%>

</body>
</html>