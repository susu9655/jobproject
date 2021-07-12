<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<h2>결제내역</h2>
<hr>

<c:forEach var="dto" items="${gonggolist}" varStatus="n">
<c:if test="${dto.amount ne null}">
<input type="hidden" name="num" value="${dto.num}">
<h3 class="premium" OnClick="location.href='gonggodetail?num=${dto.num}'"><i class="fas fa-medal"></i>
&nbsp;프리미엄 공고 : ${dto.jobgroup} <span style="float:right; color:#021B80;">${dto.amount}원</span></h3>
<h4 style="float:right"><fmt:formatDate value="${dto.guipday}" pattern="yyyy-MM-dd HH:mm"/></h4><br>
<hr>
</c:if>
</c:forEach>
</body>
</html>