<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="beans.ProductBean"%>
<%@ page import="model.MenuDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<META http-equiv="REFRESH" content="10">

<title>Kitchen</title>

<t:headcontents></t:headcontents>

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