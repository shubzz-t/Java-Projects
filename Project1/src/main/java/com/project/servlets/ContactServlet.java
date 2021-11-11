package com.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.entities.Contact;
import com.database.entities.Message;
import com.database.helper.ConnectionDataSource;
import com.query.models.ContactModel;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		HttpSession session = request.getSession();
		Contact contact = new Contact(name, email, subject, message);
		ContactModel contactModel = new ContactModel(ConnectionDataSource.setConnection());
		contactModel.insertcontactDetails(contact);
		if (contactModel.insertcontactDetails(contact)) {
			Message msg = new Message("Query Submitted " + name , "success", "alert-success");
			session.setAttribute("msg", msg);
		}
		response.sendRedirect("contact.jsp");

	}

}
