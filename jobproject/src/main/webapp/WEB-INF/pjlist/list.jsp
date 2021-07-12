<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<style type="text/css">

body{
line-height: 1.6
}
.container{
	width: 1000px;
	padding-right: 0px;
    padding-left: 0px;
    margin-right: 0px;
    margin-left: 0px;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #blue;
	color: #222;
	border: gray;
}

.tab-content{
	display: none;
	padding: 15px;
	border: 1px solid #D2D4D6;
}

.tab-content.current{
	display: inherit;
}

 div.gonggo-box2{
 	max-width: 200px;
 	min-width: 200px;
	height: 150px;
	cursor: pointer;
	margin-left:30px;
	margin-bottom: 20px;
	text-align:center;
	padding-top: 10px;
 }
 
	
</style>

</head>



<body>

<h2>전체 </h2>
<hr>
	 
	 <!-- 직무로 검색 -->
	<h3>직군/직무<br></h3>
		
	<div class="container" style="align-items: left;">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">지역선택▼</li>
		<li class="tab-link" data-tab="tab-2">직군/직무▼</li>
	</ul>
		<form id=reset_searcharea>	
		<div id="tab-1" class="tab-content current" style="border: 1px solid #D2D4D6;">
		 <h5 style="margin-left: 50px;">지역　　　　　　　　　　　　　　 　　　　　　　　　　　　　상세지역</h5>
      		<select name="sido1" id="sido1"  size="3" style="width:400px;height:100px;margin-left: 50px;"></select>
			<select name="gugun1" id="gugun1" size="3" style="width:400px;height:100px;"></select>
			<br/>
			<button type="button" class="searcharea btn btn-default btn-ms" id="area_reset" style="margin-left: 680px; margin-top: 10px;">
			선택 초기화 <i class="fa fa-refresh"></i></button>
			<button type="button" class="searcharea btn btn-default btn-ms" id="searcharea" style="margin-top: 10px;">검색</button>
			
		</div>
		</form>
		
		<form id=reset_searchjob>	
			<div id="tab-2" class="tab-content">
				<fieldset style="width:850px;">
					<h5 style="margin-left: 50px;">직군　　　　　　　　　 　　　　　　　　　　　　　　　　　　직무</h5>
						<select name="job" id="job" class="col-sm-3" size="3" style="width: 400px; height: 100px; margin-left: 50px;"
									onchange="selectjob(this)">
									<option value="IT/인터넷" selected="selected">IT/인터넷</option>
									<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
									<option value="디자인">디자인</option>
									<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
									<option value="생산/제조">생산/제조</option>
									<option value="유통/무역">유통/무역</option>
									<option value="서비스/고객지원">서비스/고객지원</option>
						</select>
						<select name="jobgroup" id="jobgroup" class="col-sm-3" size="3" style="width: 400px; height: 100px;"></select>
						<br/>
						<button type="button" class="searchjob btn btn-default btn-ms" id="job_reset" style="margin-left:680px; margin-top: 10px;">
						선택 초기화 <i class="fa fa-refresh"></i></button>
						<button type="button" class="searchjob btn btn-default btn-ms" id="searchjob" style="margin-top: 10px;">검색</button>
						
				</fieldset>
			</div>
		</form>
		
	</div>

	&nbsp;&nbsp;&nbsp;
		
		<!-- 태그로 검색 -->
		<br/>
		<button type="button" class="btn btn-default btn-ms" data-toggle="collapse" data-target="#demo">
			<span class="tag">태그</span>
		  	<span class="tag_info" style="color: #021B80"><b>딱 맞는 기업찾기</b></span>
		  	<span class="tag_arrow">▼</span>
		</button>
		<br/>
		<div id="demo" class="collapse">
			<div class="statement">
				<br/>
			  <b>기업의 특별한 복지, 혜택 등 태그를 선택하여 <br/>
			  나에게 꼭 맞는 포지션을 찾아보세요!</b>
			
				<table id="seltag" >
					<tr>
						<td>
						<h5>1. 카테고리 선택</h5>
							<select style="width: 200px; height: 35px;" name="cctg" id="cctg" class="sel form-control" 
							onchange="selectctg(this.value)">
								<option hidden disabled>카테고리</option>
									<option value="업계연봉수준">업계연봉수준</option>
									<option value="보상">보상</option>
									<option value="출퇴근">출퇴근</option>
									<option value="식사/간식">식사/간식</option>
									<option value="기업문화">기업문화</option>
									
							</select>
		          	<br/>
						<h5>2. 태그 선택</h5>
							<select style="width: 200px; height: 35px;" name="hashtag" id="hashtag" class="sel form-control" onchange="selecttag(this.value)">
								<option>해시태그</option>
							</select>
								<!-- <button type="button" class="add" id="btnaddctg">+ 추가</button>-->
							<div id="output1">
							 <c:forEach var="category" items="${category}">
								<div class="form-control">
									<input type="button" name="ctg" id="ctg" value="${category.ctg}"> 
									<span class="remove1 glyphicon glyphicon-remove"></span>
								</div>
							 </c:forEach>
							</div>
							<br/>
							<div id="output2">
							 <c:forEach var="category" items="${category}">
								<div class="form-control">
									<input type="button" name="tag" id="tag" value="${category.tag}"> 
									<span class="remove1 glyphicon glyphicon-remove"></span>
								</div>
							 </c:forEach>        
							</div>
						</td>
					</tr>
				</table>
		
		          <button type="button" class="tagconfirm btn btn-defualt" id="tagConfirm" style="margin-left: 200px;">확인</button>
		    
	 		</div>
		</div>
