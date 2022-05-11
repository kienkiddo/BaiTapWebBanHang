package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import io.CartData;
import io.InfoData;


public class Cart {

	private int id;
	
	private String hashkey;
	
	private String strData;
	
	private Timestamp timeupdate; 
	
	private ArrayList<CartItem> cartItems = new ArrayList<CartItem>();
	
	public Cart() {
		
	}
	
	public Cart(String hashkey) {
		this.hashkey = hashkey;
	}
	
	public void fill(ResultSet res) throws SQLException {
		this.id = res.getInt("id");
		this.hashkey = res.getString("hashkey");
		this.strData = res.getString("data");
		this.timeupdate = res.getTimestamp("timeupdate");
		this.cartItems = CartData.parseItems(this.strData);
	}
	
	public int getPrice() {
		int price = 0;
		for (var item : this.cartItems) {
			price += item.getPrice();
		}
		return price;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	
	public ArrayList<CartItem> getCartItems() {
		return this.cartItems;
	}
	
	public void setCartItems(ArrayList<CartItem> items) {
		this.cartItems = items;
	}
	
	
	public void add(CartItem cartItem) {
		boolean flag = true;
		for (int i = 0; i < this.cartItems.size(); i++) {
			if (this.cartItems.get(i).getId() == cartItem.getId() && this.cartItems.get(i).getSize() == cartItem.getSize()) {
				this.cartItems.get(i).setQuantity(cartItem.getQuantity());
				flag = false;
				break;
			}
		}
		if (flag) {
			this.cartItems.add(cartItem);
		}
	}
	
	public void remove(int id, int size) {
		for (int i = this.cartItems.size() - 1; i >= 0; i--) {
			if (this.cartItems.get(i).getId() == id && this.cartItems.get(i).getSize() == size) {
				this.cartItems.remove(i);
				break;
			}
		}
	}
}

