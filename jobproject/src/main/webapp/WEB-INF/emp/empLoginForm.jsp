<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<h3>관리자 계정 로그인</h3>
<form action="/emploginprocess" method="POST">
<!-- 	<input type="text" name="username" placeholder="Username"/> 
	<br/><br/> -->
	<input type="email" name="email" placeholder="Email"/>
	<br/><br/>
	<input type="password" name="password" placeholder="Password"/> 
	<br/><br/>
	<button type="submit" class="btn btn-primary" style="width: 150px;">로그인</button>
</form>
<br/><br/>
<a href="/empJoin">계정이 없으신가요? 관리자 계정 만들기</a>
</body>
</html>