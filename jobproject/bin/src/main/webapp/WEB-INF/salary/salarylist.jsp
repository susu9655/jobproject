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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
<style type="text/css">
	
	div.chart{
		position:absolute;
		margin-left: 50px;
		width: 700px; 
		height: 500px;
	}
	
	div.cate_job{
		position:absolute;
		top:750px;
		margin-left: 50px;
		width: 800px; 
		height: 30px;
	}	
	
	div.detail{
		position:absolute;
		left:1300px;
		top:350px;
		width: 300px;
		height: 150px;
	}
	
	div.salary{
		position:absolute;
		top:800px;
		width: 250px;
		float: left;
	}
	
	div.choice{
		position:absolute;
		left:1300px;
		top:600px;
		width: 240px;
		height: 150px;
	}
	
	span.detailjob, span.detailjobgroup, span.detailcareer, span.detailsalary{
		height: 50px;
		border: 3px solid #021B80;
		background-color: white;
		border-radius: 50px;
		color: #021B80;
		padding: 10px 10px 10px 10px;
		font-size: 1.3em;
	}

	span.detailsalary{
		font-size: 2.2em;
	}

</style>
</head>
<body>
	<h1>직군별 연봉</h1>
	<br><br>
	<!-- salary 초기값 -->
	<c:forEach var="item" items="${saldefault}" varStatus="status" >
		<c:set value="${item.salary}" var="salary"/>
		<span class='salary' style="color: white;">${salary}</span>
		<c:set value="${item.career}" var="career"/>
	</c:forEach>
	
	<!-- chart -->
	<div id="columnchart_material" class="chart"></div>
	
	
	<!-- select -->
	<div class="cate_job">
		<select name="job" id="job" class="form-inline" style="width: 150px; height: 30px;" onchange="selectjob(this)">
			<option value="IT/인터넷" selected="selected">IT/인터넷</option>
			<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
			<option value="디자인">디자인</option>
			<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
			<option value="생산/제조">생산/제조</option>
			<option value="유통/무역">유통/무역</option>
			<option value="서비스/고객지원">서비스/고객지원</option>
		</select>
		&nbsp;
		<select name="jobgroup" id="jobgroup" class="form-inline" style="width: 150px; height: 30px;">
			<option selected="selected">직무</option>
			<option  value="웹개발자">웹개발자</option>
			<option value="프론트엔드개발자">프론트엔드개발자</option>
			<option value="Node.js개발자">Node.js개발자</option>
			<option value="빅데이터엔지니어">빅데이터엔지니어</option>
		</select>
		&nbsp;
		<select name="career" id="career" class="form-inline" style="width: 150px; height: 30px;"
			onchange="detail(this)">
			<option selected="selected">연차</option>
			<option value="0">신입</option>
			<option value="1">1년</option>
			<option value="2">2년</option>
			<option value="3">3년</option>
			<option value="4">4년</option>
			<option value="5">5년</option>
			<option value="6">6년</option>
			<option value="7">7년</option>
			<option value="8">8년</option>
			<option value="9">9년</option>
			<option value="10">10년</option>
		</select>
		&nbsp;
		<input type="text" name="sal" id="sal" placeholder="연봉을 입력하세요."
			style="width: 150px; height: 30px;">
		&nbsp;
		<button type="button" class="searchsal btn btn-default">검색</button>	
	</div>
	
	<!-- 선택 값 출력 div -->
	<div class="detail">
		<span class='detailjob'>IT/인터넷</span><br><br><br>
		<span class='detailjobgroup'>웹개발자</span><br><br><br>
		<span class='detailcareer'>0년차</span><br><br><br>
		<span class='detailsalary'>3037</span><br><br>
	</div>
	<div class="choice"></div>
</body>

<script type="text/javascript">

//구글 차트 호출
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);
    
