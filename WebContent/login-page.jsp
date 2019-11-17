<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<form action="userDashboard.jsp" method="post">

			<fieldset>
				<legend>Login Form</legend>

				<label>Login As: </label>
				<input type="radio" name="loginRadio"
					id="userRadio" value="user" checked>USER 
			
				<input type="radio"
					name="loginRadio" id="adminRadio" value="admin">ADMIN
				<br>

				<c:if test="${param.value == 0 }">
					<p style="color: red;">
						<c:out value="Incorrect Username/Password"></c:out>
					</p>
				</c:if>
				<br> <label>Username: </label><input type="text"
					name="username" id="username"><br> <label>Password:
				</label> <input type="text" name="password" id="password"><br>
				<input type="submit" name="submit" value="Login">

			</fieldset>

			<label>New?</label><a href="userRegistration.jsp">Create your
				account</a>

		</form>

	</div>
</body>
</html>