package beans;

public class OrderBean {

	private String id;
	private String date_in;
	private String item_id;
	private String quantity;
	private String name;
	private String stage;
	
	public OrderBean(String id, String date_in, String item_id,
			String quantity, String name, String stage) {
		super();
		this.id = id;
		this.date_in = date_in;
		this.item_id = item_id;
		this.quantity = quantity;
		this.name = name;
		this.stage = stage;
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

	
	
}
