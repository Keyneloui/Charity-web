package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
 * Servlet implementation class DonorListServlet
 */
public class DonorListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO iudao=new UserDAOImpl();
		List<User> list = null;
			try {
				 list = iudao.findAll();
			} catch (DBException e) {
				
			}
			Gson gson=new Gson();
			String json=gson.toJson(list);
			
			PrintWriter out =response.getWriter();
			
			out.write(json);
			out.flush();
			
			
		
	}
}
