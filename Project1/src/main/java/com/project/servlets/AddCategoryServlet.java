package com.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.entities.Message;
import com.database.helper.ConnectionDataSource;
import com.query.models.CategoryModel;


@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession(); 
String title = request.getParameter("name");
String description = request.getParameter("description");

CategoryModel catm = new CategoryModel(ConnectionDataSource.setConnection());
catm.insertCategory(title, description);
Message msg = new Message(title + " ADDED ", "success", "alert-success");
session.setAttribute("msg", msg);
response.sendRedirect("profile.jsp");
	}

}
