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
		margin-left: 10px;
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
	

.rating .rate_radio, 
.cul .cul_radio, 
.imp .imp_radio, 
.env .env_radio, 
.sal .sal_radio, 
.ceo .ceo_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label, 
.cul .cul_radio + label, 
.imp .imp_radio + label, 
.env .env_radio + label, 
.sal .sal_radio + label, 
.ceo .ceo_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 45px;
    height: 45px;
    background-image: url('./image/starrate.png');
    background-repeat: no-repeat;
    background-size: 45px 45px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label, 
.cul .cul_radio:checked + label, 
.imp .imp_radio:checked + label, 
.env .env_radio:checked + label, 
.sal .sal_radio:checked + label ,
.ceo .ceo_radio:checked + label 
{
    background-color: #FFEB5A;
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
	
		<!-- 기업 저장 -->
		<c:set var="emp" value="${emp }"></c:set>
		<!-- 작성리뷰 출력 -->
		<div class="mylist">
		
			
    	<form action="add" method="post">
    	<input type="hidden" name="email" value="${email }">
    	  		
    		<h3 style="color: #021B80; margin-top: 100px; margin-bottom: 30px;">${emp } 기업리뷰 작성</h3>    	
    		<tr>
    			<th>
    				    <input type="hidden" name="empname" value="${emp }"
    					style="width: 300px; height: 40px;" required="required" class="form-control">기업명 <b style="font-weight: bold;">${emp }</b>
    			</th>
    		</tr>
    		<tr>
    			<th>
    				<h5>현 직장/전 직장</h5>
    			</th>
    			<td>
    				<select name="prenow" style="width: 300px; height: 40px;" required="required" class="form-control">
    					<option value="전 직장">전 직장</option>
    					<option value="현 직장">현 직장</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>직종</h5>
    			</th>
    			<td>
    				<select name="job_group" style="width: 300px; height: 40px;" required="required" class="form-control">
    					<option value="IT/인터넷">IT/인터넷</option>
    					<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
    					<option value="디자인">디자인</option>
    					<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
    					<option value="생산/제조">생산/제조</option>
    					<option value="유통/무역">유통/무역</option>
    					<option value="서비스/고객지원">서비스/고객지원</option>
    					<option value="인사/총무">인사/총무</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>기업의 장점</h5>
    			</th>
    			<td>
    				<textarea name="good" style="width: 500px; height: 70px;" required="required" class="form-control"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<H5>기업의 단점</H5>
    			</th>
    			<td>
    				<textarea name="bad" style="width: 500px; height: 70px;" required="required" class="form-control"></textarea>
    				
    			</td>
    		</tr>
    		<tr>
    			<th style="border-top: hidden; margin-top: 20px;">
    				<h3 style="color: #021B80; margin-top: 100px; margin-bottom: 30px;">평가하기</h3> 
    			</th>
    		</tr>
 
    		<tr>
    			<th>
    				<H5>기업 총 평가 *</H5>
    			</th>
				<td>
       			 <div class="review_rating">
           			<div class="rating">                	
                		<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio rating" title="1점">
                		<label for="rating1"></label>
                		<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio rating" title="2점">
               			<label for="rating2" ></label>
                		<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio rating" title="3점" >
                		<label for="rating3" ></label>
                		<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio rating"  title="4점">
                		<label for="rating4" ></label>
                		<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio rating" title="5점">
                		<label for="rating5"></label>
            		</div>
       	 		</div>
				</td>
			</tr>
    		<tr>
    			<th>
    				<H5>사내문화</H5>
    			</th>
    			<td>
       			 <div class="review_cul">
           			<div class="cul">
                		<input type="checkbox" name="cul" id="cul1" value="1" class="cul_radio cul" title="1점">
                		<label for="cul1"></label>
                		<input type="checkbox" name="cul" id="cul2" value="2" class="cul_radio cul" title="2점">
               			<label for="cul2" ></label>
                		<input type="checkbox" name="cul" id="cul3" value="3" class="cul_radio cul" title="3점" >
                		<label for="cul3" ></label>
                		<input type="checkbox" name="cul" id="cul4" value="4" class="cul_radio cul"  title="4점">
                		<label for="cul4" ></label>
                		<input type="checkbox" name="cul" id="cul5" value="5" class="cul_radio cul" title="5점">
                		<label for="cul5"></label>
            		</div>
       	 		</div>				
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<h5>자기개발</h5>
    			</th>
    			<td>
       			 <div class="review_imp">
           			<div class="imp">
                		<input type="checkbox" name="imp" id="imp1" value="1" class="imp_radio imp" title="1점">
                		<label for="imp1"></label>
                		<input type="checkbox" name="imp" id="imp2" value="2" class="imp_radio imp" title="2점">
               			<label for="imp2" ></label>
                		<input type="checkbox" name="imp" id="imp3" value="3" class="imp_radio imp" title="3점" >
                		<label for="imp3" ></label>
                		<input type="checkbox" name="imp" id="imp4" value="4" class="imp_radio imp"  title="4점">
                		<label for="imp4" ></label>
                		<input type="checkbox" name="imp" id="imp5" value="5" class="imp_radio imp" title="5점">
                		<label for="imp5"></label>
            		</div>
       	 		</div>	   				
    			</td>
    		</tr>
    		<tr>
    			<th>
    				<H5>근무환경</H5>
    			</th>
    			<td>
       			 <div class="review_env">
           			<div class="env">
                		<input type="checkbox" name="env" id="env1" value="1" class="env_radio env" title="1점">
                		<label for="env1"></label>
                		<input type="checkbox" name="env" id="env2" value="2" class="env_radio env" title="2점">
               			<label for="env2" ></label>
                		<input type="checkbox" name="env" id="env3" value="3" class="env_radio env" title="3점" >
                		<label for="env3" ></label>
                		<input type="checkbox" name="env" id="env4" value="4" class="env_radio env"  title="4점">
                		<label for="env4" ></label>
                		<input type="checkbox" name="env" id="env5" value="5" class="env_radio env" title="5점">
                		<label for="env5"></label>
            		</div>
       	 		</div> 				
    			</td>
    		</tr>
    		<tr>
    			<th><h5>급여 및 복지</h5></th>
    			<td>
     			 <div class="review_sal">
           			<div class="sal">
                		<input type="checkbox" name="sal" id="sal1" value="1" class="sal_radio sal" title="1점">
                		<label for="sal1"></label>
                		<input type="checkbox" name="sal" id="sal2" value="2" class="sal_radio sal" title="2점">
               			<label for="sal2" ></label>
                		<input type="checkbox" name="sal" id="sal3" value="3" class="sal_radio sal" title="3점" >
                		<label for="sal3" ></label>
                		<input type="checkbox" name="sal" id="sal4" value="4" class="sal_radio sal"  title="4점">
                		<label for="sal4" ></label>
                		<input type="checkbox" name="sal" id="sal5" value="5" class="sal_radio sal" title="5점">
                		<label for="sal5"></label>
            		</div>
       	 		</div> 				
    			</td>
    		</tr>
    		<tr>
    			<th><h5>경영진</h5></th>
    			<td>
     			 <div class="review_ceo">
           			<div class="ceo">
                		<input type="checkbox" name="ceo" id="ceo1" value="1" class="ceo_radio ceo" title="1점">
                		<label for="ceo1"></label>
                		<input type="checkbox" name="ceo" id="ceo2" value="2" class="ceo_radio ceo" title="2점">
               			<label for="ceo2" ></label>
                		<input type="checkbox" name="ceo" id="ceo3" value="3" class="ceo_radio ceo" title="3점" >
                		<label for="ceo3" ></label>
                		<input type="checkbox" name="ceo" id="ceo4" value="4" class="ceo_radio ceo"  title="4점">
                		<label for="ceo4" ></label>
                		<input type="checkbox" name="ceo" id="ceo5" value="5" class="ceo_radio ceo" title="5점">
                		<label for="ceo5"></label>
            		</div>
       	 		</div> 					
    			</td>    			
    		</tr>
    	<br>
    	<button type="submit" class="btnsubmit btn btn-default" style="margin-left: 400px;" >리뷰남기기</button>
    	<br><br><br>
    </form>
	</div>
</div>
</body>
<script type="text/javascript">

//총 별점
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            $("input.rating").val(parseInt(elem.value));
        }
    })
});

