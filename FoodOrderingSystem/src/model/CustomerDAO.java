package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.CustomerBean;
import model.DataManager;

public class CustomerDAO {
	
	//boolean status = false;  
    private static Connection conn = null;  
    private static PreparedStatement pst = null;  
    
	public static boolean login(String email, String password){
		ResultSet rs = null;
		boolean status = false;
		try {  
            //Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("SELECT id, first_name, last_name, email FROM customer WHERE email = ? AND password = ?");  
            pst.setString(1, email);
            pst.setString(2, password);
           
            rs = pst.executeQuery();
            status  = rs.next();
            
           

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
        return status;
	}
	
	
	public static int register(CustomerBean customer){	
		int status = 0;
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "INSERT INTO customer ("
            		+ "first_name, last_name, phone, "
            		+ "phone2, email, password, subscribed)"
            		+ "VALUES (? , ? , ? , ? , ? , ?, ?)");
            						
            pst.setString(1, customer.getFirstName());  
            pst.setString(2, customer.getLastName());
            pst.setString(3, customer.getPhone());
            pst.setString(4, customer.getPhone2());
            pst.setString(5, customer.getEmail());
            pst.setString(6, customer.getPassword());
            pst.setString(7, customer.getSubscribed());
            
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
	
	public static int addAddress(String alias, String address1, String address2, String city, 
			String province, String postalCode, String phone, String buzzerNumber, String customerId){
		int status = 0;	
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "INSERT INTO address"
                    + "( alias, address1, address2 ,"
                    + "city, province, postal_code, "
                    + "phone, buzzer_number, customer_id )" 
                    + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )");
			
            pst.setString(1, alias);  
            pst.setString(2, address1);  
            pst.setString(3, address2);
            pst.setString(4, city);
            pst.setString(5, province);
            pst.setString(6, postalCode);
            pst.setString(7, phone);
            pst.setString(8, buzzerNumber);
            pst.setString(9, customerId);
            
            System.out.println(pst);
  
            //status = pst.executeUpdate();  
  
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
	
	public static ArrayList<String> getUserInfo(String email){
		ResultSet rs = null;
		ArrayList<String> userInfo = new ArrayList<>();
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("SELECT id, first_name, last_name, email FROM customer WHERE email = ?"); 
            System.out.println(pst);
            pst.setString(1, email);
            
            System.out.println(pst);
            
            rs = pst.executeQuery();
            rs.next();

            userInfo.add(0, rs.getString("id"));
            userInfo.add(1, rs.getString("first_name"));
            userInfo.add(2, rs.getString("last_name"));
            userInfo.add(3, rs.getString("email"));

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
        return userInfo;
	}
	
	public void edit(){
		
	}

}
