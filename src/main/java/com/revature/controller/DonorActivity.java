package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.revature.exception.DBException;
import com.revature.util.DisplayUtil;

/**
 * Servlet implementation class DonorActivity
 */
public class DonorActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email  = request.getParameter("email_id");
		String requestType= request.getParameter("requestType");
	   
	    String requestAmount = request.getParameter("requestAmount");
	    PrintWriter out = response.getWriter();
	    out.println("email_Id:" + email);
	    out.println("Type:"+requestType);
	   
	    out.println("Amount:" + requestAmount );
	    try {
			DisplayUtil.donorActivity();
		} catch (DBException e) {
			
	   
	}
}
}
