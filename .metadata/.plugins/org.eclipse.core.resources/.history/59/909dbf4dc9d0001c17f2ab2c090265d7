package io;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import model.Info;

public class InfoData {
	public static Info parseJson(String json) {
		JSONObject job = (JSONObject) JSONValue.parse(json);
		Info info = new Info(Integer.parseInt(job.get("size").toString()), Integer.parseInt(job.get("quantity").toString()));
		return info;
	}
}
