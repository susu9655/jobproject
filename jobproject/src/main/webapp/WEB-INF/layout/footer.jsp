<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<style type="text/css">
#footer{
   border-top:1px solid #F0F0F0;
   display: flex;
}

.footerlist>li {
    list-style: none;
    float: left;
    margin-right: 20px;
}

ul.footerlist {
    padding-left: 0px;
}
a:hover{
	cursor:pointer;
	color: #021B80;
    text-decoration: none;
}
a{
	color:gray;
}

ul.footerlist>li>a.link
	margin-top: 30px;

}

.foo_div1{
	flex-direction: column;
	width: 80%;
}

.foo_div2{
	flex-direction: column;
}
</style>
</head>
<body>

<div id="footer" style="opacity: 2;">

	<div class="logo">
	<img src="../img/logo_letter.png" style="width: 130px; margin-top: 10px;" >
	
	</div>

	<div class=foo_div1 style=" margin-top: 30px; font-size: 14pt;">
		<ul class="footerlist">
			<li><a class="link" href="" target="_blank">기업소개</a></li>
			<li><a class="link" href="/noticecontent?num_n=102&key=list">이용약관</a></li>
			<li><a class="link" href="/noticecontent?num_n=101&key=list">개인정보처리방침</a></li>
			<li><a class="link" onclick="location.href='Faq'">고객센터</a></li>
		</ul>
	</div>

	<div class=link_sns style="margin-top: 25px; margin-left: 80px;">
	<a href="" class="link_sns" target="_blank">
	<img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt=" 인스타그램 바로가기" style="width: 30px;"></a>
	<a href="" class="link_sns" target="_blank">
	<img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt=" 페이스북 바로가기" style="width: 30px"></a>
	<a href="" class="link_sns" target="_blank">
	<img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt=" 네이버블로그 바로가기" style="width: 30px"></a>
	<a href="" class="link_sns lst" target="_blank">
	<img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="네이버포스트 바로가기"  style="width: 30px"></a>
	<a href="" class="link_sns" target="_blank">
	<img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="유튜브 바로가기" style="width: 30px"></a>
	</div>

</div>	
<br/>
	<div class="foo_div2">
		<p>(주)플러스잡 (대표이사:다대표) | 서울특별시 송파구 올림픽로 300 롯데월드타워 35층 | 통신판매번호 : 2020-서울송파-3147
		<br/>
		유료직업소개사업등록번호 : (국내) 제2020-3230259-14-5-00018호 | (국외) 서울동부-유-2020-2 | 사업자등록번호 : 299-86-00021 | 02-539-7118
		<br/>
		© +JOB Corp.
		</p>
	</div>

</body>
</html>