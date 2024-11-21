<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User-form</title>
</head>

<style>
.card {
	background-image: linear-gradient(101.9deg, rgba(197, 120, 234, 1) 1.6%,
		rgba(120, 220, 234, 1) 51.2%, rgba(119, 249, 176, 1) 99.8%);
	background-image: radial-gradient(circle farthest-corner at 10% 20%, rgba(255, 37, 174, 1)
		0%, rgba(241, 147, 55, 1) 53.4%, rgba(250, 237, 56, 1) 99.5%);
}

#usersid {
	font-size: large;
	font-family: sans-serif;
	color: black;
}

.form-control {
	border: 2px solid black;
}

.form-group {
	font-size: 20px;
}

.textsize {
	font-size: 22px;
}
</style>


<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("session_id") == null) {
		response.sendRedirect("login_page.jsp");
	}
	%>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-image: linear-gradient(90.1deg, rgba(255, 85, 85, 1) 0.1%, rgba(85, 85, 255, 1) 100%);">
			<div>
				<a href="#" class="navbar-brand textsize"> User Management Application </a>
			</div>

			<div class="collapse navbar-collapse" id="collapse_Navbar"></div>



			<form action="logout">

				<button type="submit" class="btn btn-danger">
					<i class="fa fa-sign-out" style="font-size: 20px"></i> logout
				</button>
			</form>
		</nav>
	</header>
	<br>

	<div class="container col-md-5 temp">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>


				<h2>
					<c:if test="${user != null}">
                                    Edit User
                                </c:if>
					<c:if test="${user == null}">
                                    Add New User
                                </c:if>
				</h2>


				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" autocomplete="off" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" autocomplete="off" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>User Country</label> <input type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country" autocomplete="off" required="required">
				</fieldset>
				<br>
				<button type="submit" class="btn btn-success">Save</button>
				&nbsp; &nbsp;
				<button type="reset" class="btn btn-secondary">Reset</button>
				&nbsp; &nbsp; <a class="btn btn-danger cancel"
					href="<%=request.getContextPath()%>/list" role="button">Cancel</a>
				</form>
			</div>
		</div>
	</div>
</body>

</html>