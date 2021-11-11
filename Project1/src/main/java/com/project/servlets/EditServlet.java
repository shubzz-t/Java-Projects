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

import com.database.entities.Message;
import com.database.entities.users;
import com.database.helper.ConnectionDataSource;
import com.database.helper.ImageProcess;
import com.query.models.UserModel;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// FETCH ALL DATA
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		Part part = request.getPart("image");
		String imagename = part.getSubmittedFileName();

		// GET USER FROM SESSION
		HttpSession session = request.getSession();
		users user = (users) session.getAttribute("currentuser");
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		String oldimage = user.getProfile();
		if (imagename == "") {
			imagename = oldimage;
			user.setProfile(imagename);
		} else {
			user.setProfile(imagename);
		}
		UserModel usr = new UserModel(ConnectionDataSource.setConnection());
		boolean result = usr.updateUser(user);

		// IF THE PROFILE IS NOT CHANGED THEN TO KEEP THE OLD PROFILE PIC
		if (imagename == oldimage) {
			Message msg = new Message("Profile Details Updated", "success", "alert-success");
			session.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
		// ELSE WHEN THE NEW IMAGE IS SELECTED THEN
		else {
			user.setProfile(imagename);
			if (result) {

				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/") + "profileimgs" + File.separator + user.getProfile();
				String oldImgPath = request.getRealPath("/") + "profileimgs" + File.separator + oldimage;

				// IF THE OLD IMAGE IS DEFAULT.PNG THEN DONT DELETE THE DEFAULT.PNG AS IT IS
				// COMMON FOR ALL
				if (!oldimage.equals("default.png")) {
					ImageProcess.imageDelete(oldImgPath);
				}

				// TO SAVE THE NEW IMAGE TO FOLDER
				if (ImageProcess.saveimage(part.getInputStream(), path)) {
					Message msg = new Message("Profile Details Updated", "success", "alert-success");
					session.setAttribute("msg", msg);

				}
			} else {
				Message msg = new Message("Something went wrong...", "error", "alert-error");
				session.setAttribute("msg", msg);

			}
			response.sendRedirect("profile.jsp");
		}
	}

}
