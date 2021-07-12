<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	body{
	
	}
	  div.resume-entire{
	padding-left: 100px;
	padding-right: 100px;
	padding-top: 10px;
	}
	div.gonggoicon{
   width: 70px;
   height: 70px;
   border-radius: 50px 50px 50px;
   border: 0px solid black;
   margin-left:50px;
   background-color: #021B80;
}
	div.gonggoicon span{
    font-size:30pt;
    padding: 15px 18px;
    color: white;
 }
 	div.gonggoicon p{
  	width: 100px;
  	padding-top: 20px;
  }
  
  table.resumebox{
  	border: 1px solid #D4D6D0;
  	float: left;
  	margin-left: 10px;
  	margin-bottom: 10px;
  	min-height: 140px;
  	min-width: 170px;
  }
 
  table.resumelist{
  	border: 1px solid #D4D6D0;
  	float: left;
  	margin-left: 10px;
  	margin-bottom: 10px;
  }
  
  span.glyphicon-option-vertical:hover{
	  	cursor: pointer;
   }
  div.popup{
  	display: none;
  	border: 1px solid gray;
  	background-color: white;
  	width: 130px;
  	box-shadow : 0 0 2px gray inset, 0 0 2px black
  }
  
  div.popup *{
  	color: #495057;
  }
  
  
 li a{
 	text-decoration: none;
 	color: black;
 }
 li a:hover{
	background-color: #eee;
	color: black;
}
	div.explanation{
		background-color: #F3F9FE;
		width: 800px;
	}
 
</style>
<script type="text/javascript">
//선택한 이력서 num을 전역 변수로 설정
var num_r;

window.onload=function(){
	
	//:를 클릭했을 때 다운로드, 삭제 poopup 띄우기
	var list=document.querySelectorAll("#vertical-menu");
	
	for(var i=0;i<list.length;i++){
		list[i].onclick=function(e){
			var t= e.target.offsetTop;//상단 좌표
			var l= e.target.offsetLeft;//좌측 좌표
			num_r=e.target.getAttribute('num');
			
			var popup= document.getElementById("popup");
			popup.style.zIndex="10";
			popup.style.position="absolute";
			popup.style.top=t+10+"px";
			popup.style.left=l-100+"px";
			popup.style.display="block";
			popup.setAttribute("num",num_r);
			
			
			
			
			
		}
	} 
}

//이력서삭제 이벤트
function godel(e){
	location.href="delresume?num_r="+num_r;
}

</script>
</head>
<body>
<div class="resume-entire">
<div>
	<h4>최근 문서</h4>
</div>
<br><br>
<div class="explanation" style="margin-top: 10px;margin-left: 10px;">
	<h6>• 이력서 공개 설정은 1개의 이력서만 가능합니다</h6>
	<h6>• 이력서, 파일+ 이력서 각각 최대 10개까지 등록 가능합니다. (총 최대 20개)</h6>
</div>
<br>
<table class="resumebox" onclick="location.href='addresume'" style="cursor: pointer;">
 	<tr>
 		<td>
 			<div class="gonggoicon">
   			<span class="glyphicon glyphicon-file" ></span>
   			</div>
   			<p style="color: #495057;text-align: center;margin-top: 10px;">새 이력서 작성</p>
 		</td>
 	</tr>
</table>
<c:forEach var="dto" items="${list }" varStatus="n">
	<table class="resumelist" id="resumelist">
		<tr onclick="location.href='resumedetail?num_r=${dto.num_r}'">
			<td align="left" style="width: 170px;height: 120px;">
				<h4 style="color:#868e96;"><sec:authentication property="principal.username"/></h4>
				<h5 style="color:#adb5bd;"><fmt:formatDate value="${dto.nowdate }" pattern="yyyy.MM.dd"/></h5><br><br>
			</td>
		</tr>
		<tr>
			<td align="right" style="background-color: #F1F3EF">
				<span class="glyphicon glyphicon-option-vertical" style="color:#868e96;" id="vertical-menu" num="${dto.num_r }"></span>
			</td>
		</tr>
	</table>
	
	<div class="popup" id="popup" >
		<ul>
			<li onclick="godel()" style="cursor: pointer;">삭제</li>
		</ul>
	</div>
</c:forEach>
</div>
</body>
</html>