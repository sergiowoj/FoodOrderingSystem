<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="beans.KitchenBean"%>
<%@ page import="beans.OrderBean"%>
<%@ page import="model.OrderDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% ArrayList<OrderBean> orders = KitchenBean.getOrders(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<META http-equiv="REFRESH" content="100">

<title>Kitchen</title>

<t:headcontents></t:headcontents>

</head>
<body>
	<!--<t:header></t:header>-->
	
	<div class="container">
		<h1>KITCHEN</h1>
		<hr>
		
			<%
			String order_id = "";
			int count = 0;
			for (OrderBean order : orders) {
				
				if(!order.getId().equals(order_id)){
					
					if(count>0){
						out.println("</div>");
						out.println("<div class=\"clearfix\"></div>");
						out.println("</div>");
					}

					order_id = order.getId();
					out.println("<div class=\"singleorder\">");
					out.println("<div class=\"number\"> Order # <b>"+order_id+"</b></div>");
					out.println("<span style=\"float:right;\"><button class=\"btn btn-success btn-lg\">Done!</button></span>");
					out.println("<span style=\"float:right; margin: 0 20px 0 0;\"><button class=\"btn btn-link btn-lg\">Cancel order</button></span>");					
					out.println("<div class=\"items\">");
					
					count++;
				}
			%>

			<div class="item">
				<div class="item_name"><span class="quantity"><%=order.getQuantity() %>x</span> <%=order.getName() %></div>
			</div>

			<%
				if(!order.getId().equals(order_id)){
					
					out.println("lol");
				}
			}
			
			if(count>1)
				out.println("</div>");
				out.println("<div class=\"clearfix\"></div>");
				out.println("</div>");
			%>
	</div>

	<t:footer></t:footer>
</body>
</html>