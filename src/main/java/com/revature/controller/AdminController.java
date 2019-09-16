package com.revature.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.revature.dao.UserDAO;
import com.revature.dao.UserDAOImpl;
import com.revature.model.User;

public class AdminController {

	static UserDAO udao = new UserDAOImpl();

	public static String login(String email, String password) {

		String errorMessage = null;

		User user = null;
		try {
			user = udao.adminLogin(email, password);
			if (user == null) {
				throw new Exception("invalid ");
			}

		} catch (Exception e) {
			// e.printStackTrace();
			errorMessage = e.getMessage();
		}

		// Prepare JSON Object
		String json = null;
		Gson gson = new Gson();
		if (user != null) {
			json = gson.toJson(user);
		} else if (user == null) {
			JsonObject obj = new JsonObject();
			obj.addProperty("errorMessage", errorMessage);
			json = obj.toString();
		}

		return json;

	}

	public static void main(String[] args) {

		 testLogin();

	}

	private static void testLogin() {
		System.out.println("Test Case 1: Valid User");
		String validUserJson = AdminController.login("k1@gmail.com", "123");
		System.out.println(validUserJson);

		System.out.println("Test Case 2: Invalid User");
		String invalidUserJson = AdminController.login("invaliduser@gmail.com", "password");
		System.out.println(invalidUserJson);
	}
}
