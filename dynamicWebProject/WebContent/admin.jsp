<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.rowset.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>

<% 
	
	CachedRowSet cAllUsers = (CachedRowSet) request.getAttribute("cAllUsers");
	CachedRowSet cAllQuests = (CachedRowSet) request.getAttribute("cAllQuests");
	CachedRowSet cAllGuilds = (CachedRowSet) request.getAttribute("cAllGuilds");
%>

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

<% 
String checkAdmin = (String) session.getAttribute("username");

if (checkAdmin != null && checkAdmin.equals("admin")) { %>

<h1 class="center">Admin Functions</h1>

<div class="row">
	
	<div class="col-lg-6">
	<!----------------------------------- ADD QUEST BY ID --------------------------------->
		<h2 class="center">Add Quest By ID</h2>
		
		<div class="addFriend alignCenter center">
			<form action="addQuestByID" method="post">
			
				<input class="form-control" type="text" name="quest" placeholder="Quest ID" required autofocus>
				
				<br>
				
				<input class="alignCenter btn btn-default" type="submit" value="Submit">
				
			</form>
		</div>
		
	<br>
	
	<!----------------------------------- ADD QUEST BY RANGE --------------------------------->
	
	
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
	
	<!------------------------------------- SHOW GUILDS -------------------------------------->
	<div class="col-lg-6">
	
		<h1 class="center">Guilds</h1>
		
		<ol>
		<% while (cAllGuilds.next()){ %>
			<li><%=cAllGuilds.getString(1)%></li>
		<%} %>
		</ol>
</div>

<br>

<div class="row">
	</div>
	<!----------------------------------- SHOW ALL QUESTS --------------------------------->
	
	<div class="col-lg-6">
		<h2 class="center">All Quests</h2>
			<table class="table">
					<tr>
						<th>Quest Id</th>
						<th>Title</th>
						<th>Req Level</th>
						<th>Delete</th>
					</tr>
				<% while(cAllQuests.next())  {%>
					<tr>
						<td><%= cAllQuests.getString(1) %></td>
						<td><%= cAllQuests.getString(2) %></td>
						<td><%= cAllQuests.getString(3) %></td>
						<td>
							<form action="deleteQuest" method="post">
								<input type="text" name="quest_id" value="<%=cAllQuests.getString(1)%>" hidden>
								<input class="btn btn-default" type="submit" value="Delete">
								
							</form>
						</td>
					</tr>
				<%} %>
				</table>
	</div>
	
	
	<!----------------------------------- SHOW ALL Users --------------------------------->
	
	<div class="col-lg-6">
		<h2 class="center">All Users</h2>
		<table class="table">
					<tr>
						<th>Account Number</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
					</tr>
					
				<% while(cAllUsers.next())  {%>
					<tr>
						<td><%= cAllUsers.getString(1) %></td>
						<td><%= cAllUsers.getString(2) %></td>
						<td><%= cAllUsers.getString(3) %></td>
						<td><%= cAllUsers.getString(4) %></td>
					</tr>
				<%} %>
				</table>
	</div>
	
</div>

<%} else {%>
<br>
<br>
<h1 class="center">You are not authorized to be here!</h1>

<%} %>
</div>

</body>
</html>