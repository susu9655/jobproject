<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style type="text/css">
	form.resumedetail{
		padding: 10px 0px 0px 200px;
	}
	div.fixbtn button{
		background-color: #021B80;
		color: white;
		border-radius: 40px;
		width: 100px;
		height: 40px;
		line-height: 30px;
		border: 0px solid black;
	}
</style>
<script type="text/javascript">
window.onload=function(){
	//pdf파일로 변환해주는 이벤트
	$('#create_pdf').click(function() {
		//이름 받아오기
		var username=$(this).attr("value");
		console.log(username);
		  //pdf_wrap을 canvas객체로 변환
		  html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    doc.save(username+'_이력서.pdf'); //pdf저장
		  });
		});
}
</script>
</head>
<body>
<c:set var="username"><sec:authentication property="principal.username"/></c:set>
<div style="position: fixed; bottom: 10px;right: 500px;" class="fixbtn">
<button type="button" onclick="location.href='updateresumeForm?num_r=${num_r}'">수정하기</button>
<button type="button" id="create_pdf" value="${username }"><span class="glyphicon glyphicon-download-alt"></span></button>
</div>
<div id="pdf_wrap">
<form action="#" class="resumedetail">
		<h2><sec:authentication property="principal.username"/></h2>
		<br><br>
		<h5><sec:authentication property="principal.username"/></h5>
		<h5><sec:authentication property="principal.user.email"/></h5>
		<h5><sec:authentication property="principal.user.hp"/></h5>
		<br><br><br>
		<table class="carer">
			<tr style="border-bottom: 1px solid gray;">
				<th style="width: 300px;height: 100px;">
					<h4><b>경력</b></h4>
				</th>
				<td>
					<c:forEach var="cdto" items="${cdto }">
						<span>${cdto.company }</span>&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid gray;">
				<th style="width: 300px;height: 100px;">
					<h4><b>학력</b></h4>
				</th>
				<td>
					<c:forEach var="edto" items="${edto }">
						<span>${edto.school }</span>&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid gray;">
				<th style="width: 300px;height: 100px;">
					<h4><b>수상경력 및 활동</b></h4>
				</th>
				<td>
					<c:forEach var="adto" items="${adto }">
						<span>${adto.activity }</span>&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th style="width: 300px;height: 100px;">
					<h4><b>외국어</b></h4>
				</th>
				<td>
					<c:forEach var="fdto" items="${fdto }">
						<span>${fdto.lang }</span>&nbsp;
					</c:forEach>
				</td>
			</tr>
		</table>
</form>
</div>
</body>
</html>