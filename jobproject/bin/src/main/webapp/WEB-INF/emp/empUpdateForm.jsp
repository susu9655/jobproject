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

<form action="/empupdate" method="post" class="form-inline">
	<div class="main-container">
		<input type="hidden" name="num" value="${dto.num}">
		<section class="intro-ment1-section-wrap">
			<h3><b>관리자 계정 수정하기</b></h3>
		</section>
		<br/>
			담당자성함*<br/>
			<input type="text" name="managername" value="${dto.managername}" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			직책(or팀)*<br/>
			<input type="text" name="team" value="${dto.team}" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			연락처*<br/>
			<input type="text" name="hp" value="${dto.hp}" required="required" style="width: 500px; height: 40px;"/>
			<br/><br/>
			회사이메일*<br/>
			<input type="email" name="email" value="${dto.email}"  readonly="readonly" style="width: 500px; height: 40px;"/> 
			<br/><br/>
			비밀번호*<br/>
			<input type="password" name="password" value="${dto.password}" required="required" style="width: 500px; height: 40px;"/> 
			<br/><br/>
		<hr>
		
		<section class="intro-ment2-section-wrap">
			<h3 color="#333333" class="intro-ment">회사 정보를 수정해주세요</h3>
		</section>
		<br/><br/>
	
		<section class="join-input-section-wrap">
				<div class="join-input-wrap empname-wrap">	
					회사이름*<br/>
						<input type="text" name="empname" value="${dto.empname}" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="cate_job">
					<div class="join-input-wrap country-wrap" style="float : left;">
						국가/지역*<br/>
						<select name="country" id="country" class="form-inline" style="width: 400px; height: 40px;"
							onchange="selectContry(this)">
							<option disabled="disabled">${dto.country}</option>
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
						<option>${dto.area}</option>
						</select>
					</div>
				</div>
				<br/>
				<div class="join-input-wrap addr-wrap">	
					대표 주소*<br/>
						<input type="text" name="addr" value="${dto.addr}" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="join-input-wrap empserial-wrap">	
					사업자등록번호*<br/>
						<input type="text" name="empserial" value="${dto.empserial}"  required="required" style="width: 820px; height: 40px;"/>
				</div> 
				<br/>
				<div class="join-input-wrap biztype-wrap" style="float: left;">
					산업군*<br/>
					<select name="biztype" id="biztype" class="form-inline" style="width: 400px; height: 40px;">
						<option value="${dto.biztype}">${dto.biztype}</option>
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
						<option value="${dto.staffnum}">${dto.staffnum}명</option>
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
					<input type="text" name="establishyear" value="${dto.establishyear}" required="required" style="width: 820px; height: 40px;"/>
				</div> 
				
				<br/><br/>
				<div class="w3-container w3-cardd-4">
				  <button type="submit" class="btn btn-default" style="width: 150px; float: right;">수정하기</button>
				</div>
				<br/>
				<hr>
				<a href="/empLogin">이미 가입되어 있으신가요? 로그인하기</a>
				<br/><br/>
		</section>
				  		
	</div>
</form>

<script type="text/javascript">


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