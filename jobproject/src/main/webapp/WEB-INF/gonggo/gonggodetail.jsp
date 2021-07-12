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
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ae45bf90266e140c52136e8a7c89216&libraries=services"></script>
<style type="text/css">
.emplogo{
max-width: 600px;
max-height: 400px;
min-width: 600px;
min-height: 400px;
}

hr.seon{
border: solid 2px gray;
}
div.one{
 border: 2px solid #021B80;
    border-radius: 20px 20px;
    font-size: 1.2em;
    color: gray;
    max-width: 200px;
    width: 100px;
    padding-left: 10px;
}

button.bookmark_btn{
		background-color: white;
		color: #021B80;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
		margin-top: 50px;
		margin-bottom: 10px;
	}
	button.apply_btn{
		background-color: #021B80;
		color: white;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
	}
	button.apply_complete_btn{
		background-color: #bbb;
		color: #F2F2F2;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #bbb;
		cursor: default;
	}
	div.bookmarkBox{
		border: 1px solid #eee;
		width: 300px;
		height: 200px;
		text-align: center;
		position: relative;
		border-radius: 5px;
	}
	aside.bookmarkBox{
		position: absolute;
		left: 1000px;
		top: 160px;
		float: left;
		border: 0px solid gray;
	}
	div.apply_info_box{
		position: absolute;
		width: 300px;
		height: auto;
		min-height: 200px;
		border: 1px solid #ccc;
		z-index: 100;
		top: 0px;
		display: none;
		background-color: white;
		border-radius: 5px;
		overflow-y: scroll;
		padding-left: 5px;
	}
	div.apply_resumelist{
		border: 1px solid #ccc;
	    width: 200px;
	    height: 40px;
	    color: gray;
	    padding-left: 5px;
	    padding-right: 5px;
	    margin-right: 5px;
	    margin-left: 40px;
	    cursor: pointer;
	    margin-bottom: 10px;
	    text-align: center;
	    line-height: 40px;
	}
	div.select-border{
		border:2px solid #258bf7;
	}
	#apply_resume_submit{
		background-color: white;
		color: #021B80;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		border: 1px solid #021B80;
		margin-bottom: 15px;
		
	}
	
	button.add_new_resume{
		background-color: white;
		color: #021B80;
		border-radius: 5px;
		width: 200px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #ccc;
		margin-left: 35px;
	}
	button.add_new_resume:hover{
		border: 1px solid #36f;
	}
	span.apply_box_backbtn{
		color: #aaa;
		font-weight: bold;
		cursor: pointer;
	}
	
	pre.content{
	border: none;
	font-size: 1.3em;
	font-family: 'ELAND_Choice_M';
	}
	.btn{
	float: right;
	margin-left: 10px;
	margin-bottom: 300px;
	}
</style>
<script type="text/javascript">
window.onload=function(){
	//북마크 하기 버튼을 클릭했을 때 이벤트 주기
	document.getElementById("bookmark_btn").onclick=function(){
		var ch_book=this.getAttribute('value');
		if(ch_book=="북마크하기"){
			alert("북마크에 저장되었습니다.")
			location.href="gonggodetail?num=${dto.num}&book=yes";
		}else if(ch_book=="북마크완료"){
			location.href="gonggodetail?num=${dto.num}&book=no";
		}
	}
	
	//지원하기를 클릭했을 때 지원창이 뜨는 이벤트
	document.getElementById('apply_btn').onclick=function(){
		document.getElementById("appy_info_box").style.display="block";
	}
	
	//뒤로가기 버튼을 클릭했을 때 이벤트
	document.getElementById("apply_box_backbtn").onclick=function(){
		document.getElementById("appy_info_box").style.display="none";
	}
	
	//지원할 이력서를 클릭했을 때 이벤트
	$("div.apply_resumelist").click(function(){
		//다른 클래스 지우기
		$("div.apply_resumelist").removeClass("select-border");
		$("div.apply_resumelist").removeAttr("name");
		$("div.apply_resumelist").children("input").remove();
		
		if($(this).attr("name")!="num_r"){
			$(this).attr("name", "num_r");
			$(this).addClass("select-border");
			var num_r=$(this).attr("num");
			$(this).append("<input type='hidden' name='num_r' value='"+num_r+"'>");
		}else{
			$(this).attr("name","");
			$(this).removeClass("select-border");
			$(this).children("input").empty();
		}
		console.log($("div.select-border").length==0);
		
	});
}
function submit2(frm){
	//이력서를 선택했는지 체크
	if($("div.select-border").length==0){
		alert("지원할 이력서를 선택해주세요.");
		return false;
	}
	
	frm.action='applyResume';
	frm.submit();
	return true;
}
</script>
</head>
<body>
<form action="#" class="gonggodetail form-inline" method="post">
<div class="header">
<img src="../gonggophoto/${dto.empimg}" class="emplogo"><br>
<h2>${dto.jobgroup}</h2>
<h3>${dto.empname}</h3>
<c:forEach var="cdto" items="${cdto}">
<div class="one form-control">${cdto.tag}</div>
</c:forEach>
</div>
<hr class="seon">
<pre class="content">${dto.empcontent}</pre><br>
<hr class="seon">
<h4>마감일&nbsp; ${dto.deadline}</h4>
<h4>근무지역 &nbsp; ${edto}</h4>
<input type="hidden" name="edto" id="edto" value="${edto}">
<div id="map" style="width:400px;height:300px;"></div>
<c:if test="${authok =='ok' }">
<aside class="bookmarkBox">
<c:set var="id"><sec:authentication property="principal.user.id"/></c:set>
<input type="hidden" name="id" value="${id }">
<input type="hidden" value="${dto.num }" name="num">
<div class="bookmarkBox">
<c:if test="${book!='yes' }">
<button type="button" class="bookmark_btn" id="bookmark_btn" value="북마크하기">
	<i class="far fa-bookmark"></i>북마크하기
