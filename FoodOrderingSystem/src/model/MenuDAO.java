package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import beans.ProductBean;
import model.DataManager;

public class MenuDAO {
	
	//boolean status = false;  
    private static Connection conn = null;  
    private static PreparedStatement pst = null;
    private static ArrayList<ProductBean> menu = new ArrayList<ProductBean>();
    
	public static ArrayList<ProductBean> listMenu(){
		ResultSet rs = null;
		
		try {  
            //Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement("SELECT * FROM ITEM ");  
            System.out.println(pst);
            rs = pst.executeQuery();
                        
            while (rs.next()) {
            	ProductBean product = new ProductBean(rs.getString("category"), rs.getString("Name"),
            			rs.getString("ingredients"), rs.getDouble("Price"), rs.getString("Description"));
                //Code to fill up your DTO
                menu.add(product);
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
		Collections.sort(menu);
		return menu;
	}

}
