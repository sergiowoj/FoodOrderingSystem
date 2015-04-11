<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="beans.KitchenBean"%>
<%@ page import="beans.OrderBean"%>
<%@ page import="model.OrderDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% 
OrderDAO.updateKitchen();
ArrayList<OrderBean> orders = KitchenBean.getOrders(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<META http-equiv="REFRESH" content="10">

<title>Kitchen</title>

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
	        	//$("#"+itemId).attr("disabled", "true");
	        }
	    });
	}
	
	$(".preparing").click(function(){
		var id = event.target.id;
		var stage = 2;
		changeStage(id, stage);
		$(".preparing").each(function(){
			if($(this).attr("id") == id){
				$(this).attr("disabled", "true");
				$(this).html("Preparing...");
			}
		});
	});
	
	$(".ready").click(function(){
		var id = event.target.id;
		var stage = 3;
		changeStage(id, stage);
		$(".ready").each(function(){
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
		<div class="kitchen">
			<h1>Orders to be prepared</h1>
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
					String preparingBtnDisplay = "Prepare";
					String preparingBtnDisabled = "";
					if(order_stage.equals("Preparing")){
						preparingBtnDisplay = "Preparing...";
						preparingBtnDisabled = "disabled";
					}
					order_id = order.getId();
					out.println("<div class=\"singleorder\">");
					out.println("<div class=\"number\"> Order # <b>"+order_id+"</b></div>");
					
					out.println("<div class=\"buttons pull-right\">");
						out.println("<button name=\"preparing\" id=\""+order_id+"\" class=\"preparing btn btn-primary btn-lg\" "+preparingBtnDisabled+">"+preparingBtnDisplay+"</button>");
						out.println("<button name=\"ready\" id=\""+order_id+"\"class=\"ready btn btn-success btn-lg\">Ready!</button>");
					out.println("</div>");
					
										
					out.println("<div class=\"items\">");
					
					count++;
				}
			%>

			<div class="item">
				<div class="item_name"><span class="quantity"><%=order.getQuantity() %>x  <%=order.getSize()%> </span> <%=order.getName()%> </div>
			</div>

			<%
			}
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