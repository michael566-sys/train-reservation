<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!-- 	// THIS JSP IS MADE MY SONGYUAN ZHANG (SZ490)
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Make Reservation</title>
	</head>
	<body>
	
		      
		   
		   
			<h3>Make Reservation</h3>
	
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
 
	// Display all avaliable train schedules 
				out.println("<h2>All avaliable Train Schedules</h2>");

			
				Statement st1 = con.createStatement();	    
			
				
				ResultSet rs1 = st1.executeQuery("select Transit_line_name, Fare, Origin_station_ID, Destination_station_ID, Train_ID, Origin_Departure_datetime, Dest_Arrival_datetime from Train_Schedule_Origin_Destination_Contains_Train;");
				
out.print("<table>");		
	    		
	    		out.print("<tr>");
	    		
	    			out.print("<th>Transit_line_name 	</td>");
	    			out.print("<th>Fare 	</td>");
	    			
	    			out.print("<th>Train_ID 	</td>");
	    			out.print("<th>Origin_station_ID 	</td>");
	    			out.print("<th>Origin_Departure_datetime 	</td>");
	    			out.print("<th>Destination_station_ID 	</td>");

	    			out.print("<th>Dest_Arrival_datetime 	</td>");

	    			
	        		out.print("</tr>");
			
				while (rs1.next()) {
					
					out.print("<tr>");
						out.print("<td>");
							out.print(rs1.getString("Transit_line_name"));
						out.print("</td>");
						
						out.print("<td>");
							out.print(rs1.getInt("Fare"));
						out.print("</td>");
						out.print("<td>");
							out.print(rs1.getInt("Train_ID"));
						out.print("</td>");
										
						out.print("<td>");
							out.print(rs1.getString("Origin_station_ID"));
						out.print("</td>");
						
						out.print("<td>");
							out.print(rs1.getString("Origin_Departure_datetime"));
						out.print("</td>");
									
						out.print("<td>");
							out.print(rs1.getString("Destination_station_ID"));
						out.print("</td>");
						
						out.print("<td>");
							out.print(rs1.getString("Dest_Arrival_datetime"));
						out.print("</td>");
						
					out.print("</tr>");
				}
	    		
	out.print("</table>");		
	    		
	    		st1.close();
	    		rs1.close();
	    		
	    	/* 	
	    		
				Statement st2 = con.createStatement();	    

				ResultSet rs2 = st2.executeQuery(" ");
				
				

				 */
				
	    		
				
	        		db.closeConnection(con);

			        		
					%>
					
			
			    
	<!-- 	<section>

		<h2>Select a TrainLine, Origin Station, and Destination Station to Reserve</h2>"
			<form action="createReservation.jsp" method="post">
				<label for="trainLineName">Train Line Name:</label>
  				<input name="trainLineName" type="text"/>
  
  				<label for="originStation">Origin Station:</label>
  				<input name="originStation" type="text"/>
  	
				<label for="destinationStation">Destination Station:</label>
				<input name="destinationStation" type="text"/>	
				<br>			
				<button>Create</button>
			</form>
		</section>
			    
			    
			<form action="manageReservation.jsp" method="POST">
				<button>Return back to Reservation Home Page</button>
     	</form>
     	 -->
     	
     	 
   
   
   
     <form action="insertReservation.jsp" method="post">
	     <h5>Reservation</h5>
	     
	  	<select required name="bookingFeeType"  >
	  	<option value='single' >One Way Trip</option>
	    <option value='round'>Round Trip</option>
	   
	    </select><br>
	    
	  
	  <input type="hidden" name="numRows" value =1>
	  <br>
	     <table name="table">
	     <tr>
	     <td>
	     <label for="transitLine1"> Transit Line Name</label>
		<input required name="transitLine1" type="text"/>
		</td>
	
	
	    <td>
	    		<label for="originId1"> Origin Station Id</label>
	        	<input required name="originId1" type="text"/>
		</td>
		<td>	
				<label for="destId1"> Destination Station Id</label>	
		    	<input required name="destId1" type="text"/>
	    </td>

		<td>
			<select required name="discount1" >
			<option value='none'>None of the Above</option>
		    <option value='child'>Child</option>
		    <option value='senior'>Senior</option>
		    <option value='disabled'>Disabled</option>
	    </select>
	    </td>
		</tr>
	     </table>
	  
	     <button  name="statement2" type="submit">Submit</button>
     </form>
     	
     	
		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>