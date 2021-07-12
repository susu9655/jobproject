<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ae45bf90266e140c52136e8a7c89216&libraries=services"></script>
<style type="text/css">
div.giup{
		border: 1px solid #ccc;
		width: 250px;
		height: 700px;
		float: left;
		border-radius: 5px;
		padding: 10px 20px;
}
div.premium{
	border: 1px solid #ccc;
	margin-left: 260px;
    border-radius: 5px;
    max-height: 700px;
    min-height: 700px;
    padding: 20px 20px;
}

.empimg{
max-width: 210px;
height: 100px;
max-height: 100px;
}
</style>
</head>
<body>
<form action="#" class="form-inline">
<h2>My Company</h2>
<div class="giup">
<c:forEach var="cdto" items="${cdto}" end="0">
<img class="empimg" src="/gonggophoto/${cdto.empimg}">
</c:forEach>
<h3>${empname}</h3>
<h4>(${email})</h4>

<input type="hidden" name="num" value="${num}">
<a style="float:right;" href="updateEmp?num=${num}">기업정보 수정</a><br>
<hr>
<h4>회사위치</h4><h5> ${addr}</h5>
<input type="hidden" name="addr"id="addr"value="${addr}">
<div id="map" style="width:200px;height:250px;"></div>
</div>
<div class="premium">
<c:set var="strPlanDate" value="${date}" />
<h3><i class="fas fa-medal"></i>게시 중인 프리미엄 공고</h3>
<a style="float:right;" href="orderComplete">결제내역</a><br>
<c:forEach var="cdto" items="${cdto}">
<c:if test="${cdto.amount ne null}">
<hr>
<h4 OnClick="location.href='gonggodetail?num=${cdto.num}'">&nbsp;&nbsp;${cdto.jobgroup} 
<span style="float:right;"><fmt:formatDate value="${cdto.guipday}" pattern="yyyy-MM-dd"/></span></h4>
</c:if>
</c:forEach>
<hr>
<br>
<h3>최근 등록한 공고</h3>
<a style="float:right;" href="gonggolist">공고목록</a><br>
<hr>
<c:forEach var="cdto" items="${cdto}" end="4">
<h4 OnClick="location.href='gonggodetail?num=${cdto.num}'">&nbsp;&nbsp;${cdto.jobgroup}
<span style="float:right;"><fmt:formatDate value="${cdto.writeday}" pattern="yyyy-MM-dd"/></span>
 </h4>
&nbsp;&nbsp;
</c:forEach>
</div>

</form>
<script>
var addr=$("#addr").val();
console.log(addr);

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
geocoder.addressSearch(addr, function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${empname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	</script>
</body>
</html>