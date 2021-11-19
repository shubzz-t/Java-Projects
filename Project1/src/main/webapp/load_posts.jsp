

<%@page import="com.database.entities.users"%>
<%@page import="com.query.models.CommentModel"%>
<%@page import="com.database.entities.Comments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.query.models.LikesModel"%>
<%@page import="java.util.List"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="com.query.models.DoPostModel"%>
<%@page import="com.database.entities.Posts"%>



<div class="row">


	<!-- VALIDATION USING SESSION -->
	<%
	users user = (users) session.getAttribute("currentuser");

	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
	%>
	<!--CLOSED VALIDATION USING SESSION -->

	<%
	DoPostModel dopost = new DoPostModel(ConnectionDataSource.setConnection());
	List<Posts> list = null;
	int cid = Integer.parseInt(request.getParameter("cid"));

	if (cid == 0) {
		list = dopost.getAllPosts();
	} else {
		list = dopost.getPostsByCategory(cid);
	}

	if (list.size() == 0) {
		out.println("<h4 class='display-4 text-center text-light'>NO POSTS YET... </h4>");
		return;
	}
	for (Posts p : list) {
	%>

	<div class="col-md-6 mt-2">
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
				<div class="form-row">
					<div class="col-md-3">
						<a href="show_individual_post.jsp?postid=<%=p.getPid()%>"
							class="btn btn-outline-light btn-sm">Read More...</a>
					</div>
					<div class="form-group col-md-3">
						<form action="LikeServlet" method="post">
							<%LikesModel lm = new LikesModel(ConnectionDataSource.setConnection());%>
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<input type="hidden" name="uid" value="<%=user.getId()%>">
							<input type="hidden" name="like" value="1"> <input
								type="hidden" name="likedislike" value="liked">
							<button class="btn btn-outline-light btn-lg ">
								<i class="fa fa-thumbs-o-up"></i><span class="like-counter">
									<%=lm.countLikeOnPost(p.getPid(), 1)%></span>
							</button>
						</form>
					</div>
					<div class="form-group col-md-3">
						<form action="LikeServlet" method="post">
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<input type="hidden" name="uid" value="<%=user.getId()%>">
							<input type="hidden" name="like" value="0"> <input
								type="hidden" name="likedislike" value="disliked">
							<button class="btn btn-outline-light btn-lg ">
								<i class="fa fa-thumbs-o-down"></i><span class="like-counter">
									<%=lm.countDislikeOnPost(p.getPid(), 0)%></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>