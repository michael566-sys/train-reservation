<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%-- <%@ page import="java.time.format.DateTimeFormatter"  %>
<%@ page import="java.time.LocalDateTime"   %> --%>

<!-- // THIS JSP IS MADE MY SONGYUAN ZHANG
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Create Reservation</title>
	</head>
	<body>
		      
		   
		   
			<h3>Create Reservation</h3>
	
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	
			
			
			if ((String) session.getAttribute("user") == null) {
				String redirectURL = "http://localhost:8080/Login/login.jsp";
				response.sendRedirect(redirectURL);
			}
			
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
			    String trainLineName = request.getParameter("transitLine1");   
			    String originId = request.getParameter("originId1");
			    String destId = request.getParameter("destId1"); 
			    String discount = request.getParameter("discount1");
			    
			    String bookingFeeType = request.getParameter("bookingFeeType");
			    int bookingFeeTypeInsert= 0;
			    
			    if ( bookingFeeType.equals("round")) {
			    	
			    	bookingFeeTypeInsert = 1; 
			    }
			    
			    int isChild = 0;
			    int isSenior = 0;
			    int isDisabled = 0;
			    
			    if ( discount.equals("child")) {
			   //	discountType = "child";
			   		isChild = 1;
			    } 
			    
			    if ( discount.equals ("senior")) {
			    	
			    //	discountType = "senior";
			    	isSenior = 1;
			    	
			    } 
			    
			    if ( discount.equals("disabled")) {
			    	
			    //	discountType = "disabled";
			    	isDisabled = 1; 
			    }
			    
			   	
				Statement st1 = con.createStatement();	    
		
				ResultSet rs1 = st1.executeQuery("select t.Transit_line_name, t.Fare, t.Origin_station_ID, t.Destination_station_ID, t.Train_ID, t.Origin_Departure_datetime, t.Dest_Arrival_datetime	from Train_Schedule_Origin_Destination_Contains_Train t where t.Transit_line_name = '"+trainLineName+"';");
				
				
				
			    String trainLineNameInsert = "";
			   	String originIdInsert = "";		
			   	String destIdInsert = "";
			   	
			   	String arrivalDateTime = ""; 
			   	String departureDateTime = ""; 
			   	
			 /*    String trainLineNameInsert = rs1.getString("Transit_line_name"); 
			   	String originIdInsert = rs1.getString("Origin_station_ID");		
			   	String destIdInsert = rs1.getString("Destination_station_ID"); */
			   	
			   	
			   	
		if ( rs1.next() ) {// check if the tranist line exists 
					
				
					trainLineNameInsert = rs1.getString("Transit_line_name");
		out.println("Trains line name: " +trainLineNameInsert );
					originIdInsert = rs1.getString("Origin_station_ID");		
				   	destIdInsert = rs1.getString("Destination_station_ID");
				   	departureDateTime = rs1.getString("Origin_Departure_datetime");
				   	arrivalDateTime = rs1.getString( "Dest_Arrival_datetime");
					
					if ( !originId.equals(originIdInsert)) {//if origin is not in the trainsit line origin 
				    	
						// check if origin is inside stops 
						Statement st2 = con.createStatement();	    
						
						ResultSet rs2 = st2.executeQuery("select s.Station_ID, s.Arrival_datetime, s.Departure_datetime from Train_Schedule_Origin_Destination_Contains_Train t, Stops s where t.Transit_line_name = '"+trainLineNameInsert+"' and t.Transit_line_name = s.Transit_line_name and s.Station_ID = '" + originId + "';");
						
				    	if ( !rs2.next()) {//origin not inside stops
				    		rs1.close();
				    	  	rs2.close(); 
				    	  	st2.close (); 
				    	  	st1.close(); 
			        		db.closeConnection(con);

					    	out.println("<p>Invalid origin ID entered, please return to reservation page and try again.</p>");
					        out.println("<a href='makeReservation.jsp'>try again</a> <br> ");
		
				    	} else {//origin inside stops 
				    		
				    		originIdInsert = rs2.getString ( "Station_ID");
				    		
				    		departureDateTime = rs2.getString ("Departure_datetime");
				    	  	rs2.close(); 
				    	  	st2.close (); 
				    		
				    	}
				    	
				    	
					} //end of check origin 
						
					if ( !destId.equals(destIdInsert)) {//if destination is not in the trainsit line origin 
				    	
						// check if destination is inside stops 
							Statement st2 = con.createStatement();	    
							
							ResultSet rs2 = st2.executeQuery("select s.Station_ID, s.Arrival_datetime, s.Departure_datetime from Train_Schedule_Origin_Destination_Contains_Train t, Stops s where t.Transit_line_name = '"+trainLineNameInsert+"' and t.Transit_line_name = s.Transit_line_name and s.Station_ID = '" + destId + "';");
							
					    	if ( !rs2.next()) {//destination not inside stops
					    		rs1.close();
					    	  	rs2.close(); 
					    	  	st2.close (); 
					    	  	st1.close(); 
				        		db.closeConnection(con);
	
						    	out.println("<p>Invalid destination ID entered, please return to reservation page and try again.</p>");
						        out.println("<a href='makeReservation.jsp'>try again</a> <br> ");
			
					    	} else {//destination inside stops 
					    		
					    		
					    		destIdInsert = rs2.getString ( "Station_ID");
					    		
								arrivalDateTime = rs2.getString ("Arrival_datetime");
					    	  	rs2.close(); 
					    	  	st2.close (); 
					    	}
							
					}//end of check destination 
						
	 } else {// if the tranist line does not exist
			
						out.println ("Transit line name does not exist");
						out.println("<p>please return to reservation page and try again.</p>");
				        out.println("<a href='makeReservation.jsp'>try again</a> <br> ");
	
						
	}// end of whole checking 
				
			   	
	    
			   
		// get a unique reservatio number 	    
				String reservationNumber = "";

			    
	// Display all avaliable train schedules 
				out.println("<h2>All avaliable Train Schedules</h2>");

			
				Statement st3 = con.createStatement();	    
			
				ResultSet rs3 = st3.executeQuery("select max(r.Reservation_number) as MaxNum from Reservation_Portfolio r where r.Reservation_number=( select max(Reservation_number) from Reservation_Portfolio);");

				rs3.next();
				String maxNum = rs3.getString("MaxNum");
