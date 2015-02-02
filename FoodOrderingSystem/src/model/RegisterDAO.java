package model;

import java.sql.*;
import java.util.ArrayList;

public class RegisterDAO {
	
	public static int register(ArrayList<String> userInfo){
		//boolean status = false;  
        Connection conn = null;  
        PreparedStatement pst = null;  
        //ResultSet rs = null;  
        int rs = 0;
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "cst8218";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "root";  
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
  
            pst = conn  
                    .prepareStatement("INSERT INTO users () VALUES ( )");  
            pst.setString(1, userInfo.get(0));  
            pst.setString(2, userInfo.get(1));
            pst.setString(3, userInfo.get(2));
            pst.setString(4, userInfo.get(3));
            pst.setString(5, userInfo.get(4));
            pst.setString(6, userInfo.get(5));
            pst.setString(7, userInfo.get(6));
            pst.setString(8, userInfo.get(7));
            
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
        }  
        return rs;
	}

}
