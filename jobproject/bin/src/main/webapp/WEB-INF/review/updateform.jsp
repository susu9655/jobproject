<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

	div.menu{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}
	button.menu:hover{
		background-color:  #021B80;
		color: white;
	}
	
	div.myreview{
		margin-left: 10px;
	}
	
	div.infomation{
		background-color: #eee;
		padding: 20px 20px 20px 20px;
	}
	
	div.statement{
		font-size: 1.4em;
		margin-top: 100px;
	}
	
	span.star{
		font-size: 1.4em;
		color: gray;
	}
	
	div.mylist{
		margin-bottom: 50px;
	}
	
	table.reviewtable{
		cursor: pointer;
	}
	
	table.reviewtable:hover{
		background-color: #eee;
	}
	
	div.menu button.menu{
		border-radius: 20px;
		width: 150px;
	}
	
	#alert:hover {
	background-color:  #021B80;
	color: white;
	}
	
	button.update:hover{
	background-color:  #021B80;
	color: white;	
	} 
	
	button.delete:hover {
	background-color:  #021B80;
	color: white;
	}
	
</style>
</head>
<body>
	<!-- 로그인 username -->
	<c:set var="email" value="${auth }"/>
	<div class="menu">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='review'">기업리뷰</button>
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='addreview'">my리뷰</button>
	</div>
	<div class="myreview">
		<h2>MY 기업리뷰 수정</h2>
		<br>
		<!-- 작성리뷰 출력 -->
		<div class="mylist">
		<c:forEach var="data" items="${updatedata }" varStatus="n">
			<table class="reviewtable table table" style="font-size: 1.3em;">
			<form action="updateOfReview" method="post">
			<input type="hidden" name="num" value="${data.num }">
    	<table class="formtable table" style=" width: 700px; margin-left: 100px; border: 1px solid #ccc;">    		
    		<tr>
    			<th>
    				<h5>기업명</h5>
    			</th>
    			<td>
    				<h5>${data.empname }</h5>
    				
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>현 직장/전 직장</h5>
    			</th>
    			<td>
    				<h5>${data.prenow }</h5>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>직종</h5>
    			</th>
    			<td>
    				<h5>${data.job_group }</h5>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>기업의 장점</h5>
    			</th>
    			<td>
    				<textarea name="good" style="width: 500px; height: 70px;" required="required" class="form-control">${data.good }</textarea>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<H5>기업의 단점</H5>
    			</th>
    			<td>
    				<textarea name="bad" style="width: 500px; height: 70px;" required="required" class="form-control">${data.bad }</textarea>
    			</td>
    		</tr>
 
    		<tr>
    			<th >
    				<H5>기업 총 평가 *</H5>
    			</th>
				<td>
					<label class="radio-inline" >
      				<input type="radio" name="rating" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="rating" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline"> 
      				<input type="radio" name="rating" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="rating" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="rating"  value="5"> 5
    				</label>  
				</td>
			</tr>
    		<tr>
    			<th>
    				<H5>사내문화</H5>
    			</th>
    			<td>
					<label class="radio-inline" >
      				<input type="radio" name="cul" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="cul" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>자기개발</h5>
    			</th>
    			<td>
					<label class="radio-inline" > 
      				<input type="radio" name="imp" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="imp" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp"  value="5"> 5
    				</label>   				
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<H5>근무환경</H5>
    			</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="env" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env" value="3" > 3 
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="env" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th><h5>급여 및 복지</h5></th>
    			<td>
					<label class="radio-inline" >
      				<input type="radio" name="sal" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="sal" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th><h5>경영진</h5></th>
    			<td>
					<label class="radio-inline" >
      				<input type="radio" name="ceo" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="ceo" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="5"> 5
    				</label> 				
    			</td>    			
    		</tr>
    	</table>
    	<br>
    	<button type="submit" class="btnsubmit btn btn-default" style="margin-left: 400px;">수정하기</button>
    	<br><br><br>
	</table>
	</c:forEach>
	</div>
</div>
</body>