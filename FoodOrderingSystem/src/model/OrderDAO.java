package model;

import java.sql.*;
import java.util.ArrayList;

import beans.KitchenBean;
import beans.OrderBean;
import beans.ProductBean;

public class OrderDAO {
	
	private static Connection conn = null;  
	private static PreparedStatement pst = null;
	
	public static int insertItems(String orderId, ArrayList<ProductBean> items){
		int status = 0;
		
        try {  
        	
        	String query = "INSERT INTO order_item ( order_id, item_id, quantity ) VALUES ";		
    		for (ProductBean item : items) { query += "( "+orderId+", "+item.getId()+", "+item.getQuantity()+" ),"; }
    		query = query.substring(0, query.length()-1);
    		System.out.println(query);
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
	
	public static String createOrder(String orderTotal, String subTotal, String taxes, String deliveryCharge, String discount, String payment_method, String deliveryAddressId, String customerId){
		String orderId = "";
		try {  
			String query = ""
					+ "INSERT INTO `order` ( "
					+ "date_in , date_out , total_amount , subtotal_amount , taxes , delivery_charge, "
					+ "discount, payment_method, delivery_address_id , customer_id , cook_id , delivery_id , stage_id "
					+ ") VALUES "
					+ "( NOW(), NULL, "+orderTotal+", "+subTotal+", "+taxes+", "+deliveryCharge+", "+discount+", '"+payment_method+"', "+deliveryAddressId+", "+customerId+", 0, 0, 1 )";

            conn = new DataManager().getConnection();
            pst = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            int status = pst.executeUpdate();
            if(status > 0){
	            ResultSet rs = pst.getGeneratedKeys();
	            rs.next();
	            orderId = rs.getString(1);
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
        }
		return orderId;
	}
	
	public static void updateKitchen(){
		ResultSet rs = null;
		try {  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "SELECT `order`.id, `order`.date_in, order_item.item_id, "
            		+ "order_item.quantity, item.`name`, stage.`name` as stage , size.`name` as size "
            		+ "FROM `order` "
            		+ "INNER JOIN order_item ON `order`.id = order_item.order_id "
            		+ "INNER JOIN item ON item.id = order_item.item_id "
            		+ "INNER JOIN stage ON `order`.stage_id = stage.id "
            		+ "INNER JOIN size ON item.size_id = size.id "
            		+ "WHERE `stage`.`name` IN ('Open', 'Preparing') "
            		+ "ORDER BY `order`.id, `name` ASC");
           
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
            			rs.getString("stage"),
            			rs.getString("size")
            			);
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
	
	public static String[] getOrder(String orderId){
		ResultSet rs = null;
		String[] order = new String[14];
		try {  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "SELECT total_amount, subtotal_amount, "
            		+ "taxes, delivery_charge, discount, payment_method, alias, "
            		+ "address1, address2, city, province, "
            		+ "postal_code, buzzer_number, stage.`name` as stage "
            		+ "FROM `order` INNER JOIN address ON address.id = `order`.delivery_address_id "
            		+ "INNER JOIN stage ON stage.id = `order`.stage_id "
            		+ "WHERE `order`.id = "+orderId+";");
           
            rs = pst.executeQuery();

            while(rs.next()){
            	order[0] = rs.getString("total_amount");
            	order[1] = rs.getString("subtotal_amount");
            	order[2] = rs.getString("taxes");
            	order[3] = rs.getString("delivery_charge");
            	order[4] = rs.getString("discount");
            	order[5] = rs.getString("payment_method");
            	order[6] = rs.getString("alias");
            	order[7] = rs.getString("address1");
            	order[8] = rs.getString("address2");
            	order[9] = rs.getString("city");
            	order[10] = rs.getString("province");
            	order[11] = rs.getString("postal_code");
            	order[12] = rs.getString("buzzer_number");
            	order[13] = rs.getString("stage");
            	
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
		return order;
	}
	
	public static ArrayList<ProductBean> getItems(String orderId){
		ArrayList<ProductBean> items = new ArrayList<>();
		ResultSet rs = null;

		try {  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "SELECT quantity, item.`name`, price, description, size.`name` as size "
            		+ "FROM order_item INNER JOIN item ON item.id = order_item.item_id "
            		+ "INNER JOIN size ON size.id = item.size_id "
            		+ "WHERE order_item.order_id = "+orderId+";");
           
            rs = pst.executeQuery();

            while(rs.next()){
            	ProductBean product = new ProductBean();
            	product.setQuantity(rs.getInt("quantity"));
            	product.setName(rs.getString("name"));
            	product.setPrice(rs.getDouble("price"));
            	product.setDescription(rs.getString("description"));
            	product.setSize(rs.getString("size"));
            	items.add(product);            
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
		
		return items;
	}
	
	public static int changeOrderStage(String orderId, String stage){
		int status = 0;
		int stageInt = Integer.parseInt(stage);
	
        try {  
        	String query = "UPDATE `order` SET `stage_id`='"+stageInt+"' WHERE `id`='"+orderId+"';";		
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

}
