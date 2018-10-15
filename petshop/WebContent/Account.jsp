<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Login.User"%>
<%@page import="com.Connection.Connections"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.swing.JOptionPane"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>

</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<div class="w3-container w3-border-bottom w3-margin">
	<h1>Java Pet Store</h1>
	<div class="w3-right-align">
		<a href="http://localhost:8080/petshop/Account.jsp">Account|</a> <a
			href="http://localhost:8080/petshop/Checkout.jsp">|Cart|</a> <a
			href="http://localhost:8080/petshop/Logout.jsp">Log Out</a>
	</div>
</div>
<body>
	<div class="w3-container w3-padding-16">

		<div class="w3-quarter w3-container w3-border w3-border-green">
			<a href="http://localhost:8080/petshop/Animals.jsp?value=Birds">Birds</a>
			<br /> <a
				href="http://localhost:8080/petshop/Animals.jsp?value=Cats">Cats</a>
			<br /> <a
				href="http://localhost:8080/petshop/Animals.jsp?value=Dogs">Dogs</a>
			<br /> <a
				href="http://localhost:8080/petshop/Animals.jsp?value=Fish">Fish</a>
			<br /> <a
				href="http://localhost:8080/petshop/Animals.jsp?value=Reptiles">Reptiles</a>
		</div>


	
			<%
				/**
				 * Grabs the current user that is logged in to the Pet shop
				 */
				User currentUser = (User) (session.getAttribute("currentSessionUser"));
				if (currentUser == null) {
					JOptionPane.showMessageDialog(null, "Please Login before trying to look at the Account Page");
					response.sendRedirect("Login.jsp");
				} else {
					int ID = currentUser.getUserID();

					Connection myconn = Connections.conManager();
					String sql = "Select * from User where ID =" + ID;
					Statement stmt = myconn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
			%>

			<div class="w3-center-align">
				Name :
				<%=rs.getString("First") + " " + rs.getString("Last")%>
				<br />
			</div>
			<div class="w3-center-align">
				Email :
				<%=rs.getString("Email")%>
				<br />
			</div>
			<div class="w3-center-align">
				User Name :
				<%=rs.getString("User_Name")%>
			</div>

			<%
				}
				}
			%>
		</div>


	<div class="w3-container w3-teal">

		<p>The Java Pet Store Demo is a fictional sample application based
			on the Java BluePrints by Sun Microsystems used as Java training for
			the eCommerce division at the Exchange</p>
	</div>
</body>
</html>