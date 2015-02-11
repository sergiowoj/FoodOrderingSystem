package beans;

public class ProductBean implements Comparable<ProductBean>
{
	private int id;
	private String category;     
	private String name;   
	private String ingredients;    
	private double price;    	
	private String description;
	private String size;

	public ProductBean(int id, String category, String name, String ingredients,
			double price, String description, String size) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
		this.ingredients = ingredients;
		this.price = price;
		this.description = description;
		this.size = size;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	@Override
	public int compareTo(ProductBean arg0) {
		return this.category.compareToIgnoreCase(arg0.category);

	}

}    	



