<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
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
            
            <% if(session.getAttribute("username") != null)  {%>
            	<li><a href="logout">Logout</a></li>
            <%} else {%>
            	<li><a href="login">Login</a></li>
            <%} %>
            
            <li><a href="register">Register</a></li>
            
            <li class="active"><a href="admin">Admin</a></li>
            
            </ul>
            	
          
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->


<h1 class="center">Admin Functions</h1>

<div class="row">
	
	<div class="col-lg-6">
	
		<h2 class="center">Add Quest By ID</h2>
		
		<div class="addFriend alignCenter center">
			<form action="addQuestByID" method="post">
			
				<input class="form-control" type="text" name="quest" placeholder="Quest ID" required autofocus>
				
				<br>
				
				<input class="alignCenter btn btn-default" type="submit" value="Submit">
				
			</form>
		</div>
		
	</div>
	
	<div class="col-lg-6">
	
		<h2 class="center">Add Quest By Range</h2>
		
		<div class="addFriend alignCenter center">
			<form action="populateQuests" method="post">
			
				<input class="form-control" type="text" name="from" placeholder="From" required>
				<input class="form-control" type=text" name="to" placeholder="to" required>
				<br>
				
				<input class="alignCenter btn btn-default" type="submit" value="Submit">
				
			</form>
		</div>
		
	</div>

</div>

</div>

</body>
</html>