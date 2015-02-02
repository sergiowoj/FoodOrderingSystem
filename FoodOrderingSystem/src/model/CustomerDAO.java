package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DataManager;

public class CustomerDAO {
	
	//boolean status = false;  
    Connection conn = null;  
    PreparedStatement pst = null;  
    int rs = 0;
	
	public void login(){
		
	}
	
	public int register(ArrayList<String> userInfo){

		try {  
            //Class.forName(driver).newInstance();  
            conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("INSERT INTO users (first_name, last_name, email, password, address1, address2, city, province, postalcode, phone) VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ?)");  
            pst.setString(1, userInfo.get(0));  
            pst.setString(2, userInfo.get(1));
            pst.setString(3, userInfo.get(2));
            pst.setString(4, userInfo.get(3));
            pst.setString(5, userInfo.get(5));
            pst.setString(6, userInfo.get(6));
            pst.setString(7, userInfo.get(7));
            pst.setString(8, userInfo.get(8));
            pst.setString(9, userInfo.get(9));
            pst.setString(10, userInfo.get(10));

            
            
            System.out.println(pst);
  
            rs = pst.executeUpdate();  
            //status = rs.next();  
  
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
//            if (rs != null) {  
//                try {  
//                    rs.close();  
//                } catch (SQLException e) {  
//                    e.printStackTrace();  
//                }  
//            }  
        }  
        return rs;
	}
	
	public void edit(){
		
	}

}
