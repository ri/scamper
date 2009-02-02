<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Scamper: <%= controller.action_name %></title>
<%= stylesheet_link_tag 'style' %>
</head>
<body>

<div id="container">

<div id="header">
<img src="images/header.png">
</div>
<div id="message"><p><%= flash[:notice] %><%= flash[:error] %></p>
</div>
<div id="content">

<%= yield %>

	
</div>


</div>

</body>
</html>
