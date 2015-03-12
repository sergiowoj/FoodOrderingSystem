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
	private static CustomerBean customer ;
	private static String address[] = new String[6];

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


	public static CustomerBean getCustomer(String id){
		ResultSet rs = null;

		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement(""
					+ "SELECT first_name , last_name , phone, phone2, "
					+ "email, password, subscribed "
					+ "FROM customer WHERE id = "+id);

			rs = pst.executeQuery();
			//			CustomerBean(String password, String firstName,
			//					String lastName, String email, String phone, String phone2, String subscribed)
			while (rs.next()) {
				customer = new CustomerBean(
						rs.getString("password"),
						rs.getString("first_name"), 
						rs.getString("last_name"),
						rs.getString("email"), 
						rs.getString("phone"), 
						rs.getString("phone2"),
						rs.getString("subscribed"));
				System.out.println(customer.toString());
			}
			//			System.out.printf(rs.getString("password")+
			//					rs.getString("first_name")+ 
			//					rs.getString("last_name")+
			//					rs.getString("email")+ 
			//					rs.getString("phone")+ 
			//					rs.getString("phone2")+
			//					rs.getString("subscribed"));
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
		return customer;
	}

	public static boolean setCustomerPwd(String pwd, String id){
		int rs = 0;

		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement(""
					+ "UPDATE customer SET password = "+pwd
					+ " WHERE customer.id = "+id);

			rs = pst.executeUpdate();

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

		return (rs != 0? true:false);
	}

	public static boolean setCustomerProfile(String firstName, String lastName, 
			String email, String phone, String phone2, String subscribed, String id){
		int rs = 0;

		try {  
			conn = new DataManager().getConnection();
//			UPDATE customer SET first_name = 'igor v' , last_name = 'costa.' , phone = '154155158',
//					 phone2 = '581245812', subscribed = 'no' , email = 'email' WHERE customer.id = 4;
			pst = conn.prepareStatement("UPDATE customer SET first_name = ? , last_name = ? , phone = ? "
					+ " , phone2 = ? , subscribed = ? , email = ? WHERE customer.id = ? ");

			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, phone);
			pst.setString(4, phone2);
			pst.setString(5, subscribed);
			pst.setString(6, email);
			pst.setInt(7, Integer.parseInt(id));
			rs = pst.executeUpdate();

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

		return (rs != 0? true:false);
	}


	public static boolean setCustomerAddress(String address1, String address2, String city,
			String province, String postal_code, String phone, String id){
		int rs = 0;

		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement("UPDATE address SET address1 = ? " 
					+ ", address2 = ? , city = ? , province = ? , postal_code = ? , "
					+ " phone = ? WHERE customer_id = ? ");

			pst.setString(1, address1);
			pst.setString(2, address2);
			pst.setString(3, city);
			pst.setString(4, province);
			pst.setString(5, postal_code);
			pst.setString(6, phone);
			pst.setInt(7, Integer.parseInt(id));
			rs = pst.executeUpdate();

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

		return (rs != 0? true:false);
	}

	public static String[] getCustomerAddress(String id){
		ResultSet rs = null;

		try {  
			conn = new DataManager().getConnection();
			//			pst = conn.prepareStatement(""
			//					+ "SELECT address1 , address2, city, province, postal_code, phone"
			//					+ "FROM address WHERE customer_id = "+id);
			pst = conn.prepareStatement("SELECT * FROM address WHERE customer_id = "+id);

			rs = pst.executeQuery();
			System.out.println(pst);
			System.out.println(rs);
			while (rs.next()) {
				address[0] = rs.getString("address1");
				address[1] = rs.getString("address2"); 
				address[2] = rs.getString("city");
				address[3] = rs.getString("province"); 
				address[4] = rs.getString("postal_code"); 
				address[5] = rs.getString("phone");
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
		for	(int i= 0; i<address.length;i++){
			System.out.println(address[i]);
		}
		return address;
	}

}
