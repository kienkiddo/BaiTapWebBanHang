package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import io.BillData;

public class History {

	private int id;
	
	private int userId;
	
	private int status;
	
	private String name;
	
	private String phone;
	
	private String address;
	
	private Timestamp timecreat;
	
	private ArrayList<Bill> bills;
	
	public void fill(ResultSet res) throws SQLException {
		this.id = res.getInt("id");
		this.userId = res.getInt("userId");
		this.status = res.getInt("status");
		this.name = res.getString("name");
		this.phone = res.getString("phone");
		this.address = res.getString("address");
		this.timecreat = res.getTimestamp("timecreat");
	}
	
	public ArrayList<Bill> getBills() {
		if (this.bills == null) {
			this.bills = BillData.withHistoryId(this.id);
		}
		return this.bills;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Timestamp getTimecreat() {
		return timecreat;
	}

	public void setTimecreat(Timestamp timecreat) {
		this.timecreat = timecreat;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getPrice() {
		int price = 0;
		for (var bill : this.getBills()) {
			price += bill.getPrice() * bill.getQuantity();
		}
		return price;
	}
	
}
