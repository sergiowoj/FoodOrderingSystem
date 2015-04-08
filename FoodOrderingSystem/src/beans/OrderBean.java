package beans;

public class OrderBean {

	private String id;
	private String date_in;
	private String item_id;
	private String quantity;
	private String name;
	private String stage;
	private String size;
	
	private String address1;
	private String address2;
	private String city;
	private String province;
	private String buzzerNumber;
	private String postalCode;
	private String phone;
	
	public OrderBean(String id, String date_in, String item_id,
			String quantity, String name, String stage, String size) {
		super();
		this.id = id;
		this.date_in = date_in;
		this.item_id = item_id;
		this.quantity = quantity;
		this.name = name;
		this.stage = stage;
		this.size = size;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate_in() {
		return date_in;
	}
	public void setDate_in(String date_in) {
		this.date_in = date_in;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	
	// 	address methods
	
	
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

	public String getBuzzerNumber() {
		return buzzerNumber;
	}

	public void setBuzzerNumber(String buzzerNumber) {
		this.buzzerNumber = buzzerNumber;
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
	
}
