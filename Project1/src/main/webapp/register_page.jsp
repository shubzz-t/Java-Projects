<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
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



	<main class="primary-background p-5 banner-bg">
		<div class="conatiner">
			<div class="col-md-6 offset-md-3">
				<div class="card">

					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle"></span> <br> Register
						Here..
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="user_name">Username</label> <input type="text"
									name="username" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Username">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<label for="gender">Gender</label> <br>
								 <input type="radio" id="gender" name="gender" value="Male">Male 
								 <input type="radio" id="gender" name="gender" value="Female">Female
							</div>

							<div class="form-group">
								<textarea name="about" class="form-control"
									placeholder="ENTER ABOUT YOURSELF..."></textarea>

							</div>

							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="terms"> <label
									class="form-check-label" for="exampleCheck1">Check me
									our Terms and Conditions...</label> <br>
							</div>
							<div class="container text-center " id="loader"
								style="display: none">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait...</h4>
							</div>

							<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>


						</form>
					</div>
					<div class="card-footer"></div>
				</div>
			</div>

		</div>
	</main>
<%@include file="footer.jsp"%>

	<!-- JAVASCRIPTS -->
	<!-- JavaScript Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="js/main.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded....")

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);

				$("submit-btn").hide();
				$("loader").show();

				//SEND REGISTER SERVLET
				$.ajax({

					url : "RegisterServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						$("submit-btn").show();
						$("loader").hide();
						
						
						if(data.trim()=== 'INSERTED')
						{
							swal("Registration Successfull..Login now..")
							.then((value) => {
							  window.location = "login_page.jsp"
							});
						}
						else{
							swal(data);
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR)
						$("submit-btn").show();
						$("loader").hide();
						swal("Something went wrong..Try again..")
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>
</body>
</html>












