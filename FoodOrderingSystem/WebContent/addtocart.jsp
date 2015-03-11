<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cart" scope="session" class="beans.ShoppingCartBean" />

<%
    String id = request.getParameter("itemId");
    if ( id != null ) {
      String name = request.getParameter("itemName");
      double price = new Float(request.getParameter("itemPrice"));
      
      String result = cart.addItem(id, name, price, 1);
      response.setContentType("text/json");
      response.getWriter().write(result);
    }
%>
