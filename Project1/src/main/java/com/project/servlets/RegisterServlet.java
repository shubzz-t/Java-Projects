package com.project.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.entities.users;
import com.database.helper.ConnectionDataSource;
import com.query.models.UserModel;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String check = request.getParameter("terms");

		if (check == null) {
			response.getWriter().println("You have to agree the terms and conditions..");
		} else {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			users user = new users(username, email, password, gender, about );

			UserModel usr = new UserModel(ConnectionDataSource.setConnection());
			if (usr.saveUser(user)) {
				response.getWriter().println("INSERTED");
			} else {
				response.getWriter().println("Email is registered try to login");
			}
		}

	}

}
