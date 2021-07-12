<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<style type="text/css">
	b.status{
		color:#021B80;
		font-size: 10pt;
	}
</style>
</head>
<body>
<div class="logo" onclick="location.href='/'">
	<img src="/image/loggo.png">
</div>
<div id="nav" class="container-fluid">
			<nav class="navbar navbar-default">
				<ul class="navcategory">
					<li id="gg"><a href="pjlist">채용공고</a>
					</li>
					<li id="ch"><a href="recommend">추천공고</a>
					</li>
					<li id="gc"><a >기업정보</a>
						<div>
							<ul class="info">
								<li><a href="review">기업 리뷰</a></li>
								<li><a href="salary">직군별 연봉</a></li>
								<li><a href="news">최신뉴스</a></li>
							</ul>
						</div></li>
					<c:if test="${auth!=null or sessionScope.loginok!=null}">
					<li id="gs"><a>Mypage</a>
						<div>			
							<ul class="Mypage">
								<c:if test="${auth!=null and sessionScope.loginok==null}">
								<li><a href="myjob">My +JOB</a></li>
								<li><a href="profile">프로필</a></li>
								<li><a href="apply">지원 현황</a></li>
								<li><a href="bookmark">북마크</a></li>
								<li><a href="resumelist">이력서</a></li>
							</c:if>
							<c:if test="${sessionScope.loginok!=null}">
								<li><a href="empMyPage">My Company</a></li>
								<li><a href="writegonggo">공고작성</a></li>
								<li><a href="gonggolist">공고목록</a></li>
								<li><a href="orderComplete">결제내역</a></li>
							</c:if>
							</ul>
						</div></li>
					</c:if>
					<li id="gs"><a>고객센터</a>
						<div>
							<ul class="Support">
							<li><a href="Faq">자주하는 질문</a></li>
								<li><a href="notice">공지사항</a></li>
							</ul>
						</div></li>
					<li id="log">
						<li>
						<div>
							<c:if test="${auth==null and sessionScope.loginok==null}">
							<a onclick="location.href='/login'">회원가입/로그인</a>
							</c:if>
							<c:if test="${auth!=null }">
							<b class="status">${auth}님</b>
							<c:set var="root" value="<%=request.getContextPath() %>"/>
							<button type="button" class="btn btn-default" style="height: 30px;"
							onclick="location.href='/logout'">Logout</button>
							</c:if>
						</div>
						</li>
					<li id=emploginfo>
	 					<li>
	 						<span style="margin-left: 20px;">
	 						<c:if test="${sessionScope.loginok==null}">
	 						<button type="button" class="btn btn-default"
	 						onclick="location.href='/empLogin'">기업서비스</button>
	 						</c:if>
	 						<c:if test="${sessionScope.loginok!=null}">
							<b class="status">${sessionScope.myemail}님</b>
							<c:set var="root" value="<%=request.getContextPath() %>"/>
							<button type="button" class="btn btn-default" style="height: 30px;"
							onclick="location.href='/emplogout'">Logout</button>
	 						</c:if>
	 						</span>
	 					</li>
 					</li>
				</ul>
			</nav>
		</div>
</body>
</html>