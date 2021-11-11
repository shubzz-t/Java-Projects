
<%@page import="com.database.entities.Comments"%>
<%@page import="com.query.models.CommentModel"%>
<%@page import="com.query.models.LikesModel"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.query.models.UserModel"%>
<%@page import="com.database.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.entities.Posts"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="com.query.models.DoPostModel"%>
<%
int p = Integer.parseInt(request.getParameter("postid"));

DoPostModel dop = new DoPostModel(ConnectionDataSource.setConnection());
Posts pos = dop.getPostBypostID(p);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.database.entities.users"%>
<%@page import="com.database.entities.Message"%>
<%//@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=pos.getPtitle()%> || Code Baker</title>
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

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-username {
	font-weight: bold;
	font-style: italic;
	font-size: 20px;
}

.post-date {
	font-weight: bold;
	font-style: italic;
}

.row-title {
	border: 1px solid #e2e2e2;
}

body {
	background: url(images/bg3.jpg);
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

.comments-details button.btn.dropdown-toggle, .comments-details .total-comments
	{
	font-size: 18px;
	font-weight: 500;
	color: #5e5e5e;
}

.comments-details {
	padding: 15px 15px;
}

.comments .comments .dropdown, .comments .dropup {
	position: relative;
}

.comments button {
	background-color: transparent;
	border: none;
}

.comments .comment-box {
	width: 100%;
	float: left;
	height: 100%;
	background-color: #FAFAFA;
	padding: 10px 10px 10px;
	margin-bottom: 15px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.comments .add-comment {
	background-color: transparent;
	border: none;
	position: relative;
	margin-bottom: 50px;
}

.comments .commenter-pic {
	width: 50px;
	height: 50px;
	display: inline-block;
	border-radius: 100%;
	border: 2px solid #fff;
	overflow: hidden;
	background-color: #fff;
}

.comments .add-comment .commenter-name {
	width: 100%;
	padding-left: 75px;
	position: absolute;
	top: 20px;
	left: 0px;
}

.comments .add-comment input {
	border-top: 0px;
	border-bottom: 1px solid #ccc;
	border-left: 0px;
	border-right: 0px;
	outline: 0px;
	box-shadow: none;
	border-radius: 0;
	width: 100%;
	padding: 0;
	font-weight: normal;
}

.comments .add-comment input:focus {
	border-color: #03a9f4;
	border-width: 2px;
}

.comments .add-comment button[type=submit] {
	background-color: #03a9f4;
	color: #fff;
	margin-right: 0px;
}

.comments .add-comment button {
	background-color: #f5f5f5;
	margin: 10px 5px;
	font-size: 14px;
	text-transform: uppercase;
	float: right;
}

.comments .commenter-name .comment-time {
	font-weight: normal;
	margin-left: 8px;
	font-size: 15px;
}

.comments p.comment-txt {
	font-size: 15px;
	border-bottom: 1px solid #ddd;
	padding: 0px 0px 15px;
}

.comments .commenter-name {
	display: inline-block;
	position: relative;
	top: -20px;
	left: 10px;
	font-size: 16px;
	font-weight: bold;
}

.comments .comment-meta {
	font-size: 14px;
	color: #333;
	padding: 2px 5px 0px;
	line-height: 20px;
	float: right;
}

.comments .reply-box {
	display: none;
}

.comments .replied {
	background-color: #fff;
	width: 95%;
	float: right;
	margin-top: 15px;
}

/*======Responsive CSS=======*/
@media ( max-width : 767px) {
	.comments .commenter-name {
		font-size: 13px;
		top: -5px;
	}
	.comments .commenter-pic {
		width: 40px;
		height: 40px;
	}
	.comments .commenter-name a {
		display: block;
	}
	.comments .commenter-name .comment-time {
		display: block;
		margin-left: 0px;
	}
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
	<!--CLOSED VALIDATION USING SESSION -->



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
				<li class="nav-item active"><a class="nav-link " href="contact.jsp"><span
						class="fa fa-address-book"></span> Contact</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#profile-modal"><span><img
							src="profileimgs/<%=user.getProfile()%>" class="user"><b>
								<%=user.getName()%></b></span> </a></li>
				<li class="nav-item active"><a class="nav-link " href="LogoutServlet"><span
						class="fa fa-sign-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>


	<!-- end NAVBAR -->


	<!-- STARTING MAIN CONTENT OF THE BODY -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header  text-dark ">
						<!-- FOR USERNAME AND DATE -->
						<div class="row  bg-light">
							<div class="col-md-8">
								<p class="post-username">
									<%
									UserModel um = new UserModel(ConnectionDataSource.setConnection());
									users usr = um.getUserByPostUserid(pos.getUserid());
									%>
									<a href="UsersProfileServlet?uid=<%=usr.getId()%>"><img src="profileimgs/<%=usr.getProfile()%>"
										class="user"><i> <%=usr.getName()%></i> </a>HAS POSTED
								</p>
							</div>
							<div class="col-md-4 ">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(pos.getPdate())%></p>
							</div>
						</div>
						<!--END OF FOR USERNAME AND DATE -->
					</div>
					<!-- ONE MORE CARD HEADER FOR TITLE -->
					<div class="card-header post-title primary-background  row-title">
						<h4><%=pos.getPtitle()%></h4>
					</div>
					<!-- END OF CARD HEADER FOR TITLE -->
					<!-- START OF CARD BODY-->
					<div class="card-body">

						<img class="card-img-top my-2 " height="300" width="250"
							src="blog_pic/<%=pos.getPpic()%>" alt="Card image cap"> <br>
						<p class="post-content"><%=pos.getPcontent()%></p>
						<div class="post-code">
							<pre align="center"><%=pos.getPcode()%></pre>
						</div>
					</div>
					<!-- END OF CARD BODY-->
					<!-- START OF CARD FOOTER FOR LIKE AND COMMENT BUTTON-->
					<div class="card-footer primary-background ">

						<div class="form-row">
							<div class="form-group col-md-3">
								<form action="LikeServlet" method="post">
									<%LikesModel lm = new LikesModel(ConnectionDataSource.setConnection());%>
									<input type="hidden" name="pid" value="<%=pos.getPid()%>">
									<input type="hidden" name="uid" value="<%=user.getId()%>">
									<input type="hidden" name="like" value="1"> <input
										type="hidden" name="likedislike" value="liked">
									<button class="btn btn-outline-light btn-lg ">
										<i class="fa fa-thumbs-o-up"></i><span class="like-counter">
											<%=lm.countLikeOnPost(pos.getPid(), 1)%></span>
									</button>
								</form>
							</div>
							<div class="form-group col-md-3">
								<form action="LikeServlet" method="post">
									<input type="hidden" name="pid" value="<%=pos.getPid()%>">
									<input type="hidden" name="uid" value="<%=user.getId()%>">
									<input type="hidden" name="like" value="0"> <input
										type="hidden" name="likedislike" value="disliked">
									<button class="btn btn-outline-light btn-lg ">
										<i class="fa fa-thumbs-o-down"></i><span class="like-counter">
											<%=lm.countDislikeOnPost(pos.getPid(), 0)%></span>
									</button>
								</form>
							</div>
						</div>

						<div class="form-row bg-light">
							<div class="container">
								<div class="row">
									<div class="col-12">
										<div class="comments">
											<div class="comment-box add-comment">
												<span class="commenter-pic"> <img
													src="profileimgs/<%=user.getProfile()%>" class="img-fluid">
												</span> <span class="commenter-name">
													<form action="CommentServlet" method="post">
														<input type="hidden" name="pid" value="<%=pos.getPid()%>">
														<input type="hidden" name="uid" value="<%=user.getId()%>">
														<input type="text" placeholder="Add a public comment"
															name="comment">
														<button type="submit" class="btn btn-default">Comment</button>
													</form>
												</span>
											</div>
											<%
											UserModel umforcomment = new UserModel(ConnectionDataSource.setConnection());
											CommentModel cm = new CommentModel(ConnectionDataSource.setConnection());
											ArrayList<Comments> comlist = cm.getCommentsByPost(pos.getPid());
%>
											<div class="comments-details">
											<span class="total-comments comments-sort"><%=comlist.size()%> Comments</span> <span class="dropdown">
										</div>
										<% 
											users userforcomment;

											for (Comments c : comlist) {
												int uuid = c.getUid();
												userforcomment = umforcomment.getUserByPostUserid(c.getUid());
												String naem = userforcomment.getName();
											%>
											<div class="comment-box">
												<span class="commenter-pic"> <img
													src="profileimgs/<%=userforcomment.getProfile()%>"
													class="img-fluid">
												</span> <span class="commenter-name"> <a href="#"><%=naem%></a>
													<p class="comment-txt more"><%=c.getComment()%></p>
													<div class="comment-meta">
														<button class="comment-like">
															<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99
														</button>
														<button class="comment-dislike">
															<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
															149
														</button>
														<button class="comment-reply reply-popup">
															<i class="fa fa-reply-all" aria-hidden="true"></i> Reply
														</button>
													</div>
											</div>
											<%
											}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>
					<!-- END OF CARD FOOTER FOR LIKE AND COMMENT BUTTON-->
				</div>
			</div>
		</div>
	</div>



	<!-- ENDING MAIN CONTENT OF THE BODY -->







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
						<a href="usersprofile.jsp"><img src="profileimgs/<%=user.getProfile()%>" class="image-fluid"
							style="border-radius: 50%; max-width: 100px;"></a>
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


	<!-- SCRIPT FOR PROFILE EDITING -->
	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide()
					$("#profile-edit").show()
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide()
					editStatus = false;
					$(this).text("Edit")
				}

			});
		});
	</script>
	<!--END  SCRIPT FOR PROFILE EDITING -->



	<!-- SCRIPT FOR POSTING DATA -->
	<script>
		$(document)
				.ready(
						function(e) {
							$("#Add-post-form")
									.on(
											"submit",
											function(event) {
												//THIS CODE WILL BE CALLED WHEN FORM IS SUBMITTED
												event.preventDefault();
												console.log("SUBMMITTING...")

												let form = new FormData(this);
												//NOW REQUESTING SERVER
												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//FUNCTION WILL BE CALLED WHEN THE REQUEST COMES SUCCESSFULLLY
																console
																		.log(data)
																if (data.trim() == 'SUCCESS') {
																	swal(
																			"POSTED",
																			"Post is ready to viewers",
																			"success");
																} else {
																	swal(
																			"Something Wrong with Post",
																			"Try Again Later",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//EXECUTE WHEN THERE IS ERROR
																swal(
																		"Something Wrong with Post",
																		"Try Again Later",
																		"error");
															},
															processData : false,
															contentType : false
														})

											})
						})
	</script>
	<!-- END SCRIPT FOR POSTING DATA -->

</body>
</html>