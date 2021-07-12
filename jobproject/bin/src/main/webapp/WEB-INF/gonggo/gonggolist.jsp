<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<form class="gonggolist form-inline">
		<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
		<br>
		<h3>${empname} 채용 중</h3>
		<br>
		<div class="addgonggo form-control"
			OnClick="location.href='writegonggo'">
			<div class="gonggoicon">
				<span class="glyphicon glyphicon-file"></span>
				<p>공고 작성</p>
			</div>
		</div>
		<c:set var="strPlanDate" value="${date}" />
		<c:forEach var="dto" items="${gonggolist}" varStatus="n">
			<c:set var="end_plan_date" value="${dto.deadline}" />
			<fmt:parseNumber value="${strPlanDate.time/ (1000*60*60*24)}"
				integerOnly="true" var="strDate" />
			<fmt:parseDate value="${end_plan_date}" var="endPlanDate"
				pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${endPlanDate.time/ (1000*60*60*24)+1}"
				integerOnly="true" var="endDate" />

			<c:if test="${(endDate - strDate)>=0}">
				<div class="gonggo-box form-control">
					<div OnClick="location.href='gonggodetail?num=${dto.num}'">
						<input type="hidden" name="num" value="${dto.num}">
						<h4 class="subject" >${dto.jobgroup}</h4>
						<c:set var="endday1" value="${end_plan_date.substring(0,4)}" />
						<c:set var="endday2" value="${end_plan_date.substring(5,7)}" />
						<c:set var="endday3" value="${end_plan_date.substring(8,10)}" />
						<h5 style="color: gray">마감일 : ${endday1}년 ${endday2}월
							${endday3}일</h5>
						<h4 class="numdday">D - ${(endDate - strDate)}</h4>
						</div>
						<c:if test="${dto.amount eq null}">
						<button type="button" class="premium"  num="${dto.num}">프리미엄 등록</button>
						</c:if>
						<c:if test="${dto.amount ne null}">
						<h4><i class="fas fa-medal"></i> 프리미엄 공고</h4>
						
						</c:if>
					</div>
			</c:if>
		</c:forEach>
		<hr>
		<!-- 마감 날짜가 현재 날짜를 지났을때 -->

		<h3>채용 마감</h3>
		<br>
		<c:forEach var="dto" items="${gonggolist}" varStatus="n">
			<c:set var="end_plan_date" value="${dto.deadline}" />
			<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}"
				integerOnly="true" var="strDate" />
			<fmt:parseDate value="${end_plan_date}" var="endPlanDate"
				pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)+1}"
				integerOnly="true" var="endDate" />

			<c:if test="${(endDate - strDate)<0}">
				<div class="gonggo-box form-control"
					OnClick="location.href='gonggodetail?num=${dto.num}'">
					<input type="hidden" name="num" value="${dto.num}">
					<h4 class="subject">${dto.jobgroup}</h4>
					<c:set var="endday1" value="${end_plan_date.substring(0,4)}" />
					<c:set var="endday2" value="${end_plan_date.substring(5,7)}" />
					<c:set var="endday3" value="${end_plan_date.substring(8,10)}" />
					<div class="circle">마감일</div>
					<h3 class="endday">
						<br>${endday1}년 ${endday2}월 ${endday3}일
					</h3>
				</div>
			</c:if>
		</c:forEach>
	</form>

<script type="text/javascript">
window.onload=function(){
	$("button.premium").click(function(){
		//alert($(this).attr("num"));
		let amount="100";
		IMP.init('imp27016563');
		var num=$(this).attr("num");
		console.log(num);
		
		 IMP.request_pay({
	         pg: 'danal',
	         merchant_uid: 'merchant_' + new Date().getTime(),
			 num: num,
	         name: '주문명 : 프리미엄 공고',
	         amount: 100000,
	         buyer_email: 'iamport@siot.do',
	         buyer_name: '구매자이름',
	         buyer_tel: '010-1234-5678',
	         buyer_addr: '인천광역시 부평구',
	         buyer_postcode: '123-456'
	     }, function (rsp) {
	         console.log(rsp);
	         if (rsp.success) {
	             var msg = '결제가 완료되었습니다.';
	             msg += '고유ID : ' + rsp.imp_uid;
	             msg += '상점 거래ID : ' + rsp.merchant_uid;
	             msg += '결제 금액 : ' + rsp.paid_amount;
	             msg += '카드 승인번호 : ' + rsp.apply_num;
	             $.ajax({
	                 type: "GET", 
	                 url: "/gonggo/premiumlist", //충전 금액값을 보낼 url 설정
	                 data: {
	                     "amount" : amount,
	                     "num" : num
	                 },
	                 success : function(result){
							if(result == "성공") {
								alert(msg);
								location.href = "/orderComplete"; 
							}else{
								alert("디비입력실패");
								return false;
							}
						},
						error : function(a,b,c){}
	             });
	         } else {
	             var msg = '결제에 실패하였습니다.';
	             msg += '에러내용 : ' + rsp.error_msg;
	         }
	         alert(msg);
	     });
	});
}

</script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>