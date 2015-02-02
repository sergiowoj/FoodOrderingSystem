<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<t:headcontents></t:headcontents>

</head>
<body>
<t:header></t:header>

<div class="container">
	<h1>Register</h1>
	<hr>
	<h3>Personal information</h3>
	<form action="register" method="post">
	  <div class="form-group">
	    <label for="firstname">First name</label>
	    <input name="firstname" class="form-control" id="firstname" placeholder="Enter your first name">
	  </div>
	  <div class="form-group">
	    <label for="lastname">Last name</label>
	    <input name="lastname" class="form-control" id="lastname" placeholder="Enter your last name">
	  </div>
	  <div class="form-group">
	    <label for="email">Email</label>
	    <input name="email" class="form-control" id="email" placeholder="Enter your email">
	  </div>
	  <div class="form-group">
	    <label for="password">Password</label>
	    <input name="password" class="form-control" id="password" placeholder="Enter your password">
	  </div>
	  <div class="form-group">
	    <label for="password-conf">Password</label>
	    <input name="password-conf" class="form-control" id="password-conf" placeholder="Confirm your password">
	  </div>
	  
	  <h3>Address</h3>
	  <div class="form-group">
	    <label for="address1">Address Line 1</label>
	    <input name="address1" class="form-control" id="address1" placeholder="Enter your street address, P.O. box, company name, c/o">
	  </div>
	  <div class="form-group">
	    <label for="address2">Address Line 2 (optional)</label>
	    <input name="address2" class="form-control" id="address2" placeholder="Enter your apartment, suite, unit, building, floor, etc.">
	  </div>
	  <div class="form-group">
	    <label for="city">City</label>
	    <input name="city" class="form-control" id="city" placeholder="City">
	  </div>
	  <div class="form-group">
	    <label for="province">Province</label>
	    <input name="province" class="form-control" id="province" placeholder="Province">
	  </div>
	  <div class="form-group">
	    <label for="postalcode">Postal Code / ZIP</label>
	    <input name="postalcode" class="form-control" id="postalcode" placeholder="Enter your postal code / ZIP">
	  </div>
	  <div class="form-group">
	    <label for="phone">Phone</label>
	    <input name="phone" class="form-control" id="phone" placeholder="Enter your phone number">
	  </div>  
	  
	  
	  <div class="checkbox">
	    <label>
	      <input type="checkbox"> I want to receive news and information about promotions in my email.
	    </label>
	  </div>
	  <button type="submit" class="btn btn-default">Register</button>
	</form>
</div>

<t:footer></t:footer>
</body>
</html>