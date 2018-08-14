<%@page import="java.util.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%> 
<%@page import = "java.sql.Statement"%> 
<%@page import = "java.sql.Connection"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Animals JSP</title>
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
		 	 Statement stmt = myconn.createStatement();	
		 	 String value =(String)request.getParameter("value");
		 	 String animal = value;
		 	 String sql = "Select Breed, Descri From "+ animal;
		 	 ResultSet rs = stmt.executeQuery(sql);
		 	 while(rs.next()){
		 	%>
		 		
		 		<div class="w3-padding-16">
		 		<a href = "http://localhost:8080/PetShop/Cart.jsp?value=<%=rs.getString("Breed")%>&value1=<%=animal%>"><b><%=rs.getString("Breed")%></b></a>
		 		<br>
		 		<b><%=rs.getString("Descri")%></b>
				</div>
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