<div class="showtaglist"></div>

<br/>
<!-- 북마크  -->
	 <div class="bookmark-button">
			<button data-attribute-id="explore__bookmarkPage__click" type="button" style="background-color: white; border: none;" onclick="location.href='/bookmark'">
			<svg width="13" height="17" viewBox="0 0 13 17" style="color:#36f"><defs>
			<path id="bookmarkIconFill" d="M6.25 13.21L.905 16.22c-.403.228-.905-.06-.905-.517V.596C0 .267.27 0 .605 0h11.29c.334 0 .605.267.605.596v15.107c0 .458-.502.745-.905.518L6.25 13.209z">
			</path></defs>
			<g fill="none" fill-rule="evenodd" transform="translate(.188)">
			<use fill="currentColor" xlink:href="#bookmarkIconFill"></use></g></svg>
			<span>북마크 모아보기</span><svg width="12" height="12" viewBox="0 0 12 12">
			<path fill="currentColor" d="M4.22 9.72a.75.75 0 001.06 1.06l4.25-4.25a.75.75 0 000-1.06L5.28 1.22a.75.75 0 00-1.06 1.06L7.94 6 4.22 9.72z">
			</path></svg></button>
	 </div>	 



<!-- 지역선택 및 직군/직무 탭 기능 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})

</script>


<!-- 태그 딱맞는 기업찾기 기능  -->
<script type="text/javascript">

	function selectctg(c) {
		
		var ipt = document.createElement("input");
		ipt.setAttribute("type","button");
		ipt.setAttribute("class","form-control");
		ipt.setAttribute("name","ctg");
		ipt.setAttribute("id","ctg");
		ipt.setAttribute("value",c);
		var space= document.getElementById("output1");
		var spanx=document.createElement("span");
		spanx.setAttribute("class","remove glyphicon glyphicon-remove");
		//space.appendChild(ipt);
		//space.appendChild(spanx);	
		
	    var pay = ["연봉업계평균이상","연봉상위1%","연봉상위2~5%","연봉상위6~10%","연봉상위11~20%"];
	    var com = ["성과급", "상여금", "연말보너스","스톡옵션"];
	    var work = ["택시비", "차량지원", "재택근무", "원격근무"];
	    var eat = ["조식제공", "중식제공", "석식제공", "식비","커피","간식"];
	    var culture = ["수평적조직", "스타트업", "자율복장", "워크샵", "스톡옵션"];
	    var hashtag = document.getElementById("hashtag");
	   
	    if(c == "업계연봉수준") var t = pay;
	    else if(c == "보상") var t = com;
	    else if(c == "출퇴근") var t = work;
	    else if(c == "식사/간식") var t = eat;
	    else if(c == "기업문화") var t = culture;
	
	    hashtag.options.length = 0;
	
	    for (x in t) {
	        var opt = document.createElement("option");
	       	opt.setAttribute("type","button");
	        opt.value = t[x];
	        opt.innerHTML = t[x];
	        hashtag.appendChild(opt);
	    }
	}

	function selecttag(t) {
			var ipt = document.createElement("input");
			ipt.setAttribute("type","button");
			ipt.setAttribute("class","form-control");
			ipt.setAttribute("name","tag");
			ipt.setAttribute("id","tag");
			ipt.setAttribute("value",t);
			var space= document.getElementById("output2");
			var spanx=document.createElement("span");
			spanx.setAttribute("class","remove glyphicon glyphicon-remove");
			space.appendChild(ipt);	
			space.appendChild(spanx);	
		
	}
	
	$(document).on("click",".remove1",function(e){
		var r1 = e.target;
		var r2= r1.parentNode;
		r2.parentNode.removeChild(r2);
		
	});
	
	/* 태그 검색 시 리스트 재출력 */
	$( document ).ready( function() {
		$( 'button#tagConfirm' ).click( function() {
			
			var tag = $( 'input#tag' ).val();
			//alert( tag );
			
			$.ajax({
		        type : "post",  
		        url : "/pjlistsearchtag",        
		        data : "tag="+tag,
		        dataType: 'json',
		        
		        error : function(){
		            alert("통신 에러","error","확인",function(){
		            	
		            });
		        },
  
				success : function(data) {
		        	
		        	//console.log(data); //list 데이터 확인 
		        	//alert(data);
		        	
		        	//검색 값 삭제
		        	//$( 'input#tag' ).val("");
		        	//$( 'div#output2' ).val("");
					//alert( tag );
		        	
		        	var s="";
		        	
		        	if(data==""){
		        		s+="<br><br><br>";
		        		s+="<h3 style='margin-left: 300px;'>["+tag+"] 해당 검색 결과가 없습니다.</h3><br><br>";
		        	}else{
			       		//반복문으로 값 출력
			        	$.each(data, function(idx, val) {
			        		s+='<div class="gonggo-box2 form-control" num="'+val.num+'">';
			        		s+='<input type="hidden" name="num" value="'+val.num+'">';
				        	s+='<h4>'+val.jobgroup+'</h4></br>';
				        	s+='<h5>'+val.empname+'</h5>';
				        	s+='<h5 class="job">'+val.job+'</h5>';
				        	s+='<h5 style="color: gray"> 마감 '+val.deadline+'</h5>';
				        	s+='</div>';
				        	
			        	});		
		        	}	
		        	
		        	$("div.pjlist").html(s);	
		        }
		        	})	        	
		        })	
			});			
	
