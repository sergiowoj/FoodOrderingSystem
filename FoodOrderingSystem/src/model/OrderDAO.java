package model;

import java.sql.*;
import java.util.ArrayList;

import beans.KitchenBean;
import beans.OrderBean;
import beans.ProductBean;

public class OrderDAO {
	
	private static Connection conn = null;  
	private static PreparedStatement pst = null;
	
	public static int placeOrder(){
	    int status = 0;
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "INSERT INTO customer ("
            		+ "first_name, last_name, phone, "
            		+ "phone2, email, password, subscribed)"
            		+ "VALUES (? , ? , ? , ? , ? , ?, ?)");
            						
//            pst.setString(1, customer.getFirstName());  
//            pst.setString(2, customer.getLastName());
//            pst.setString(3, customer.getPhone());
//            pst.setString(4, customer.getPhone2());
//            pst.setString(5, customer.getEmail());
//            pst.setString(6, customer.getPassword());
//            pst.setString(7, customer.getSubscribed());
            
            System.out.println(pst);
  
            status = pst.executeUpdate();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }    
        }  
        return status;
	}
	
	public static String getLastOrderId(){
		ResultSet rs = null;
		boolean status = false;
		String id = "";
		try {  
            //Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("SELECT id FROM `order` ORDER BY id DESC LIMIT 1");  
           
            rs = pst.executeQuery();
            status = rs.next();
            id = rs.getString("id");
            
		} catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return id;
	}
	
	public static int insertItems(int orderId, ArrayList<ProductBean> items){
		int status = 0;
		String query = "INSERT INTO order_item ( order_id, item_id, quantity ) VALUES ";		
		for (ProductBean item : items) { query += "( "+orderId+", "+item.getId()+", "+item.getQuantity()+" ),"; }
		query = query.substring(0, query.length()-1);
		
        try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
            pst = conn.prepareStatement(query);
            status = pst.executeUpdate();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }    
        }  
        
        return status;
	}
	
	public static int createOrder(int orderId, String orderTotal, String subTotal, String taxes, String discount, String deliveryAddressId, String customerId){
		int status = 0;
		String query = ""
				+ "INSERT INTO `order` ( "
				+ "id , date_in , date_out , total_amount , subtotal_amount , taxes ,"
				+ "discount, delivery_address_id , customer_id , cook_id , delivery_id , stage_id "
				+ ") VALUES "
				+ "( "+orderId+", NOW(), NULL, "+orderTotal+", "+subTotal+", "+taxes+", "+discount+", "+deliveryAddressId+", "+customerId+", 0, 0, 1 )";
		
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
            pst = conn.prepareStatement(query);
            status = pst.executeUpdate();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }    
        }
		return status;
	}
	
	public static void updateKitchen(){
		ResultSet rs = null;
		try {  
            //Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "SELECT `order`.id, `order`.date_in, order_item.item_id, "
            		+ "order_item.quantity, item.`name`, stage.name as stage "
            		+ "FROM `order` "
            		+ "INNER JOIN order_item ON `order`.id = order_item.order_id "
            		+ "INNER JOIN item ON item.id = order_item.item_id "
            		+ "INNER JOIN stage ON `order`.stage_id = stage.id "
            		+ "WHERE `stage`.name = \"Open\" "
            		+ "ORDER BY `order`.id ASC");
            		//+ "WHERE stage.name LIKE \"Open\"");  
           
            rs = pst.executeQuery();
            // status = rs.next();
            KitchenBean.clearOrdersList();
            while(rs.next()){
            	OrderBean order = new OrderBean(
            			rs.getString("id"),
            			rs.getString("date_in"),
            			rs.getString("item_id"),
            			rs.getString("quantity"),
            			rs.getString("name"),
            			rs.getString("stage")
            			);
//            	System.out.println(rs.getString("id"));
//            	System.out.println(rs.getString("quantity"));
//            	System.out.println(rs.getString("name"));
//            	System.out.println("----------------------------------------------------");
            	KitchenBean.insertOrder(order);
            }

            
		} catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
	}

}
