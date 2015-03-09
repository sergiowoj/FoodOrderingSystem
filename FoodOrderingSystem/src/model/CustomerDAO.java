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
  
            pst = conn.prepareStatement("SELECT CustomerID, FirstName, LastName, Email FROM customer WHERE Email = ? AND Password = ?");  
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
  
            //pst = conn.prepareStatement("INSERT INTO users (first_name, last_name, email, password, address1, address2, city, province, postalcode, phone) VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ?)");
            pst = conn.prepareStatement(""
            		+ "INSERT INTO customer ("
            		+ "FirstName, LastName, Phone, "
            		+ "Phone2, Email, Password, "
            		+ "Address1, Address2, City, "
            		+ "Province, Postalcode) "
            		+ "VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?)");
            						
            pst.setString(1, customer.getFirstName());  
            pst.setString(2, customer.getLastName());
            pst.setString(3, customer.getPhone());
            pst.setString(4, customer.getPhone2());
            pst.setString(5, customer.getEmail());
            pst.setString(6, customer.getPassword());
            pst.setString(7, customer.getAddress1());
            pst.setString(8, customer.getAddress2());
            pst.setString(9, customer.getCity());
            pst.setString(10, customer.getProvince());
            pst.setString(11, customer.getPostalCode());

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
	
	public static ArrayList<String> getUserInfo(String email){
		ResultSet rs = null;
		ArrayList<String> userInfo = new ArrayList<>();
		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("SELECT CustomerID, FirstName, LastName, Email FROM customer WHERE Email = ?"); 
            System.out.println(pst);
            pst.setString(1, email);
            
            System.out.println(pst);
            
            rs = pst.executeQuery();
            rs.next();

            userInfo.add(0, rs.getString("CustomerID"));
            userInfo.add(1, rs.getString("FirstName"));
            userInfo.add(2, rs.getString("LastName"));
            userInfo.add(3, rs.getString("Email"));

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
