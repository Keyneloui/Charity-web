package com.revature.dao;

import java.sql.Date;
import java.util.List;

import com.revature.exception.DBException;
import com.revature.model.User;

public interface UserDAO {

	void register(User user) throws DBException;

	User adminLogin(String emailIds, String passwords) throws DBException;

	User donorLogin(String email, String password) throws DBException;

	List<User> findAll() throws DBException;

	void donorActivity(String email, double amount, String requestType, Date date) throws DBException;

	void displayActivity() throws DBException;

	void admin(String email, String password) throws DBException;

}