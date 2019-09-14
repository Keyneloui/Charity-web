package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.revature.model.DonationRequest;
import com.google.gson.Gson;
import com.revature.dao.DonationDAO;
import com.revature.dao.DonationDAOImpl;
import com.revature.exception.DBException;

/**
 * Servlet implementation class AddRequest
 */
public class AddRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestType= request.getParameter("requestType");
	    String requestId  = request.getParameter("requestId");
	    String requestAmount = request.getParameter("requestAmount");
	    PrintWriter out = response.getWriter();
	    out.println("Type:"+requestType);
	    out.println("Id:" + requestId);
	    out.println("Amount:" + requestAmount );
	   

		DonationDAO dao = new DonationDAOImpl();
		DonationRequest dr = new DonationRequest();
	    dr.setRequestAmount(Double.parseDouble(requestAmount));
		dr.setRequestId(Integer.parseInt(requestId));
		dr.setRequestType(requestType);
		
		Gson gson=new Gson();
		String json=gson.toJson(dr);
		
		try {
			dao.addDonations(dr);
		} catch (DBException e) {
			 //response.sendRedirect("register.jsp?message="+e.getMessage());
			 
			
		}
		
		
	}
	
}
