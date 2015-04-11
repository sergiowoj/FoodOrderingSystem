<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	boolean isLogged = false;
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null){ response.sendRedirect("login.jsp"); }
	else { isLogged = true; }

	boolean isOwner = OrderDAO.checkOrderOwner(request.getParameter("oid").toString(), session.getAttribute("id").toString());
	
	

	String orderId;
	ArrayList<ProductBean> items = null;
	String[] order = null;
	if(isOwner){
		orderId = request.getParameter("oid").toString();
		items = OrderDAO.getItems(orderId);
		order = OrderDAO.getOrder(orderId);
		order = OrderDAO.getOrder(orderId);
	}
%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="beans.ProductBean" %>
<%@ page import="model.OrderDAO" %>
<%@ page import="model.CustomerDAO" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% 
	if(isOwner){
		if(!order[13].equals("Delivered")) { %>
		<meta http-equiv="REFRESH" content="5"> 
	<% 	}
	}%>
<title></title>
<t:headcontents></t:headcontents>

</head>
<body>
	<t:header></t:header>
	<%
	if(isLogged){
		if(isOwner){		
			
			String stageOpen = "", stagePrep="", stageReady="", stageOut="", stageDeliv="";
			if(order[13].equals("Open")) { stageOpen = "stage-active"; stagePrep = "stage-next"; stageReady = "stage-next"; stageOut = "stage-next"; stageDeliv = "stage-next"; }
			else if(order[13].equals("Preparing")) { stageOpen = "stage-prev"; stagePrep = "stage-active"; stageReady = "stage-next"; stageOut = "stage-next"; stageDeliv = "stage-next";}
			else if(order[13].equals("Ready")) { stageOpen = "stage-prev"; stagePrep = "stage-prev"; stageReady = "stage-active"; stageOut = "stage-next"; stageDeliv = "stage-next";}
			else if(order[13].equals("Out for delivery")) { stageOpen = "stage-prev"; stagePrep = "stage-prev"; stageReady = "stage-prev"; stageOut = "stage-active"; stageDeliv = "stage-next";}
			else if(order[13].equals("Delivered")) { stageOpen = "stage-prev"; stagePrep = "stage-prev"; stageReady = "stage-prev"; stageOut = "stage-prev"; stageDeliv = "stage-active"; }
	
	%>
	<div class="container container-style">
		<div class="container-fluid">
			<h2>Order Progress</h2>
			<div class="row">
				<div class="col-md-2 stage <%=stageOpen%>">Open</div>
				<div class="col-md-2 stage <%=stagePrep%>">Preparing</div>
				<div class="col-md-2 stage <%=stageReady%>">Ready</div>
				<div class="col-md-2 stage <%=stageOut%>">Out for delivey</div>
				<div class="col-md-2 stage <%=stageDeliv%>">Delivered</div>
			</div>
			<hr>
			
			<h3>Order Details</h3>
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
					<a href="index.jsp?" class="btn btn-lg pull-right">Done</a>
				</div>
			</div>
		</div>
	</div>
	
	<% 
		} else { %>
			<div class="container">
				<div class="container-fluid">
					<div class="alert alert-danger" role="alert">
						This order does not exist.
					</div>	
				</div>
			</div>
		<%}
		
	} %>
	<t:footer></t:footer>
</body>
</html>