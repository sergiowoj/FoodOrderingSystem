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
	    $(".placeOrder").removeAttr('disabled');
	} 
	else {
		var noItem = "No items selected";
		$('#itemList').append(noItem);
		$(".placeOrder").attr('disabled', 'true');
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
