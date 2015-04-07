<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

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
<title>Contact - Food Ordering System</title>
<t:headcontents></t:headcontents>

</head>
<body>
<t:header></t:header>

<div class="container">
	<div class="container-fluid container-style">
		<div class="row">
			<div class="col-md-12">
				<div class="text">
					<h1><fmt:message key="contact.title.contact" /></h1>
					<form method="post" action="">
						<div class="form-group">
							<label for="firstname"><fmt:message key="contact.label.firstName" /></label>
							<input name="firstname" class="form-control" id="firstname" placeholder="<fmt:message key="contact.label.firstName" />">
						</div>
						<div class="form-group">
							<label for="lastname"><fmt:message key="contact.label.lastName" /></label>
							<input name="lastname" class="form-control" id="lastname" placeholder="<fmt:message key="contact.label.lastName" />">
						</div>
						<div class="form-group">
							<label for="email"><fmt:message key="contact.label.email" /></label>
							<input name="email" class="form-control" id="email" placeholder="<fmt:message key="contact.label.email" />">
						</div>
						<div class="form-group">
							<label for="email"><fmt:message key="contact.label.message" /></label>
							<textarea rows="5" name="message" class="form-control" id="message" placeholder="<fmt:message key="contact.label.message" />"></textarea>
						</div>
						<button type="submit" class="btn btn-default pull-right"><fmt:message key="contact.button.send" /></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<t:footer></t:footer>
</body>
</html>