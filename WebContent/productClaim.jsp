<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="productId" value="${param.id }"></c:set>
	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	<fmt:formatDate var="Today" value="${now }" pattern="dd-MM-yyyy"/>
	<form action="" method="post">
		
		Product Name: <input type="text" name="name" value="" readonly><br><br>
		Claim Date: <input type="text" name="date" value="" readonly><br>
		Description: <textarea name="desc" rows="5" cols="10"></textarea>
		 
	</form>
	
</body>
</html>