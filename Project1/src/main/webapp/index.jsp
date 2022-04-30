<%@page import="com.database.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.query.models.DoPostModel"%>
<%@page import="com.database.helper.ConnectionDataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="shortcut icon" type="image/jpg" href="images/cb.png"/>
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
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid m-0 p-0 ">
		<div class="jumbotron primary-background text-white banner-bg">
			<div class="container">
				<h3 class="display-4">Welcome to Code Bakers</h3>
				<h5>Bake your code in the perfect way..</h5>
				<p>Any fool can write code that a computer can understand. Good
					programmers write code that humans can understand.Practice Coding ,
					Utilise Your Code , Surf for the Solution , Code with Optimization
					, Post for the Betterment..</p>
					<a href="register_page.jsp">
				<button class="btn btn-outline-light btn-lg">
					<span class="	fa fa-user-plus"></span> Start ! Its Free
				</button></a>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>

	</div>

	<div class="container">
	<div class="row align-items-baseline">
	<%
						DoPostModel dpo = new DoPostModel(ConnectionDataSource.setConnection());
						ArrayList<Categories> listc = dpo.getAllCategories();

						for (Categories c : listc) {
						%>
						
		
			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card"">
						<div class="card-body">
							<h5 class="card-title"><%=c.getName() %></h5>
							<p class="card-text"><%=c.getDescription() %></p>
							<a href="profile.jsp" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
			</div>
			</div>
			
<hr>

<%@include file="footer.jsp"%>

	<!-- JAVASCRIPTS -->
	<!-- JavaScript Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="js/main.js" type="text/javascript"></script>
</body>
</html>