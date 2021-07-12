<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<style>
	div.profile_title{
		border: 0px solid gray;
		width: 100px;
		height: 50px;
		margin-bottom: 20px;
	}
	div.profile_personW{
		border: 1px solid #ccc;
		width: 200px;
		height: 400px;
		float: left;
		border-radius: 5px;
		
	}
	div.profile_resume{
		border: 1px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
	}
	
	div.profile_jobGroup{
		border: 1px solid #ccc;
		width: 600px;
		height: 300px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		margin-top: 10px;
	}
	
	div.jobGroup_main{
		border: 1px solid #ccc;
		width: 600px;
		margin-top: 10px;
		height: auto;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		min-height: 300px;
	}
	
	div.profile_noresume{
		border: 0px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		text-align: center;
		margin-top: 100px;
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
	
	a.addresume_link:hover{
		text-decoration: none;
	}
	input.jobGroup{
		margin-bottom: 10px;
		height: 30px;
		width: 200px;
		border: 1px solid #D9D3D2;
	}
	input.jobGroup:focus {
		outline: none;
		border: 1px solid gray;
	}
	select.jobGroup{
		margin-bottom: 10px;
		height: 30px;
		width: 200px;
		border: 1px solid #D9D3D2;
	}
	select.jobGroup:focus {
		outline: none;
		border: 1px solid gray;
	}
	input.jobGroup_selbtn{
		border: 1px solid #ccc;
		width: auto;
		height: 30px;
		color: gray;
		padding-left:5px;
		padding-right:5px;
		margin-right: 5px;
		margin-left: 5px;
		cursor: pointer;
		margin-bottom: 10px;
		text-align: center;
	}
	input.jobGroup_selbtn:focus {
		outline: none;	
	}
	button.jobGroup_addbtn{
		background-color: #021B80;
	    color: white;
	    border-radius: 5px;
	    width: 120px;
	    height: 40px;
	    line-height: 30px;
	    border: 0px solid black;
	    
	}
	div.jobGroup_btndiv{
		text-align: right;
		margin-right: 60px;
	}
	#jobGroup_job_addbtn{
		width: 50px;
	    height: 30px;
	    border-radius: 3px;
	    background-color: #258bf7;
	    color: #fff;
	    border: none;
	}	 
	#jobGroup_job_addbtn:focus {
		border: none;
	}
	.selectJob{
		border: 2px solid #258bf7;
	}
	
</style>
<script type="text/javascript">
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}
	//직군선택에 따른 직무 나타내기
	function selectJob(val){
		location.href="jobGroup?match="+val;
	}
	
window.onload=function(){
	//직무를 선택했을 때 클릭 효과 주기
	var list=document.querySelectorAll("#jobGroup_selbtn");
	for(var i=0;list.length;i++){
		list[i].onclick=function(){
			if(this.getAttribute("name")!="job"){
				this.setAttribute("name","job");
				this.style.border="2px solid #258bf7";
			}else{
				this.setAttribute("name","");
				this.style.border="1px solid #ccc";
			}
		}
	}
		
	
	
	
}
</script>
<body>
<form action="insertJobGroup" method="post">
<c:set var="user_id"><sec:authentication property="principal.user.id"/></c:set>
<input value="${user_id }" name="id" type="hidden">
<div class="profile_entire">
	<div class="profile_title">
		<h4>프로필</h4>
	</div>
	<div class="profile_personW">
		<div class="profile_img">
			<img alt="없음" src="image/profile.png">
			<br><br>
			<h4><sec:authentication property="principal.username"/></h4>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.email"/></h5>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.hp"/></h5>
			<br>
			<button type="button" class="profile_update" onclick="location.href='personUpdateForm'" style="color: #021B80;">기본정보 수정</button>
		</div>
	</div>
	<div class="jobGroup_main">
		<div class="bookmarks_title" style="float: left;">
			<h4>전문분야 설정</h4>
		</div>
		<br><br>
		<div>
			<table>
				<tr>
					<td style="max-width: 50px;width: 50px;">직군</td>
					<td>
						<select class="jobGroup" name="job_group" onchange="selectJob(this.value)" id="selectJobGroup">
							<c:forEach var="JobG" items="${jobGroup }">
								<c:if test="${JobG == match }">
									<option value="${JobG}" selected>${JobG }</option>
								</c:if>
								<c:if test="${JobG != match }">
									<option value="${JobG}">${JobG }</option>
								</c:if>
							</c:forEach>
						</select>
						
								
						
					</td>
				</tr>
				<tr>
					<td colspan="2">직무</td>
				</tr>
				<tr>
				<td></td>
					<td>
						<div id="jobGroup_option">
							<c:forEach var="selJob" items="${selectJob }">
								<input class="jobGroup_selbtn" id="jobGroup_selbtn" value="${selJob }" readonly>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td>경력</td>
					<td>
						<select class="jobGroup" name="career">
							<option hidden disabled>선택하기</option>
							<option value="0">신입</option>
							<option value="1">1 년</option>
							<option value="2">2 년</option>
							<option value="3">3 년</option>
							<option value="4">4 년</option>
							<option value="5">5 년</option>
							<option value="6">6 년</option>
							<option value="7">7 년</option>
							<option value="8">8 년</option>
							<option value="9">9 년</option>
							<option value="10">10 년 이상</option>
						</select>
					</td>
				</tr>
			</table>
			<div class="jobGroup_btndiv">
				<button type="submit" class="jobGroup_addbtn">확인</button>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>