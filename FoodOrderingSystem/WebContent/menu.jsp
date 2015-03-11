<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.ProductBean"%>
<%@ page import="model.MenuDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>

<t:headcontents></t:headcontents>

<script>
$(document).ready( listCart() );

$(document).ready(function() {
    $('.addToCart').click( function(event){
    		var id = event.target.id;
    		addToCart(id);
    });
});

$(document).ready(function() {
    $('#itemList').on('click', '.removeFromCart', function(event){
    	var id = event.target.id;
    	removeFromCart(id);
    });
});




$(document).ready(function() {
    
    $('#showLoginModal').click(function(event){
		$('#loginModal').modal('show');
	});
	
    
    $('#openRegistration').click(function(event){
    	$('.modal-login').css('display', 'none');
    	$('.modal-register').css('display', 'block');
    }); 
});


</script>

</head>
<body>
	<t:header></t:header>

	<div class="cart">
		<h3>My items</h3>
		<div class="itens">
			<ul id="itemList">
			</ul>
		</div>
		<div class="totalprice"></div>
		<div class="placeorder">
			<!--style="visibility:hidden-->
			<% if(session.getAttribute("id") == null){ %>
			<button class="btn btn-default placeOrder" id="showLoginModal">Checkout</button>
			<% } else { %>
			<a href="checkout.jsp" class="btn btn-default placeOrder">Checkout</a>
			<% } %>
		</div>



	</div>

	<div class="container">
		<h1>MENU</h1>
		<hr>
		<table border=1 style="width: 100%;">
			<%
				String category = "";
				ArrayList<ProductBean> menu = MenuDAO.listMenu();
				out.println(menu.size());
				for (ProductBean product : menu) {
					if(!product.getCategory().equals(category)){
						category = product.getCategory();
						out.println("<tr><td><h2>" + category.toUpperCase() + "</h2></td></tr>");
					}
				%>

			<tr>
				<td>
					<div id="productName<%=product.getId()%>"><%=product.getName()%></div>
					<hr> <%=product.getDescription() %> <i><%=product.getIngredients()%></i>
				</td>
				<td>
					<div id="productPrice<%=product.getId()%>"><%=product.getPrice()%></div>
					<i>CAD</i>
				</td>
				<td>
					<button class="addToCart" id="<%=product.getId()%>">+</button>
				</td>

			</tr>

			<%
					}
				%>
		</table>
	</div>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Login before continue...</h4>
				</div>
				<div class="modal-body">

					<div class="modal-login">
						<form action="login" method="post">
							<div class="form-group">
								<label for="email">Email</label> <input name="email"
									class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input name="password"
									class="form-control" id="password">
							</div>
							<input type="hidden" name="origin" value="menu">
							<button type="submit" class="btn btn-primary">Login</button>
						</form>

						<h4>Not registered yet?</h4>
						<div class="register">
							<button type="button" class="btn btn-primary"
								id="openRegistration">Register</button>
						</div>
					</div>

					<div class="modal-register" style="display: none;">
						<form action="register" method="post">
							<div class="form-group">
								<label for="firstname">First name</label> <input
									name="firstname" class="form-control" id="firstname"
									placeholder="Enter your first name">
							</div>
							<div class="form-group">
								<label for="lastname">Last name</label> <input name="lastname"
									class="form-control" id="lastname"
									placeholder="Enter your last name">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input name="email"
									class="form-control" id="email" placeholder="Enter your email">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input name="password"
									class="form-control" id="password"
									placeholder="Enter your password">
							</div>
							<div class="form-group">
								<label for="password-conf">Password</label> <input
									name="password-conf" class="form-control" id="password-conf"
									placeholder="Confirm your password">
							</div>

							<button type="submit" class="btn btn-default">Register</button>
						</form>
					</div>

				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<t:footer></t:footer>
</body>
</html>