package io;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import commom.Security;
import model.Cart;
import model.CartItem;
import model.Item;
import model.User;

public class CartData {

	public static Cart withHashkey(String hashkey) {
		try {
			String sql = "SELECT * FROM cart WHERE hashkey=?";
			var ps = DBConnect.getConn().prepareStatement(sql);
			ps.setString(1, hashkey);
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				Cart cart = new Cart();
				cart.fill(res);
				return cart;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return null;
	}

	
	public static boolean add(Cart cart) {
		try {
			String sql = "INSERT INTO cart(id, hashkey) VALUES(NULL, ?)";
			var ps = DBConnect.getConn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, cart.getHashKey());
			int row = ps.executeUpdate();
			ResultSet res = ps.getGeneratedKeys();
			if (res.next()) {
				cart.setId(res.getInt(1));
			}
			return row == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	public static void update(Cart cart) {
		try {
			String data = CartData.parseJson(cart.getCartItems());
			String sql = "UPDATE cart SET data='" + data + "' WHERE id=" + cart.getId();
			var ps = DBConnect.getConn().createStatement();
			ps.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	

	public static String parseJson(ArrayList<CartItem> cartItems) {
		JSONArray arr = new JSONArray();
		for (var item : cartItems) {
			JSONObject job = new JSONObject();
			job.put("id", Integer.valueOf(item.getId()));
			job.put("price", Integer.valueOf(item.getPrice()));
			job.put("size", Integer.valueOf(item.getSize()));
			job.put("quantity", Integer.valueOf(item.getQuantity()));
			arr.add(job);
		}
		return arr.toJSONString();
	}
	
	public static ArrayList<CartItem> parseItems(String data){
		 ArrayList<CartItem> res = new  ArrayList<CartItem>();
		JSONArray job = (JSONArray) JSONValue.parse(data);
		for (var obj : job) {
			JSONObject job2 = (JSONObject) obj;
			CartItem cartItem = new CartItem(Integer.parseInt(job2.get("id").toString()), Integer.parseInt(job2.get("size").toString()), Integer.parseInt(job2.get("quantity").toString()));
			res.add(cartItem);
		}
		return res;
	}
	
	
	
}
