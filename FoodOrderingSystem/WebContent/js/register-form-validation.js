$(document).ready(function() {
	
	$("#register_form").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			lastname: {
				required: true,
				minlength: 2,
				 maxlength: 15
			},
			email: {
				required: true,
				email: true
			},
			password: "required",
		    minlength: 6,
		    password_again: {
		      equalTo: "#password"
		    },
			phone: {
				required: true,
				number: true
			},
			phone2: {
				number: true
			}
		}
	});
	
	$("#profileChange").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			lastname: {
				required: true,
				minlength: 2,
				 maxlength: 20
			},
			email: {
				required: true,
				email: true
			},
			phone: {
				required: true,
				number: true
			},
			phone2: {
				number: true
			}
		}
	});
	
	$("#loginform").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 6
			}
		}
	});
	
	$("#pwdChange").validate({
		rules: {
		    password: {
		    	required: true,
		    	minlength: 6
		    },
		    password_again: {
		    	required: true,
		    	minlength: 6,
		    	equalTo: "#password"
		    }
		  }
	});
	
	$("#changeAddress").validate({
		rules: {
			address1: {
				required: true,
				minlength: 4,
	    	    maxlength: 25
			},
			address2: {
				minlength: 2,
	    	    maxlength: 15
			},
			city: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			province: {
				required: true,
				minlength: 2,
				maxlength: 15
			},
			postalcode: {
				required: true,
				minlength: 6,
				maxlength: 10
			},
			phone: {
				required: true,
				number: true,
				minlength: 8,
				maxlength: 14
			},
			buzzer: {
				minlength: 2,
				maxlength: 10
			}
		}
	});
	
	$("#checkout").validate({
		rules: {
			alias: {
				required: true,
				minlength: 2,
	    	    maxlength: 30
			},
			address1: {
				required: true,
				minlength: 4,
	    	    maxlength: 25
			},
			address2: {
				minlength: 2,
	    	    maxlength: 15
			},
			city: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			province: {
				required: true,
				minlength: 2,
				maxlength: 15
			},
			postalcode: {
				required: true,
				minlength: 6,
				maxlength: 10
			},
			phone: {
				required: true,
				number: true,
				minlength: 8,
				maxlength: 14
			},
			buzzer: {
				minlength: 2,
				maxlength: 10
			},
			
		}
	});
	
	$("#contactform").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			lastname: {
				required: true,
				minlength: 2,
				 maxlength: 20
			},
			email: {
				required: true,
				email: true
			},
			message: {
				required: true,
				minlength: 10
			}
		}
	});
	
});