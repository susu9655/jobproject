<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

div.btn {
	width: 100px;
	height: 50px;
	border: 1px solid #e6e6e6;
	background-color: #e6e6e6;
	line-height: 35px;
	margin-top: 100px;
}

div.img {
	background-image: url('/image/faqimg.png');
	width: 1080px;
	height: 400px;
}

div.content {
	margin-left: 50px;
	border: 2px solid #e6e6e6;
	padding: 20px 75px 20px 40px;
	
}
</style>
</head>
<body>
	<div class='img'></div>
	<div class="serach">
		<form action="faqsearch" method="get">
			<input type="search" name="content" id="content"
				placeholder="예) 서비스 이용방법, 비밀번호 찾기 등" autocomplete="off"
				aria-label="예) 서비스 이용방법, 비밀번호 찾기 등">
			<button style="background-color: #fff; border: none;">
				<i class="fas fa-search" style="font-size: 1.6em;"></i>
			</button>
		</form>
	</div>
	<div class="content">
		<h3 style="font-weight: bold;">${dto.subject}</h3>
		<p>&nbsp;</p>
		<h4 style="font-size: 1.5em; line-height:30px;">${dto.content}</h4>
	</div>

	<div class="btn" onClick="location.href='Faq'">FAQ 목록</div>
	<div class="btn" onClick="history.back();">이전 페이지</div>
</body>
</html>