package beans;

public class AddressBean {

	private String id;
	private String alias;
	private String address1;
	private String address2;
	private String city;
	private String province;
	private String postalCode;
	private String phone;
	private String buzzerNumber;
	private String customerId;
	
	public AddressBean(){};
	
	public AddressBean(String id, String alias, String address1,
			String address2, String city, String province, String postalCode,
			String phone, String buzzerNumber, String customerId) {
		super();
		this.id = id;
		this.alias = alias;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.province = province;
		this.postalCode = postalCode;
		this.phone = phone;
		this.buzzerNumber = buzzerNumber;
		this.customerId = customerId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBuzzerNumber() {
		return buzzerNumber;
	}

	public void setBuzzerNumber(String buzzerNumber) {
		this.buzzerNumber = buzzerNumber;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	
	
}
