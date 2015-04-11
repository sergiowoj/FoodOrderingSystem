<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null) response.sendRedirect("login.jsp");
%>

<jsp:useBean id="customer" scope="session" class="beans.CustomerBean" />
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.CustomerDAO"%>
<%@ page import="beans.AddressBean"%>

<!-- Internationalization imports -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="languageResources.text" />

<%
	customer.toString();

    customer.setAddresses(CustomerDAO.getCustomerAddresses(customer.getId()));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="profile.label.userProfile" /></title>
<t:headcontents></t:headcontents>
<script src="js/jquery.validate.min.js"> </script>
<script src="js/register-form-validation.js"> </script>
<c:set var="locale" value="${language}"/>
<c:if test="${locale == 'pt'}">
    <script src="js/messages_pt.js" type="text/javascript"> </script>
</c:if> 

<script>

$(document).ready(function(){
	$("#profileForm").css('display', 'block');
	$(".showContent").click(function(event){
		var id = event.target.id;
		if(id == "profile"){
			$("#profileForm").css('display', 'block');
			$("#pwdForm").css('display', 'none');
			$("#addressForm").css('display', 'none');
		}
		if(id == "password"){
			$("#profileForm").css('display', 'none');
			$("#pwdForm").css('display', 'block');
			$("#addressForm").css('display', 'none');
		}
		if(id == "address"){
			$("#profileForm").css('display', 'none');
			$("#pwdForm").css('display', 'none');
			$("#addressForm").css('display', 'block');
		}
	});
	
	initialAddressForm('profile');
	$('#selectaddress').change(function(event){
		var value = event.target.value;
		if(value == "newaddress"){
			clearCheckoutAddressForm();
		} else {
			changeAddressForm(event.target.value);
		}
	});
});

</script>

 <c:set var="locale" value="${language}"/>
    <c:if test="${locale == 'pt'}">
        <script src="js/messages_pt.js" type="text/javascript"> </script>
    </c:if> 
</head>
<body>
<t:header></t:header>
		
