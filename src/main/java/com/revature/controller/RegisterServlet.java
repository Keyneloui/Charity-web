package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.revature.model.User;
import com.revature.dao.UserDAO;
import com.revature.dao.UserDAOImpl;
import com.revature.exception.DBException;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	       String name=request.getParameter("name");
	       String email_id = request.getParameter("email_id");
	       String password=request.getParameter("password");
	       
	       PrintWriter out = response.getWriter();
	     
	       System.out.println("Name:" + name);
	       System.out.println("Email Id:" + email_id);
	       System.out.println("Password:" + password);
	       User user = new User();
		
			user.setName(name);
			user.setEmail(email_id);
			user.setPassword(password);
	       UserDAO dao=new UserDAOImpl();
	       try {
			dao.register(user);
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
	       


	       
	}

	
}
