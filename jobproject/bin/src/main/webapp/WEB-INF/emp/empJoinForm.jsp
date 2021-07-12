<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<form action="/insertemp" method="post" class="form-inline">
	<div class="main-container">
		<section class="intro-ment1-section-wrap">
			<h3><b>관리자 계정 만들기</b></h3>
		</section>
		<br/>
			담당자성함*<br/>
			<input type="text" name="managername" placeholder="담당자성함" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			직책(or팀)*<br/>
			<input type="text" name="team" placeholder="직책 또는 팀명을 입력해주세요" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			연락처*<br/>
			<input type="text" name="hp" placeholder="예시)01020203030" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			회사이메일*<br/>
			<input type="email" class="email" name="email" placeholder="회사이메일(로그인 아이디로 사용됩니다)" required="required" style="width: 500px; height: 40px;"/> 
			<button type="button" class="btn btn-default" id="btncheck" style="height: 35px;">중복체크</button> 
			<br/><br/>
			비밀번호*<br/>
			<input type="password" name="password" placeholder="6자리 이상 비밀번호" required="required" style="width: 500px; height: 40px;"/> 
			<br/><br/>
		<hr>
		
		<section class="intro-ment2-section-wrap">
			<h3 color="#333333" class="intro-ment">회사 정보를 등록해주세요</h3>
			<h5 color="#757575" class="intro-ment">+JOB은 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 
			다음 정보를 리뷰하여 회사등록을 승인하고 있습니다.</h5>
		</section>
		<br/><br/>
	
		<section class="join-input-section-wrap">
				<div class="join-input-wrap empname-wrap">	
					회사이름*<br/>
						<input type="text" name="empname" placeholder="회사명" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="cate_job">
					<div class="join-input-wrap country-wrap" style="float : left;">
						국가/지역*<br/>
						<select name="country" id="country" class="form-inline" style="width: 400px; height: 40px;"
							onchange="selectContry(this)">
							<option value="국가" disabled>국가</option>
							<option value="한국">한국</option>
							<option value="대만">대만</option>
							<option value="싱가폴">싱가폴</option>
							<option value="일본">일본</option>
							<option value="기타">기타</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="join-input-wrap area-wrap">
					<br/>
						<select name="area" id="area" class="form-inline" style="width: 400px; height: 40px;">
							<option>지역</option>
						</select>
					</div>
				</div>
				<br/>
				<div class="join-input-wrap addr-wrap">	
					대표 주소*<br/>
						<input type="text" name="addr" placeholder="대표 주소" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="join-input-wrap empserial-wrap">	
					사업자등록번호*<br/>
						<input type="text" name="empserial" placeholder="사업자등록번호" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="join-input-wrap biztype-wrap" style="float: left;">
					산업군*<br/>
					<select name="biztype" id="biztype" class="form-inline" style="width: 400px; height: 40px;">
						<option value="산업군" disabled>산업군</option>
						<option value="IT,컨텐츠">IT,컨텐츠</option>
						<option value="판매, 유통">판매, 유통</option>
						<option value="제조">제조</option>
						<option value="교육">교육</option>
						<option value="금융">금융</option>
						<option value="전문, 과학기술">전문, 과학기술</option>
						<option value="예술, 스포츠, 여가">예술, 스포츠, 여가</option>
						<option value="사업지원">사업지원</option>
						<option value="물류,운송">물류,운송</option>
						<option value="부동산">부동산</option>
						<option value="건설">건설</option>
						<option value="보건, 사회복지">보건, 사회복지</option>
						<option value="숙박, 음식점">숙박, 음식점</option>
						<option value="광업">광업</option>
						<option value="상수도,환경">상수도,환경</option>
						<option value="공공행정, 국방">공공행정, 국방</option>
						<option value="전기, 가스">전기, 가스</option>
						<option value="농림,어업">농림,어업</option>
						<option value="가사, 가정">가사, 가정</option>
						<option value="국제,외국기관">국제,외국기관</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				
				<div class="join-input-wrap staffnum-wrap">	
					직원수*<small> (승인기준 : 팀원 10명 이상)</small><br/>
					<select name="staffnum" id="staffnum" class="form-inline" style="width: 400px; height: 40px;">
						<option value="회사규모" disabled>회사규모</option>
						<option value="1~4">1~4명</option>
						<option value="5~10">5~10명</option>
						<option value="11~50">11~50명</option>
						<option value="51~200">51~200명</option>
						<option value="201~500">201~500명</option>
						<option value="501~1000">501~1000명</option>
						<option value="1001~5000">1001~5000명</option>
						<option value="5001~10000">5001~10000명</option>
						<option value="10001~">10001명 이상</option>
					</select>
				</div>
				<br/>
				<div class="join-input-wrap establishyear-wrap">	
					설립연도*<br/>
					<input type="text" name="establishyear" placeholder="ex)2012년" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				
				<br/><br/>
				<div class="w3-container w3-cardd-4">
				  <p>
				  <input class="w3-check" type="checkbox" checked="checked">
					<b>이용약관 및 원티드 기업회원 가입에 동의합니다.</b>
				  </p>
				  <button type="submit" class="btn btn-default" style="width: 150px; float: right;">제출하기</button>
				</div>
				<br/>
				<hr>
				<a href="/empLogin">이미 가입되어 있으신가요? 로그인하기</a>
				<br/><br/>
		</section>
				  		
	</div>
</form>

<script type="text/javascript">

$(function(){
	$("#btncheck").click(function(){
		//email 읽기
		var email=$(".email").val();
		alert( email );
		
		$.ajax({
			type:"get",
			url:"emailcheck",
			dataType:"json",
			data:{"email":email},
			success:function(data){
				if(data.count==1){
					alert("이미 가입된 이메일입니다\n다시 입력해주세요");
					$("#email").val("");
					$("#email").focus();
				}else{
					alert("가입이 가능한 이메일입니다");
				}
					
			}
		})
	});
});



//국가 onchange 이벤트
function selectContry(e) {
    var kr = ["서울", "부산", "대구", "인천","광주", "대전", "울산", "경기","강원", "부산", "충북", "충남","전북", "전남", "경북", "경남","제주"];
    var tw = ["Taipei City", "New Taipei City", "Taoyuan City", "Taichung City", "Tainan City", "Kaohsiung City"];
    var sg = ["All"];
    var jp = ["Tokyo", "Kanagawa", "Chiba", "Aichi","Osaka","Hyogo","Kyoto","Okinawa","Etc"];
    var others = ["All"];
    var target = document.getElementById("area");

    if(e.value == "한국") var d = kr;
    else if(e.value == "대만") var d = tw;
    else if(e.value == "싱가폴") var d = sg;
    else if(e.value == "일본") var d = jp;
    else if(e.value == "기타") var d = others;
    
    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}

</script>

</body>
</html>