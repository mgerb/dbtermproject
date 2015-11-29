<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
            <% if(session.getAttribute("username") != null)  {%>
            	<li><a href="logout">Logout</a></li>
            <%} else {%>
            	<li><a href="login">Login</a></li>
            <%} %>
            <li><a href="register">Register</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

	<form class="form-signin" action="subscription" method="post">
		
        <h2 class="form-signin-heading center">Subscription</h2>
        <div class="center">Subscription - $10 per month</div>
        <div class="center">Subscription lasts until cancelled</div>
        <br>
        <label for="inputCardNumber" class="sr-only">Card Number</label>
        <input name="card_number" type="text" id="inputCardNumber" class="form-control" placeholder="Card Number" required>
        
        <label for="inputCardType" class="sr-only">Card Type</label>
        <input name="card_type" type="text" id="inputCardType" class="form-control" placeholder="Card Type" required>
        
        <label for="inputFirstName" class="sr-only">Card Type</label>
        <input name="first_name" type="text" id="inputFirstName" class="form-control" placeholder="First Name" required>
        
        <label for="inputLastName" class="sr-only">Card Type</label>
        <input name="last_name" type="text" id="inputLastName" class="form-control" placeholder="Last Name" required>
        
        <label for="inputDate" class="sr-only">Card Type</label>
        <input name="date" type="text" id="inputDate" class="form-control" placeholder="Date" required>
        <br>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        <br>
        <% if (request.getAttribute("message") != null) {
    	  out.print(request.getAttribute("message"));
      	}%>
      </form>
      
</div>
	
</body>
</html>