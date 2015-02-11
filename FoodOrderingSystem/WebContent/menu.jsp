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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MENU</title>
<t:headcontents></t:headcontents>

<script>

function addToCart(id){
    var productName = document.getElementById('productName'+id).innerHTML;
    var productPrice = document.getElementById('productPrice'+id).innerHTML;
    itemList.innerHTML += "<li>"+productName+"| CAD "+productPrice+"</li>"; 
}


</script>

</head>
<body>
	<t:header></t:header>
	
	<div class="cart">
		<h3>My selected itens</h3>
		<div class="itens">
			<ul id="itemList">
				<li>Item 1 | <a href="" onclick="removeFromCart()">remove</a></li>
				<li>Item 2 | <a href="" onclick="removeFromCart()">remove</a></li>
			</ul>
		</div>
		<div class="totalprice">
			Total price: CAD 
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
						<p id="productName<%=product.getId()%>">
							<%=product.getName()%>
						</p>
						<hr> 
						<%=product.getDescription() %>
						<i><%=product.getIngredients()%></i>
					</td>
					<td>
						<p id="productPrice<%=product.getId()%>">
							<i>CAD </i> <%=product.getPrice()%> 
						</p>
					</td>
					<td>
						<button onclick="addToCart(<%=product.getId()%>)" id="<%=product.getId()%>">+</button>
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