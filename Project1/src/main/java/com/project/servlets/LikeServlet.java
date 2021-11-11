package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.helper.ConnectionDataSource;
import com.query.models.LikesModel;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		String operation = request.getParameter("operation");
//		int uid = Integer.parseInt(request.getParameter("uid"));
//		int pid = Integer.parseInt(request.getParameter("pid"));
//		
//		LikesModel likesModel = new LikesModel(ConnectionDataSource.setConnection());
//		if (operation.equals("like")) {
//			boolean f = likesModel.insertLike(pid, uid);
//			out.println(f);
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("WORKING");

		// GETTING ALL THE FORM VALUES

		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int like = Integer.parseInt(request.getParameter("like"));
		String likedislike = request.getParameter("likedislike");

		LikesModel ld = new LikesModel(ConnectionDataSource.setConnection());

		switch (likedislike) {
		case "liked": {

			if (ld.isLikedByUser(pid, uid)) {
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			} else if (ld.isDislikedByUser(pid, uid)) {
				ld.UpdateDtoL(pid, uid);
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			} else {
				ld.insertLike(pid, uid, like);
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			}
			break;
		}
		case "disliked": {

			if (ld.isDislikedByUser(pid, uid)) {
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			} else if (ld.isLikedByUser(pid, uid)) {
				ld.UpdateLtoD(pid, uid);
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			} else {
				ld.insertDislike(pid, uid, like);
				response.sendRedirect("show_individual_post.jsp?postid=" + pid);
			}
			break;
		}
		default:

		}

	}

	public void likedfunc(int pid, int uid, int like) {

	}

}
