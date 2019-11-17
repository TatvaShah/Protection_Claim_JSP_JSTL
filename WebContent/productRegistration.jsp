<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Registration</title>
</head>
<body>

	<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/project" user="root" password="12345" />

	<sql:query var="productList" dataSource="${con}">
	SELECT * FROM product_list;
</sql:query>

	<form action="productDb.jsp" method="post">
		<table>

			<tr>
				<th><h1>Product Registration Form</h1></th>
			</tr>
			
			<tr>
				<td>User Name:<input type="text" name="userName" value="${param.username }" readonly></td>
					
				<td><input type="hidden" name="id" value="${param.id }"></td>
			</tr>

			<tr>
				<td>Product Name: <select name="productName">

						<c:forEach var="product" items="${productList.rows }">
							<option><c:out value="${product.productName }"></c:out></option>
						</c:forEach>
				</select>
				</td>
			</tr>

			<tr>
				<td>Serial No: <input type="text" name="serialNo"></td>
			</tr>

			<tr>
				<td>Purchase Date:<input type="date" name="purchaseDate" placeholder="DD-MM-YYYY"><section style="color: red;"><c:out value="${param.dateError }"></c:out></section></td>
			</tr>

			<tr>
				<td><input type="submit" name="submit" value="Register"></td>
			</tr>

		</table>

	</form>
</body>
</html>