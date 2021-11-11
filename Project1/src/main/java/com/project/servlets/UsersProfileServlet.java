package com.project.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.entities.Posts;
import com.database.entities.users;
import com.database.helper.ConnectionDataSource;
import com.query.models.DoPostModel;
import com.query.models.UserModel;

@WebServlet("/UsersProfileServlet")
public class UsersProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));

		// GETTING POSTS
		DoPostModel dModel = new DoPostModel(ConnectionDataSource.setConnection());
		List<Posts> listpost = new ArrayList<Posts>();
		listpost = dModel.getPostsByUserId(uid);

		// GETTING USER
		UserModel uModel = new UserModel(ConnectionDataSource.setConnection());
		users anyUser = uModel.getUsersByUserId(uid);

		HttpSession session = request.getSession();
		session.setAttribute("listpost", listpost);
		session.setAttribute("anyUser", anyUser);
		request.getRequestDispatcher("anyUserProfile.jsp").forward(request, response);

	}

}
