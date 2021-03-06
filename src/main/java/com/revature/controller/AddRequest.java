package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddRequest
 */
public class AddRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestType = request.getParameter("requestType");
		int requestId = Integer.parseInt(request.getParameter("requestId"));
		double requestAmount = Double.parseDouble(request.getParameter("requestAmount"));
		String json = DonationController.addRequest(requestType, requestId, requestAmount);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();

	}

}
