package beans;

public class CustomerBean
{
    //private String id;         	//Username
    private String password;    //Password    
    private String firstName;   //First Name
    private String lastName;    //Last Name
    private String address1;    //Address 1
    private String address2;    //Address 2
    private String city;        //City or Town
    private String province;
    private String postalCode;  //Postal Code
    private String email;       //Email
    private String phone;    	//Phone number
    private String phone2;    	//Phone number 2
    
	public CustomerBean(String password, String firstName,
			String lastName, String address1, String address2, String city,
			String province, String postalCode, String email, String phone, String phone2) {
		//this.id = id;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.province = province;
		this.postalCode = postalCode;
		this.email = email;
		this.phone = phone;
		this.phone2 = phone2;
	}

//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
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

}