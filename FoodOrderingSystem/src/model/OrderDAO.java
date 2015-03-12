package model;

import java.sql.*;
import java.util.ArrayList;

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
	
	public static int createOrder(int orderId, String orderTotal, String subTotal, String taxes, String discount, String customerId){
		int status = 0;
		String query = ""
				+ "INSERT INTO `order` ( "
				+ "id , date_in , date_out , total_amount , subtotal_amount , taxes ,"
				+ "discount , customer_id , cook_id , delivery_id , stage_id "
				+ ") VALUES "
				+ "( "+orderId+", NOW(), NULL, "+orderTotal+", "+subTotal+", "+taxes+", "+discount+", "+customerId+", 0, 0, 0 )";
		
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
	
	public static void listOpenOrders(){
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
	}

}
