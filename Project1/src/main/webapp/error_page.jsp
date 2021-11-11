<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
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

	<div class="container text-center">
		<img src="images/warning.png" width="250px" height="250px"
			class="img-fluid">
		<h4 class="display-4">Sorry!! Something went wrong...</h6>
			<a href="index.jsp"
				class="btn primary-background text-white btn-lg mt-3">Home</a>
	</div>
</body>
</html>