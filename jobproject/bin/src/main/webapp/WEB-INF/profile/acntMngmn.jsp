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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
	div.acntMngmn_title{
		border: 0px solid gray;
		width: 100px;
		height: 50px;
		margin-bottom: 20px;
	}
	div.acntMngmn_nav{
		border: 0px solid #ccc;
		width: 200px;
		height: 400px;
		float: left;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		
	}
	div.acntMngmn_content{
		border: 0px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
	}
	
	div.profile_img{
		text-align: center;
		padding-top: 20px;
	}
	
	div.profile_img img{
		border-radius: 100px;
		width: 70px;
		height: 70px;
	}
	
	button.profile_update{
		border-radius: 30px;
		width: 100px;
		height: 30px;
		border: 1px solid #eee;
		background-color: white;
	}
	.sel{
		border: 1px solid gray;
		width: 300px;
		height: 30px;
		line-height: 30px;
	}
	.sel:active{
		border: 1px solid gray;
	}
	.sel:focus{
		outline: none;
	}
	
	.textarea{
		border:none;width: 300px;height: 100px;
	}
	.textarea:focus {
		outline: none;
	}
	span.glyphicon-pencil:hover{
		color: blue;
		cursor: pointer;
	}
	
	button.emailcheck_btn{
		background-color: #021B80;
		color: white;
		border-radius: 40px;
		width: 120px;
		height: 40px;
		line-height: 30px;
		border: 0px solid black;
	}
	
	button.leave_btn{
		background-color: #021B80;
		color: white;
		border-radius: 40px;
		width: 120px;
		height: 30px;
		line-height: 30px;
		border: 0px solid black;
	}
	
	input.emailbox{
		border: 1px solid #ccc;
		width: 300px;
		height: 40px;
	}
	
	input.emailbox:focus {
		outline: none;
	}
	
	h6.detail{
		color: #bbb;
		padding-left: 10px;
	}
	a.nav-link{
		color: black;
	}
	
	select.sel{
		width: 200px;
		height: 30px;
		padding-left: 10px;
		font-size: 15px;
		color: gray;
		border-style: none;
		border-radius: 3px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		/*background: url('select-arrow.png') no-repeat 95% 50%;  화살표 아이콘 추가 */
		margin-left: 10px;
	}
	
	button.final_leave_btn{
		color: white;
		background-color: #bbb;
		border: none;
		border-radius: 5px;
		width: 200px;
		height: 40px;
		margin-top: 10px;
	}
	.loader {
		  border: 16px solid #f3f3f3;
		  border-top: 16px solid #3498db;
		  border-radius: 50%;
		  width: 50px;
		  height: 50px;
		  animation: spin 2s linear infinite;
		  position: fixed;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
   }

@keyframes spin {
  0% {
    transform: translate(-50%, -50%) rotate(0deg);
  }
  100% {
    transform: translate(-50%, -50%) rotate(360deg);
  }
}
</style>
<script type="text/javascript">

window.onload=function(e){
	$('.loader').hide();
	//로그인한 이메일을 입력시 메일 발송
	document.getElementById("emailcheck_btn").onclick=function(e){
		var email_input = document.getElementById("email_input").value;
		var hidden_email = document.getElementById("hidden_email").value;
		
		if(email_input != hidden_email){
			alert("입력하신 이메일이 유효하지 않습니다.\n다시 입력해주세요.");
			e.preventDefault();
		}
		//로딩 이미지 띄우기
		$('.loader').fadeIn().delay('2000');
		setTimeout(function() { 
			alert("이메일을 확인해주세요");
		},2000);
		
		
	}
}
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}

