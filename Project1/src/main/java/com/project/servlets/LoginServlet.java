package com.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.entities.Message;
import com.database.entities.users;
import com.database.helper.ConnectionDataSource;
import com.mysql.cj.Session;
import com.query.models.UserModel;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserModel usr = new UserModel(ConnectionDataSource.setConnection());

		users user = usr.getUsersByEmailAndPassword(email, password);

		if (user == null) {
//			response.getWriter().println("INVALID LOGIN DETAILS...");
			Message msg = new Message("INVALID LOGIN DETAILS...", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		} 
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("currentuser", user);
			response.sendRedirect("profile.jsp");
		}
	}

}
