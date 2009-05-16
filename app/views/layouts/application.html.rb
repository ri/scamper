<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Scamper: <%= controller.action_name %></title>
<%= stylesheet_link_tag 'style' %>
</head>
<body>
<div id="header"></div>
<div id="container">
<div id="dashboard" class="column"> <img src="/images/logo.png"></div>
<div id="center" class="column">
<div id="content">
<div id="message"><p><%= flash[:notice] %><%= flash[:error] %></p>
</div>
<%= yield %>
</div>
</div>
</div>

</body>
</html>
