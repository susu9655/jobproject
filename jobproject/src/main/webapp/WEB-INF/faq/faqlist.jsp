<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style type="text/css">
#content {
    background-color: #fff;
    border: 1px solid #e6e6e6;
    border-radius: 25px;
    height: 50px;
    padding: 10px 55px 10px 30px;
    width: 90%;
    margin-top: 50px;
    margin-left: 50px;
    margin-bottom: 50px;
}
div.img{
	background-image:url('/image/faqimg.png');
	width: 1120px;
	height: 400px;
}
div.gaein{
 	margin-left: 50px;
	width: 450px;
	height: 700px;
	float:left;
}
div.giup{
 margin-left: 20px;
	width: 450px;
	height: 700px;
	float:right;
}

a.faq{
font-size: 1.3em;
color: #666;
text-decoration: none;
}
</style>
</head>
<body>
<div class='img'></div>
<div class="search">
	<form action="faqsearch" method="get">
	<input type="search" name="content" id="content" placeholder="예) 서비스 이용방법, 비밀번호 찾기 등" 
	autocomplete="off" aria-label="예) 서비스 이용방법, 비밀번호 찾기 등">
	<button style="background-color: #fff; border: none;"><i class="fas fa-search"  style="font-size: 1.6em;"></i></button>
	</form>
</div>
<div class="gaein">
<h3>개인회원 자주 묻는 질문</h3><br>
<c:forEach var="dto" items="${dto}" varStatus="n">
<c:if test="${dto.member=='개인'}">
<a class="faq" href="faqcontent?num=${dto.num}" num="${dto.num}">${dto.subject}</a><br><br>
</c:if>
</c:forEach>
</div>
<div class="giup">
<h3>기업회원 자주 묻는 질문</h3><br>
<c:forEach var="dto" items="${dto}" varStatus="n">
<c:if test="${dto.member=='기업'}">
<a class="faq" href="faqcontent?num=${dto.num}" num="${dto.num}">${dto.subject}</a><br><br>
</c:if>
</c:forEach>
</div>


</body>
</html>