</button>
</c:if>
<c:if test="${book=='yes' }">
<button type="button" class="bookmark_btn" id="bookmark_btn" value="북마크완료">
	<i class="fas fa-bookmark"></i>북마크완료
</button>
</c:if>
<br>
<c:if test="${apply_cnt==0 }">
<button type="button" class="apply_btn" id="apply_btn">
	지원하기
</button>
</c:if>
<c:if test="${apply_cnt!=0 }">
<button type="button" class="apply_complete_btn">
	지원완료
</button>
</c:if>
</div>
<div class="apply_info_box" id="appy_info_box">
<header>
	<h3 style="text-align: center;">지원하기</h3>
	<span class="apply_box_backbtn" id="apply_box_backbtn">뒤로</span>
</header>
<br>
<table class="apply">
	<caption><b>지원정보</b></caption>
	<tr>
		<th style="width: 70px;height: 30px;">이름</th>
		<th style="border-bottom: 1px solid #ccc;"><sec:authentication property="principal.username"/></th>
	</tr>
	<tr>
		<th style="width: 70px;height: 30px;">이메일</th>
		<th style="border-bottom: 1px solid #ccc;"><sec:authentication property="principal.user.email"/></th>
	</tr>
	<tr>
		<th style="width: 70px;height: 30px;">연락처</th>
		<th style="border-bottom: 1px solid #ccc;"><sec:authentication property="principal.user.hp"/></th>
	</tr>
</table>
<br>
<table>
	<caption><b>첨부파일</b></caption>
	<tr>
		<td align="center" colspan="2"><img alt="" src="image/resume.png" style="width: 100px;height: 100px;"></td>
	</tr>
	<c:forEach var="rdto" items="${list }" varStatus="n">
		<tr>
			<td>
				<div class="apply_resumelist" id="apply_resumelist" num="${rdto.num_r }">
					<div>
						<span>이력서(${n.count})</span>&nbsp;
						<span>
							<fmt:formatDate value="${rdto.nowdate }" pattern="YYYY-MM-dd"/>
						</span>
					</div>
				</div>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td align="center" style="margin: auto;">
			<button type="button" onclick="location.href='addresume'" class="add_new_resume">새 이력서 작성</button>
		</td>
	</tr>
</table>
<footer style="text-align: center;margin: auto;">
		<hr>
		<button type="submit" id="apply_resume_submit" onclick="return submit2(this.form)">제출하기</button>
</footer>
<div>
</div>
</div>

</aside>
</c:if>
<button type="button" class="btn" onclick="location.href='gonggolist'">목록</button>
<c:if test="${dto.empname==loginname}">
<button type="button" class="btn" onclick="location.href='updategonggo?num=${dto.num}'">공고 수정</button>
<button type="button" class="btn" onclick="location.href='delete?num=${dto.num}'">공고 삭제</button>
</c:if>

</form>
<script>
var edto=$("#edto").val();
console.log(edto);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(edto, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.empname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6093907a141e311e"></script>
</body>
</html>