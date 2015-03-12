<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="beans.CustomerBean"%>
<%@ page import="model.CustomerDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<t:headcontents></t:headcontents>
<style>
    @import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css);
    body{margin-top:20px;}
    .fa-fw {width: 2em;}
    
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<script>
$(document).ready(function(){

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
});
</script>

</head>
<body>
<t:header></t:header>
		
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="active" onclick="doclick();"><a href="#"><i class="fa fa-pencil fa-fw-1x fa-spin"></i>User Profile</a></li>
                <li><a href="#" class="showContent" id="profile"><i class="fa fa-list-alt fa-fw-1x fa-spin"></i>Update Profile</a></li>
                <li><a href="#" class="showContent" id="password" ><i class="fa fa-file-o fa-fw-1x fa-spin"></i>Change Password</a></li>
                <li><a href="#" class="showContent" id="address"><i class="fa fa-home fa-fw-1x fa-spin"></i>Update Address</a></li>
            </ul>
        </div>
        <%
        CustomerBean c = CustomerDAO.getCustomer(session.getAttribute("id").toString());
        %>
        <div style="display:none" id= "profileForm" class="col-md-9 well">
        <h3>Update Profile</h3>
				<form action="profileChange" method="post">
					<div class="form-group">
						<label for="firstname">First name</label> <input name="firstname"
							class="form-control" id="firstname"
							value="<%=c.getFirstName()%>">
					</div>
					<div class="form-group">
						<label for="lastname">Last name</label> <input name="lastname"
							class="form-control" id="lastname"
							value="<%=c.getLastName()%>">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input name="email"
							class="form-control" id="email" value="<%=c.getEmail()%>">
					</div>
					<div class="form-group">
						<label for="phone">Phone</label> <input name="phone"
							class="form-control" id="phone"
							value="<%=c.getPhone()%>">
					</div>
					<div class="form-group">
						<label for="phone2">Phone</label> <input name="phone2"
							class="form-control" id="phone2"
							value="<%=c.getPhone2()%>">
					</div>

					<div class="checkbox">
						<label> <input type="checkbox" name="subscribed"
							value="subscribe" checked> I want to receive news and information
							about promotions in my email.
						</label>
						<input name= "control" type="hidden" value="profile">
					</div>
					
					<button type="submit" class="btn btn-default">Update</button>
				</form>

			</div > <!-- END PROFILE FROM --> 
			
        <div style="display:none" id="pwdForm" class="col-md-9 well" >
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
					
					<button type="submit" class="btn btn-default">Change</button>
				</form>
			</div>   <!-- END PWD FROM --> 
        <%
        String address[] = CustomerDAO.getCustomerAddress(session.getAttribute("id").toString());			
        %>
        <div style="display:none" id="addressForm" class="col-md-9 well" >
				<h3>Update Address</h3>
				<form action="changeAddress" method="post">
					<div class="form-group">
						<label for="address1">Address Line 1</label> <input
							name="address1" class="form-control" id="address1"
							value="<%=address[0].toString()%>">
					</div>
					<div class="form-group">
						<label for="address2">Address Line 2 (optional)</label> <input
							name="address2" class="form-control" id="address2"
							value="<%=address[1].toString()%>">
					</div>
					<div class="form-group">
						<label for="city">City</label> <input name="city"
							class="form-control" id="city" value="<%=address[2].toString()%>">
					</div>
					<div class="form-group">
						<label for="province">Province</label> <input name="province"
							class="form-control" id="province"value="<%=address[3].toString()%>">
					</div>
					<div class="form-group">
						<label for="postalcode">Postal Code / ZIP</label> <input
							name="postalcode" class="form-control" id="postalcode"
							value="<%=address[4].toString()%>">
					</div>
					<div class="form-group">
						<label for="phone">Phone</label> <input name="phone"
							class="form-control" id="phone"
							value="<%=address[5].toString()%>">
					</div>
					<input name= "control" class="form-control" type="hidden" value="address">
					<button type="submit" class="btn btn-default">Update</button>
					
				</form>
			</div> <!-- END ADDRESS FROM -->  
    </div>
</div>

<t:footer></t:footer>
</body>
</html>
