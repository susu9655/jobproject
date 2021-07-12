<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/loginForm.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="main-container">
	<div class="main-wrap">
		<div class="logo-wrap">
			<img src="image/loggo.png">
		</div>
		<section class="intro-ment-section-wrap">
			<h3><b>직장인을 위한 커리어 플랫폼, +JOB!</b></h3>
			<h4>커리어 성장과 행복을 위한 여정
			<br>	
			지금 +JOB에서 시작하세요.</h4>
		</section>
		<br/>
		<section class="login-input-section-wrap">
		<form action="/login" method="post">
			<div class="login-input-wrap">	
				<input type="text" name="username" placeholder="Username"/> 
			</div>
			<div class="login-input-wrap email-wrap">	
				<input type="email" name="email" placeholder="Email"/> 
			</div>
			<div class="login-input-wrap password-wrap">
				<input type="password" name="password" placeholder="Password"/> 
			</div>
			<br>
			<div class="login-button-wrap">
			<button type="submit" class="btn btn-primary" style="width: 465px; height:40px; font-weight: bold;">이메일로 시작하기</button>
			<br/><br/>
			<!-- 구글로그인 경로는 마음대로 바꿀수있는 주소가 아님! -->
			<button type="button" class="btn btn-default" style="width: 465px; height:40px; font-weight: bold;" 
			onclick="location.href='/oauth2/authorization/google'">구글로 시작하기</button>
			</div>
		</form>
		<br/><br/>
		<a href="/joinForm" style="font-size: 11pt;"><b>회원가입을 아직 하지 않으셨나요?</b></a>
		</section>
		<footer>
			<div class="copyright-wrap">
				<p class="term-of-service">
				<span><b>걱정마세요! 여러분의 지원활동은 SNS에 노출되지 않습니다.</b></span>
				<br>
				<span><b>회원가입 시 <a class="login-anchor" href="https://help.wanted.co.kr/hc/ko/articles/360035484292">개인정보 처리방침</a>과
				<a class="login-anchor" href="https://help.wanted.co.kr/hc/ko/articles/360035844551">이용약관</a>을 확인하였으며, 동의합니다.</b></span>
				</p>
				<br>
				<span>Copyright © +JOB Corp. All Rights Reserved.</span>
			</div>
		</footer>
	</div>
</div>
</body>
</html>