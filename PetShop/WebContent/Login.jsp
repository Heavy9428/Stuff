<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Welcome to the Online Pet Shop</title>
</head>
<body>
<h1 style = "color:blue; border-bottom: 5px solid black"> Java Pet Store Project
<input type="text" name="Search">
<input type = "submit" value ="Search">
</h1>
<p align ="right" style="border:3px; border-style:solid; border-color:#008000; padding:3em; box-sizing:border-box; width:400px;float:right"></p>
<form action="Login" method="post">
<pre> 


Sign In? or <a href="http://localhost:8080/PetShop/Reg.jsp">Register</a>
UserName: <input type="text" name ="name">
Password: <input type="text" name="password">
		  <input type="submit" value="Login">
		  

</pre>
</form>



<p  style="border:3px; border-style:solid; border-color:#FF0000; padding:3em; box-sizing:border-box; width:200px;float:left;">
<a href="http://localhost:8080/PetShop/Animals.jsp?value=Birds">Birds</a>
<a href="http://localhost:8080/PetShop/Animals.jsp?value=Cats">Cats</a>
<a href="http://localhost:8080/PetShop/Animals.jsp?value=Dogs">Dogs</a>
<a href="http://localhost:8080/PetShop/Animals.jsp?value=Fish">Fish</a>
<a href="http://localhost:8080/PetShop/Animals.jsp?value=Reptiles">Reptiles</a>


</p>
</body>
</html>