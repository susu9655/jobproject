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
	div.newstitle{
		width: 900px;
		height: 200px;
		border: 1px solid #ccc;
		padding: 20px 20px 20px 20px;
	}
	
	div.newsmenu{
		width: 900px;
		height: 70px;
		border: 1px solid gray;
	}
	
	div.newslist{
		width: 900px;
		cursor: pointer;
	}
	
	.newstable:active{
		background-color: #dcdcdc;
	}
	
	#latestTitle{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
<h1>최신뉴스</h1><br>
<div class="newstitle">
	<c:forEach var="news" items="${latest}" varStatus="n">
		<table style="width: 900px;">
			<tr>
				<td style="width: 800px;">
					<a href="newsdetail?num=${news.num}" id="latestTitle">
						<img alt="" src="../image/new.PNG" style="float: left;">	
						<h4>${news.title}</h4>
					</a>
				</td>
				<td align="right;">
					<h5 style="color: gray;">
					<fmt:formatDate value="${news.writeday}" pattern="MM-dd" />
					</h5>
				</td>
			</tr>
	</table>
</c:forEach>
</div>

<br><br><br>

<!-- 뉴스 게시글 개수 -->
<c:set var="count" value="${totalCount}" />
<div style="width: 900px;">
	<h4 style="float: left;">총 ${count}개</h4>
	<input type="text" name="title" id="title" placeholder="기사 제목"
		style="height: 30px; margin-left: 650px;">
	<button type="button" id="searchbtn" style="float: right;" 
		class="btn btn-default btn-sm">검색</button>
</div>


<div class="newslist">
	<c:forEach var="news" items="${list}" varStatus="n">
		<table class="newstable table table" num="${news.num}" style="width: 900px;" id="newstable">
			<tr>
				<td style="width:210px; height: 150px;">
					<img src="../newsImage/${news.image}" style="max-width: 200px; max-height: 150px;">
				</td>
				<td>
					<h4>${news.title}</h4>
					<br>
					<h5 style="color: gray;">${news.content}</h5>
					<br>
					<h5>
						<fmt:formatDate value="${news.writeday}" pattern="yyyy-MM-dd"/> | 
						<span class="glyphicon glyphicon-eye-open" style="font-size: 1.2em;"></span>
						${news.readcount}
					</h5>
				</td>
			</tr>
	</table>
</c:forEach>
</div>

<!-- 페이지 번호 -->
<div style="width: 800px; text-align: center;">
	<ul class="pagination">
		<!-- 이전페이지 -->
		<c:if test="${startPage>1 }">
			<li><a href="news?pageNum=${startPage-1}">◁이전</a></li>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<!-- currentPage==pp -->
			<c:if test="${currentPage==pp }">
				<li class="active" ><a href="news?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="news?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="news?pageNum=${endPage+1}">다음▷</a></li>
		</c:if>
	</ul>
</div>
</body>
<script type="text/javascript">

//테이블 클릭 이벤트(상세페이지 이동)
$(document).on('click', '#newstable', function() {
	//num값 저장
	var num=$(this).attr("num");
	//alert(num);
	
	//num값을 컨트롤러로 전달
	location.href="/newsdetail?num="+num;
})



//기사 검색 버튼 searchbtn 클릭 이벤트(ajax로 div 다시 출력)
$("#searchbtn").click(function() {
	
	//input태그 입력 값(기사제목) 저장
	var title=$("#title").val();
	
	//그냥 검색 시 알림창
	if(title==""){
		alert("기업명을 검색해주세요");
		return;
	}
	//컨트롤러에 title 값 전달 후 list로 돌려받기
	else{
		
		$.ajax({
	        type : "post",  
	        url : "/searchNews",        
	        data : "title="+title,
	        dataType: 'json',
	        
	        error : function(){
	            alert("통신 에러","error","확인",function(){});
	        },

	        success : function(data) {
	        	console.log(data);
	        	var s="";
	        	
	        	if(data==""){
	        		s+="<br><br><br>";
	        		s+="<h3 style='margin-left: 300px;'>["+title+"] 검색 결과가 없습니다.</h3><br><br>";
	        		s+='<button type="button" class="lostbtn btn-default btn" style="margin-left: 380px;">뒤로가기</button>';
	        		
	        		//검색 값 삭제
	        		$("#title").val("");
	        		
	        		//페이징 숨기기
	        		$(".pagination").hide();
	        		
	        	}else{
	        		
	        		//검색 값 삭제
	        		$("#title").val("");
	        		
		       		//반복문으로 값 출력
		        	$.each(data, function(idx, val) {
		        		s+='<table class="newstable table table" num="'+val.num+'" style="width: 900px;" id="newstable">';
			        	s+='<tr>';
		        		s+='<td style="width:210px; height: 150px;">';
			        	s+='<img src="../newsImage/'+val.image+'" style="max-width: 200px; max-height: 150px;"></td>';
			        	s+='<td><h4>'+val.title+'</h4><br>';
			        	s+='<h5 style="color: gray;">'+val.content+'</h5><br>';
			        	s+='<span class="glyphicon glyphicon-eye-open" style="font-size: 1.2em;"></span>&nbsp;';
			        	s+=val.readcount;
			        	s+='</h5></td></tr>';
			        	s+='</table>';
			        	
		        	});
		       		
		       		//목록 버튼
		        	s+="<br><br><br>";
		        	s+='<button type="button" class="lostbtn btn-default btn" style="margin-left: 380px;">목록</button>';
	        		
		        	//페이징 숨기기
	        		$(".pagination").hide();
	        		
	        	}	        	
	               	
	        	$("div.newslist").html(s);
	        }	
		})		
	}
});

//검색결과 없을 시 뒤로가기 버튼
$(document).on('click', '.lostbtn', function() {
	
	location.href="news";
})

</script>
</html>