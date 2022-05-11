package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class User {
	
	private int id = -1;
	
	private String name;
	
	private String email;
	
	private String phone;
	
	private String password;
	
	private String hahskey;
	
	private int level;
	
	private Timestamp timecreat;

	public User() {
		
	}
	
	
	public User(String name, String phone, String email, String password, String hashkey) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.hahskey = hashkey;
	}

	public void fill(ResultSet res) throws SQLException {
		this.id = res.getInt("id");
		this.name = res.getString("name");
		this.email = res.getString("email");
		this.phone = res.getString("phone");
		this.password = res.getString("password");
		this.hahskey = res.getString("hashkey");
		this.level = res.getInt("level");
		this.timecreat = res.getTimestamp("timecreat");
	}
	
	public boolean isLogin() {
		return this.id > 0;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
	public String getHahskey() {
		return hahskey;
	}


	public void setHahskey(String hahskey) {
		this.hahskey = hahskey;
	}


	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}


	public Timestamp getTimecreat() {
		return timecreat;
	}


	public void setTimecreat(Timestamp timecreat) {
		this.timecreat = timecreat;
	}
	
	

}
