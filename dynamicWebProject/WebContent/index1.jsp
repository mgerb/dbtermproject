<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.sql.rowset.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
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
            <li class="active"><a href="./index">Home</a></li>
            
            <% if(session.getAttribute("username") != null)  {%>
            	<li><a href="logout">Logout</a></li>
            <%} else {%>
            	<li><a href="login">Login</a></li>
            <%} %>
            
            <li><a href="register">Register</a></li>
            <li><a href="admin">Admin</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

<% if(session.getAttribute("username") != null)  {
	String characterLevel = "", questsCompleted = "", account_number = "";
	
	CachedRowSet cUserData = (CachedRowSet) request.getAttribute("cUserData");
	CachedRowSet cUserFriends = (CachedRowSet) request.getAttribute("cUserFriends");
	CachedRowSet cUserQuests = (CachedRowSet) request.getAttribute("cUserQuests");
	CachedRowSet cAvailableQuests = (CachedRowSet) request.getAttribute("cAvailableQuests");
	
	if(cUserData.next()){
		characterLevel = cUserData.getString(2);
		questsCompleted = cUserData.getString(3);
		account_number = cUserData.getString(1);
	}
%>


<div class="row">

	<div class="col-lg-6">
	<h1><%= session.getAttribute("username") %></h1>
	Character Level: <%= characterLevel %>
	<br>
	Quests Completed: <%= questsCompleted %>
	<h3>Account Information</h3>
	Acount Number: <%= account_number %>
	<br>
	Subscription Status: <% if (request.getAttribute("subscriptionActive") != null) { out.print("Active"); }%>
	<br>
	<a href="./subscription">Update Subscription</a>
	<br>
	<a href="./cancelsubscription">Cancel Subscription</a>
	</div>
	
	<div class="col-lg-6">
	<h1>Quest Log</h1>
	<% while(cUserQuests.next())  {%>
	
			<li><%= cUserQuests.getString(2) %></li>
		
		<%} %>
	<h1>Available Quests</h1>
	<table class="table">
		<tr>
			<th>Title</th>
			<th>Req Level</th>
		</tr>
		
		<% while(cAvailableQuests.next())  {%>
	
			<tr>
				<td><%=cAvailableQuests.getString(2)%></td>
				<td><%=cAvailableQuests.getString(2)%></td>
			
			</tr>
		<%} %>
	</table>
	</div>
</div>

<div class="row">
	<div class="col-lg-6">
		<h1>Friends</h1>
		<ol>
		<% while(cUserFriends.next())  {%>
	
			<li><%= cUserFriends.getString(2) %></li>
		
		<%} %>
	
		</ol>
		
		<br>
		
		<div class="addFriend">
			<form action="./addfriend" method="post">
				<input type="text" class="form-control" placeholder="Add Friend" name="friend">
				<input class="form-control" type="submit" value="Add">
			</form>
		</div>
		
		
	</div>
	
	
	<div class="col-lg-6">
		<h1>Guild</h1>
	</div>
	
</div>

<%} %>

</div>

</body>
</html>