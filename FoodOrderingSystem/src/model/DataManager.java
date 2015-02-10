package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataManager 
{
	
    private String dbURL = "jdbc:mysql://localhost:3306/fos";
    private String dbDriver = "com.mysql.jdbc.Driver";  
    private String dbUserName = "root";  
    private String dbPassword = "root";
    
    public DataManager() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
    	Class.forName(dbDriver).newInstance();
    }

	public void setDbURL(String dbURL)
	{
		this.dbURL = dbURL;
	}

	public String getDbURL()
	{
		return dbURL;
	}

	public void setDbUserName(String dbUserName) 
	{
		this.dbUserName = dbUserName;
	}

	public String getDbUserName() 
	{
		return dbUserName;
	}

	public void setDbPassword(String dbPassword) 
	{
		this.dbPassword = dbPassword;
	}

	public String getDbPassword() 
	{
		return dbPassword;
	}

	/*
	 * Open database connection
	 */
	public Connection getConnection() 
	{
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(getDbURL(), getDbUserName(),	getDbPassword());
		}
		catch (SQLException e) {
			System.out.println("Could not connect to DB");
			e.printStackTrace();
		}
		return conn;
	}

	/*
	 * Close open database connection
	 */
	public void putConnection(Connection conn) 
	{
		if (conn != null) 
		{
			try 
			{ 
				conn.close(); 
			}
			catch (SQLException e) {
				System.out.println("Enable to close DB connection");
				e.printStackTrace(); }
		}
	}

}
