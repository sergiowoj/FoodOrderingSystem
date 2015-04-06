package beans;

import java.text.DecimalFormat;
import java.util.ArrayList;

import model.OrderDAO;

import org.json.JSONArray;

public class ShoppingCartBean {
	
	private ArrayList<ProductBean> items = new ArrayList<>();
	private DecimalFormat outputFormat = new DecimalFormat("0.00");
	private String userId;
	private String subTotal;
	private String orderTotal;
	private String pst;
	private String hstgst;
	private String taxes;
	private String discount;
	private String deliveryCharge;
	private String deliveryAddressId;
	private String paymentMethod;

	JSONArray jsonArray;
	
	public ShoppingCartBean(){
		
	}
	
	public String addItem(String itemId, String itemName, double itemPrice, int quantity){

		boolean hasItemToAdd = true;
		if(items.size() > 0){
			for (ProductBean item : items) {
				if(item.getId().equals(itemId)){
					item.incrementProduct();
					hasItemToAdd = false;
					break;
				}
			}
			if(hasItemToAdd)
				items.add(new ProductBean(itemId, "", itemName, "", itemPrice, "", ""));
		} else {
			items.add(new ProductBean(itemId, "", itemName, "", itemPrice, "", ""));
		}		
		
		jsonArray = new JSONArray(items);

		return jsonArray.toString();
	}
	
	public String removeItem(String itemId){
		if(items.size() != 0){
			ProductBean productToRemove = null;
			for (ProductBean productBean : items) {
				if(productBean.getId().equals(itemId)){
					productToRemove = productBean;
				}
			}
			items.remove(productToRemove);
			jsonArray = new JSONArray(items);
			return jsonArray.toString();
		}
		return "";
	}
	
	public String listItem(){
		//if(items.size() != 0){
			jsonArray = new JSONArray(items);
			return jsonArray.toString();
		//}
	}
	
	public String checkout(){
		String orderId = OrderDAO.createOrder(getOrderTotal(), getSubTotal(), getTaxes(), getDeliveryCharge(), getDiscount(), getPaymentMethod(), getDeliveryAddressId(), getUserId());
		if(!orderId.equals("")){
			if(OrderDAO.insertItems(orderId, items) > 0){
				OrderDAO.updateKitchen();
				return orderId;
			}
		}
		return "";
	}
	
	public ArrayList<String> listName(){
		ArrayList<String> aux = new ArrayList<String>();
	
			for (ProductBean productBean : items) 
				aux.add(productBean.getName());
			return aux ;
	}

	public void calculateOrder(){
		float subTotal = 0;
		float orderTotal = 0;
		float discount = 0;
		float pst = 0;
		float hstgst = 0.13f;
		float deliveryCharge = 2;
		float taxes = 0;
			
		for(ProductBean i : items)
		{
			i.getName();
			subTotal += i.getTotalPrice();
		}
		orderTotal = subTotal * 1.13f;
		taxes = subTotal * hstgst;
		orderTotal = orderTotal + deliveryCharge;
		
		this.subTotal = outputFormat.format(subTotal);
		this.deliveryCharge = outputFormat.format(deliveryCharge);
		this.pst = outputFormat.format(pst);
		this.taxes = outputFormat.format(taxes);
		this.discount = outputFormat.format(discount);
		this.orderTotal = outputFormat.format(orderTotal);
	}
	
	public ArrayList<ProductBean> getCart(){
		return items;
	}
	
	public int getNumberOfItems(){
		return items.size();
	}

	public String getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}

	public String getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(String orderTotal) {
		this.orderTotal = orderTotal;
	}

	public String getTaxes() {
		return taxes;
	}

	public void setTaxes(String taxes) {
		this.taxes = taxes;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(String deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public String getHstgst() {
		return hstgst;
	}

	public void setHstgst(String hstgst) {
		this.hstgst = hstgst;
	}

	public String getPst() {
		return pst;
	}

	public void setPst(String pst) {
		this.pst = pst;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDeliveryAddressId() {
		return deliveryAddressId;
	}

	public void setDeliveryAddressId(String deliveryAddressId) {
		this.deliveryAddressId = deliveryAddressId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
}
