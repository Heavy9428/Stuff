<%@page import="java.util.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Login.User"%>
<%@page import="com.Connection.Connections" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Animals</title>
	</head>
	<body>
		<div class="w3-container w3-border-bottom w3-margin">
			<h1>Java Pet Store</h1>
			<%User currentUser=(User)(session.getAttribute("currentSessionUser"));%>
	
	
			<div class="w3-right-align">
				<a href="http://localhost:8080/petshop/Account.jsp">Account|</a>
			    <a href="http://localhost:8080/petshop/Checkout.jsp">|Cart|</a> 
			    <a href="http://localhost:8080/petshop/Logout.jsp">Log Out</a>
			</div>
		</div>
	
		<div class="w3-container">
			<div class="w3-quarter w3-border w3-border-red">
				<a href="http://localhost:8080/petshop/Animals.jsp?value=Birds">Birds</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Cats">Cats</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Dogs">Dogs</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Fish">Fish</a>
				<br /> <a href="http://localhost:8080/petshop/Animals.jsp?value=Reptiles">Reptiles</a>
			</div>
	
	
	
			<div class="w3-threequarter w3-border w3-border-red">
			

			<%
				try {
					Connection myconn = Connections.conManager();
					Statement stmt = myconn.createStatement();
					String value = (String) request.getParameter("value");
					String animal = value;
					String sql = "Select Breed, Descri From " + animal;
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
			%>

			<div class="w3-padding-16">
					<a
						href="http://localhost:8080/petshop/Cart.jsp?value=<%=rs.getString("Breed")%>&value1=<%=animal%>">
						<b><%=rs.getString("Breed")%></b></a>
						<br>
						<b><%=rs.getString("Descri")%></b>
			</div>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</div>
		</div>
		<div class="w3-container w3-teal">
		
			<p>The Java Pet Store Demo is a fictional sample application based on the Java BluePrints by Sun Microsystems used as Java training for the eCommerce division at the Exchange</p>
		</div>
	</body>
</html>