<%@page import="com.database.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="com.query.models.DoPostModel"%>
<nav class="navbar navbar-expand-lg navbar-light primary-background ">
	<a class="navbar-brand" href="index.jsp">
<!--  	<span>	<img src="images/cb.png" height="80" width="80" class="rounded-circle"></span>-->
	<span><img src="images/name.png" height="90" width="200" ></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="profile.jsp"><span
					class="fa fa-globe"></span> Explore Your Knowledge <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span class="fa fa-cubes"></span>Categories
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<%
						DoPostModel dpp = new DoPostModel(ConnectionDataSource.setConnection());
						ArrayList<Categories> listck = dpp.getAllCategories();

						for (Categories cd : listck) {
						%>
						<a class="c-link list-group-item list-group-item-action" href="profile.jsp"
							onClick="getPosts(<%=cd.getCid()%> , this)"><%=cd.getName()%></a>
						<%
						}
						%>
					</div></li>
			<li class="nav-item"><a class="nav-link " href="contact.jsp"><span
					class="fa fa-address-book"></span> Contact</a></li>
			<li class="nav-item"><a class="nav-link " href="login_page.jsp"><span
					class="fa fa-user-circle"></span> Login</a></li>
			<li class="nav-item"><a class="nav-link "
				href="register_page.jsp"><span class="fa fa-user-plus"></span>
					Sign Up</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>