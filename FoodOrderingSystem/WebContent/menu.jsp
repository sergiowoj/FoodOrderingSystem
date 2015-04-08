<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="beans.ProductBean"%>
<%@ page import="model.MenuDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!-- Internationalization imports -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<c:set var="language2" value="${language}"/>	
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="languageResources.text" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>

<t:headcontents></t:headcontents>

<script>
	$(document).ready(listCart());

	$(document).ready(function() {
		$('.addToCart').click(function(event) {
			var id = event.target.id;
			addToCart(id);
		});
	});

	$(document).ready(function() {
		$('#itemList').on('click', '.removeFromCart', function(event) {
			var id = event.target.id;
			removeFromCart(id);
		});
	});

	$(document).ready(function() {

		$('#showLoginModal').click(function(event) {
			$('#loginModal').modal('show');
		});

		$('#openRegistration').click(function(event) {
			$('.modal-login').css('display', 'none');
			$('.modal-register').css('display', 'block');
		});

	});
</script>

</head>
<body>
	<t:header></t:header>
	<div class="container container-style">
		<div class="row">
			<div class="menu col-xs-12 col-md-8">
				<div class="row">
					<%
						String category = "";
						
						ArrayList<ProductBean> menu = MenuDAO.listMenu(pageContext.getAttribute("language2").toString().split("_")[0]);

						for (ProductBean product : menu) {
							if (!product.getCategory().equals(category)) {
								out.println("</div>");
								category = product.getCategory();
								out.println("<div class=\"row\"><h2>" + category
										+ "</h2></div>");
								out.println("<div class=\"row\">");
							}
					%>

					<div class="col-xs-12 col-md-6">
						<div class="thumbnail">
							<div>
								<div id="productName<%=product.getId()%>" class="productname"><strong><%=product.getName()%></strong> (<%=product.getSize()%>)</div>
								<i><%=product.getDescription()%></i>
								<%=product.getIngredients()%>
							</div>
							<div class="price-add">
								<div class="add">
									<button class="addToCart btn btn-default btn-md pull-right"
										id="<%=product.getId()%>">+</button>
								</div>
								<div class="price">
									<span>$</span> <span id="productPrice<%=product.getId()%>"><%=product.getPriceOut()%></span>
								</div>

								<div class="clearfix"></div>
							</div>

						</div>
					</div>

					<%
						}
					%>
				</div>

			</div>
			<div class="cart vert-menu-style col-xs-6 col-md-4">
				<div class="myitems panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"><fmt:message key="menu.label.myItems" /></h3>
					</div>
					<div class="items col-xs-12">
						<ul id="itemList">
						</ul>
					</div>
					<div class="col-xs-12">
						<div class="totalprice pull-right"></div>
					</div>
					<div class="col-xs-12">
						<!--style="visibility:hidden-->
						<%
							if (session.getAttribute("id") == null) {
						%>
						<button class="btn btn-block btn-default placeOrder"
							id="showLoginModal"><fmt:message key="menu.button.checkout" /></button>
						<%
							} else {
						%>
						<a href="checkout.jsp"
							class="btn btn-block btn-default placeOrder">Checkout</a>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
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
					<h4 class="modal-title">
						<fmt:message key="login.title.login" />
					</h4>
				</div>
				<div class="modal-body">

					<div class="modal-login">
						<form action="login" method="post">
							<div class="form-group">
								<label for="email"><fmt:message key="login.label.email" /></label>
								<input name="email" class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="password"><fmt:message
										key="login.label.password" /></label> <input type="password"
									name="password" class="form-control" id="password">
							</div>
							<input type="hidden" name="origin" value="menu">
							<button type="submit" class="btn btn-primary pull-right">Login</button>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="modal-footer">

					<div class="register pull-left">
						Not registered yet? <a href="register.jsp">Sign up</a>
					</div>
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