</script>
<body>
<div class="profile_entire">
<c:set var="email"><sec:authentication property="principal.user.email"/></c:set>
<c:set var="name"><sec:authentication property="principal.username"/></c:set>
	<div class="acntMngmn_title">
		<h4>계정 설정</h4>
	</div>
	<div class="acntMngmn_nav">
          <ul class="nav flex-column" style="width: 180px;">
            <c:if test="${type=='changePassword' }">
	             <li class="nav-item">
	             	<a class="nav-link active" href="acntMngmn?type=changePassword">비밀번호 설정</a>
	             </li>
	             <li class="nav-item">
	             	<a class="nav-link" href="acntMngmn?type=leave">회원 탈퇴</a>
	             </li>
            </c:if>
             <c:if test="${type!='changePassword' }">
	             <li class="nav-item">
	             	<a class="nav-link" href="acntMngmn?type=changePassword">비밀번호 설정</a>
	             </li>
	             <li class="nav-item">
	             	<a class="nav-link active" href="acntMngmn?type=leave">회원 탈퇴</a>
	             </li>
            </c:if>
          </ul>
	</div>
	<div class="acntMngmn_content">
		<c:if test="${type == 'changePassword' }">
			<form action="send" method="post">
				<h4>비밀번호 설정</h4>
				<input type="hidden" name="name" value="${name }">
				<input type="hidden" name="email" value="${email }" id="hidden_email">
				<input name="address" class="emailbox" placeholder="sample@job.co.kr" id="email_input">
				<h6 style="color: #bbb;">*비밀번호를 재설정 할 이메일 계정을 입력해주세요.</h6>
				<br>
				<div style="text-align: right;margin-right: 50px;">
					<button type="submit" class="emailcheck_btn" id="emailcheck_btn">전송</button>
				</div>
				<div class="loader"></div>
			</form>
		</c:if>
		<c:if test="${type != 'changePassword' }">
			<h4>탈퇴 시 주의 사항</h4>
			<h6 class="detail">• 탈퇴 시 회원님의 이력서를 포함하여 회원님의 계정에 저장된 모든 정보가 영구적으로 삭제되며, 다시는 복구할 수 없습니다.</h6>
			<h6 class="detail">• 이력서의 저장을 원하실 경우, 탈퇴 이전에 이력서 관리 페이지에서 다운로드 해주세요.</h6>
			<h6 class="detail">• 다른 계정에 이미 제출된 추천 정보는 추천받은 계정의 소유로 간주되어 자동으로 삭제되지 않으며, 탈퇴 시 수정이나 삭제가 불가능합니다.</h6>
			<h6 class="detail">• 제출된 추천서의 수정이나 삭제를 원하실 경우, 탈퇴 이전에 추천 페이지에서 추천서를 수정, 또는 삭제 해주세요.</h6>
			<h6 class="detail">• 기업에 대한 채용 수수료 정산과 부정이용 방지를 위해, 기업에 대한 지원 내역은 관련 법령에 의거하여 탈퇴 후 최장 5년간 저장됩니다.</h6>
			<h6 class="detail">• 원티드 회원에서 탈퇴하실 경우, 추천 및 채용 보상금을 받으실 수 없습니다. 받으실 보상금이 있으시다면 탈퇴 이전에 모든 수속을 마쳐주세요.</h6>
			<h6 class="detail">• 회원 탈퇴 시 계정에 적립된 포인트는 자동으로 환급되지 않으며, 재가입시에도 복구되지 않습니다.</h6>
			<h6 class="detail">• 탈퇴 이전에 신청해주신 교육 및 이벤트 참가 신청은 자동으로 취소되지 않습니다. 취소를 원하실 경우 탈퇴 이전에 별도로 요청해주세요.</h6>
			<h6 class="detail">• 기업 서비스에 등록되어 있는 계정일 경우, 기업 서비스 접속권한도 동시에 삭제됩니다.</h6>
			<h6 class="detail">• 이상의 내용에 동의하여 탈퇴를 원하실 경우, 아래의 “동의하기” 버튼을 클릭 부탁드립니다.</h6>
			<br> 
			<div style="text-align: center;">
				<button type="button" class="leave_btn" data-toggle="modal" data-target="#myModal">동의하기</button>
			</div>
		</c:if>
	</div>
</div>


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">탈퇴하기</h4>
        </div>
        <div class="modal-body" style="text-align: center;"> 
          	<h5>탈퇴사유를 선택해주세요.</h5>
          	<select class="sel">
          		<option disabled selected hidden>선택하기</option>
          		<option>구직/이직할 생각이 없음</option>
          		<option>개인정보 유출 우려</option>
          		<option>원티드를 통해 구직완료</option>
          		<option>홍보성 메일/메세지</option>
          		<option>타 서비스를 통해 구직완료</option>
          		<option>채용 공고 부족</option>
          	</select>
          	<br>
          	<button class="final_leave_btn" onclick="location.href='deleteuser'">완료</button>
          <br>
        </div>
      </div>
    </div>
  </div>
</body>
</html>