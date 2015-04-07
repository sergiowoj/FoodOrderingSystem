<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null) response.sendRedirect("login.jsp");
%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="beans.ProductBean" %>
<%@ page import="model.OrderDAO" %>
<%@ page import="model.CustomerDAO" %>

<%
	String orderId = request.getParameter("oid").toString();
	ArrayList<ProductBean> items = OrderDAO.getItems(orderId);
	String[] order = OrderDAO.getOrder(orderId);
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

	<div class="container container-style">
		<div class="container-fluid">
			<div class="row">
				<h1>Thanks <%=session.getAttribute("firstname")%>, your order has been placed! </h1>
			</div>
			<div class="row graybg-radius">
				<div class="col-md-6">
					<h4>Delivery Address</h4>
					<table class="table">
						<tr><td><b><%=order[6]%></b></td></tr>
						<tr>
							<td>
								<%=order[7]%> <%=order[8]%><br/>
								<%=order[9]%>, <%=order[10]%><br/>
								<%=order[11].toUpperCase()%><br/>
								Buzzer Number: <%=order[12]%><br/>
							</td>
						</tr>
					</table>
					
				</div>
				<div class="col-md-6">
					<h4>Order Summary</h4>
					<table class="table">
						<tr><td><b>Subtotal</b> </td><td>$<%=order[1]%></td></tr>
						<tr><td><b>Taxes</b> </td><td>$<%=order[2]%></td></tr>
						<tr><td><b>Delivery charge</b> </td><td>$<%=order[3]%></td></tr>
						<tr><td><b>Discount</b> </td><td>$<%=order[4]%></td></tr>
						<tr><td><b>Total</b> </td><td>$<%=order[0]%></td></tr>
						<tr><td><b>Payment method</b> </td><td><%=order[5].toUpperCase()%></td></tr>
						
					</table>
				</div>
			</div>
			<div class="row">
				<h4>Order Items</h4>
				<table class="table">
					<tr>
						<th>Quantity</th>
						<th>Name</th>
						<th>Price</th>
						<th>Size</th>
						<th>Total</th>
					</tr>
					<% for(ProductBean item : items){ %>
						<tr>
							<td><%=item.getQuantity()%></td>
							<td><%=item.getName()%></td>
							<td>$<%=item.getPriceOut()%></td>
							<td><%=item.getSize()%></td>
							<td>$<%=item.getCalculatedTotalPrice() %></td>
						</tr>
					<% } %>
				</table>	
			</div>
			<div class="row">
				<div class="col-md-12">
					<a href="order_progress.jsp?oid=<%=orderId%>" class="btn btn-primary btn-lg pull-right">Check order progress >></a>
					<a href="index.jsp?" class="btn btn-lg pull-right">Done</a>
				</div>
			</div>
		</div>
	</div>

	<t:footer></t:footer>
</body>
</html>