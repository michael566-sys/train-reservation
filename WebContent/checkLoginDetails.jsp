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
		<title>Insert title here</title>
	</head>
	<body>
		<% try {%>
	
			<%@ page import ="java.sql.*" %>
			<%	


				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
			    String userid = request.getParameter("username");   
			    String pwd = request.getParameter("password");
/*			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db-group10.cfvzree0o6qn.ap-southeast-1.rds.amazonaws.com:3306/TrainReservationServices",
			    		"admin", "attackontitan");
*/

	
				Statement st = con.createStatement();
				Statement st2 = con.createStatement();
				Statement st3 = con.createStatement();
				ResultSet rs = st.executeQuery("select * from Customers where username='" + userid + "' and password='" + pwd + "';");
				ResultSet rs2 = st2.executeQuery("select * from Employee_Customer_Rep where username='" + userid + "' and password='" + pwd + "';");
				ResultSet rs3 = st3.executeQuery("select * from Employee_Site_Manager where username='" + userid + "' and password='" + pwd + "';");
				
	
			    if ( rs.next() && userid != null ) {
			 		
					rs.close();
				    	rs2.close();
				    	rs3.close();
				    	st.close();
				    	st2.close();
				    	st3.close();
				    	db.closeConnection(con);
			        session.setAttribute("user", userid); 
			        out.println("welcome " + userid +  "; Logged in as Customer");
			        out.println("<a href='logout.jsp'>Log out</a>");
			        response.sendRedirect("successCustomer.jsp");
			    } /* else if ( rs2.next() && userid != null ) {
			 		
					rs.close();
				    	rs2.close();
				    	rs3.close();
				    	st.close();
				    	st2.close();
				    	st3.close();
				    	db.closeConnection(con);
			    	session.setAttribute("user", userid); 
			        out.println("welcome " + userid + "; Logged in as Customer Representative" );
			        out.println("<a href='logout.jsp'>Log out</a>");
			        response.sendRedirect("successCustomer_Rep.jsp");
			    	
			    } else if ( rs3.next() && userid != null ) {
			 		
					rs.close();
				    	rs2.close();
				    	rs3.close();
				    	st.close();
				    	st2.close();
				    	st3.close();
				    	db.closeConnection(con);
			    	session.setAttribute("user", userid); 
			        out.println("welcome " + userid + "; Logged in as Site Manager");
			        out.println("<a href='logout.jsp'>Log out</a>");
			        response.sendRedirect("successAdmin.jsp");
			        
			    } */ else {
			 		
					rs.close();
				    	rs2.close();
				    	rs3.close();
				    	st.close();
				    	st2.close();
				    	st3.close();
				    	db.closeConnection(con);
			        out.println("Invalid password <a href='login.jsp'>try again</a>");
			    } 
			   
			        		
					%>

		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>