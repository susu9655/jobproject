<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
#content {
    background-color: #fff;
    border: 1px solid #e6e6e6;
    border-radius: 25px;
    height: 50px;
    padding: 10px 55px 10px 30px;
    width: 90%;
    margin-left: 50px;
    margin-bottom: 50px;
}
div.img{
	background-image:url('/image/faqimg.png');
	width: 1080px;
	height: 400px;
}
</style>
</head>
<body>
<div class='img'></div>
<div class="serach">
	<form action="faqsearch" method="get">
	<input type="search" name="content" id="content" placeholder="예) 서비스 이용방법, 비밀번호 찾기 등" 
	autocomplete="off" aria-label="예) 서비스 이용방법, 비밀번호 찾기 등">
	<button style="background-color: #fff; border: none;"><i class="fas fa-search"  style="font-size: 1.6em;"></i></button>
	</form>
</div>
<div>
<h3>자주하는 질문 검색결과</h3><br>
<c:forEach items="${faqsearch}" var="faq">
<c:if test="${faq.member=='개인'}">
<div onclick="location.href='faqcontent?num=${faq.num}'">
<span style="float:right;">개인</span>
<h4>${faq.subject}</h4><hr>
</div>
</c:if>
<c:if test="${faq.member=='기업'}">
<span style="float:right;">기업</span>
<div onclick="location.href='faqcontent?num=${faq.num}'">
<h4>${faq.subject}</h4><hr>
</div>
</c:if>
</c:forEach>
</div>
</body>
</html>