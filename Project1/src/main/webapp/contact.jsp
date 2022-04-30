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




</style>
</head>
<body>



<%@include file="navbar.jsp"%>

	

	
	<!-- CONTACT FORM START -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<img src="images/conbg.png" height="200" width="500">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="row no-gutters">
							<div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4 text-light">Get in touch for any queries</h3>
									<div id="form-message-warning" class="mb-4"></div> 
									<form action="ContactServlet" method="Post" id="contactForm" name="contactForm" class="contactForm">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label text-light" for="name">Full Name</label>
													<input type="text" class="form-control" name="name" id="name" placeholder="Name">
												</div>
											</div>
											<div class="col-md-6"> 
												<div class="form-group">
													<label class="label text-light" for="email">Email Address</label>
													<input type="email" class="form-control" name="email" id="email" placeholder="Email">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label text-light" for="subject">Subject</label>
													<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label text-light" for="#">Tell us if any Problem...</label>
													<textarea name="message" class="form-control" id="message" cols="30" rows="4" placeholder="Message"></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="submit" class="btn btn-primary">
												</div>
											</div>
										</div>
									</form>
									
								</div>
							</div>
							<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
								<div class="info-wrap bg-primary w-100 p-md-5 p-4">
									<h3>Let's get in touch</h3>
									<p class="mb-4">We're open for any suggestion or just to have a chat</p>
				        	<div class="dbox w-100 d-flex align-items-start">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-map-marker"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Address:A/P :-  Malegaon Tal :- Baramati Dist :- Pune </span> </p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-phone"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Phone:+91 9881099565</span> <a href="tel://1234567920"></a></p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-paper-plane"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>codebaker@gmail.com</span> <a href="mailto:info@yoursite.com"></a></p>
					          </div>
				          </div>
				        	<div class="dbox w-100 d-flex align-items-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-globe"></span>
				        		</div>
				        		<div class="text pl-3">
					            <p><span>Website:- codebaker.com</span> <a href="#"></a></p>
					          </div>
				          </div>
			          </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- CONTACT FORM END -->
	
	<!-- CONTACT PAGE START BODY -->



  <!-- Footer -->
  <footer class="bg-white">
    <div class="container py-5">
      <div class="row py-4">
        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0"><img src="img/logo.png" alt="" width="180" class="mb-3">
          <p class="font-italic text-muted">The only way to learn a new programming language is by writing programs in it. <b>Code Baker</b> helps you with that...</p>
          <ul class="list-inline mt-4">
            <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fa fa-pinterest"></i></a></li>
            <li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fa fa-vimeo"></i></a></li>
          </ul>
        </div>
        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
          <h6 class="text-uppercase font-weight-bold mb-4">Go to..</h6>
          <ul class="list-unstyled mb-0">
            <li class="mb-2"><a href="profile.jsp" class="text-muted">Explore your Knowledge</a></li>
            <li class="mb-2"><a href="#" class="text-muted">Programming</a></li>
            <li class="mb-2"><a href="#" class="text-muted">DSA</a></li>
            <li class="mb-2"><a href="#" class="text-muted">Implementations</a></li>
          </ul>
        </div>
        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
          
        </div>
        <div class="col-lg-4 col-md-6 mb-lg-0">
          <h6 class="text-uppercase font-weight-bold mb-4">Company</h6>
          <ul class="list-unstyled mb-0">
            <li class="mb-2"><a href="login_page.jsp" class="text-muted">Login</a></li>
            <li class="mb-2"><a href="register_page.jsp" class="text-muted">Register</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Copyrights -->
    <div class="primary-background py-4 text-dark">
      <div class="container text-center ">
        <p class=" mb-0 py-2 text-dark ">© 2022 <b>CODE BAKER </b>  All rights reserved.</p>
      </div>
    </div>
  </footer>
  <!-- End -->

</body>
		<!-- CONTACT PAGE BODY END -->
	
	
	
	
	
	
	
	
	
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



	<!-- SCRIPT FOR LOADING POST DATA AND MAKING LINKS ACTIVE IN CLICK-->
	<script>
		function getPosts(catid,temp) {
			$("#loader").show();
			$("#post-container").hide()
			$(".c-link").removeClass('active')
			$.ajax({
				url : "load_posts.jsp",
				data:{cid:catid},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show()
					$("#post-container").html(data)
					$(temp).addClass('active')
				}
			})
		}

		$(document).ready(function(e) {
			let allPostref = $('.c-link')[0]
			getPosts(0 , allPostref)

		})
	</script>
	<!-- END SCRIPT FOR LOADING POST DATA -->
</body>
</html>