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

</head>
<body>
	<t:header></t:header>

	<div class="container">
		<h1>MENU</h1>
		<hr>
		<form action="placeOrder" method="post">
			<TABLE>
				<%
				String categorie = "";
				ArrayList<ProductBean> menu = MenuDAO.listMenu();
				for (ProductBean product : menu) {
					if(!product.getCategory().equals(categorie)){
						categorie = product.getCategory();
						%><h3><%=categorie.toUpperCase() %></h3>
				<%
					}
					%>

				<TR>
					<TD>
						<p><%=product.getName()%></p>
						<hr> <br><%=product.getDescription() %></br> <i><%=product.getIngredients()%></i>
					</TD>
					<TD><i>CAD</i><%=product.getPrice()%></TD>

				</TR>
				<%
					}
				%>
			</TABLE>

			<button type="submit" class="btn btn-default">Place Order</button>
		</form>
	</div>

	<t:footer></t:footer>
</body>
</html>