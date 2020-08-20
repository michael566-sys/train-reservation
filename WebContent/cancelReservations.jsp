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
		<title>Cancel Reservations</title>
	</head>
	<body>
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	

			

			if ((String) session.getAttribute("user") == null) {
				String redirectURL = "http://localhost:8080/Login/login.jsp";
				response.sendRedirect(redirectURL);
			}
			String username = (String) session.getAttribute("user");

				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
			    String reservationNumber = request.getParameter("reservationNumber");   

				Statement st1 = con.createStatement();	    

				ResultSet rs1 = st1.executeQuery("SELECT * FROM Reservation_Portfolio"
		+ " WHERE Reservation_number = '" + reservationNumber + "'"
		+ " AND Username ='" + username + "';");
			    
			    if (!rs1.next()) {
					out.println("<h3>Error: Reservation does not exist</h3>");
				} else {
					Statement st2 = con.createStatement();
					st2.executeUpdate( "delete from Reservation_Portfolio WHERE Reservation_number = '" + reservationNumber + "';");
					
					st2.close();
					out.println("<h3>Deleted Reservation number successfully" + reservationNumber + "</h3>");
				}

			
	    		
	    			st1.close();
	    			rs1.close();
				
	        		db.closeConnection(con);

			        		
					%>
			
		
		<form action="manageReservation.jsp" method="POST">
				<button>Return back to Manage Reservation Home Page</button>
     	</form>
		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>