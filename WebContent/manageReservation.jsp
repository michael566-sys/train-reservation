<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%-- <%@ page import="java.time.format.DateTimeFormatter";  %>
<%@ page import="java.time.LocalDateTime";   %>
 --%>

			<%@ page import ="java.sql.*" %>
<!-- // THIS JSP IS MADE MY SONGYUAN ZHANG 
 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Reservation Home Page</title>
	</head>
	
	<body>
	
	     <p>Reservation Home Page</p>
		
	
     	
     	<h2>Reservations</h2><br>
<!-- 	     view reservation	-->
     	
     	<h3>Make Reservations: </h3>
     	
     	<form action="makeReservation.jsp" method="POST">
				<button> Make Reservation</button>
     	</form>
     	
<!-- 	     cancel reservation	-->
 		<h5>Cancel Reservation</h5>
		
		<form action="cancelReservations.jsp" method="post">
			<p>Please enter the reservation number:
			<input required name="reservationNumber" type="text"/>
			</p> <br>
			<button type="submit">Continue</button>
		</form>
		
     
     	
     	<% 
// ----------------starting from here, view the current and past schedules--------------------------------------------
    	//get username of the current user 
		if ((String) session.getAttribute("user") == null) {
			String redirectURL = "http://localhost:8080/Login/login.jsp";
			response.sendRedirect(redirectURL);
		}
     	
     	%>
	
				
				<h2>Current Reservations</h2>
	
		<%
		
		/* 
		* Copied from Ronak's code on the "reservations.jsp" sheet
		* This code should get a list of all reservations of the user
		*/
		
		
		try {
			// get username of current user
			String username = (String) session.getAttribute("user");
			
			// get the date and time right now 
 		 /* 	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();   
		
			
			
			String date = dtf.format(now);  */
			
/* 			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df1.format(new java.util.Date()); 
			*/
			
/* 			String date = "2020/08/08 06:30:40.0";
 */			
			
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df1.format(new java.util.Date()); 

	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			
			
/* 	-------start of view current-----------
			 */	
			Statement st1 = con.createStatement();	    
	


			String query1 = "select * from Customers AS C join Reservation_Portfolio AS R using (Username)"
			 +" join Trip_Has_Origin_Destination_Includedin AS H using (Reservation_number)"
			 +" join Train_Schedule_Origin_Destination_Contains_Train AS S using (Transit_line_name)"
			+"join Train AS T on (S.Train_ID = T.ID)"
			 +" where username = '" + username + "'" 
			 +" and S.Origin_Arrival_datetime >= '" + date + "'" 
			 +" order by reservation_number DESC;";
			  

			 
		/* 	 Transit_line_name, Reservation_number, Username, Email_Address, 
			 First_Name, Last_Name, Password, Date, isRoundTrip, Trip_Origin_Station_ID, 
			 Trip_Destination_Station_ID, Arrival_datetime, Departure_datetime, isChild,
			  isSenior, isDisabled, Fare, Origin_station_ID, Destination_station_ID, Train_ID,
			  Origin_Departure_datetime, Dest_Arrival_datetime, Dest_Departure_datetime,
			  Origin_Arrival_datetime, ID
			   */
			  
	
			ResultSet rs1 = st1.executeQuery(query1);
			
			out.print("<table>");
	
			out.print("<tr>");
			out.print("<th>Reservation Number</td>");
			out.print("<th>Username</td>");
			out.print("<th>Customer Name</td>");
			out.print("<th>Type of Reservation</td>");
			out.print("<th>Reservation Created</td>");
			out.print("<th>Booking Fee</td>");
			out.print("<th>Transit Line</td>");
			out.print("<th>Train ID</td>");
			out.print("<th>Origin Station ID</td>");
			out.print("<th>Destination Station ID</td>");
			out.print("</tr>");
		
			while (rs1.next()) {
				
				
				// Create row of data
				out.print("<tr>");
	
				int reservation_number = rs1.getInt("Reservation_number");
				
				out.print("<td>");
				out.print(reservation_number);
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("Username"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("First_Name") + " " + rs1.getString("Last_Name"));
				out.print("</td>");
	
				String type = "";
				if (rs1.getInt("isRoundTrip") == 1) {
					type = "Round Trip";
				} else {
					type = "Single Trip";
				}
				out.print("<td>");
				out.print(type);
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("Date"));
				out.print("</td>");
				
				int isChild = rs1.getInt("isChild");
				int isSenior = rs1.getInt("isSenior");
				int isDisabled = rs1.getInt("isDisabled");
				int isRoundTrip = rs1.getInt("isRoundTrip");

				
				double fare = rs1.getDouble("Fare");
				if (isChild == 1 ) {
					fare = fare * (1-0.25);
				}
				if (isSenior == 1 ){
					fare = fare * (1-0.35);
				}
				if (isDisabled == 1 ){
					fare = fare * (1-0.5);
				}
				if (isRoundTrip == 1) {
					fare = fare * 2.0; 	
				}
							  
				  
				  
				out.print("<td>");
				out.print(fare);
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("Transit_line_name"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("ID"));
				out.print("</td>");
	
	
				out.print("<td>");
				out.print(rs1.getString("Origin_station_ID"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs1.getString("Destination_station_ID"));
				out.print("</td>");
				
				out.print("</tr>");
				
			}
			
			out.print("</table>");

			rs1.close();
			st1.close();
/* 	-------end of view current-----------
*/				
			


/* 	-------start of view past-----------
*/
			out.print("<h2>Past Reservations</h2>");


					
			Statement st2 = con.createStatement();	    
			


			String query2 = "select * from Customers AS C join Reservation_Portfolio AS R using (Username)"
			 +" join Trip_Has_Origin_Destination_Includedin AS H using (Reservation_number)"
			 +" join Train_Schedule_Origin_Destination_Contains_Train AS S using (Transit_line_name)"
			+"join Train AS T on (S.Train_ID = T.ID)"
			 +" where username = '" + username + "'" 
			 +" and S.Origin_Arrival_datetime < '" + date + "'" 
			 +" order by reservation_number DESC;";
			  

			 
		/* 	 Transit_line_name, Reservation_number, Username, Email_Address, 
			 First_Name, Last_Name, Password, Date, isRoundTrip, Trip_Origin_Station_ID, 
			 Trip_Destination_Station_ID, Arrival_datetime, Departure_datetime, isChild,
			  isSenior, isDisabled, Fare, Origin_station_ID, Destination_station_ID, Train_ID,
			  Origin_Departure_datetime, Dest_Arrival_datetime, Dest_Departure_datetime,
			  Origin_Arrival_datetime, ID
			   */
			  
	
			ResultSet rs2 = st2.executeQuery(query2);
			
			out.print("<table>");
	
			out.print("<tr>");
			out.print("<th>Reservation Number</td>");
			out.print("<th>Username</td>");
			out.print("<th>Customer Name</td>");
			out.print("<th>Type of Reservation</td>");
			out.print("<th>Reservation Created</td>");
			out.print("<th>Booking Fee</td>");
			out.print("<th>Transit Line</td>");
			out.print("<th>Train ID</td>");
			out.print("<th>Origin Station ID</td>");
			out.print("<th>Destination Station ID</td>");
			out.print("</tr>");
		
			while (rs2.next()) {
				
				
				// Create row of data
				out.print("<tr>");
	
				int reservation_number = rs2.getInt("Reservation_number");
				
				out.print("<td>");
				out.print(reservation_number);
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs2.getString("Username"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs2.getString("First_Name") + " " + rs2.getString("Last_Name"));
				out.print("</td>");
	
				String type = "";
				if (rs2.getInt("isRoundTrip") == 1) {
					type = "Round Trip";
				} else {
					type = "Single Trip";
				}
				out.print("<td>");
				out.print(type);
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs2.getString("Date"));
				out.print("</td>");
				
				int isChild = rs2.getInt("isChild");
				int isSenior = rs2.getInt("isSenior");
				int isDisabled = rs2.getInt("isDisabled");
				int isRoundTrip = rs2.getInt("isRoundTrip");

				
				double fare = rs2.getDouble("Fare");
				if (isChild == 1 ) {
					fare = fare * (1-0.25);
				}
				if (isSenior == 1 ){
					fare = fare * (1-0.35);
				}
				if (isDisabled == 1 ){
					fare = fare * (1-0.5);
				}
				if (isRoundTrip == 1) {
					fare = fare * 2.0; 	
				}
				  
				out.print("<td>");
				out.print(fare);
				out.print("</td>");
				
				
				out.print("<td>");
				out.print(rs2.getString("Transit_line_name"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs2.getString("ID"));
				out.print("</td>");
	
	
				out.print("<td>");
				out.print(rs2.getString("Origin_station_ID"));
				out.print("</td>");
	
				out.print("<td>");
				out.print(rs2.getString("Destination_station_ID"));
				out.print("</td>");
				
				out.print("</tr>");
				
			}
			
			out.print("</table>");

			rs2.close();
			st2.close();
/* 	-------end of view past-----------
 */				
 %>
				
				
				
	
	

		<%} catch (Exception e) {
			out.print(e);
		}%>
	
     	
    				   	
		<form action="CustomerHome.jsp" method="POST">
				<button>Back to Customer Home Page</button>
     	</form>
	
		
	</body>
</html>
</body>
</html>