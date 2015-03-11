package beans;

import java.text.DecimalFormat;

public class ProductBean implements Comparable<ProductBean>
{
	private DecimalFormat outputFormat = new DecimalFormat("0.00");
	private String id;
	private String category;     
	private String name;   
	private String ingredients;    
	private String priceOut;    	
	private String description;
	private String size;
	private String totalPriceOut;
	
	private int quantity;
	
	private double price;
	private double totalPrice;

	public ProductBean(String id, String category, String name, String ingredients,
			double price, String description, String size) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
		this.ingredients = ingredients;
		this.priceOut = outputFormat.format(price);
		this.price = price;
		this.description = description;
		this.size = size;
		this.quantity = 1;
		
		this.totalPrice = quantity * price;
		this.totalPriceOut = outputFormat.format(totalPrice);		
	}
	
	public void incrementProduct(){
		this.quantity++;
		this.totalPrice = quantity * price;
		this.totalPriceOut = outputFormat.format(totalPrice);
	}
	
	public void decrementProduct(){
		this.quantity--;
		this.totalPrice = quantity * price;
		this.totalPriceOut = outputFormat.format(totalPrice);
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getTotalPriceOut() {
		return totalPriceOut;
	}

	public void setTotalPriceOut(String totalPriceOut) {
		this.totalPriceOut = totalPriceOut;
	}

	public String getPriceOut() {
		return priceOut;
	}

	public void setPriceOut(String priceOut) {
		this.priceOut = priceOut;
	}

	@Override
	public int compareTo(ProductBean arg0) {
		return this.category.compareToIgnoreCase(arg0.category);

	}

}    	



