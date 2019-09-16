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
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //Get Inputs
        String email=request.getParameter("email_id");
        String pass=request.getParameter("password");
        PrintWriter out = response.getWriter();
           out.println("email_id:" + email);
           out.println("password:" + pass);
          
        //To call dao
           User user=new User();
          user.setEmail(email);
          user.setPassword(pass);
          UserDAO udao=new UserDAOImpl();
          try {
			user=udao.adminLogin(email, pass);
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          
       // Convert value to json
         
           Gson gson = new Gson();
           String json = gson.toJson(user);
           
          out.write("json:"+json);
			out.flush();

	}
}
