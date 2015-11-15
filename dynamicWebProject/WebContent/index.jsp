<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>

<div class="container">

<h1 class="center">Welcome!</h1>

<input type="button" class="alignCenter btn" onclick="location.href='login';" value="Login">
<br>
<input type="button" class="alignCenter btn" onclick="location.href='register';" value="Register">

<div class="row">

	<div class="col-lg-6">
	<h1>Username</h1>
	
	</div>
	
	<div class="col-lg-6">
	<h1>Quests</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-6">
		<h1>Friends</h1>
	</div>
	
	<div class="col-lg-6">
		<h1>Guild</h1>
	</div>
	
</div>

</div>

</body>
</html>