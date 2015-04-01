<%@tag description="Header" pageEncoding="UTF-8"%>

<!-- Imports da internacionalizacao -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="languagesResources.text" />

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Food Ordering System</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp"><fmt:message key="index.menu.home" /></a></li>
				<li><a href="menu.jsp"><fmt:message key="index.menu.order" /></a></li>
				
				<li><a href="about.jsp"><fmt:message key="index.menu.about" /></a></li>
				<li><a href="contact.jsp"><fmt:message key="index.menu.contact" /></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
					<li>
						<c:if test="${!language.equals(\"pt\") }">
							<a href="?language=pt">Português</a>
						</c:if>
						<c:if test="${language.equals(\"pt\")}">
							<a href="?language=en">English</a>
						</c:if>
		        	</li>
		        	
					<% if (session.getAttribute("id") != null) { %>
						<li>
							<a href="profile.jsp">
								<span class="glyphicon glyphicon-user"></span> 
								<%=session.getAttribute("firstname") %>
							</a>
						</li>
						<li>
							<a href="logout"><fmt:message key="index.menu.logout" /></a>
						</li>
							
					<% } else {	%>
						<li> 
							<a href="login.jsp"><fmt:message key="index.menu.login" /></a> 
						</li>
						<li>
							<a href="register.jsp"><fmt:message key="index.menu.register" /></a>
						</li>
					<% } %>
				
			</ul>

		</div>
	</div>
</nav>