//직군 onchange 이벤트
function selectjob(e) {
    var it = ["웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"];
    var business = ["사업개발기획자", "컨설턴트", "경영지원"];
    var design = ["그래픽디자이너", "웹디자이너", "일러스트레이터", "UI디자이너"];
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

//구글 차트 초기값 설정(웹개발자-신입)
function drawChart() {

	//배열 생성
	 var salary=new Array();
	 var career=new Array();
	       	
	//span.salary 값을 이용하여 반복문
	  $(".salary").each(function(i, element) {
	//element에 값 넣기
	  salary.push(parseInt($(element).text()));
	//index생성
	  career.push(i); 	
	});

	  var data = google.visualization.arrayToDataTable([
	    
	    ['Year', '연봉'],
	    [career[0], salary[0]],
	    [career[1], salary[1]],
	    [career[2], salary[2]],
	    [career[3], salary[3]],
	    [career[4], salary[4]],
	    [career[5], salary[5]],
	    [career[6], salary[6]],
	    [career[7], salary[7]],
	    [career[8], salary[8]],
	    [career[9], salary[9]],
	    [career[10], salary[10]]
	]);
	         
	  var options = {
			  
		// 범례 표시 삭제
		legend : {
			position : 'none'
		},
				
	   //막대 차트 색상
       series: {
           0: { color: '#021B80' },
         },
	   
         vAxis: {format: 'decimal',
        	 
        	//차트 최소,최대값 지정
             viewWindow: {
                 max:7000,
                 min:2000
               }
           }
	         
	   };

	  var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

	  chart.draw(data, google.charts.Bar.convertOptions(options));
}

</script>
<script type="text/javascript">

//연봉검색 버튼 클릭 이벤트
$(".searchsal").click(function() {
	//입력한 연봉 값
	var sal=$("#sal").val();
	console.log(sal);
	
	if(sal=="" || sal==null){
		alert("연봉을 입력해주세요");
		return;
	}
	
	//직군,직무,연차
	var job=$("#job").val();
	var jobgroup=$("#jobgroup").val();
	var career=$("#career").val();
	
	//alert(job+", "+jobgroup+", "+career+", "+sal);
	
	$.ajax({
		type : "post",  
        url : "/searchsal",        
        data : "job="+job+"&jobgroup="+jobgroup+"&career="+career,
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },
        
        success : function(item) {
        	
        	//연봉대비 입력연봉 계산
        	var money = ((sal-item)/item)*100;
        	
        	//계산값이 0보다 큼
        	if(money>0){
        		var m = Math.abs(money);
        		var text="높음";
        	}
        	//계산값이 0보다 작음
        	if(money<0){
        		var m = Math.abs(money);
        		var text="낮음";
        	}
        	//계산값 : 0
        	if(money=0){
        		var m = Math.abs(money);
        		var text="적정";
        	}
        	
        	//소수점 삭제(정수형)
        	var s = m.toFixed();
        	
        	var print="<h3>*예상 연봉("+item+")</h3>";
        	print+="<h3>대비 "+s+"% "+text+"</h3>";

        	$("div.choice").html(print);
        	console.log(s+text);
        }
	})
});

//input tags onchange 이벤트(차트 바로 반영)
function detail(e) {
	//직군,직무,연차
	var job=$("#job").val();
	var jobgroup=$("#jobgroup").val();
	var career=$("#career").val();
	
	var print="";
	print+="<span class='detailjob'>"+job+"</span><br><br><br>";
	print+="<span class='detailjobgroup'>"+jobgroup+"</span><br><br><br>";
	print+="<span class='detailcareer'>"+career+"년차</span><br><br><br>";
	$("div.detail").html(print);
	
	//연봉 비교 수식 제거
	$("div.choice").html("");
	//연봉입력 제거
	$("#sal").val("");
	
    $.ajax({
        type : "post",  
        url : "/searchjob",        
        data : "job="+job+"&jobgroup="+jobgroup+"&career="+career,
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(item) {
        	
        //데이터 출력 콘솔 확인
        console.log("인덱스:"+item[career].career);
        console.log("연봉:"+item[career].salary);
        	
       	//선택한 연차의 연봉 데이터 출력
       	print+="<span class='detailsalary'>"+item[career].salary+"만원</span><br><br><br>";
       	$("div.detail").html(print);
   	       
        //구글 차트 호출
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawChart);
		
		//선택한 직군/직무에따른 데이터 차트에 넣기
        function drawChart() {
        	
        	var data = google.visualization.arrayToDataTable([
                  	['Year', '연봉'],
                  	[item[0].career, item[0].salary],
                  	[item[1].career, item[1].salary],
                  	[item[2].career, item[2].salary],
                  	[item[3].career, item[3].salary],
                  	[item[4].career, item[4].salary],
                  	[item[5].career, item[5].salary],
                  	[item[6].career, item[6].salary],
                  	[item[7].career, item[7].salary],
                  	[item[8].career, item[8].salary],
                  	[item[9].career, item[9].salary],
                  	[item[10].career, item[10].salary]
                  	
                 ]);  

            var options = {
            		
            		// 범례 표시 삭제
            		legend : {
            			position : 'none'
            		},
                    
             	   //막대 차트 색상
                    series: {
                    	0: { color: '#021B80' },
                    },
                    
                   //y축 차트 옵션
                    vAxis: {
                    
                    //주 단위(10진수)
                    format: 'decimal',
                    	
                    //차트 최소,최대값 지정
                    viewWindow: {
                       max:7000,
                       min:2000
                      }
                    }
                  
                  
                  };

            var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                  chart.draw(data, google.charts.Bar.convertOptions(options));
           } 
        
        }
        
        
    });	
}
</script>
</html>