<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">

<div class="header">
<h1 class="headerText">MMO Database</h1>
</div>

	<nav class="squareCorners navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./index">CS485</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="./index">Home</a></li>
            <li class="active"><a href="login">Login</a></li>
            <li><a href="register">Register</a></li>
            <li><a href="admin">Admin</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
	
	<form class="form-signin" method="post" action="login">
        <h2 class="form-signin-heading center">Login</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" required autofocus>
        
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <% if (request.getAttribute("message") != null) {
    	  out.print(request.getAttribute("message"));
     	}%>
      </form>

</div>

</body>
</html>