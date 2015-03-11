package beans;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.json.JSONArray;

public class InvoiceBean {
	
	private int id;
	//SimpleDateFormat date_format = new SimpleDateFormat("MMM dd,yyyy HH:mm");
	private SimpleDateFormat dateIn;
	private SimpleDateFormat dateOut;
	private float totalAmount;
	private int customerId;
	private int cookId;
	private int deliverId;
	private int stage;
	protected ArrayList<String> items; // pode virar int para representar o id do bd, mas so quando conseguir ler de boas no banco
	
	JSONArray jsonArray;
	
	public InvoiceBean(float totalAmount, ArrayList<String> items) {
		super();
		this.totalAmount = totalAmount;
		items = new ArrayList<String>() ;
		dateIn = getDate();
		this.items = items;
		stage = 0;
	}

	public String listItem(){
		
		jsonArray = new JSONArray(items);
		return jsonArray.toString();
		
	}
	
	private SimpleDateFormat getDate(){
		Calendar cal = new GregorianCalendar();
	    Date creationDate = cal.getTime();
	    SimpleDateFormat date_format = new SimpleDateFormat("MMM dd,yyyy HH:mm");
	    return date_format;
	}
	
	public void dateOut(){
		dateOut = getDate();
	}
	
	public void changeStage(){
		stage++;
	}
}
