<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">

div.recommed{
	width: 1000px;
	height:600px;
}

 div.gonggo-box{
 	max-width: 200px;
 	min-width: 200px;
	height: 200px;
	cursor: pointer;
	margin-left:30px;
	margin-bottom: 100px;
	padding-top: 10px;
	float: left;
	border: none;
 }
 div.totaljob{
 	position:absolute;
 	top: 150px;
 	left:1150px;
 	border-radius:10px;
 	font-size: 1.5em;
 	padding: 10px 10px;
 
 }
 
 div.totaljob a{
 	text-decoration: none;
 	color: black;
 	cursor: pointer;
 }
 
 div.totaljob a:hover {
	color: highlight;
}

div.image{
	width: 200px;
	height: 150px;
	background-size: 200px 150px;
	border-radius: 10px;
}

div.gonggo{
	margin-left: 10px;
	margin-top: 10px;
}

div.nodata{
	width: 900px;
	height: 100px;
	border: 1px solid #ccc;
	border-radius: 30px;
	padding-top: 17px;
	padding-left: 130px;
}


</style>
</head>
<body>
<c:set var="id" value="${username }"/>
<h2>추천 공고</h2>
<h5 class="alert alert-default">
	안녕하세요 ${id }님, 기입하신 전문분야를 기반으로 포지션을 추천드립니다.
</h5><br>
<!-- 추천공고 -->
<div class="recommed">
<c:set var="id" value="${idx }"/>
<c:set var="job" value="${jobgroup }"/>

<!-- 추천공고 직군 데이터 없을 경우 -->
<c:if test="${empty data }">
	<div class="nodata">
		<h3>죄송합니다. 현재 [${job}] 직군은 채용 공고가 없습니다.</h3>
	</div>
	
</c:if>

<c:forEach var="dto" items="${data}" varStatus="n">
	<div class="gonggo-box">
		<input type="hidden" name="num" value="${dto.num}">
			<div class="image" style="background-image: url('../gonggophoto/${dto.empimg }');">
	
				<c:forEach var="book" items="${bookdata }">
				<c:set var="bnum" value="${book.num }"/>
				<c:set var="dnum" value="${dto.num }"/>
					<c:if test="${bnum==dnum}">
						<span class="bookmark fas fa-bookmark" 
						style="float: right; margin: 10px 10px 10px 10px; font-size: 1.3em; color: blue;"
						num="${dto.num }" id=${id }></span>	
					</c:if>
				</c:forEach>
					<c:if test="${not fn:contains(bnum, dnum)}">
						<span class="bookmark far fa-bookmark" 
						style="float: right; margin: 10px 10px 10px 10px; font-size: 1.3em;"
						num="${dto.num }" id=${id }></span>	
					</c:if>
						<c:if test="${bnum==null}">
						<span class="bookmark far fa-bookmark" 
						style="float: right; margin: 10px 10px 10px 10px; font-size: 1.3em;"
						num="${dto.num }" id=${id }></span>	
					</c:if>

			</div>		
			<div class="gonggo" OnClick="location.href='gonggodetail?num=${dto.num}'">	
				<h4 class="subject">${dto.jobgroup}</h5>
				<h5>${dto.empname }</h4>		
				<h5 style="color:gray">마감일 : ${dto.deadline }</h5>
			</div>
	</div>
</c:forEach>

<!-- 전문분야 변경 -->

<div class="totaljob">
	<a data-toggle="collapse" data-target="#demo" >다른 포지션을 원하시나요?</a><br>
  	<div id="demo" class="collapse">
  		<div class="statement">
			<button type="button" class="btn btn-default"
				style="margin-left: 30px; margin-top: 10px;"
				onclick="location.href='profile'"
			>전문분야 변경하러가기 ></button>
 	 	</div>
	</div>
	
</div>
</div>

</body>
<script type="text/javascript">
	$("span.bookmark").click(function() {
		var num=$(this).attr("num");
		var id=$(this).attr("id");
		var css=$(this).attr("class");
		
		//alert(num+", "+id+", "+css);
		
		$(this).attr("class", "bookmark fas fa-bookmark");
	    $(this).css("color", "blue");
		
		
	    $.ajax({
	        type : "get",  
	        url : "/recommendbookmark",        
	        data : "num="+num+"&id="+id,
	        dataType: 'json',
	        
	        error : function(){
	            alert("통신 에러","error","확인",function(){});
	        },

	        success : function(data) {
	      
	        
	                if(data == 0){
	                	alert("북마크되었습니다.");
	                	$(this).attr("class", "bookmark fas fa-bookmark");
	                	$(this).css("color", "blue");
	                }
	                else if (data == 1){
	                	alert("북마크가 해제되었습니다.");
	                	location.reload();
	                	$(this).atrr("class", "bookmark far fa-bookmark");  
	                	
	                }
	                
	                
	        }
	    });
		
	});
</script>
</html>