/* 				out.println("maxNum: " + maxNum);
 */				        		
				if (maxNum ==null) {
/* 					out.println("maxNum is null ");
 */
					reservationNumber = new String( "1");

				}else {
					reservationNumber = new String (Integer.toString(Integer.parseInt(maxNum)+1)) ; 

				}    		

				/* if (!rs3.next()) {
					
					reservationNumber = new String( "001");

					
				} else {
					
					
					String maxNum = rs3.getString("MaxNum");   
					
					if (maxNum.equals(null)) {
						reservationNumber = new String( "001");

					}else {
						reservationNumber = new String (Integer.toString(Integer.parseInt(maxNum+1))) ; 
	
					}
					
					
					
				} */
				
				out.println("curernt reservation number: " + reservationNumber);
				out.println("<br><br>");

				rs3.close();
				st3.close();
				
			/* 	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df.format(new java.util.Date());
				
				
				DateTimeFormatter df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df.format(new java.util.Date()); 
				*/
				
				// generate date and time now 
				/* DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				
				String date = dtf.format(now);  */
				
			/* 	DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df1.format(new java.util.Date()); */
				
				DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df1.format(new java.util.Date()); 
				
/* 				String date = "2020/08/08 06:30:40.0";
 */
				
				Statement st4 = con.createStatement();	    

				
				String username = (String) session.getAttribute("user");

				

				st4.executeUpdate("insert into Reservation_Portfolio values ( '" + reservationNumber+ "','" +  date+ "','" + username + "','" + bookingFeeTypeInsert +"');");
				
				st4.close(); 
/* 	originIdInsert = rs2.getString ( "Station_ID");
	    		
	    		departureDateTime = rs2.getString ("Departure_datetime");
				        		
	    		destIdInsert = rs2.getString ( "Station_ID");
	    		
				arrivalDateTime = rs2.getString ("Arrival_datetime");   	 */
				
				
				
				
				Statement st5 = con.createStatement();	    

				 st5.executeUpdate ("insert into Trip_Has_Origin_Destination_Includedin values ( '" + reservationNumber+ "' , '" +  originIdInsert+ "' , '" + destIdInsert + "','" + trainLineNameInsert + "','" +arrivalDateTime+"','"+ departureDateTime+"','" + isChild+"','"+ isSenior+"','" + isDisabled +"');");
				
	/* 					
			    String trainLineNameInsert = "";
			   	String originIdInsert = "";		
			   	String destIdInsert = ""; */
			   	
			   	
			   	st5.close();
			   	rs1.close();
			   	st1.close();
			 
			   	
			   	
			out.println("Reservation " + reservationNumber + "Reserved Successfully," 
					+ "return back to Reservation Home Page to view current and past reservations");

			   	%>
			   	
		<form action="manageReservation.jsp" method="POST">
				<button>Back to Reservation Home Page</button>
     	</form>
		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>