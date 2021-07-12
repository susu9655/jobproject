<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<form action="send" method="post">
<c:set var="email"><sec:authentication property="principal.user.email"/></c:set>
<c:set var="name"><sec:authentication property="principal.username"/></c:set>

<input name="address" value="${email }">
<input name="title" value="메일..발송...입닏....다">
<input name="message" value="진자 힘드러">
<input type="hidden" name="name" value="${name }">
<button type="submit">보내</button>
</form>


<h1>[+JOB] 비밀번호 초기화</h1>
<h3>안녕하세요, ${name }님,</h3>
<h3>+JOB입니다.</h3>
<br>

<h3>${email}계정의 비밀번호를 재설정 하려면 하단의 비밀번호 재설정을 클릭하세요.</h3>
<h3>문의사항은 kimmtommy@gmail.com으로 연락 주시길 바랍니다 :)</h3>
<br>
<button type="button" style="background-color: #021B80;color: white;border-radius: 5px;width: 120px;height: 50px;
line-height: 30px;border: none;font-weight: bold;">
<a href="http://localhost:9001/chage_password" style="text-decoration: none;color: white;font-weight: bold;">비밀번호 재설정</a>
</button>


</body>
</html>