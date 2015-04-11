<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="beans.DeliveryBean"%>
<%@ page import="beans.OrderBean"%>
<%@ page import="model.OrderDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% 
OrderDAO.updateDelivery();
ArrayList<OrderBean> orders = DeliveryBean.getOrders(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<META http-equiv="REFRESH" content="10">

<title>Orders to be delivered</title>

<t:headcontents></t:headcontents>

<script>
$(document).ready(function() {
	function changeStage(id, stage){
		var itemId = id;
		var itemStage = stage;
	    $.ajax({
	        url : 'changeStage.jsp',
	        data : {
	            itemId : itemId,
	            itemStage : itemStage
	        },
	        success : function() {
	        }
	    });
	}
	
	$(".outfordelivery").click(function(){
		var id = event.target.id;
		var stage = 4;
		changeStage(id, stage);
		$(".outfordelivery").each(function(){
			if($(this).attr("id") == id){
				$(this).attr("disabled", "true");
				$(this).html("Delivering...");
			}
		});
	});
	
	$(".delivered").click(function(){
		var id = event.target.id;
		var stage = 5;
		changeStage(id, stage);
		$(".delivered").each(function(){
			if($(this).attr("id") == id){
				$(this).attr("disabled", "true");
			}
		});
	});
});
</script>

</head>
<body>	
	<div class="container">
		<div class="delivery">
			<h1>Orders to be delivered</h1>
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
						String order_stage = order.getStage();
						String deliveringBtnDisplay = "Deliver";
						String deliveringBtnDisabled = "";
						if(order_stage.equals("Out for delivery")){
							deliveringBtnDisplay = "Delivering...";
							deliveringBtnDisabled = "disabled";
						}
						order_id = order.getId();
						out.println("<div class=\"singleorder\">");
						
						out.println("<div class=\"buttons pull-right\">");	
							out.println("<button name=\"outfordelivery\" id=\""+order_id+"\" class=\"outfordelivery btn btn-primary btn-lg\" "+deliveringBtnDisabled+">"+deliveringBtnDisplay+"</button>");
							out.println("<button name=\"delivered\" id=\""+order_id+"\" class=\"delivered btn btn-success btn-lg\">Delivered!</button>");
						out.println("</div>");
						
						out.println("<div class=\"order-address\">");
						
							out.println("<div class=\"number\"> Order # <b>"+order_id+"</b></div>");
							
							out.println("<div class=\"address\">");
							out.println(order.getAddress1()+" "+order.getAddress2()+"<br>");
							out.println(order.getCity()+", "+order.getProvince()+", "+order.getPostalCode()+"<br>");
							out.println("Buzzer: "+order.getBuzzerNumber()+"<br>");
							out.println("Phone: "+order.getPhone());				
							out.println("</div>");	
							
						out.println("</div>");	

						out.println("<div class=\"items\">");
						
						count++;
					}
				%>
				
				<div class="item">
					<div class="item_name"><span class="quantity"><%=order.getQuantity() %>x  <%=order.getSize()%> </span> <%=order.getName()%> </div>
				</div>
				<%
					if(!order.getId().equals(order_id)){
						
						out.println("lol");
					}
				} %>
				
				<%
				if(count==1){
					out.println("</div>");
				}
				if(count>1)
					out.println("</div>");
					out.println("<div class=\"clearfix\"></div>");
					out.println("</div>");
				%>
			</div>
	</div>

	<t:footer></t:footer>
</body>
</html>