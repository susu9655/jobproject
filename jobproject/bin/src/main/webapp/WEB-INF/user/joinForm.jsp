<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/joinForm.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<div class="main-container">
		<section class="intro-ment-section-wrap">
			<h3>회원가입</h3>
		</section>
		<br/><br/>
		<section class="login-input-section-wrap">
			<form action="/join" method="POST">
				이름<br/>
				<div class="login-input-wrap username-wrap">	
					<input type="text" name="username" placeholder="이름을 입력해주세요"/> 
				</div>
				휴대폰 번호<br/>
				<div class="login-input-wrap hp-wrap">
					<input type="text" name="hp" placeholder="예시)010234567890"/>
				</div>
				이메일<br/>
				<div class="login-input-wrap email-wrap">
					<input type="email" name="email" placeholder="Email"/> 
				</div>
				비밀번호<br/>
				<div class="login-input-wrap password-wrap">
					<input type="password" name="password" placeholder="비밀번호를 6자 이상 입력해주세요"/> 
				</div>
				<br>
				<div class="login-button-wrap">
					<button type="submit" class="btn btn-primary" style="width: 465px; height: 40px;">회원가입</button>
				</div>
			</form>
		</section>
	</div>
</body>

</html>