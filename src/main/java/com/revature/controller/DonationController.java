package com.revature.controller;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.revature.dao.DonationDAO;
import com.revature.dao.DonationDAOImpl;
import com.revature.exception.DBException;
import com.revature.model.DonationRequest;
import com.revature.util.DisplayUtil;

public class DonationController {

	static DonationDAO dao = new DonationDAOImpl();

	public static String listRequest() {
		String json = null;
		List<DonationRequest> list = null;
		String errorMessage = null;
		try {
			list = dao.findAll();
			DisplayUtil.display(list);

		} catch (DBException e) {
			errorMessage = e.getMessage();

		}
		if (list != null) {
			Gson gson = new Gson();
			json = gson.toJson(list);
		}
		if (errorMessage != null) {
			JsonObject obj = new JsonObject();
			obj.addProperty("errorMessage", errorMessage);
		}

		return json;

	}

	public static String addRequest(String requestType, int requestId, double requestAmount) {

		String errorMessage = null;
		String message = null;
		DonationRequest dr = null;
		try {
			dr = new DonationRequest();

			dr.setRequestType(requestType);
			dr.setRequestId(requestId);
			dr.setRequestAmount(requestAmount);
			dao.addDonations(dr);
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
		testAddDonation();
		listRequest();
	}

	private static void testAddDonation() {
		System.out.println("Test Case 1: Valid Input");
		String validUserJson = DonationController.addRequest("Goods", 5, 10000);
		System.out.println(validUserJson);
		System.out.println("Test Case 2: Invalid Input");
		String invalidUserJson = DonationController.addRequest("Food", 1, 10000);

		System.out.println(invalidUserJson);

	}

}
