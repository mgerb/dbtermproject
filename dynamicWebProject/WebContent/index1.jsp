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
	String characterLevel = "", questsCompleted = "", account_number = "", image_path = "";
	
	CachedRowSet cGuildInfo = (CachedRowSet) request.getAttribute("cGuildInfo");
	CachedRowSet cUserData = (CachedRowSet) request.getAttribute("cUserData");
	CachedRowSet cUserFriends = (CachedRowSet) request.getAttribute("cUserFriends");
	CachedRowSet cUserQuests = (CachedRowSet) request.getAttribute("cUserQuests");
	CachedRowSet cAvailableQuests = (CachedRowSet) request.getAttribute("cAvailableQuests");
	CachedRowSet cCompletedQuests = (CachedRowSet) request.getAttribute("cCompletedQuests");
	
	if(cUserData.next()){
		characterLevel = cUserData.getString(2);
		questsCompleted = cUserData.getString(3);
		account_number = cUserData.getString(1);
		image_path = cUserData.getString(4);
	}
%>


<div class="row">

	<div class="col-lg-4">
	<h1><%= session.getAttribute("username") %></h1>
	
	<img src="/dynamicWebProject/<%=image_path %>" class="img-responsive" alt="image">
	
	Character Level: <%= characterLevel %>
	<br>
	Quests Completed: <%= questsCompleted %>
	
	<br>
	<br>
	
	<form action="imageUpload" method="post" enctype="multipart/form-data">
	
		<input class="btn btn-default" type="submit" value="Upload Avatar">
	
		<input type="file" name="image" required>

	</form>
	
	
	<h3>Account Information</h3>
	Acount Number: <%= account_number %>
	<br>
	Subscription Status: <% if (request.getAttribute("subscriptionActive") != null) { %>
	
		Active
		<br>
		<a href="./cancelSubscription">Cancel Subscription</a>
	<% } else {%>
		Inactive
		<br>
		<a href="./subscription">Update Subscription</a>
	<%} %>
	
	</div>
	
	<!-- ----------------------------------------- FRIENDS/GUILD TAB --------------------------------------------------->
		<%if (request.getAttribute("subscriptionActive") != null) { %>
			<div class="col-lg-4">
				<h1>Friends</h1>
				
				<div class="addFriend">
					<form action="addfriend" method="post">
						<input type="text" class="form-control" placeholder="Add Friend" name="friend" required>
						<input class="form-control" type="submit" name="add_remove_button" value="Add">
						<input class="form-control" type="submit" name="add_remove_button" value="Remove">
					</form>
				</div>
				
				<br>
				
				<ol>
				<% while(cUserFriends.next())  {%>
			
					<li><%= cUserFriends.getString(3) %></li>
				
				<%} %>
			
				</ol>
				
			</div>
			
			<div class="col-lg-4">
				<h1>Guild</h1>
				
				<!-- If user is not in a guild display the join guild form -->
				
				<% if (cGuildInfo == null){ %>
					<div class="addFriend">
						<form action="addGuild" method="post">
							<input type="text" class="form-control" placeholder="Create/Join Guild" name="guild_title" required>
							<input class="form-control" type="submit" value="Submit">
						</form>
					</div>
				<%} else { %>
				<!-- If the user is in a guild display the guild list in a table -->
					<table class="table">
						<tr>
							<th><%cGuildInfo.next(); out.print(cGuildInfo.getString(1) + " - "); cGuildInfo.beforeFirst(); %>Members</th>
						</tr>
						
						<% while (cGuildInfo.next()) { %>
							<tr>
								
								<% if (cGuildInfo.getBoolean(3) == true){ %>
								
								 	<td><%=cGuildInfo.getString(5)%> - Leader</td>
								
								<%} else {%>
									<td><%=cGuildInfo.getString(5)%></td>
								<%} %>
							</tr>
						<%} %>
						
					</table>
					
					<a href="leaveGuild">Leave Guild</a>
				
				<%} %>
			</div>
		<%} %>
	
</div>
<br>
	<!-----------------------------------------------QUEST LOG/COMPLETED QUESTS ------------------------------------>
	<% if (request.getAttribute("subscriptionActive") != null) { %>
		<div class="row">
			<div class="col-lg-6">
				
				<h1 class="center">Quest Log</h1>
				<table class="table">
					<tr>
						<th>Title</th>
						<th>Req Level</th>
						<th>Complete Quest</th>
					</tr>
				<% while(cUserQuests.next())  {%>
					<tr>
						<td><%= cUserQuests.getString(6) %></td>
						<td><%= cUserQuests.getString(7) %></td>
						<td>
							<form action="completeUserQuest" method="post">
								<input type="text" name="completequest_id" value="<%=cUserQuests.getString(5)%>" hidden>
								<input class="btn" type="submit" value="Complete Quest">
							
							</form>
						</td>
					</tr>
				<%} %>
				</table>
				
				<br>
				<br>
				
				<h1 class="center">Completed Quests</h1>
				<table class="table">
					<tr>
						<th>Title</th>
						<th>Req Level</th>
					</tr>
				<% while(cCompletedQuests.next())  {%>
					<tr>
						<td><%= cCompletedQuests.getString(6) %></td>
						<td><%= cCompletedQuests.getString(7) %></td>
					</tr>
				<%} %>
				</table>
				
			</div>
			
		<!---------------------------------------------- AVAILABLE QUESTS ---------------------------------------------------->
			<div class="col-lg-6">
			
				<h1 class="center" >Available Quests</h1>
			<table class="table">
				<tr>
					<th>Title</th>
					<th>Req Level</th>
					<th>Add Quest</th>
				</tr>
				
				<% while(cAvailableQuests.next() && Integer.parseInt(cAvailableQuests.getString(3)) <= Integer.parseInt(characterLevel))  {%>
			
					<tr>
						<td><%=cAvailableQuests.getString(2)%></td>
						<td><%=cAvailableQuests.getString(3)%></td>
						
						<%if (Integer.parseInt(characterLevel) >= Integer.parseInt(cAvailableQuests.getString(3))) {%>
						<td>
							<form action="addUserQuest" method="post">
								<input type="text" name="addquest_id" value="<%=cAvailableQuests.getString(1)%>" hidden>
								<input class="btn" type="submit" value="Add Quest">
							
							</form>
						</td>
						<%} %>
					</tr>
				<%} %>
			</table>
				
			</div>
			
		</div>

<%}} else {
	response.sendRedirect("/dynamicWebProject/login");
}%>

</div>

</body>
</html>