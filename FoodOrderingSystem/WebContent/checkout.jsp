<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null) response.sendRedirect("login.jsp");
%>
<jsp:useBean id="cart" scope="session" class="beans.ShoppingCartBean" />
<jsp:useBean id="customer" scope="session" class="beans.CustomerBean" />

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="beans.ProductBean"%>
<%@ page import="beans.AddressBean" %>
<%@ page import="model.CustomerDAO" %>


<%
	cart.calculateOrder();
	cart.setUserId(session.getAttribute("id").toString());
    customer.setAddresses(CustomerDAO.getCustomerAddresses(customer.getId()));
	request.getSession().setAttribute("cart", cart);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<t:headcontents></t:headcontents>

<script>
	$(document).ready(function() {
		$(".payatdoor").css('display', 'none');
		$(".payonline").css('display', 'none');

		$("#payAtDoor").click(function() {
			$(".payonline").css('display', 'none');
			$(".payatdoor").css('display', 'block');
		});

		$("#payOnline").click(function() {
			$(".payatdoor").css('display', 'none');
			$(".payonline").css('display', 'block');
		});
		
		initialAddressForm('checkout');
		$('#selectaddress').change(function(event){
			var value = event.target.value;
			if(value == "newaddress"){
				clearAddressForm();
			} else {
				changeAddressForm(event.target.value);
			}
		});
	});
</script>

</head>
<body>
	<t:header></t:header>

	<script src="js/bootstrap-table/bootstrap-table.min.js"></script>
	<%if(cart.getNumberOfItems() == 0){ %>
	<div class="container container-style">
		<div class="container-fluid">
			<div class="row">
				<h1>You have nothing in your shopping cart. Please make an order first! :)</h1>
			</div>
		</div>
	</div>
	<%} else { %>
	<div class="container container-style">
		<div class="checkout">
			<h1>Checkout</h1>
			<table data-toggle="table" data-url="listcart.jsp">
				<thead>
					<tr>
						<th data-field="quantity">Quantity</th>
						<th data-field="name">Item</th>
						<th data-field="priceOut">Price per unit</th>
						<th data-field="totalPriceOut">Total</th>
					</tr>
				</thead>
			</table>

			<table class="table">
				<tr>
					<td>Subtotal</td>
					<td>Delivery</td>
					<td>GST/HST</td>
					<td>PST</td>
					<td>Discount</td>
					<td><b>Order Total</b></td>
				</tr>
				<tr>
					<td>$ <%=cart.getSubTotal()%></td>
					<td>$ <%=cart.getDeliveryCharge()%></td>
					<td>$ <%=cart.getTaxes()%></td>
					<td>$ <%=cart.getPst()%></td>
					<td>$ <%=cart.getDiscount()%></td>
					<td>$ <%=cart.getOrderTotal()%></td>
				</tr>
			</table>
			<form method="post" action="checkout">
				<div class="address">
					<h3>Delivery address</h3>
					
					<div class="deliveryaddress">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="selectaddress">Select the desired delivery address</label>
										<select class="form-control" name="selectaddress" id="selectaddress">
											<option value="newaddress">New address</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="alias">Set an Alias for this address</label> 
										<input name="alias" class="form-control" id="alias"
											placeholder="(Home, Work, Joe's house...)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="address1">Address Line 1</label> <input
											name="address1" class="form-control" id="address1"
											placeholder="Enter your street address, P.O. box, company name, c/o">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="address2">Address Line 2 (optional)</label> <input
											name="address2" class="form-control" id="address2"
											placeholder="Enter your apartment, suite, unit, building, floor, etc.">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="city">City</label> <input name="city"
											class="form-control" id="city" placeholder="City">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="province">Province</label> <input name="province"
											class="form-control" id="province" placeholder="Province">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="postalcode">Postal Code / ZIP</label> <input
											name="postalcode" class="form-control" id="postalcode"
											placeholder="Enter your postal code / ZIP">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="phone">Phone</label> <input name="phone"
											class="form-control" id="phone"
											placeholder="Enter your phone number">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="buzzer">Buzzer number</label> <input name="buzzer"
											class="form-control" id="buzzer"
											placeholder="Does your house have a particular buzzer number? Enter it here!">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="checkbox">
						<!-- <label> <input type="checkbox" name="saveaddress"> Save this address
							in my address book.
						</label> -->
					</div>
				</div>

				<div class="payment">
					<h3>Payment method</h3>
					Select your payment method
					<div class="radio">
						<label><input type="radio" name="payment" id="payAtDoor">Pay at door</label> 
						<label><input type="radio" name="payment" id="payOnline">Pay online</label>
					</div>
					
					<div class="payatdoor" id="payatdoor">
						<div class="method">
							<select name="payment_method" class="form-control">
								<option value="cash">Cash</option>
								<option value="credit">Credit</option>
								<option value="debit">Debit</option>
							</select>
						</div>
					</div>
					
					<div class="payonline" id="payonline">
						<div class="creditinfo">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="cardnumber">Card Number</label> <input
											name="cardnumber" class="form-control" id="cardnumber">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label for="name">Name on Card</label> <input name="name"
											class="form-control" id="name">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1">
									<div class="form-group">
										<label for="expirationday">Expiration</label> <select
											name="expirationday" class="form-control">
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
										</select>

									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="expirationyear">&nbsp;</label> <select
											name="expirationyear" class="form-control">
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
										</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="ccv">CCV</label> <input name="ccv"
											class="form-control" id="ccv">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="ccv">Postal code of this Credit Card
											billing address</label> <input name="postalcode" class="form-control"
											id="postalcode">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="placeorder">
					<hr>
					<button class="btn btn-primary pull-right" id="placeorder">Place
						order</button>
				</div>
			</form>
			<div class="clearfix"></div>
		</div>
	</div>
	<%} %>
	<t:footer></t:footer>
</body>
</html>