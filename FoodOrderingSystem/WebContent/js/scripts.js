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
	var itemPrice = $('#productPrice'+itemId).attr('class');
    $.ajax({
        url : 'addtocart.jsp',
        data : {
            itemId : itemId,
            itemName : itemName,
            itemPrice : itemPrice
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

function updateAddressForm(response){
	$(".deliveryaddress input").attr('disabled', 'true');
	$('#alias').val(response['alias']);
	$('#address1').val(response['address1']);
	$('#address2').val(response['address2']);
	$('#city').val(response['city']);
	$('#province').val(response['province']);
	$('#postalcode').val( response['postalCode']);
	$('#phone').val(response['phone']);
	$('#buzzer').val(response['buzzerNumber']);
}

function initialAddressForm(page){
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
        		if(page=='checkout'){
        			$('#selectaddress').append("<option value='newaddress'>New Address</option>");
        		}
        		updateAddressForm(response[0]);
        	}
        }
    });
}

function changeAddressForm(addressid){
	$.ajax({
        url : 'getAddresses.jsp',
        data : {},
        success : function(response) {
        	var options = '';
        	if(response.length != 0){
        		$.each(response, function(){
        			if(this["id"] == addressid){
        				updateAddressForm(this)
        			}
        		})
        	}
        }
    });
}

function clearAddressForm(){
	$(".deliveryaddress input").removeAttr('disabled');
	$('#alias').val('');
	$('#address1').val('');
	$('#address2').val('');
	$('#city').val('');
	$('#province').val('');
	$('#postalcode').val('');
	$('#phone').val('');
	$('#buzzer').val('');
}





