//사내문화 별점
function Culture(){};
Culture.prototype.rate = 0;
Culture.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.cul_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let culture = new Culture();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.cul').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('cul_radio')){
            culture.setRate(parseInt(elem.value));
            $("input.cul").val(parseInt(elem.value));
     
        }
    })
});


</script>
<script type="text/javascript">
//자기개발 별점
function Improv(){};
Improv.prototype.rate = 0;
Improv.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.imp_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let improv = new Improv();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.imp').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('imp_radio')){
        	improv.setRate(parseInt(elem.value));
            $("input.imp").val(parseInt(elem.value));
     
        }
    })
});

//근무환경 별점
function Environ(){};
Environ.prototype.rate = 0;
Environ.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.env_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let environ = new Environ();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.env').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('env_radio')){
        	environ.setRate(parseInt(elem.value));
            $("input.env").val(parseInt(elem.value));
     
        }
    })
});

//급여및복지 별점
function Salary(){};
Salary.prototype.rate = 0;
Salary.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.sal_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let salary = new Salary();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.sal').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('sal_radio')){
        	salary.setRate(parseInt(elem.value));
            $("input.sal").val(parseInt(elem.value));
     
        }
    })
});

//경영진 별점
function CeoCeo(){};
CeoCeo.prototype.rate = 0;
CeoCeo.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.ceo_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let ceoceo = new CeoCeo();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.ceo').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('ceo_radio')){
        	ceoceo.setRate(parseInt(elem.value));
            $("input.ceo").val(parseInt(elem.value));
     
        }
    })
});
</script>
</html>