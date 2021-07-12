<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	div.myjob_apply{
		border: 1px solid #ccc;
		width: 600px;
		height: 130px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
	}
	
	div.myjob_bookmarks{
		border: 1px solid #ccc;
		width: 600px;
		margin-top: 10px;
		height: 260px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
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
	header.bookmark_bookmarkul_header{
		width: 100px;
		height: 100px;
		min-width: 100px;
		min-height: 100px;
		margin-right: 15px;
		max-height: 100px;
		max-width: 100px;
		background-size: 100px 100px;
	}
	h5.myjob_bookmark_gobk:hover {
		color:  #258bf7;
	}
	span.apply_status:hover{
		color: #0A31A6;
	}
	div.myjob_apply_div div{
		float: left;
		margin-left: 110px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}
</script>
<body>
<div class="profile_entire">
	<div class="profile_title">
		<h4>MY JOB</h4>
	</div>
	<div class="profile_personW">
		<div class="profile_img">
			<img alt="없음" src="image/profile.png">
			<br><br>
			<h4><sec:authentication property="principal.username"/></h4>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.email"/></h5>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.hp"/></h5>
			<br>
			<button type="button" class="profile_update" onclick="location.href='acntMngmn?type=changePassword'">계정 설정</button>
		</div>
	</div>
	<div class="myjob_apply">
		<div class="myjob_title">
			<h4>지원 현황</h4>
		</div>
		<div class="myjob_apply_div">
			<div>
				<span style="font-size: 2em;cursor: pointer;" onclick="location.href='apply'" class="apply_status">${apply_cnt }</span>
				<h5>지원 완료</h5>
			</div>
			<div>
				<span style="font-size: 2em;cursor: pointer;" class="apply_status">0</span>
				<h5>합격</h5>
			</div>
			<div>
				<span style="font-size: 2em;cursor: pointer;" class="apply_status" onclick="location.href='apply?state=fail'">${failCnt }</span>
				<h5>불합격</h5>
			</div>
		</div>
	</div>
	<div class="myjob_bookmarks">
		<div class="bookmarks_title" style="float: left;">
			<h4>북마크</h4>
		</div>
		<div style="text-align: right;margin-right: 10px;color: #021B80;cursor: pointer;">
			<h5 onclick="location.href='bookmark'" class="myjob_bookmark_gobk">총 ${bookmark_cnt }개 전체보기></h5>
		</div>
		<br>
		<div style="margin: auto;">
			<ul class="bookmark_ul">
				<c:forEach var="cdto" items="${cdto }" varStatus="n">
					<c:if test="${n.index<4 }">
						<li>
							<a href="gonggodetail?num=${cdto.num }">
								<div style="float: left;">
									<header class="bookmark_bookmarkul_header" style="background-image: url('gonggophoto/${cdto.empimg}');"></header>
									<div>
										<h5 style="color: black;">${cdto.jobgroup }</h5>
										<h6 style="color: gray;">${cdto.empname }</h6>
									</div>
								</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</body>
</html>