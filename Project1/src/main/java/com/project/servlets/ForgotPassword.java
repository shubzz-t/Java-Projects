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
import com.query.models.UserModel;


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String newpass = request.getParameter("newpass");
		String confirmpass = request.getParameter("confirmpass");
		
		UserModel m = new UserModel(ConnectionDataSource.setConnection());
	    users user =	m.getUsersByEmail(email);
	    if (user == null) {
			Message msg = new Message("TRY USING REGISTERED EMAIL ID...", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("forgotpassword.jsp");
		} 
		else
		{
			user.setPassword(confirmpass);
		    m.updateUser(user);
			response.sendRedirect("login_page.jsp");
		}
	    
		
	}

}
