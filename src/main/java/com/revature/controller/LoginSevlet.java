package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.revature.dao.UserDAO;
import com.revature.dao.UserDAOImpl;
import com.revature.exception.DBException;
import com.revature.model.User;

/**
 * Servlet implementation class LoginSevlet
 */
public class LoginSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email_id = request.getParameter("email_id");
	       String password=request.getParameter("password");
	       
	       System.out.println("Email Id:" + email_id);
	       System.out.println("Password:" + password);
	       
	       User user = new User();
		   user.setEmail(email_id);
		   user.setPassword(password);
		   UserDAO dao=new UserDAOImpl();
		   try {
			dao.adminLogin(email_id, password);
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   PrintWriter out = response.getWriter();
	     
	       System.out.println("Email Id:" + email_id);
	       System.out.println("Password:" + password);
	       Gson gson=new Gson();
			String json=gson.toJson(user);
			out.write(json);
			out.flush();
			
	       
	      
		
	       

	      
}
}


