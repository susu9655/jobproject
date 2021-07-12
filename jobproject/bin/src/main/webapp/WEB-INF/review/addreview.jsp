<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

	div.menu{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}
	button.menu:hover{
		background-color:  #021B80;
		color: white;
	}
	
	div.myreview{
		margin-left: 10px;
	}
	
	div.infomation{
		background-color: #eee;
		padding: 20px 20px 20px 20px;
	}
	
	div.statement{
		font-size: 1.4em;
		
	}
	
	span.star{
		font-size: 1.4em;
		color: gray;
	}
	
	div.mylist{
		margin-bottom: 50px;
	}
	
	table.reviewtable{
		cursor: pointer;
	}
	
	table.reviewtable:hover{
		background-color: #eee;
	}
	
	div.menu button.menu{
		border-radius: 20px;
		width: 150px;
	}
	
	#alert:hover {
	background-color:  #021B80;
	color: white;
	}
	
	button.update:hover{
	background-color:  #021B80;
	color: white;	
	} 
	
	button.delete:hover {
	background-color:  #021B80;
	color: white;
	}
	
	div.reviewInfo{
		padding: 10px 10px 10px 10px;
		width: 1000px;
		height: 250px;
		border: 1px solid #eee;
		background-color: #eee;
	}
	
</style>
</head>
<body>
	<!-- 로그인 username -->
	<c:set var="email" value="${auth }"/>
	<div class="menu">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='review'">기업리뷰</button>
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='addreview'">my기업리뷰</button>
	</div>
	
	<!-- my 기업리뷰 -->
	<div class="myreview">
		<h2>MY 기업리뷰 (${email }님)</h2>
		<br>
		
		<!-- 기업리뷰 없음 -->
		<c:if test="${totalCount==0 }">
			<h5 style="color: gray;">작성하신 기업리뷰가 존재하지 않습니다.</h5>
		  		
		  		<!-- 경력사항 없음 -->
		  		<c:if test="${empty company}">
   				<h3 href="#demo" class="alert alert-default" id="alert" data-toggle="collapse"
  					style="height:100px; border: 1px solid #dcdcdc;
  					padding: 30px 70px 30px 180px; cursor: pointer;">아직 작성하지 않은 리뷰가 있나요? 기업리뷰 작성하기></h3><br> 			
  				
  				<!-- 이력서페이지로 -->
  					<!-- 리뷰작성 폼 -->
  					<div id="demo" class="collapse">
  						<div class="statement">
  							<h5>기업리뷰는 +JOB 이력서 내 경력사항이 작성된 경우 등록이 가능합니다.</h5>
    						<a style="text-decoration: none; cursor: pointer; color: #021B80;" href="profile">이력서 작성하기</a>
    						<br><br>
 						 </div>
 					</div>
  				</c:if>
  				
  				<!-- 경력사항 있음 -->
  				<c:if test="${!empty company}">
    				<h3 href="#demo" class="alert alert-default" id="alert" data-toggle="collapse"
  					style="height:100px; border: 1px solid #dcdcdc;
  					padding: 30px 70px 30px 180px; cursor: pointer;">아직 작성하지 않은 리뷰가 있나요? 기업리뷰 작성하기 ></h3><br> 			
  				
  					<!-- 기업 확인 -->
  					<div id="demo" class="collapse">
  						<div class="statement">
  							<c:forEach var="com" items="${company }">
  								<table class="com table table" style="width: 400px; margin-left: 300px;">
  									<tr>
  										<td>
  											<h4>${com.company }</h4>
  											<h6>${com.department }</h6>
  										</td>
  										<td>
  											<h5>${com.c_startday } ~ ${com.c_endday }</h5>
  										</td>
  										<td height="50" align="right">
  											<button type="button" class="btn btn-default" style="margin-top: 10px;" 
  												onclick="location.href='writeReview?emp=${com.company }'">리뷰 등록</button>
  										</td>
  									</tr>
  								</table>
  							</c:forEach>
 						 </div>
 					</div> 				
  				</c:if>
		</c:if>
		
		<!-- 기업리뷰 있음 -->
		<c:if test="${totalCount>0}">
			<h5 style="color: gray;">${totalCount}개의 기업리뷰를 작성했습니다.</h5>
			<br>
			<!-- 작성리뷰 출력 -->
			<div class="mylist">
			<c:forEach var="data" items="${list }" varStatus="n">
				<table class="reviewtable table table" style="font-size: 1.3em;">
				<tr>
					<td width="70px;" align="center" style="height: 70px;">${n.count }</td>
					<td width="500px;"
						data-toggle="popover" title="${data.empname }" data-placement="bottom"
						data-content="장점 : ${data.good } 단점 : ${data.bad}">${data.empname }</td>
					<td width="100px;" align="right">${data.prenow }</td>
					<td width="100px;" align="right">
						<fmt:formatDate value="${data.writeday}" pattern="MM-dd"/>
					</td>
					<td width="130px;" align="right">
						<!-- 현재날짜, 작성일 -->
						<c:set var="today" value="${date}" />
						<c:set var="writeday" value="${data.writeday}" />
						
						<!-- 기준날짜:현재날짜-7 -->
						<fmt:parseNumber value="${today.time/ (1000*60*60*24)-7}"
							integerOnly="true" var="expired" />
						<fmt:parseDate value="${writeday}" var="wrote"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${wrote.time/ (1000*60*60*24)}"
							integerOnly="true" var="write" />
							
						<!-- 기준날짜보다 최신 -->
						<c:if test="${expired<=write}">
							<button type="button" class="update btn btn-default" 
								num="${data.num }" >수정</button>
							<button type="button" class="delete btn btn-default" 
								num="${data.num }" >삭제</button>
						</c:if>
						
						<!-- 기준날짜보다 지남 -->
						<c:if test="${expired>write}">
							<button class="pastupdate btn btn-default" disabled>수정</button>
							<button class="pastedelete btn btn-default"  disabled >삭제</button>
						</c:if>			
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
  			
  			<c:if test="${!empty company }">
   				<h3 href="#demo" class="alert alert-default" id="alert" data-toggle="collapse"
  					style="height:100px; border: 1px solid #dcdcdc;
  					padding: 30px 70px 30px 180px;
  					cursor: pointer;"> 아직 작성하지 않은 리뷰가 있나요? 기업리뷰 작성하기></h3><br> 			
  	
     					<!-- 기업 확인 -->
  					<div id="demo" class="collapse">
  						<div class="statement">
  							<hr>
  							<c:forEach var="com" items="${company }">
  								<table class="com " style="width: 400px; margin-left: 300px;">
  									<tr>
  										<td>
  											<h4>${com.company }</h4>
  											<h6>${com.department }</h6>
  										</td>
  										<td>
  											<h5>${com.c_startday } ~ ${com.c_endday }</h5>
  										</td>
  										<td height="50" align="right">
  											<button type="button" class="btn btn-default" style="margin-top: 10px;" 
  												onclick="location.href='writeReview?emp=${com.company }'">리뷰 등록</button>
  										</td>
  									</tr>
  								</table>
  								<hr>
  							</c:forEach>
 						 </div>
 					</div> 	

  
  </c:if>
	</div>	
	</div>
	</c:if>	

 <div class="reviewInfo">
 	<h3>기업리뷰 안내사항</h3><br><br>
 	<p>- 기업리뷰는 +JOB 이력서 내 경력사항이 작성된 경우 등록이 가능합니다.</p>
 	<p>- 현직자 퇴사자가 직접 입력한 데이터로 실제 기업의 내용과 차이가 발생할 수 있으므로 참고하는 자료로 활용하시기를 권장해드립니다.</p>
 	<p>- 최초 작성 후 7일까지 수정/삭제가 가능하며 이후에는 수정/삭제가 불가합니다.</p>
 	<p>- 본 자료의 저작권은 +JOB에 있으며 동의 없이 재가공 및 재배포 할 수 없음을 알려드립니다.</p><br><br>
 </div>
</body>
<script>

//팝오버 - 내용확인
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

//삭제버튼
$(".delete").click(function() {
	
	var num=$(this).attr("num");
	//alert(num);
	
	location.href="deleteReview?num="+num;
	alert("삭제되었습니다.");
});

//수정버튼
$("button.update").click(function() {
	
	var num=$(this).attr("num");
	//alert(num);
	
	location.href="updateReview?num="+num;
	
});
</script>
</html>