<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.searchtitle{
		width: 900px;
		height: 100px;
		padding: 20px 20px 20px 20px;
	}
	
	div.search{
		width: 900px;
		height: 70px;
		border: 1px solid gray;
		border-radius: 20px;
	}
	
	div.list{
		width: 900px;
		margin-left: 10px;
	}
	
	div.empname{
		width: 900px;
		height: 70px;
		padding-left: 20px;
		padding-top:22px;
		margin-bottom: 10px;
		border: 1px solid gray;
		border-radius: 20px;
		cursor: pointer;
		font-size: 1.2em;
	}
	

	a.empname{
		text-decoration: none;
		color: #282828;
		
	}
	
	div.empname:hover{
		border: 2px solid #021B80;
		
	}
</style>
</head>
<body>
<div class="searchtitle">
	<h2>기업검색 > 리뷰 검색</h2>
</div>
<div class="search">
	<form action="searchlist" method="get">
	<input type="text" id="empname" name="empname" placeholder="기업 검색"
		style="width: 750px; height: 60px; border: 0px; margin-left: 10px; margin-top: 5px;" class="form-inline">
	<button class="btn btn-default" style="width: 100px; height: 40px;" type="submit" >
	검색
	</button>
	</form>	
</div>

<!-- 기업 단어 검색에 해당하는 데이터 반복출력 -->
<div class="list">
	<br><br><br><br>
	<h3>검색 기업리뷰 (${total })</h3>
	<br>
	<c:forEach items="${searchlist }" var="data">

			<div class="empname">
			<img alt="" src="../image/ministar.png" style="max-width: 20px;">
			<a class="empname" href="reviewdetail?empname=${data.empname }" >
			<b style="font-weight: normal; text-align: right;">${data.rating}
				
			</b>
			&nbsp;&nbsp;
			${data.empname } 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b style="font-weight: normal; color: gray;"># ${data.good}</b></a>
			
			</div>
	</c:forEach>
</div>	
	<br>
	<button type="button" class="btn btn-default" onclick="location.href='review'"
		style="margin-left: 400px;">목록</button>
</body>
</html>