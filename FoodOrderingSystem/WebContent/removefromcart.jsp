<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cart" scope="session" class="beans.ShoppingCartBean" />

<%
    String id = request.getParameter("itemId");
    if ( id != null ) {      
      
      String result = cart.removeItem(id);
      response.setContentType("text/json");
      response.getWriter().write(result);
    }
%>
