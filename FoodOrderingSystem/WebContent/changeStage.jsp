<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="model.OrderDAO" %>

<%
    String id = request.getParameter("itemId");
    String stage = request.getParameter("itemStage");
    
    int result = OrderDAO.changeOrderStage(id, stage);
    response.getWriter().write(result);
%>
