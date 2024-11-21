<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

if (session.getAttribute("session_id") == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">




<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User-list</title>

</head>

<style>
.table-striped {
	background-image: linear-gradient(89.8deg, rgba(204, 156, 223, 1) 0.3%,
		rgba(155, 219, 245, 1) 20.4%, rgba(245, 183, 208, 1) 40.2%,
		rgba(250, 186, 98, 1) 62.9%, rgba(234, 238, 240, 1) 81.9%,
		rgba(250, 245, 171, 1) 99.2%);
}

table, tr, th, td, thead {
	border: 2px solid black;
	text-align: center;
	border-collapse: collapse;
}

td {
	padding: 3px;
	font-size: 18px;
}

th {
	font-size: 20px;
}

#usersid {
	font-size: large;
	font-family: sans-serif;
	color: black;
}

.textsize {
	font-size: 22px;
}

input:hover {
	background-color: rgb(183, 12, 12);
}
</style>
<body>



	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-image: linear-gradient(90.1deg, rgba(255, 85, 85, 1) 0.1%, rgba(85, 85, 255, 1) 100%);">
			<div>
				<a href="https://www.cricbuzz.com" class="navbar-brand textsize">
					User Management Application </a>
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


	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-striped">


				<tbody>

					<tr>
						<th>Unique ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th>Actions</th>
					</tr>

					<c:forEach var="user" items="${listUsers}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td><a href="edit?id=<c:out value='${user.id}' />"
								class="btn btn-info">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${user.id}' />"
								class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</div>
	</div>
</body>
</html>