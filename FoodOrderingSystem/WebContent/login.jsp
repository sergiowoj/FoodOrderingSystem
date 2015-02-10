<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") != null) response.sendRedirect("index.jsp");
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<t:headcontents></t:headcontents>

</head>
<body>
<t:header></t:header>

<div class="container">
	
	<form action="login" method="post">
	  <div class="form-group">
	    <label for="email">Email</label>
	    <input name="email" class="form-control" id="email">
	  </div>  
	  <div class="form-group">
	    <label for="password">Password</label>
	    <input name="password" class="form-control" id="password">
	  </div> 
	  
	  
	  <div class="checkbox">
	    <label>
	      <input type="checkbox"> Keep me logged in
	    </label>
	  </div>
	  <button type="submit" class="btn btn-default">Login</button>
	</form>

</div>

<t:footer></t:footer>
</body>
</html>