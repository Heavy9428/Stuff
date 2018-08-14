	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    <%@page import = "java.sql.DriverManager"%>
	<%@page import = "java.sql.ResultSet"%> 
	<%@page import = "java.sql.Statement"%> 
	<%@page import = "java.sql.Connection"%> 
	<%@page import = "java.sql.PreparedStatement"%>  
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cart Page Test</title>
	</head>
	<body>
		<div class="w3-container w3-teal">
		  <h1>Header</h1>
		</div> 
	
		<div class="w3-container">
		
			
			<div class="w3-quarter w3-border w3-border-red">
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Birds">Birds</a>
				<br/>
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Cats">Cats</a>
				<br/>
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Dogs">Dogs</a>
				<br/>
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Fish">Fish</a>
				<br/>
				<a href="http://localhost:8080/PetShop/Animals.jsp?value=Reptiles">Reptiles</a>
			</div>
	
	
		 	
			 <div class="w3-threequarter w3-border w3-border-red">
			 <% 
			 try{
			 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			 }
			 catch(ClassNotFoundException e){
				 e.printStackTrace();
			 }%>
			
			 <%
			 try{
				 Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetShop?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago","Trebingm", "Ultima383");
				 String value =(String)request.getParameter("value");
			 	 String animal =(String)request.getParameter("value1");
			 	 PreparedStatement stmt = myconn.prepareStatement("Select Gender, Breed, Descri, Price From "+animal+" where Breed = ?");	
			 	 stmt.setString(1,value);
			 	 ResultSet rs = stmt.executeQuery(); 
			 	 while(rs.next()){
			 	%>
			 	<form action = "Cart" method="post">
			 		<div class="w3-padding-16">
			 		
			 		<b><%=rs.getString("Gender")%></b>
			 		<b><%=rs.getString("Breed")%></b>
			 		<b><%="$"+rs.getString("Price")%></b>
			 		<input type ="hidden" value = <%=animal%> name = "Animals">
			 		<input type ="hidden" value = <%=rs.getString("Breed")%> name = "items[]">
			 		<input type ="hidden" value = <%=rs.getString("Gender")%> name = "items[]">
			 		<input type ="hidden" value = <%=rs.getString("Price")%> name = "items[]">
			 		
			 		
			 		<input type="submit"  value = "Add to Cart" name = "Add to Cart">
			 				 		
			 		<br>
			 		<b><%=rs.getString("Descri")%></b>
					</div>
				</form>
			 <%
			 	}
			 }
			 catch(Exception e){
				 e.printStackTrace();
			 }
			 %>
			</div>
		</div>
		
		<div class="w3-container w3-teal">
		  <h5>Footer</h5>
		  <p>Footer information goes here</p>
		</div> 
		</body>
	</html>