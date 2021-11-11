package com.project.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.database.entities.Posts;
import com.database.entities.users;
import com.database.helper.ConnectionDataSource;
import com.database.helper.ImageProcess;
import com.query.models.DoPostModel;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cid = Integer.parseInt(request.getParameter("cid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		Part part = request.getPart("image");

		HttpSession session = request.getSession();
		users user = (users) session.getAttribute("currentuser");
		String imgString = part.getSubmittedFileName();
		if (imgString == "") {
			imgString = "bakers.png";
		}

		Posts post = new Posts(title, content, code, imgString, null, cid, user.getId());

		DoPostModel doPostDao = new DoPostModel(ConnectionDataSource.setConnection());
		boolean result = doPostDao.savePost(post);

		if (result) {
			String path = request.getRealPath("/") + "blog_pic" + File.separator + part.getSubmittedFileName();
			ImageProcess.saveimage(part.getInputStream(), path);
			response.getWriter().println("SUCCESS");
		} else {
			response.getWriter().println("POST UNSUCCESSFULL");
		}
	}

}
