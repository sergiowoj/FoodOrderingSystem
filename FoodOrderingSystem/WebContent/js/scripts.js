function updateCart(response){
	$('#itemList').html('');
	var obj = response;
	var html = '';
	var totalPrice = 0;
	var count = 0;

	if(obj.length != 0){
	    $.each(obj, function() {
			html +=	"<li class=\"row\"><span class=\"col-xs-8\">"+this['quantity']+" x "+this['name']+"</span> <span class=\"col-xs-4 price\"> $"+this['price'].toFixed(2)+" <button type=\"button\" class=\"removeFromCart btn btn-xs\" id=\""+this['id']+"\">x</button></span></li>";
			totalPrice += parseFloat(this['totalPrice']);
			count+=1;
		})
	    $('#itemList').append(html);
	    $('.totalprice').html('Total price: $' + totalPrice.toFixed(2));
	    $('.placeOrder').removeAttr('disabled');
	} 
	else {
		var noItem = "No items selected";
		$('#itemList').append(noItem);
		$('.placeOrder').attr('disabled', 'true');
		$('.totalprice').html('');
	}
}

function addToCart(id){
	var itemId = id;
	var itemName = $('#productName'+itemId).text();
	var itemPrice = $('#productPrice'+itemId).text();
    $.ajax({
        url : 'addtocart.jsp',
        data : {
            itemId : itemId,
            itemName : $('#productName'+itemId).text(),
            itemPrice : $('#productPrice'+itemId).text()
        },
        success : function(response) {
        	updateCart(response);
        }
    });
}

function removeFromCart(id){
	var itemId = id;
    $.ajax({
        url : 'removefromcart.jsp',
        data : {
            itemId : itemId,
        },
        success : function(response) {
        	updateCart(response);
        }
    });
}

function listCart(){
	$.ajax({
        url : 'listcart.jsp',
        data : {},
        success : function(response) {
        	updateCart(response); 
        }
    });
}

String.prototype.capitalizeFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

function updateCheckoutAddressForm(response){
	$(".deliveryaddress input").attr('disabled', 'true');
	$('#alias').attr('value', response['alias']);
	$('#address1').attr('value', response['address1']);
	$('#address2').attr('value', response['address2']);
	$('#city').attr('value', response['city']);
	$('#province').attr('value', response['province']);
	$('#postalcode').attr('value', response['postalCode']);
	$('#phone').attr('value', response['phone']);
	$('#buzzer').attr('value', response['buzzerNumber']);
}

function initialCheckoutAddressForm(){
	$.ajax({
        url : 'getAddresses.jsp',
        data : {},
        success : function(response) {
        	var options = '';
        	if(response.length != 0){
        		$.each(response, function(){
        			options += "<option value='"+this["id"]+"'>"+this["alias"].capitalizeFirstLetter()+"</option>"
        		});
        		$('#selectaddress').html(options);
        		$('#selectaddress').append("<option value='newaddress'>New Address</option>");
        		updateCheckoutAddressForm(response[0]);
        	}
        }
    });
}

function changeCheckoutAddressForm(addressid){
	$.ajax({
        url : 'getAddresses.jsp',
        data : {},
        success : function(response) {
        	var options = '';
        	if(response.length != 0){
        		$.each(response, function(){
        			if(this["id"] == addressid){
        				updateCheckoutAddressForm(this)
        			}
        		})
        	}
        }
    });
}

function clearCheckoutAddressForm(){
	$(".deliveryaddress input").removeAttr('disabled');
	$('#alias').attr('value', '');
	$('#address1').attr('value', '');
	$('#address2').attr('value', '');
	$('#city').attr('value', '');
	$('#province').attr('value', '');
	$('#postalcode').attr('value', '');
	$('#phone').attr('value', '');
	$('#buzzer').attr('value', '');
}





















