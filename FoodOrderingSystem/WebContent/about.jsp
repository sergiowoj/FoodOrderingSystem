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
<title>About us - Food Ordering System</title>
<t:headcontents></t:headcontents>

</head>
<body>
<t:header></t:header>

<div class="container">
	<div class="container-fluid container-style">
		<div class="row">
			<div class="col-md-12">
				<div class="text">
					<h1><fmt:message key="about.title.about" /></h1>
					<fmt:message key="about.text.information" />
				</div>
			</div>
		</div>
	</div>
</div>

<t:footer></t:footer>
</body>
</html>