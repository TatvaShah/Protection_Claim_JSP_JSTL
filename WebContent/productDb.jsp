<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/project" user="root" password="12345" />
	
	
	
	<c:set var="userId" value="${param.id }"/>
	<c:set var="userName" value="${param.userName}" />
	<c:set var="prodName" value="${param.productName}"></c:set>
	<c:set var="serialNo" value="${param.serialNo}"></c:set>
	
	<c:catch var="dateException">
	<fmt:parseDate value="${param.purchaseDate}" var="purchaseDate" type="date" pattern="dd-MM-yyyy"/>
	<c:if test="${empty purchaseDate }">
		<c:redirect url="/productRegistration.jsp">
			<c:param name="id" value="${userId }"></c:param>
			<c:param name="username" value="${userName }"></c:param>
			<c:param name="dateError" value="Please provide Purchase Date in the given format"></c:param>
		</c:redirect>
	</c:if>
	</c:catch>
	
	<sql:query var="result" dataSource="${con}" scope="application">
			select * from user where userId=?;
			<sql:param value="${userId}" />
			</sql:query>
			
	<c:forEach var="row" items="${result.rows }">
		<c:set var="username" value="${row.userName }"></c:set>
		<c:set var="password" value="${row.password }"></c:set>
	</c:forEach>

	<c:if test="${dateException != null }">
		<c:redirect url="/productRegistration.jsp">
			<c:param name="id" value="${userId }"></c:param>
			<c:param name="username" value="${userName }"></c:param>
			<c:param name="dateError" value="Please provide Purchase Date in the given format"></c:param>
		</c:redirect>
	</c:if>
	
	<c:catch var="queryException">
	<sql:update dataSource="${con}" var="result">
		INSERT INTO product_registered(productName,serialNo,purchaseDate,user_id) VALUES(?,?,?,?);
		<sql:param value="${prodName}" />
		<sql:param value="${serialNo}" />
		<sql:param value="${purchaseDate}" />
		<sql:param value="${userId }" />
	</sql:update>
	</c:catch>
	
	<c:if test="${queryException != null }">
		<c:redirect url="/productRegistration.jsp">
			<c:param name="missingValues" value="Some Value missing. Please try again"></c:param>
		</c:redirect>
	</c:if>
	
	<c:if test="${result >= 1 }">
		<c:redirect url="/userDashboard.jsp">
			<c:param name="loginRadio" value="user"></c:param>
			<c:param name="username" value="${username}"></c:param>
			<c:param name="password" value="${password}"></c:param>
		</c:redirect>
	</c:if>

</body>
</html>