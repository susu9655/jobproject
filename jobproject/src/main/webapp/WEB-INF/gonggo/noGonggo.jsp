<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.gonggo{
width: 500px;
height: 500px;
margin: 100px 300px;
}
</style>
</head>
<body>
<form class="gonggolist form-inline">
<h2>채용공고</h2><br>
<div class="gonggo">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;작성된 채용공고가 없습니다.</h4>
	<div class="addgonggo form-control"
			OnClick="location.href='writegonggo'">
			
			<div class="gonggoicon">
				<span class="glyphicon glyphicon-file"></span>
				<p>공고 작성</p>
			</div>
		</div>
</div>
</form>
</body>
</html>