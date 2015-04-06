<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") != null) response.sendRedirect("index.jsp");
%>

<!-- Internationalization imports -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="languageResources.text" />

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="register.title" /></title>
<t:headcontents></t:headcontents>

</head>
<body>
<t:header></t:header>

<div class="container">
	<h1><fmt:message key="register.label.register" /></h1>
	<hr>
	<h3><fmt:message key="register.label.information" /></h3>
	<form action="register" method="post">
	  <div class="form-group">
	    <label for="firstname"><fmt:message key="register.label.firstName" /></label>
	    <input name="firstname" class="form-control" id="firstname" placeholder="<fmt:message key="register.textbox.firstName" />">
	  </div>
	  <div class="form-group">
	    <label for="lastname"><fmt:message key="register.label.lastName" /></label>
	    <input name="lastname" class="form-control" id="lastname" placeholder="<fmt:message key="register.textbox.lastName" />">
	  </div>
	  <div class="form-group">
	    <label for="email"><fmt:message key="register.label.email" /></label>
	    <input name="email" class="form-control" id="email" placeholder="<fmt:message key="register.textbox.email" />">
	  </div>
	  <div class="form-group">
	    <label for="password"><fmt:message key="register.label.password" /></label>
	    <input name="password" class="form-control" id="password" placeholder="<fmt:message key="register.textbox.password" />">
	  </div>
	  <div class="form-group">
	    <label for="password-conf"><fmt:message key="register.label.password2" /></label>
	    <input name="password-conf" class="form-control" id="password-conf" placeholder="<fmt:message key="register.textbox.password2" />">
	  </div>
	  <div class="form-group">
	    <label for="phone"><fmt:message key="register.label.phone" /></label>
	    <input name="phone" class="form-control" id="phone" placeholder="<fmt:message key="register.textbox.phone" />">
	  </div> 
	  <div class="form-group">
	    <label for="phone2"><fmt:message key="register.label.phone2" /></label>
	    <input name="phone2" class="form-control" id="phone2" placeholder="<fmt:message key="register.textbox.phone2" />">
	  </div> 
	  
	  
	  <div class="checkbox">
	    <label>
	      <input type="checkbox" name="subscribed" value="subscribe"> <fmt:message key="register.checkbox.subscribe" />
	    </label>
	  </div>
	  <button type="submit" class="btn btn-default"><fmt:message key="register.button.register" /></button>
	</form>
</div>

<t:footer></t:footer>
</body>
</html>