</script>


<!-- 지역선택 셀렉박스 기능 -->
<script type="text/javascript">

$('document').ready(function() {
	 var area0 = ["전국","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
	 var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
	  var area4 = ["전체","광산구","남구","동구","북구","서구"];
	  var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	  var area6 = ["전체","남구","동구","북구","중구","울주군"];
	  var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	  var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	  var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	  var area16 = ["전체","서귀포시","제주시"];
	   
  
	   // 시/도 선택 박스 초기화

  $("select[name^=sido]").each(function() {
   $selsido = $(this);
   $.each(eval(area0), function() {
    $selsido.append("<option value='"+this+"'>"+this+"</option>");
   });
   $selsido.next().append("<option value=''>시/도 구군</option>");
  });

  

  // 시/도 선택시 구/군 설정

  $("select[name^=sido]").change(function() {
   var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
   var $gugun = $(this).next(); // 선택영역 군구 객체
   $("option",$gugun).remove(); // 구군 초기화

   if(area == "area0")
    $gugun.append("<option value=''>구/군 선택</option>");
   else {
    $.each(eval(area), function() {
     $gugun.append("<option value='"+this+"'>"+this+"</option>");
    });
   }
  });


	 });
	 

/* 지역 검색 시 리스트 재출력 */
$( document ).ready( function() {
	$( 'button#searcharea' ).click( function() {
		
		
		var addr = $( 'select#gugun1' ).val();
		//alert( addr );
		
		$.ajax({
	        type : "post",  
	        url : "/pjlistsearcharea",        
	        data : "addr="+addr,
	        dataType: 'json',
	        
	        error : function(){
	            alert("통신 에러","error","확인",function(){
	            	
		            });
		        },
		        
		    success : function(data) {
		    	//console.log(data); //list 데이터 확인 
	        	//alert(data);
		    	
	        	var s="";
	        	
	        	if(data==""){
	        		s+="<br><br><br>";
	        		s+="<h3 style='margin-left: 300px;'>["+addr+"] 해당 검색 결과가 없습니다.</h3><br><br>";
	        	}else{
		       		//반복문으로 값 출력
		        	$.each(data, function(idx, val) {
		        		//alert(val.num);
		        		s+='<div class="gonggo-box2 form-control" num="'+val.num+'">';
		        		s+='<input type="hidden" name="num" value="'+val.num+'">';
			        	s+='<h4>'+val.jobgroup+'</h4></br>';
			        	s+='<h5>'+val.empname+'</h5>';
			        	s+='<h5 class="job">'+val.job+'</h5>';
			        	s+='<h5 style="color: gray"> 마감 '+val.deadline+'</h5>';
			        	s+='</div>';
			        	
		        	});		
	        	}	
	        	
	        	$("div.pjlist").html(s);	

		    	}	
		    })	
		});	
			
	});
		

$(document).ready(function(){
    //지역선택 초기화btn을 클릭했을 때의 함수
    $( "#area_reset").click(function () {
        $( "#reset_searcharea" ).each( function () {
            this.reset();
        });
    });
});


</script>

<!-- 직군 검색 기능 -->
<script type="text/javascript">

//직군 onchange 이벤트
function selectjob(e) {
    var it = ["웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"];
    var business = ["사업개발기획자", "컨설턴트", "경영지원"];
    var design = ["그래픽디자이너", "웹디자이너", "일러스트레이터", "UI 디자이너"];
    var marketing = ["광고기획자", "마케팅전략기획자", "키워드광고", "소셜마케터"];
    var production = ["생산직종사자", "제조엔지니어", "품질관리자", "반도체/디스플레이"];
    var trade  = ["수출입사무", "유통관리자", "배송담당", "항공운송"];
    var service  = ["MD", "CS어드바이저", "CS매니저", "텔레마케터"];
    var target = document.getElementById("jobgroup");

    if(e.value == "IT/인터넷") var d = it;
    else if(e.value == "경영/기획/컨설팅") var d = business;
    else if(e.value == "디자인") var d = design;
    else if(e.value == "미디어/홍보/마케팅") var d = marketing;
    else if(e.value == "생산/제조") var d = production;
    else if(e.value == "유통/무역") var d = trade;
    else if(e.value == "서비스/고객지원") var d = service;


    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }

}

