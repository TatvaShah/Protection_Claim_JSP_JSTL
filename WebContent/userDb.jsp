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

<!-- 	Data Validation -->

<c:set var="name" value="${param.name }"></c:set>
<c:set var="username" value="${param.userName }"></c:set>
<c:set var="password" value="${param.password }"></c:set>
<c:set var="cellphone" value="${param.cellphone}"></c:set>
<c:set var="email" value="${param.email }"></c:set>
<c:set var="address" value="${param.address }"></c:set>

<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root"
		password="12345" />
		
		
		<sql:update dataSource="${con}" var="result">
			INSERT INTO user VALUES (null,?,?,?,?,?,?);
		
			<sql:param value="${username }"></sql:param>
			<sql:param value="${password}"></sql:param>
			<sql:param value="${cellphone }"></sql:param>
			<sql:param value="${email }"></sql:param>
			<sql:param value="${address }"></sql:param>
			<sql:param value="${name }"></sql:param>
		
		</sql:update>
		
		<c:choose>
			<c:when test="${result == 1 }">
				<c:redirect url="/login-page.jsp"/>
			</c:when>
		</c:choose>


</body>
</html>