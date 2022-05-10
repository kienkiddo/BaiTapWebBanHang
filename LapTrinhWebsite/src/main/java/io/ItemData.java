package io;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;
import model.User;

public class ItemData {

	public static ArrayList<Item> searchByPrice(ArrayList<Item> items, int price){
		if (price == -1) {
			return items;
		}
		int[] arr = {200000, 300000, 500000, Integer.MAX_VALUE};
		for (int i = items.size() - 1; i >= 0; i--) {
			if (items.get(i).getPrice() > arr[price] || (price > 0 && items.get(i).getPrice() < arr[price - 1])) {
				items.remove(i);
			}
		}
		return items;
	}
	
	public static ArrayList<Item> all(int type, int status){
		ArrayList<Item> items = new ArrayList<Item>();
		try {
			String sql = "SELECT * FROM item WHERE type=" + type + " and status=" + status;
			var ps = DBConnect.getConn().createStatement();
			ResultSet res = ps.executeQuery(sql);
			while (res.next()) {
				Item item = new Item();
				item.fill(res);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return items;
	}
	
	public static Item withId(int id) {
		try {
			String sql = "SELECT * FROM item WHERE id=" + id;
			var ps = DBConnect.getConn().createStatement();
			ResultSet res = ps.executeQuery(sql);
			while (res.next()) {
				Item item = new Item();
				item.fill(res);
				return item;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return null;
	}
}
