<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<c:if test="${totalCount==0}">
	<div class="alert alert-info">
		<h2>저장된 정보가 없습니다</h2>
	</div>
</c:if>

<c:if test="${totalCount>0}">
	<div class="alert alert-warning">
		<h2>총 ${totalCount} 개의 정보가 있습니다다다다다</h2>
	</div>
</c:if>


<%-- <c:if test="${emailCheck>0}"> --%>
	<div class="alert alert-warning">
		<h2>총 ${emailCheck} 개 이메일이 있습니다</h2>
	</div>
<%-- </c:if> --%>


<h1></h1>


</body>
</html>