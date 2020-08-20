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
		<title>Sort by Different Criteria</title>
	</head>
	<body>
	
			<h3>Sort Trains Schedules by Different Criteria</h3>
	
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
			    String sortBy = request.getParameter("sortBy");   
			    String orderBy = request.getParameter("orderBy");    
			
			    
			    
			    //find name
				Statement st1 = con.createStatement();
			    
			    
				String sortByValue = "";
				String orderByValue = "";
				
				
			
				if (sortBy.equals("arrivalTime")) {
					
					sortByValue = "Dest_Arrival_datetime";
					
				} else if (sortBy.equals("departureTime")) {
					
					sortByValue = "Origin_Departure_datetime";
					
				} else {
					
					sortByValue = "Fare";
				} 
			
				if (orderBy.equals("ascend")) {	
					
					orderByValue = "asc"; 
				} else {
					
					orderByValue = "desc";
				} 

				out.println("Sort by: "+ sortByValue + "; Sort in: " + orderByValue) ;

				ResultSet rs1 = st1.executeQuery("select Transit_line_name, Fare, Origin_station_ID, Destination_station_ID, Train_ID, Origin_Departure_datetime, Dest_Arrival_datetime	from Train_Schedule_Origin_Destination_Contains_Train order by "+sortByValue +" "+  orderByValue+";");
				
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
	    		
	    		
				
	        		db.closeConnection(con);

			        		
					%>
					
					
			<form action="searchAndBrowse.jsp" method="POST">
				<button>Return back to Search and Browse Page</button>
     	</form>
		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>