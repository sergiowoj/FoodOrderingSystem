package beans;

public class ProductBean implements Comparable<ProductBean>
{

	private String category;     
	private String name;   
	private String ingredients;    
	private double price;    	
	private String description;

	public ProductBean(String category, String name, String ingredients,
			double price, String description) {
		super();
		this.category = category;
		this.name = name;
		this.ingredients = ingredients;
		this.price = price;
		this.description = description;
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

	@Override
	public int compareTo(ProductBean arg0) {
		return this.category.compareToIgnoreCase(arg0.category);

	}

}    	



