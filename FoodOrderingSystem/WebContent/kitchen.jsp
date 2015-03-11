<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.ProductBean"%>
<%@ page import="model.MenuDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>


<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if (session.getAttribute("id") != null)
		response.sendRedirect("index.jsp");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<META http-equiv="REFRESH" content="30">
<title>KITCHEN</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<t:headcontents></t:headcontents>

<script>
function updateCart(response){
	$('#itemList').html('');
	var obj = response;
	var html = '';
	var totalPrice = 0;
	var count = 0;
	
    $.each(obj, function() {
		html +=	"<li>"+this['name']+"| CAD "+this['price'].toFixed(2)+"<button class=\"removeFromCart\" id=\""+this['id']+"\">x</button></li>";
		totalPrice += parseFloat(this['price']);;
		count+=1;
	})
    $('#itemList').append(html);
    $('.totalprice').html('Total price: ' + totalPrice.toFixed(2) + ' CAD');
    
    //$('#buttonorder').show();
    
    	
}

$(document).ready(function() {
	$.ajax({
        url : 'listcart.jsp',
        data : {},
        success : function(response) {
        	updateCart(response);
        }
    });
});

$(document).ready(function() {
    $('.addToCart').click(function(event) {
    	var itemId = event.target.id;
    	var itemName = $('#productName'+itemId).text();
    	var itemPrice = $('#productPrice'+itemId).text();
        $.ajax({
            url : 'addtocart.jsp',
            data : {
                itemId : event.target.id,
                itemName : $('#productName'+itemId).text(),
                itemPrice : $('#productPrice'+itemId).text()
            },
            success : function(response) {
            	updateCart(response);
            }
        });
    });
});

$(document).ready(function() {
    $('#itemList').on('click', '.removeFromCart', function(event) {
    	var itemId = event.target.id;
        $.ajax({
            url : 'removefromcart.jsp',
            data : {
                itemId : itemId,
            },
            success : function(response) {
            	updateCart(response);
            }
        });
    });
});

</script>

</head>
<body>
	<t:header></t:header>
	
	<div class="container">
		<h1>KITCHEN</h1>
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
						<i><%=product.getIngredients()%></i>
					</td>
					<td>
						<div id="productQuantity<%=product.getId()%>">X</div>
						<i>qt</i>
					</td>
					<td>
						<button class="done" id="<%=product.getId()%>"><b>DONE</b></button>
					</td>

				</tr>
				
				<%
					}
				%>
			</table>
	</div>

	<t:footer></t:footer>
</body>
</html>