<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
</head>
<body>

	<div class="wrapper">
		<form action="userDb.jsp" method="post">
			<table>
				<tr>
					<th><h1>User Registration Form</h1></th>
				</tr>
				<tr>
					<td>Name:<input type="text" name="name"></td>
					<br/>
				</tr>
				<tr>
					<td>User Name:<input type="text" name="userName"></td>
					<br />
				</tr>
				<tr>
					<td>Password:<input type="password" name="password"></td>
					</br>
				</tr>
				<tr>
					<td>Confirm Password:<input type="passWord" name="conPassWord"></td>
					</br>
				</tr>
				<tr>
					<td>Mobile Number: <input type="text" name="cellphone"></td>
					</br>
				</tr>
				<tr>
					<td>Email:<input type="text" name="email"></td>
					</br>
				</tr>
				<tr>
					<td>Address:<input type="text" name="address"></td>
					</br>
				</tr>
				<tr>
					<td><input type="submit" name="regUser"
						value="Register Product"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>