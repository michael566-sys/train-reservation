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
			    String fn = request.getParameter ("first_name");
			    String ln = request.getParameter ("last_name"); 
			    String em = request.getParameter ("email") ;

/*			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db-group10.cfvzree0o6qn.ap-southeast-1.rds.amazonaws.com:3306/TrainReservationServices",
			    		"admin", "attackontitan");
*/

	
			    Statement st1 = con.createStatement();
			    Statement st2 = con.createStatement();
			    Statement st3 = con.createStatement();
				ResultSet rs1 = st1.executeQuery("select * from Customers where username='" + userid /*+ "' and password='" + pwd */+ "';");
				ResultSet rs2 = st2.executeQuery("select * from Employee_Customer_Rep where username='" + userid /*+ "' and password='" + pwd */+ "';");
				ResultSet rs3 = st3.executeQuery("select * from Employee_Site_Manager where username='" + userid /*+ "' and password='" + pwd */+ "';");
				    	
					
					
				if (rs1.next()||userid==""||pwd==""||rs2.next()||rs3.next()) {
					
					rs1.close();
			    	rs2.close();
			    	rs3.close(); 
			    	st1.close();
			    	st2.close();
			    	st3.close();
			    	db.closeConnection(con);
			    	
					
			    	out.println("<p>User already exists or is invalid. You may login or create an account with a different username.</p>");
	//		        out.println("<button onclick=\"window.location.href='insertToDB.jsp';\">Try Again</button><br><button onclick=\"window.location.href='login.jsp';\">Log In</button>");
			        out.println("<a href='register.jsp'>try again</a> <br> <a href='login.jsp'>Log In</a>");


				} else if ( em != "" && fn != "" && ln != "" && userid != "" && pwd != "" ) {
					Statement st = con.createStatement();


					st.executeUpdate("insert into Customers ( Email_Address, First_Name, Last_Name, Username, Password) values ('" + em + "', '" +fn + "','" + ln + "','" + userid + "','" + pwd + "');");
					
					

			    	rs1.close();
			    	rs2.close();
			    	rs3.close(); 
			    	st1.close();
			    	st2.close();
			    	st3.close();
			    	st.close();

			    	db.closeConnection(con);
			    	
			        out.println("Account created, " + userid +  " registered as a Customer");
			        out.println("<br><a href='login.jsp'>Log in</a>");
					

			    } else {

			    	rs1.close();
			    	rs2.close();
			    	rs3.close(); 
			    	st1.close();
			    	st2.close();
			    	st3.close();
			    	db.closeConnection(con);
			    	
			    	out.println("<p>Please fill in all the information required. You may login or enter information again.</p>");
			        out.println("<a href='register.jsp'>try again</a> <br> <a href='login.jsp'>Log In</a>");
	
			    	
			    }
			    
			    	
					%>

		
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>