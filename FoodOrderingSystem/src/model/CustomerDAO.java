package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.AddressBean;
import beans.CustomerBean;
import model.DataManager;

public class CustomerDAO {

	//boolean status = false;  
	private static Connection conn = null;  
	private static PreparedStatement pst = null;
	private static CustomerBean customer ;
	
	public static boolean login(String email, String password){
		ResultSet rs = null;
		boolean status = false;
		PasswordEncryptionService pw = new PasswordEncryptionService();
		try {  
			//Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();

			pst = conn.prepareStatement("SELECT password, salt FROM customer WHERE email = ?");  
			pst.setString(1, email);
			
			rs = pst.executeQuery();

			while(rs.next()){
				if(pw.authenticate(password, rs.getBytes("password"), rs.getBytes("salt"))){
					status = true;
				} else {
					status = false;
				}
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
					+ "phone2, email, password, salt, subscribed)"
					+ "VALUES (? , ? , ? , ? , ? , ?, ?, ?)");

			pst.setString(1, customer.getFirstName());  
			pst.setString(2, customer.getLastName());
			pst.setString(3, customer.getPhone());
			pst.setString(4, customer.getPhone2());
			pst.setString(5, customer.getEmail());
			pst.setBytes(6, customer.getPassword());
			pst.setBytes(7, customer.getSalt());
			pst.setString(8, customer.getSubscribed());

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

	public static String addAddress(String alias, String address1, String address2, String city, 
			String province, String postalCode, String phone, String buzzerNumber, String customerId){

		String id = "";
		try {  
			//Class.forName(driver).newInstance();  
			conn = new DataManager().getConnection();

			pst = conn.prepareStatement(""
					+ "INSERT INTO address"
					+ "( alias, address1, address2 ,"
					+ "city, province, postal_code, "
					+ "phone, buzzer_number, customer_id )" 
					+ "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )", Statement.RETURN_GENERATED_KEYS);

			pst.setString(1, alias);  
			pst.setString(2, address1);  
			pst.setString(3, address2);
			pst.setString(4, city);
			pst.setString(5, province);
			pst.setString(6, postalCode);
			pst.setString(7, phone);
			pst.setString(8, buzzerNumber);
			pst.setString(9, customerId);

            int status = pst.executeUpdate();
            if(status > 0){
	            ResultSet rs = pst.getGeneratedKeys();
	            rs.next();
	            id = rs.getString(1);
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
		return id;
	}
	
	public static ArrayList<AddressBean> getCustomerAddresses(String id){
		ResultSet rs = null;
		ArrayList<AddressBean> addresses = new ArrayList<>();
		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement(""
					+ "SELECT id, alias, address1, address2, city, province, postal_code, "
					+ "phone, buzzer_number FROM address "
					+ "WHERE customer_id = "+id); 
			
			rs = pst.executeQuery();
			
			 while (rs.next()) {
	            	AddressBean address = new AddressBean(
	            			rs.getString("id"),
	            			rs.getString("alias"),
	            			rs.getString("address1"),
	            			rs.getString("address2"),
	            			rs.getString("city"),
	            			rs.getString("province"),
	            			rs.getString("postal_code"),
	            			rs.getString("phone"),
	            			rs.getString("buzzer_number"),
	            			id
	            			);
	            	
	                addresses.add(address);
	                address.toString();
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
		return addresses;	
	}

	public void edit(){

	}


	public static CustomerBean getCustomer(String email){
		ResultSet rs = null;

		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement(""
					+ "SELECT id, first_name , last_name , phone, phone2, "
					+ "email, password, salt, subscribed "
					+ "FROM customer WHERE email = '"+email+"'");
			rs = pst.executeQuery();
			
			while (rs.next()) {
				customer = new CustomerBean(
						rs.getBytes("password"),
						rs.getBytes("salt"),
						rs.getString("first_name"), 
						rs.getString("last_name"),
						rs.getString("email"), 
						rs.getString("phone"), 
						rs.getString("phone2"),
						rs.getString("subscribed")
						);
				customer.setId(rs.getString("id"));
				customer.setAddresses(getCustomerAddresses(rs.getString("id")));
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
			String province, String postal_code, String buzzer, String phone, String customerId, String addressId){
		int rs = 0;

		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement(""
					+ "UPDATE address SET "
					+ "address1 = ? " 
					+ ", address2 = ? "
					+ ", city = ? "
					+ ", province = ? "
					+ ", postal_code = ? "
					+ ", buzzer_number = ?"
					+ ", phone = ? "
					+ "WHERE id = ? "
					+ "AND customer_id = ? ");

			pst.setString(1, address1);
			pst.setString(2, address2);
			pst.setString(3, city);
			pst.setString(4, province);
			pst.setString(5, postal_code);
			pst.setString(6, buzzer);
			pst.setString(7, phone);
			pst.setString(8, addressId);
			pst.setString(9, customerId);
			
			System.out.println(pst);
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
		String address[] = new String[6];
		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement("SELECT * FROM address WHERE customer_id = "+id);

			rs = pst.executeQuery();
			
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
	
	public static AddressBean getSpecificAddress(String id){
		ResultSet rs = null;
		AddressBean address = new AddressBean();
		
		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement("SELECT id, alias, "
					+ "address1, address2, city, province, "
					+ "postal_code, phone, buzzer_number, customer_id "
					+ "FROM address WHERE id = "+id);

			rs = pst.executeQuery();

			while (rs.next()) {
				address.setId(rs.getString("id"));
				address.setAddress1(rs.getString("address1"));
				address.setAddress1(rs.getString("address2"));
				address.setCity(rs.getString("city"));
				address.setProvince(rs.getString("province"));
				address.setPostalCode(rs.getString("postal_code"));
				address.setPhone(rs.getString("phone"));
				address.setBuzzerNumber(rs.getString("buzzer_number"));
				address.setCustomerId(rs.getString("customer_id"));
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

		return address;		
	}
	
	public static int deleteAddress(String addressId){
		int status = 0;
		try {  
			conn = new DataManager().getConnection();
			pst = conn.prepareStatement("DELETE FROM address WHERE id = ? ");

			pst.setString(1, addressId);

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
