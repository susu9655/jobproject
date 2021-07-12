<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.position{
	width: 900px;
	height: 600px;
	margin-bottom: 20px;
	margin-left: 50px;
	background-image: url("../image/position.png");
	background-size: 900px 600px;
}

 div.totaljob{
 	position:absolute;
 	border-radius:10px;
 	font-size: 1.5em;
 	padding: 10px 10px;
 	top:500px;
 	left: 700px;
 
 }
 
 div.totaljob a{
 	text-decoration: none;
 	color: gray;
 	cursor: pointer;
 	font-size: 2em;
 	
 }
 
 div.totaljob a:hover {
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
<h2>추천 공고</h2>
<h5 class="alert alert-default">
	안녕하세요, 전문분야를 기반으로 포지션을 추천드립니다. 로그인 후 다양한 포지션을 받아보세요.
</h5><br>
<div class="position">
	<div class="totaljob">
		<a data-toggle="collapse" data-target="#demo" >포지션을 추천 받으시겠어요?</a><br>
  			<div id="demo" class="collapse">
  				<div class="statement">
					<button type="button" class="btn btn-default btn-lg"
						style="margin-left: 135px; margin-top: 10px;"
						onclick="location.href='login'"
							>로그인 / 회원가입하기 ></button>
 	 			</div>
			</div>
	</div>
</div>

</body>
</html>