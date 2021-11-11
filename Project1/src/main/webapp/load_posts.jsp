

<%@page import="com.query.models.CommentModel"%>
<%@page import="com.database.entities.Comments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.query.models.LikesModel"%>
<%@page import="java.util.List"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="com.query.models.DoPostModel"%>
<%@page import="com.database.entities.Posts"%>



<div class="row">


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
				<a href="show_individual_post.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read More...</a> 
					<%LikesModel lm = new LikesModel(ConnectionDataSource.setConnection());
					CommentModel cm = new CommentModel(ConnectionDataSource.setConnection());
							ArrayList<Comments> comlist = cm.getCommentsByPost(p.getPid());
					;%>
					<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span><%=lm.countLikeOnPost(p.getPid(), 1) %></span></a> 
<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-down"></i><span><%=lm.countDislikeOnPost(p.getPid(), 0) %></span></a> 
					<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span><%=comlist.size() %></span></a>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>