<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="customer" scope="session" class="beans.CustomerBean" />


<%
	String result = customer.getAddressesJSON(session.getAttribute("id").toString());
	response.setContentType("text/json");
	response.getWriter().write(result);  
%>