<div class="container container-style">
    <div class="row">
        <div class="col-md-3 profile-menu vert-menu-style panel panel-primary">
        	<div class="panel-heading">
				<h3 class="panel-title"><fmt:message key="profile.button.myProfile" /></h3>
			</div>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="showContent" id="profile"><fmt:message key="profile.button.updateProfile" /></a></li>
                <li><a href="#" class="showContent" id="password" ><fmt:message key="profile.button.changePassword" /></a></li>
                <li><a href="#" class="showContent" id="address"><fmt:message key="profile.button.addressBook" /></a></li>
            </ul>
        </div>
        <%
        	//customer = CustomerDAO.getCustomer(session.getAttribute("id").toString());
        %>

        <div style="display:none" id="profileForm" class="col-md-9">
        	<h3><fmt:message key="profile.label.updateProfile" /></h3>
				<form action="profileChange" id="profileChange" method="post">
					<div class="form-group">
						<label for="firstname"><fmt:message key="profile.label.firstName" /></label> <input name="firstname"
							class="form-control" id="firstname"
							value="<%=customer.getFirstName()%>">
					</div>
					<div class="form-group">
						<label for="lastname"><fmt:message key="profile.label.lastName" /></label> <input name="lastname"
							class="form-control" id="lastname"
							value="<%=customer.getLastName()%>">
					</div>
					<div class="form-group">
						<label for="email"><fmt:message key="profile.label.email" /></label> <input name="email"
							class="form-control" id="email" value="<%=customer.getEmail()%>">
					</div>
					<div class="form-group">
						<label for="phone"><fmt:message key="profile.label.phone" /></label> <input name="phone"
							class="form-control" id="profile_phone"
							value="<%=customer.getPhone()%>">
					</div>
					<div class="form-group">
						<label for="phone2"><fmt:message key="profile.label.phone2" /></label> <input name="phone2"
							class="form-control" id="profile_phone2"
							value="<%=customer.getPhone2()%>">
					</div>

					<div class="checkbox">
						<label> <input type="checkbox" name="subscribed"
							value="subscribe" checked> <fmt:message key="profile.label.subscribed" />
						</label>
						<input name= "control" type="hidden" value="profile">
					</div>
					
					<button type="submit" class="btn btn-primary pull-right"><fmt:message key="profile.button.update" /></button>
				</form>

			</div > <!-- END PROFILE FROM --> 
			
        <div style="display:none" id="pwdForm" class="col-md-9" >
        <h3><fmt:message key="profile.button.changePassword" /></h3>
				<form action="pwdChange" id="pwdChange" method="post">
					<div class="form-group">
						<label for="password"><fmt:message key="profile.label.password" /></label> 
						<input type="password" name="password" class="form-control" id="password" placeholder="<fmt:message key="profile.textbox.enterPassword" />">
					</div>
					<div class="form-group">
						<label for="password-conf"><fmt:message key="profile.label.confPassword" /></label> 
						<input type="password" name="password_again" class="form-control" id="password_again" placeholder="<fmt:message key="profile.textbox.confPassword"/>">
						<input name= "control" type="hidden" value="pwd">
					</div>
					
					<button type="submit" class="btn btn-primary pull-right"><fmt:message key="profile.button.change" /></button>
				</form>
			</div>   <!-- END PWD FROM -->

			<div style="display:none" id="addressForm" class="col-md-9" >
				<h3><fmt:message key="profile.label.manageAddresses" /></h3>
				<form action="changeAddress" id="changeAddress" method="post">
					<div class="form-group">
						<label for="selectaddress"><fmt:message key="profile.label.selectAddresses" /></label>
						<select class="form-control btn-primary" name="selectaddress" id="selectaddress">
							
						</select>
					</div>
					<div class="form-group">
						<label for="address1"><fmt:message key="profile.label.addressLine1" /></label> 
						<input name="address1" class="form-control" id="address1"
							placeholder="<fmt:message key="profile.textbox.address1" />"
							value="">
					</div>
					<div class="form-group">
						<label for="address2"><fmt:message key="profile.label.addressLine2" /></label> 
						<input name="address2" class="form-control" id="address2"
							placeholder="<fmt:message key="profile.textbox.address2" />"
							value="">
					</div>
					<div class="form-group">
						<label for="city"><fmt:message key="profile.label.city" /></label> 
						<input name="city" placeholder="<fmt:message key="profile.textbox.city" />"
							class="form-control" id="city" value="">
					</div>
					<div class="form-group">
						<label for="province"><fmt:message key="profile.label.province" /></label> <input name="province"
						placeholder="<fmt:message key="profile.textbox.province" />"
							class="form-control" id="province"value="">
					</div>
					<div class="form-group">
						<label for="postalcode"><fmt:message key="profile.label.postalCode" /></label> <input
							placeholder="<fmt:message key="profile.textbox.postalCode" />"
							name="postalcode" class="form-control" id="postalcode"
							value="">
					</div>
					<div class="form-group">
						<label for="phone"><fmt:message key="profile.label.phone" /></label> 
						<input name="phone"	class="form-control" id="phone"	placeholder="<fmt:message key="profile.textbox.phone" />">
					</div>
					<div class="form-group">
						<label for="buzzer"><fmt:message key="profile.label.buzzer" /></label> <input name="buzzer"
							class="form-control" id="buzzer"
							placeholder="<fmt:message key="profile.textbox.enterBuzzer" />">
					</div>
					<input name="control" class="form-control" type="hidden" value="address">
					<input type="submit" class="btn btn-primary pull-right" name="submit" value="<fmt:message key="profile.button.update" />" style="margin-left: 5px;">
					<input type="submit" class="btn btn-default pull-right" name="submit" value="<fmt:message key="profile.button.delete" />">
				</form>
			</div> <!-- END ADDRESS FROM -->  
    </div>
</div>

<t:footer></t:footer>
</body>
</html>
