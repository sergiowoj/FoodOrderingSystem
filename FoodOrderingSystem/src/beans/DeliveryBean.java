package beans;

import java.util.ArrayList;

public class DeliveryBean {
	
	private static ArrayList<OrderBean> orders = new ArrayList<OrderBean>();
	
	public DeliveryBean(){
		
	}
	
	public static ArrayList<OrderBean> getOrders(){
		return orders;
	}
	
	public static void insertOrder(OrderBean order){
		orders.add(order);
	}

	public static void clearOrdersList(){
		orders.removeAll(orders);
	}
	
}
