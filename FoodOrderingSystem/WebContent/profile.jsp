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

<%
	customer.toString();

    customer.setAddresses(CustomerDAO.getCustomerAddresses(customer.getId()));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<t:headcontents></t:headcontents>

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

</head>
<body>
<t:header></t:header>
		
<div class="container container-style">
    <div class="row">
        <div class="col-md-3 profile-menu vert-menu-style panel panel-primary">
        	<div class="panel-heading">
				<h3 class="panel-title">My profile</h3>
			</div>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="showContent" id="profile">Update Profile</a></li>
                <li><a href="#" class="showContent" id="password" >Change Password</a></li>
                <li><a href="#" class="showContent" id="address">Address Book</a></li>
            </ul>
        </div>
        <%
        	//customer = CustomerDAO.getCustomer(session.getAttribute("id").toString());
        %>

        <div style="display:none" id="profileForm" class="col-md-9">
        	<h3>Update Profile</h3>
				<form action="profileChange" method="post">
					<div class="form-group">
						<label for="firstname">First name</label> <input name="firstname"
							class="form-control" id="firstname"
							value="<%=customer.getFirstName()%>">
					</div>
					<div class="form-group">
						<label for="lastname">Last name</label> <input name="lastname"
							class="form-control" id="lastname"
							value="<%=customer.getLastName()%>">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input name="email"
							class="form-control" id="email" value="<%=customer.getEmail()%>">
					</div>
					<div class="form-group">
						<label for="phone">Phone</label> <input name="phone"
							class="form-control" id="profile_phone"
							value="<%=customer.getPhone()%>">
					</div>
					<div class="form-group">
						<label for="phone2">Phone 2</label> <input name="phone2"
							class="form-control" id="profile_phone2"
							value="<%=customer.getPhone2()%>">
					</div>

					<div class="checkbox">
						<label> <input type="checkbox" name="subscribed"
							value="subscribe" checked> I want to receive news and information
							about promotions in my email.
						</label>
						<input name= "control" type="hidden" value="profile">
					</div>
					
					<button type="submit" class="btn btn-primary pull-right">Update</button>
				</form>

			</div > <!-- END PROFILE FROM --> 
			
        <div style="display:none" id="pwdForm" class="col-md-9" >
        <h3>Change Password</h3>
				<form action="pwdChange" method="post">
					<div class="form-group">
						<label for="password">Password</label> <input name="password"
							class="form-control" id="password"
							placeholder="Enter your password">
					</div>
					<div class="form-group">
						<label for="password-conf">Password</label> <input
							name="password-conf" class="form-control" id="password-conf"
							placeholder="Confirm your password">
							<input name= "control" type="hidden" value="pwd">
					</div>
					
					<button type="submit" class="btn btn-primary pull-right">Change</button>
				</form>
			</div>   <!-- END PWD FROM --> 
        
        <div style="display:none" id="addressForm" class="col-md-9" >
				<h3>Manage Addresses</h3>
				<form action="changeAddress" method="post">
					<div class="form-group">
						<label for="selectaddress">Select the address to edit</label>
						<select class="form-control btn-primary" name="selectaddress" id="selectaddress">
							
						</select>
					</div>
					<div class="form-group">
						<label for="address1">Address Line 1</label> <input
							name="address1" class="form-control" id="address1"
							value="">
					</div>
					<div class="form-group">
						<label for="address2">Address Line 2 (optional)</label> <input
							name="address2" class="form-control" id="address2"
							value="">
					</div>
					<div class="form-group">
						<label for="city">City</label> <input name="city"
							class="form-control" id="city" value="">
					</div>
					<div class="form-group">
						<label for="province">Province</label> <input name="province"
							class="form-control" id="province"value="">
					</div>
					<div class="form-group">
						<label for="postalcode">Postal Code / ZIP</label> <input
							name="postalcode" class="form-control" id="postalcode"
							value="">
					</div>
					<div class="form-group">
						<label for="phone">Phone</label> 
						<input name="phone"	class="form-control" id="phone"	placeholder="Enter your phone number">
					</div>
					<div class="form-group">
						<label for="buzzer">Buzzer number</label> <input name="buzzer"
							class="form-control" id="buzzer"
							placeholder="Does your house have a particular buzzer number? Enter it here!">
					</div>
					<input name="control" class="form-control" type="hidden" value="address">
					<input type="submit" class="btn btn-primary pull-right" name="submit" value="Update" style="margin-left: 5px;">
					<input type="submit" class="btn btn-default pull-right" name="submit" value="Delete">
				</form>
			</div> <!-- END ADDRESS FROM -->  
    </div>
</div>

<t:footer></t:footer>
</body>
</html>
