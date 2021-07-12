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
</style>
<script type="text/javascript">
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}
</script>
<body>
<c:set var="user_id"><sec:authentication property="principal.user.id"/></c:set>
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
	<c:if test="${type != 'no' }">
		<div class="profile_resume">
			<div class="resume_title">
				<h4>기본 이력서</h4>
			</div>
				<br>
				<h5 style="color: #ccc;">기본 이력서 선택</h5>
				<select class="sel" onchange="selresume(this.value)"  >
					<c:forEach var="rdto" items="${list }" varStatus="n">
						<c:if test="${rdto.num_r==num_r }">
							<option value="${rdto.num_r }" selected>이력서(${n.count })</option>
						</c:if>
						<c:if test="${rdto.num_r!=num_r }">
							<option value="${rdto.num_r }">${n.count }번 이력서</option>
						</c:if>
					</c:forEach>
				</select>
				<br>
				<h5 style="color: #ccc;">학교 
				<span class="glyphicon glyphicon-pencil" style="float: right;margin-right: 30px;" onclick="location.href='updateresumeForm?num_r=${num_r}'"></span>
				</h5>
				<c:if test="${edto.school=='' }">
					<span style="color: red;">학교 미입력</span>
				</c:if>
				<c:if test="${edto.school!='' }">
					<span>${edto.school }</span> | <span style="color: #ccc;">${edto.major }</span>
				</c:if>
				
				<h5 style="color: #ccc;">직장</h5>
				<c:if test="${cdto.company=='' }">
					<span style="color: red;">직장 미입력</span>
				</c:if>
				<c:if test="${cdto.company!='' }">
					<span>${cdto.company }</span> | <span style="color: #ccc;">${cdto.department}</span>
				</c:if>
				<br><br>
				<textarea class="textarea">${rdto.intro }</textarea>
		</div>
		<div class="profile_jobGroup">
			<div class="jobGroup_title">
				<h4>전문분야 설정</h4>
			</div>
				<br>
				<h5 style="color: #ccc;">직군
					<span class="glyphicon glyphicon-pencil" style="float: right;margin-right: 30px;" onclick="location.href='jobGroup'"></span>
				</h5>
				<c:if test="${gdto.job_group==null }">
				<h5 style="color: red;">선택한 직군이 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.job_group!=null }">
				<h5>${gdto.job_group }</h5>
				</c:if>
				<br>
				<h5 style="color: #ccc;">직무</h5>
				<c:if test="${gdto.job==null }">
				<h5 style="color: red;">선택한 직무가 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.job!=null }">
				<h5>${gdto.job }</h5>
				</c:if>
				<br>
				<h5 style="color: #ccc;">경력</h5>
				<c:if test="${gdto.career==null }">
				<h5 style="color: red;">선택한 경력 정보가 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.career==0 }">
				<h5>신입</h5>
				</c:if>
				<c:if test="${gdto.career==10 }">
				<h5>${gdto.career }년 이상</h5>
				</c:if>
				<c:if test="${gdto.career>0 && gdto.career<10 }">
				<h5>${gdto.career }년</h5>
				</c:if>
		</div>
	</c:if>
	<c:if test="${type == 'no' }">
	<div class="profile_jobGroup">
			<div class="jobGroup_title">
				<h4>전문분야 설정</h4>
			</div>
				<br>
				<h5 style="color: #ccc;">직군
					<span class="glyphicon glyphicon-pencil" style="float: right;margin-right: 30px;" onclick="location.href='jobGroup'"></span>
				</h5>
				<c:if test="${gdto.job_group==null }">
				<h5 style="color: red;">선택한 직군이 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.job_group!=null }">
				<h5>${gdto.job_group }</h5>
				</c:if>
				<br>
				<h5 style="color: #ccc;">직무</h5>
				<c:if test="${gdto.job==null }">
				<h5 style="color: red;">선택한 직무가 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.job!=null }">
				<h5>${gdto.job }</h5>
				</c:if>
				<br>
				<h5 style="color: #ccc;">경력</h5>
				<c:if test="${gdto.career==null }">
				<h5 style="color: red;">선택한 경력 정보가 없습니다.</h5>
				</c:if>
				<c:if test="${gdto.career==0 }">
				<h5>신입</h5>
				</c:if>
				<c:if test="${gdto.career==10 }">
				<h5>${gdto.career }년 이상</h5>
				</c:if>
				<c:if test="${gdto.career>0 && gdto.career<10 }">
				<h5>${gdto.career }년</h5>
				</c:if>
		</div>
		<div class="profile_noresume">
				<h4>작성된 이력서가 없습니다.</h4>
				<a href="addresume" class="addresume_link">나의 첫 이력서 작성하러 가기></a>
		</div>
	</c:if>
</div>
</body>
</html>