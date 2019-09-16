package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.revature.dao.DonationDAO;
import com.revature.dao.DonationDAOImpl;
import com.revature.exception.DBException;
import com.revature.model.DonationRequest;
import com.revature.util.DisplayUtil;


/**
 * Servlet implementation class ListRequests
 */
public class ListRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonationDAO dao = new DonationDAOImpl();
		

			String json=DonationController.listRequest();
			
			PrintWriter out =response.getWriter();
			
			out.write(json);
			out.flush();
			

		
	}
	
	
}
