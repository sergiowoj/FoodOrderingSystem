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

<title></title>
<t:headcontents></t:headcontents>
<!--
 <script src="js/jquery.validate.min.js"> </script>
<script src="js/register-form-validation.js"> </script>
<c:set var="locale" value="${language}"/>
    <c:if test="${locale == 'pt'}">
        <script src="js/messages_pt.js" type="text/javascript"> </script>
    </c:if> 
     -->
</head>
<body>
<t:header></t:header>

<div class="container">
	<div class="container-fluid container-style">
	
		<% if(request.getAttribute("errorMessage") != null) { %>
		<div class="alert alert-danger" role="alert">${errorMessage}</div>
		<% } %>
		<% if(request.getAttribute("successMessage") != null) { %>
		<div class="alert alert-success" role="alert">${successMessage}</div>
		<% } %>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>
					<fmt:message key="login.title.login" />
				</h1>
				<form action="login" id="loginform" method="post">
					<div class="form-group">
						<label for="email"><fmt:message key="login.label.email" /></label>
						<input name="email" class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="password"><fmt:message
								key="login.label.password" /></label> <input type="password"
							name="password" class="form-control" id="password">
					</div>
					<input type="hidden" name="origin" value="login">
					<button type="submit" class="btn btn-default pull-right">
						<fmt:message key="login.button.login" />
					</button>
				</form>

			</div>
		</div>
	</div>
</div>


	<t:footer></t:footer>
</body>
</html>