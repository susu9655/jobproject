<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	body{
		background-repeat: no-repeat;
		background-size: cover;
		background-image:linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('image/company.png');
		width: auto;
		height: 855px;
		margin: auto;
		padding-bottom: 120px;
		padding-top: 5px;
	}
	button.change_btn{
		background-color: #021B80;
		color: white;
		border-radius: 40px;
		width: 120px;
		height: 30px;
		line-height: 30px;
		border: 0px solid black;
		margin-top: 10px;
	}
	div.change_pw{
		width: 230px;
		height: 200px;
		border: 1px solid #ddd;
		text-align: center;
		background-color: white;
		border-radius: 5px;
		opacity: 0.8;
		margin: auto;
		margin-top: 15%;
		}
	
	input.pw_input{
		margin-bottom: 10px;
		height: 30px;
		width: 200px;
		border: 1px solid #D9D3D2;
	}
	
	input.pw_input:focus {
		outline: none;
		border: 1px solid gray;
    }
</style>
<script type="text/javascript">
window.onload=function(){
	//비밀번호 변경 버튼을 눌렀을 때 이벤트
	document.getElementById("change_btn").onclick=function(e){
		var pw = document.getElementById("pw").value;
		var pw_ch = document.getElementById("pw_ch").value;
		
		if(pw != pw_ch){
			alert("비밀번호가 일치하지 않습니다.");
			e.preventDefault();
		}else{
			alert("비밀번호가 변경되었습니다.");
		}
	}
}
</script>
</head>
<body>
<div class="change_pass_entire">
<form action="changePwAct" method="post">
<div class="change_pw">
	<h4>비밀번호 재설정</h4>
	<hr>
	<input type="password" placeholder="6자리 이상 비밀번호" id="pw" class="pw_input" name="pass"><br>
	<input type="password" placeholder="비밀번호 재입력" id="pw_ch" class="pw_input"><br>
	<button type="submit" class="change_btn" id="change_btn" >완료</button>
</div>
</form>
</div>
</body>
</html>