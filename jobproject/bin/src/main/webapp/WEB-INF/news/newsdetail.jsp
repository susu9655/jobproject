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
	div.content{
		width: 900px;
		padding: 20px 20px 20px 20px;
	}
</style>
</head>
<body>
<h3>기업뉴스</h3>
<div class="content">
	<!-- newsdetail클릭 시 조회수 증가 조회수 저장 -->
	<c:set var="count" value="${readcount }"/>
	<c:forEach var="news" items="${list}">
		<table>
			<tr>
				<td>
					<h1>${news.title }</h1>
					<h5>
						<fmt:formatDate value="${news.writeday}" pattern="yyyy-MM-dd"/> | 
						<span class="glyphicon glyphicon-eye-open" style="font-size: 1.2em;"></span>
						${count } <!-- 조회수 -->
					</h5>
					<br>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center">
					<br><br>
					<img src="../newsImage/${news.image}" style="max-width: 600px; max-height: 300px;">
					<br><br>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 뉴스기사 출력 div -->
					<div id="txt" file="${news.file}" style="font-size: 1.5em;"></div>
				</td>
			</tr>
		</table>	
	</c:forEach>
</div>

<script type="text/javascript">
	
	//div.txt에 fileopen()함수: 뉴스기사 파일 호출 집어넣기
	$("#txt").html(fileopen());
	
	//기사 txt파일 열기
	function fileopen(){
		//file 경로 읽어오기
		var file="../file/"+$("#txt").attr("file");
		//console.log(file);
		
		//웹에 출력
		var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		xmlhttp.open('GET', file, false);
		xmlhttp.send();
		document.write(xmlhttp.responseText.split('\r\n').join('<br/>'));
	}
</script>

<!-- 목록 -->
<div style="width: 900px; padding-top: 80px;">
	<hr>
	<button type="button" onclick="location.href='news'" class="btn btn-default"
		style="margin-left: 400px;">목록</button>
</div>
</body>
</html>