<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Scamper: <%= controller.action_name %></title>
	<%= stylesheet_link_tag 'style' %>
</head>

<body onload="initialize()" onunload="GUnload()">

<div id="container">
	<div id="dashboard" class="column">
			<div id="player">
			<div class="userwelcome"><% if logged_in? %>
	           Hi <%= current_user.login %>!
	           <% end %> <a href="edit.html"> (edit your profile)</a></div>
	           <div class="help"><a href="help.html"Help!</a></div>
			<div class="signout">
				<% if logged_in? %>
	              <a href="logout">Sign Out</a>
	              <% end %> </div>


		</div>
</div>
<div id="center" class="column">
<div id="content">

<p style="color: green"><%= flash[:notice] %><%= flash[:error] %></p>

<%= yield  %>
</div>
</div>
</div>
</body>
</html>