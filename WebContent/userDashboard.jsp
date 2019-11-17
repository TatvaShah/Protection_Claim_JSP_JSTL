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
	
	<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="12345" />


	<c:set var="loginType" value="${param.loginRadio}" />
	<c:set var="username" value="${param.username}" />
	<c:set var="password" value="${param.password}" />

	<c:if test="${empty username || empty password }">
		<c:redirect url="/login-page.jsp?value=0"></c:redirect>
	</c:if>

	<c:choose>
		<c:when test="${loginType == 'user' }">

			<sql:query var="result" dataSource="${con}" scope="application">
			select * from user where userName = ? and password = ?;
			<sql:param value="${username}" />
				<sql:param value="${password }" />
			</sql:query>
			
			<c:if test="${result.rowCount == 0 }">
				<c:redirect url="/login-page.jsp?value=0"></c:redirect>
			</c:if>

			<c:forEach var="row" items="${result.rows}">

				<c:set var="name" value="${row.name }"></c:set>
				<h2>
					<c:out value="Welcome to the Dashboard, ${name }"></c:out>
				</h2>
				<c:set var="userId" value="${row.userId }"></c:set>
				<a href="productRegistration.jsp?username=<c:out value="${row.userName }"/>&id=<c:out value="${row.userId }"/>">Register Your Product HERE</a>
				</br>

				<a href="productClaim.jsp">Claim Your Protection Plan HERE</a>
			</c:forEach>
			
		<h3> List Of Registered & Claimed Products</h3>
			
			
			<sql:query var="productList" dataSource="${con}" scope="application">
			SELECT r.productId, r.productName, r.serialNo, r.purchaseDate, c.claimDate, c.claimStatus, c.claimCount FROM project.product_registered r
			LEFT JOIN project.claim_list c
			ON r.productId = c.product_id
			WHERE r.user_id = ?;
			<sql:param value="${userId}" />
			</sql:query>
			
			<table border="1px solid black">
				<tr>
					<td>Product Name</td>
					<td>Serial Number</td>
					<td>Purchase Date</td>
					<td>Claim Date</td>
					<td>Claim Status</td>
					<td>No of Claims</td>
				</tr>
				<c:forEach var="product" items="${productList.rows }">
				<tr>
					<td><c:out value="${product.productName }" /> </td>
					<td><c:out value="${product.serialNo }" /> </td>
					<td><c:out value="${product.purchaseDate }" /> </td>
					<td><c:out value="${product.claimDate }" /> </td>
					<td><c:out value="${product.claimStatus }" /> </td>
					<td><c:out value="${product.claimCount }" /> </td>
					<td><a href="productClaim.jsp?id=<c:out value="${product.productId}" />">Add a Claim</a></td>
				</tr>
				</c:forEach>
			</table>
			
			

		</c:when>
		
		
		<c:when test="${loginType == admin }">
		
		</c:when>
	</c:choose>



</body>
</html>