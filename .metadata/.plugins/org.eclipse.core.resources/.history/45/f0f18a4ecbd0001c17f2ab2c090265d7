package model;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import io.InfoData;


public class Cart {

	private int id;
	
	private int userId;
	
	private String hashkey;

	private String strData;
	
	private Timestamp timeupdate; 
	
	private ArrayList<CartItem> cartItems = null;
	
	public ArrayList<CartItem> getCartItems() {
		if (cartItems == null) {
			cartItems = new ArrayList<CartItem>();
			JSONArray job = (JSONArray) JSONValue.parse(this.strData);
			for (var obj : job) {
				JSONObject job2 = (JSONObject) obj;
				int id = Integer.parseInt(job2.get("id").toString());
				int price = Integer.parseInt(job2.get("price").toString());
				var info = InfoData.parseJson(job2.get("info").toString());
				cartItems.add(new CartItem(id, price, info));
			}
		}
		return cartItems;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getHashKey() {
		return this.hashkey;
	}

	public void setHashKey(String hashkey) {
		this.hashkey = hashkey;
	}

	public Timestamp getTimeupdate() {
		return timeupdate;
	}

	public void setTimeupdate(Timestamp timeupdate) {
		this.timeupdate = timeupdate;
	}
	
}

