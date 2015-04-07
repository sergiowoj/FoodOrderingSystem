package beans;

import java.util.ArrayList;

import org.json.JSONArray;

public class CustomerBean
{
	private String id;
    private byte[] password;    //Password    
    private byte[] salt;    	//Salt 
    private String firstName;   //First Name
    private String lastName;    //Last Name
    private String email;       //Email
    private String phone;    	//Phone number
    private String phone2;    	//Phone number 2
    private String subscribed;
    private ArrayList<AddressBean> addresses;
    
    private JSONArray addressesJSON; 

	public CustomerBean(){
    }
    
	public CustomerBean(byte[] password, byte[] salt, String firstName, String lastName, String email,
			String phone, String phone2, String subscribed) {
		this.password = password;
		this.setSalt(salt);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.phone2 = phone2;
		this.subscribed = subscribed;
	}
	
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getPassword() {
		return password;
	}

	public void setPassword(byte[] password) {
		this.password = password;
	}

	public byte[] getSalt() {
		return salt;
	}

	public void setSalt(byte[] salt) {
		this.salt = salt;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getSubscribed() {
		return subscribed;
	}

	public void setSubscribed(String subscribed) {
		this.subscribed = subscribed;
	}

	public ArrayList<AddressBean> getAddresses() {
		return addresses;
	}

	public void setAddresses(ArrayList<AddressBean> addresses) {
		this.addresses = addresses;
	}
	
	public String getAddressesJSON(String id){
		addressesJSON = new JSONArray(addresses);
		return addressesJSON.toString();
	}

//	@Override
//	public String toString() {
//		return "CustomerBean [password=" + password + ", firstName="
//				+ firstName + ", lastName=" + lastName + ", email=" + email
//				+ ", phone=" + phone + ", phone2=" + phone2 + ", subscribed="
//				+ subscribed + "]";
//	}

	
}