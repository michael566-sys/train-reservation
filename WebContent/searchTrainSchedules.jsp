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
		<title>Search for Train Schedules</title>
	</head>
	<body>
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
			    String origin_ID = request.getParameter("origin");   
			    String dest_ID = request.getParameter("destination");
			    String date = request.getParameter("dateOfTravel");
			    
			    
			    //find origin name
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select Station_name from Station where Station_ID='" + origin_ID + "';");
				rs.next();

				String originName = rs.getString("Station_name");
				rs.close(); 
				st.close();  
				
				//find destination name 
				Statement st1 = con.createStatement();	
				ResultSet rs1 = st1.executeQuery("select Station_name from Station where Station_ID='" + dest_ID + "';");
				rs1.next();
				
				String destName = rs1.getString("Station_name");
				rs1.close(); 
				st1.close(); 
				
				
				out.println("Schedule on " + date + " from " + originName + " to " + destName);

	    		out.print("<table>");		
	    		
	    		out.print("<tr>");
    			out.print("<th>Train Line Name</td>");

	    			out.print("<th>Origin Station ID</td>");
	    			out.print("<th>Origin Station Name</td>");
	    			out.print("<th>Destination Station ID</td>");
	    			out.print("<th>Destination Station Name</td>");
	    			out.print("<th>Date</td>");
	    			out.print("<th>Departure Time</td>");
	        		out.print("</tr>");
		    		String q1 = "SELECT a.Transit_line_name, a.Origin_station_ID, a.Destination_station_ID, a.Origin_Departure_datetime, b.Station_name AS oriName, c.Station_name AS destName FROM Train_Schedule_Origin_Destination_Contains_Train a, Station b, Station c WHERE a.Origin_station_ID = \'" + origin_ID + "\' AND a.Destination_Station_ID = \'" + dest_ID + "\' AND  b.Station_ID = \'" + origin_ID + "\' AND c.Station_ID = \'" + dest_ID +"\'";

	        		Statement st2 = con.createStatement();
	    		ResultSet rs2 = st2.executeQuery(q1);
	    		
	    		while (rs2.next()){
	    			
	    			String getDate = rs2.getString("Origin_Departure_datetime");
	    			String shortDate = getDate.substring(0,10);
	    			
	    			if (shortDate.equals(date)) {
	    				out.print("<tr>");
	    				out.print("<td>");
						out.print(rs2.getString("Transit_line_name"));
					out.print("</td>");
	    					out.print("<td>");
	    						out.print(rs2.getString("Origin_station_ID"));
	    					out.print("</td>");
	    					out.print("<td>");
	    						out.print(rs2.getString("oriName"));
	    					out.print("</td>");
	    					out.print("<td>");
	    						out.print(rs2.getString("destination_station_id"));
	    					out.print("</td>");
	    					out.print("<td>");
	    						out.print(rs2.getString("destName"));
	    					out.print("</td>");
	    					out.print("<td>");
	    						out.print(shortDate);
	    					out.print("</td>");		
	    					out.print("<td>");
	    						String getTime = rs2.getString("Origin_Departure_datetime");
	    						String shortTime = getTime.substring(11,21);
	    						out.print(shortTime);
	    					out.print("</td>");	
	    				out.print("</tr>");
	    			}
	    		}
	    		
	    		out.print("</table>");		
	    		
	    		st2.close();
	    		rs2.close();
					
	    		
	    		
				
	        		db.closeConnection(con);

			        		
					%>
<!-- 		Browsing the resulting Schedules:
 -->		<section>
			<h1>Search for Train Schedules</h1>
			<% out.println("Browsing the resulting Schedules:");
			out.println("Select one schedule by entering the Train Schedule Name in the following box to see the full details for stops, fare and station nations etc.");
			%>	
			<form action="browseResultingSchedules.jsp" method="post">
				<label for="transitLineName">Transit Line Name</label>
  				<input name="transitLineName" type="text"/>
				<br>			
				<button>Search</button>
			</form>
		</section>
					
					
					
					
		<form action="searchAndBrowse.jsp" method="POST">
				<button>Return back to Search and Browse Page</button>
     	</form>
		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>