<%@page import="com.database.entities.Comments"%>
<%@page import="com.query.models.CommentModel"%>
<%@page import="com.query.models.LikesModel"%>
<%@page import="com.database.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.security.auth.UnixNumericUserPrincipal"%>
<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@page import="com.database.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="com.query.models.DoPostModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.database.entities.users"%>
<%@page import="com.database.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="shortcut icon" type="image/jpg" href="images/cb.png" />
<!-- CSS only -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="CSS/main.css" rel="stylesheet" type="text/css" />
<style>
.banner-bg {
	clip-path: polygon(100% 0, 100% 90%, 54% 100%, 22% 93%, 0 100%, 0 0);
}

body {
	background: url(images/bg_.jpg);
	background-size: cover;
	background-attachment: fixed;
}

.user {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	object-fit: cover;
}
</style>
</head>
<body>

	<!-- VALIDATION USING SESSION -->
	<%
	users user = (users) session.getAttribute("currentuser");

	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
	%>



	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light primary-background ">
		<!-- <a class="navbar-brand" href="index.jsp"><span
			class="fa fa-pencil-square-o"></span> CODE BAKER</a> -->
		<a class="navbar-brand" href="index.jsp"> <!--  	<span>	<img src="images/cb.png" height="80" width="80" class="rounded-circle"></span>-->
			<span><img src="images/name.png" height="80" width="170"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-globe"></span> Explore
						Your Knowledge <span class="sr-only">(current)</span></a></li>

				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#add-category"><span
						class="fa fa-cubes"></span> Add Category <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link " href="#"
					data-toggle="modal" data-target="#do-post-modal"><span
						class="fa fa-edit"></span> Post </a></li>
				<li class="nav-item active"><a class="nav-link "
					href="contact.jsp"><span class="fa fa-address-book"></span>
						Contact</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#profile-modal"><span><img
							src="profileimgs/<%=user.getProfile()%>" class="user"><b>
								<%=user.getName()%></b></span> </a></li>
				<li class="nav-item active"><a class="nav-link "
					href="LogoutServlet"><span class="fa fa-sign-out"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>


	<!-- end NAVBAR -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<!-- END MESSAGE -->


	<%
	users anyuser = (users) session.getAttribute("anyUser");
	if (user.getId() == anyuser.getId()) {
		response.sendRedirect("usersprofile.jsp");
	}
	%>


	<!-- MAIN BODY OF THE PROFILE PAGE -->
	<main>
		<div class="container ml-3">
			<div class="row mt-3">
				<div class="col-md-4">
					<a href="#"
						class=" c-link list-group-item active list-group-item-action text-center"
						aria-current="true"><%=anyuser.getName()%></a>
					<div class="bg-light">
						<div class="text-center">
							<img src="profileimgs/<%=anyuser.getProfile()%>"
								class="image-fluid "
								style="border-radius: 50%; max-width: 100px;">
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col"><%=anyuser.getId()%></th>


								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Email</th>
									<td><%=anyuser.getEmail()%></td>


								</tr>
								<tr>
									<th scope="row">Gender</th>
									<td><%=anyuser.getGender()%></td>


								</tr>
								<tr>
									<th scope="row">Status</th>
									<td><%=anyuser.getAbout()%></td>


								</tr>
								<tr>
									<th scope="row">Registered On</th>
									<td><%=anyuser.getDateTime()%></td>


								</tr>
							</tbody>
						</table>
					</div>

				</div>






				<%
				List<Posts> listPosts = new ArrayList<Posts>();
				listPosts = (ArrayList<Posts>) session.getAttribute("listpost");

				for (Posts p : listPosts) {
				%>
				<div class="col-sm-4">
					<div class="card">


						<div class="card-body">
							<img class="card-img-top" src="blog_pic/<%=p.getPpic()%>"
								alt="Card image cap">
							<h5>
								<b><%=p.getPtitle()%></b>
							</h5>
							<p><%=p.getPcontent()%></p>

						</div>
						<div class="card-footer primary-background text-center">
							<a href="show_individual_post.jsp?postid=<%=p.getPid()%>"
								class="btn btn-outline-light btn-sm">Read More...</a>&nbsp;
							<%
							LikesModel lm = new LikesModel(ConnectionDataSource.setConnection());
							CommentModel cm = new CommentModel(ConnectionDataSource.setConnection());
							ArrayList<Comments> comlist = cm.getCommentsByPost(p.getPid());
							;
							%>
						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>

	</main>
















	<!-- END OF MAIN BODY OF THE PROFILE PAGE -->





	<!-- PROFILE MODAL -->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Code Bakers</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profileimgs/<%=user.getProfile()%>" class="image-fluid"
							style="border-radius: 50%; max-width: 100px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- DETAILS OF THE USER -->


						<div id="profile-details">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col"><%=user.getId()%></th>


									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>


									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>


									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>


									</tr>
									<tr>
										<th scope="row">Registered On</th>
										<td><%=user.getDateTime()%></td>


									</tr>
								</tbody>
							</table>
							<!-- END OF THE PROFILE SHOWING MODEL -->


							<!-- START OF THE PROFILE EDIT MODEL -->

						</div>
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-3">Edit Your Details..</h3>
							<form action="EditServlet" method="POST"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" name="email" class="form-control"
											value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" name="name" class="form-control"
											value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" name="password"
											class="form-control" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Status :</td>
										<td><textarea name="about" rows="3" class="form-control"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<td>Change Profile :</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END PROFILE EDIT MODAL -->


	<!-- POST MODAL -->
	<!-- Button trigger modal -->

	<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddPostServlet" method="post" id="Add-post-form">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option disabled selected>---Select Category---</option>
								<%
								DoPostModel post = new DoPostModel(ConnectionDataSource.setConnection());
								ArrayList<Categories> list = post.getAllCategories();
								for (Categories c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>


						<div class="form-group">
							<input name="title" type="text"
								placeholder="Enter the Post Title" class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="content" rows="5" class="form-control"
								placeholder="Enter your Content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="code" rows="5" class="form-control"
								placeholder="Enter your Code (If any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select Image :- </label><br> <input name="image"
								type="file">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary"
								id="btnSave">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- END POST MODAL -->




	<!-- CATEGORY ADD MODEL -->
	<div class="modal fade mt-5" id="add-category" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddCategoryServlet" method="post" id="Add-post-form">

						<div class="form-group">
							<input name="name" type="text" placeholder="Enter the Post Title"
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="description" rows="5" class="form-control"
								placeholder="Enter your Content"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary"
								id="btnSave">Add</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- END ADD CATEGORY MODEL -->



	<!-- JavaScript Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/main.js" type="text/javascript"></script>

</body>
</html>