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
<style type="text/css">
	
	div.menu{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}
	
	button.menu:hover{
		background-color: #021B80;
		color: white;
	}

	div.empreview{
		width: 400px;
		height: 150px;
		margin-left: 10px;
		
	}
	div.runsearch{
		cursor: pointer;
		color: gray;
		width: 40px;
		height: 45px;
		margin-top: 7px;
		font-size: 1.5em;
	}
	
	div.inputserach{
		width: 400px;
		height: 50px;
		border: 1px solid gray;
		border-radius: 10px;
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
	
	
	div.menu button.menu{
		border-radius: 20px;
		width: 150px;
	}
	
	div.reviewimg{
		position: absolute;
		left: 950px;
		top: 200px;
		width:400px;
		height:250px;
		background-image: url("../image/review.jpg");
		background-size: 400px 250px;
	}
	
	div.empname:hover{
		border: 2px solid #021B80;
		
	}
	
	div.choice{
		margin-left: 50px;
		width: 900px;
		height: 100px;
		
	}
	
	div.choice button:hover{
		border: 2px solid #021B80;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="menu">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='review'">기업리뷰</button>
		
		<!--  -->
		<c:if test="${auth!=null }">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='addreview'">my기업리뷰</button>		
		</c:if>

	</div>
	
	<div class="empreview">
		<h2>기업 리뷰</h2>
		<br>
		<h4 style="color: gray;">앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?</h4>
		<div class="inputserach">
			<form action="searchlist" method="get">
			<input type="text" id="empname" name="empname" placeholder="기업 검색"
				style="width: 350px; height: 45px; border: 0px; margin-left: 3px;" class="form-inline">
			<button class="btn btn-sm" type="submit" style="background-color: white;">
			<span class="glyphicon glyphicon-search" style="font-size: 1.5em;"></span>
			</button>
			</form>
		</div>
	</div>
	
	<div class="reviewimg"></div>
	
	<br><br><br>
	
	<!-- 기업 이미지  -->
	
	<div class="list">
		<h3>전체 기업리뷰 (${total})</h3>
		<br>
		<!-- 리뷰정렬 -->
		<div class="choice">
			<h4 style="float: left; margin-top: 30px; margin-right: 20px; color: gray;">리뷰 보기</h4>
			<button type="button" class="latest btn btn-default" style="width: 120px; height: 50px; 
				margin-left:20px; margin-top:10px;  border-radius: 20px; background-color: white;">최신순</button>
			<button type="button" class="largest btn btn-default" style="width: 120px; height: 50px; 
				margin-left:20px; margin-top:10px;  border-radius: 20px; background-color: white;">리뷰많은순</button>
			<button type="button" class="highrating btn btn-default" style="width: 120px; height: 50px; 
				margin-left:20px; margin-top:10px;  border-radius: 20px; background-color: white;">평점높은순</button>
			<button type="button" class="helpful btn btn-default" style="width: 120px; height: 50px; 
				margin-left:20px; margin-top:10px;  border-radius: 20px; background-color: white;">도움이돼요순</button>
		</div>
		<div class="print">
				<c:forEach items="${empname }" var="empname">
					<div class="empname">
					<img alt="" src="../image/ministar.png" style="max-width: 20px;">
					<a class="empname" href="reviewdetail?empname=${empname.empname }" style="text-decoration: none;" >
					<b style="font-weight: normal; text-align: right;">${empname.rating}</b>
					&nbsp;&nbsp;
					${empname.empname } 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b style="font-weight: normal; color: gray;"># ${empname.good}</b></a>
				</div>
			</c:forEach>
		</div>

	</div>
	
	
<!-- 페이지 번호 -->
<div style="width: 800px; text-align: center;">
	<ul class="pagination">
		<!-- 이전페이지 -->
		<c:if test="${startPage>1 }">
			<li><a href="review?pageNum=${startPage-1}">◁이전</a></li>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<!-- currentPage==pp -->
			<c:if test="${currentPage==pp }">
				<li class="active"><a href="review?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="review?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="review?pageNum=${endPage+1}">다음▷</a></li>
		</c:if>
	</ul>
</div>
</body>
<script type="text/javascript">

//리뷰많은 순
$("button.largest").click(function() {
	$.ajax({
        type : "post",  
        url : "/reviewlargest",        
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(data) {
        	var s="";

       		//반복문으로 값 출력
        	$.each(data, function(idx, val) {
        	
        		s+="<div class='empname'>";
        		s+='<img alt="" src="../image/ministar.png" style="max-width: 20px; margin-right:5px;">';
        		s+='<a class="empname" href="reviewdetail?empname='+val.empname+'" style="text-decoration: none;">';
        		s+='<b style="font-weight: normal; text-align: right;">'+val.rating.toFixed(1)+'</b>';
        		s+='&nbsp;&nbsp;&nbsp;';
        		s+=val.empname;
        		s+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';    
        		s+='<b style="font-weight: normal; color: gray;"># '+val.good+'</b></a>';
        		s+="</div>";
    
        	});
        	
        	$("div.print").html(s);
        }	
	})
	
});

//평점높은 순
$("button.highrating").click(function() {
	$.ajax({
        type : "post",  
        url : "/reviewrating",        
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(data) {
        	var s="";

       		//반복문으로 값 출력
        	$.each(data, function(idx, val) {
        	
        		s+="<div class='empname'>";
        		s+='<img alt="" src="../image/ministar.png" style="max-width: 20px; margin-right:5px;">';
        		s+='<a class="empname" href="reviewdetail?empname='+val.empname+'" style="text-decoration: none;">';
        		s+='<b style="font-weight: normal; text-align: right;">'+val.rating.toFixed(1)+'</b>';
        		s+='&nbsp;&nbsp;&nbsp;';
        		s+=val.empname;
        		s+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';    
        		s+='<b style="font-weight: normal; color: gray;"># '+val.good+'</b></a>';
        		s+="</div>";
    
        	});
        	
        	$("div.print").html(s);
        }	
	})
	
});

//도움이돼요 순
$("button.helpful").click(function() {
	$.ajax({
        type : "post",  
        url : "/reviewhelpful",        
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(data) {
        	var s="";

       		//반복문으로 값 출력
        	$.each(data, function(idx, val) {
        	
        		s+="<div class='empname'>";
        		s+='<img alt="" src="../image/ministar.png" style="max-width: 20px; margin-right:5px;">';
        		s+='<a class="empname" href="reviewdetail?empname='+val.empname+'" style="text-decoration: none;">';
        		s+='<b style="font-weight: normal; text-align: right;">'+val.rating.toFixed(1)+'</b>';
        		s+='&nbsp;&nbsp;&nbsp;';
        		s+=val.empname;
        		s+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';    
        		s+='<b style="font-weight: normal; color: gray;"># '+val.good+'</b></a>';
        		s+="</div>";
    
        	});
        	
        	$("div.print").html(s);
        }	
	})
	
});

//최신순
$("button.latest").click(function() {
	$.ajax({
        type : "post",  
        url : "/reviewlatest",        
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(data) {
        	var s="";

       		//반복문으로 값 출력
        	$.each(data, function(idx, val) {
        		
        		s+="<div class='empname'>";
        		s+='<img alt="" src="../image/ministar.png" style="max-width: 20px; margin-right:5px;">';
        		s+='<a class="empname" href="reviewdetail?empname='+val.empname+'" style="text-decoration: none;">';
        		s+='<b style="font-weight: normal; text-align: right;">'+val.rating.toFixed(1)+'</b>';
        		s+='&nbsp;&nbsp;&nbsp;';
        		s+=val.empname;
        		s+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';    
        		s+='<b style="font-weight: normal; color: gray;"># '+val.good+'</b></a>';
        		s+="</div>";
    
        	});
        	
        	$("div.print").html(s);
        }	
	})
	
});

</script>
</html>