/* 직군 직무 검색 시 리스트 재출력 */
$( document ).ready( function() {
	$( 'button#searchjob' ).click( function() {
		
		var jobgroup = $( 'select#jobgroup' ).val();
		//alert( jobgroup );
	
	$.ajax({
        type : "post",  
        url : "/pjlistsearchjob",        
        data : "jobgroup="+jobgroup,
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){
            	
	            });
	        },
	        
	    success : function(data) {
	    	//console.log(data); //list 데이터 확인 
        	//alert(data);
	    	
	    	
        	var s="";
        	
        	if(data==""){
        		s+="<br><br><br>";
        		s+="<h3 style='margin-left: 300px;'>["+tag+"] 검색 결과가 없습니다.</h3><br><br>";
	    	}else{
       		//반복문으로 값 출력
        	$.each(data, function(idx, val) {
        		//alert(val);
        		s+='<div class="gonggo-box2 form-control" num="'+val.num+'">';
        		s+='<input type="hidden" name="num" value="'+val.num+'">';
	        	s+='<h4>'+val.jobgroup+'</h4></br>';
	        	s+='<h5>'+val.empname+'</h5>';
	        	s+='<h5 class="job">'+val.job+'</h5>';
	        	s+='<h5 style="color: gray"> 마감 '+val.deadline+'</h5>';
	        	s+='</div>';
	        	
        	});		
    	
	    }
			$("div.pjlist").html(s);	
			
	    	}	
	    })	
	});	
		
});



$(document).ready(function(){
    //지역선택 초기화btn을 클릭했을 때의 함수
    $( "#job_reset").click(function () {
        $( "#reset_searchjob" ).each( function () {
            this.reset();
        });
    });
});

</script>

 <form class="list form-inline">
 <div class=list>
<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>적극 채용 중인 회사</h3>
<hr>
<br>
<c:set var="strPlanDate" value="${date}" />
	<div class="pjlist">
			<c:forEach var="dto" items="${gonggolist}" varStatus="n">
				<c:set var="end_plan_date" value="${dto.deadline}" />
				<fmt:parseNumber value="${strPlanDate.time/ (1000*60*60*24)}"
					integerOnly="true" var="strDate" />
				<fmt:parseDate value="${end_plan_date}" var="endPlanDate"
					pattern="yyyy-MM-dd" />
				<fmt:parseNumber value="${endPlanDate.time/ (1000*60*60*24)+1}"
					integerOnly="true" var="endDate" />
	
				<c:if test="${(endDate - strDate)>=0}">
					<div class="gonggo-box form-control">
						  <div OnClick="location.href='gonggodetail?num=${dto.num}'">
							<input type="hidden" name="num" value="${dto.num}">
								<h4 class="subject">${dto.jobgroup}</h4>
								<h6 class="empname" style="color: #021B80">${dto.empname }</h6>
								<h5 class="job">${dto.job }</h5>
							<c:set var="endday1" value="${end_plan_date.substring(0,4)}" />
							<c:set var="endday2" value="${end_plan_date.substring(5,7)}" />
							<c:set var="endday3" value="${end_plan_date.substring(8,10)}" />
							<h5 style="color: gray">마감 ${endday1}-${endday2}-${endday3}</h5>
	
							</div>
						</div> 
				</c:if>
			</c:forEach>		
	</div>
</div>
</form>
<script type="text/javascript">

//gonggo 클릭 이벤트(상세페이지 이동)
$(document).on('click', '.gonggo-box2', function() {
	//num값 저장
	var num=$(this).attr("num");
	//alert(num);
	
	//num값을 컨트롤러로 전달
	location.href="/gonggodetail?num="+num;
})

</script>
</body>
</html>