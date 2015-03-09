<%@tag description="Header" pageEncoding="UTF-8"%>
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
				<li><a href="index.jsp">Home</a></li>
				<li><a href="menu.jsp">Make an order</a></li>
				
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				
					<% if (session.getAttribute("id") != null) { %>
						<li>
							<a href="profile.jsp">
								<span class="glyphicon glyphicon-user"></span> 
								<%=session.getAttribute("firstname") %>
							</a>
						</li>
						<li>
							<a href="logout">Logout</a>
						</li>
							
					<% } else {	%>
						<li> 
							<a href="login.jsp">Login</a> 
						</li>
						<li>
							<a href="register.jsp">Register</a>
						</li>
					<% } %>
				
			</ul>

		</div>
	</div>
</nav>