package com.revature.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.revature.dao.UserDAO;
import com.revature.dao.UserDAOImpl;
import com.revature.model.User;

public class DonorController {
	static UserDAO udao = new UserDAOImpl();

	public static String login(String email, String password) {

		String errorMessage = null;

		User user = null;
		try {
			user = udao.donorLogin(email, password);
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

	public static String register(String name, String email, String password) {

		String errorMessage = null;
		String message = null;
		User user = null;
		try {
			user = new User();

			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			udao.register(user);
			message = "Success";

		} catch (Exception e) {
			// e.printStackTrace();
			errorMessage = e.getMessage();
		}

		// Prepare JSON Object

		JsonObject obj = new JsonObject();
		if (message != null) {

			obj.addProperty("message", message);
		} else if (errorMessage != null) {
			obj.addProperty("errorMessage", errorMessage);
		}

		return obj.toString();

	}

	public static void main(String[] args) {

		//testLogin();
		testRegister();

	}

	private static void testLogin() {
		System.out.println("Test Case 1: Valid User");
		String validUserJson = DonorController.login("k@gmail.com", "1234");
		System.out.println(validUserJson);

		System.out.println("Test Case 2: Invalid User");
		String invalidUserJson = DonorController.login("invaliduser@gmail.com", "password");
		System.out.println(invalidUserJson);
	}

	private static void testRegister() {
		System.out.println("Test Case 1: Valid User");
		String validUserJson = DonorController.register("yne", "i@gmail.com", "234");
		System.out.println(validUserJson);
		System.out.println("Test Case 1: Valid User");
		String invalidUserJson = DonorController.register("Sheyne", "s@gmail.com", "234");
		System.out.println(invalidUserJson);


	}

}
