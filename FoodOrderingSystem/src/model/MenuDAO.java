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
    private static  Connection conn = null;  
    private static PreparedStatement pst = null;
    private static ArrayList<ProductBean> menu ;
    
	public static ArrayList<ProductBean> listMenu(){
		ResultSet rs = null;
		
		try {  
            //Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();
  
            pst = conn.prepareStatement(""
            		+ "SELECT item.ItemID as id, item.Name as name, item.Price as price, "
            		+ "item.Description as description, item.Ingredients as ingredients, "
            		+ "size.Name as size, category.Name as category "
            		+ "FROM item "
            		+ "INNER JOIN size ON item.Size = size.SizeID "
            		+ "INNER JOIN category ON item.Category = category.CategoryID "
            		+ "ORDER BY item.ItemID;");
            
            rs = pst.executeQuery();
            int count = 0;
            menu = new ArrayList<ProductBean>();
            while (rs.next()) {
            	ProductBean product = new ProductBean(
            			rs.getInt("id"),
            			rs.getString("category"), 
            			rs.getString("name"),
            			rs.getString("ingredients"), 
            			rs.getDouble("price"), 
            			rs.getString("description"),
            			rs.getString("size"));
            	
                //Code to fill up your DTO
                menu.add(product);
                count++;
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
		System.out.println(menu.size());
		return menu;
	}

}
