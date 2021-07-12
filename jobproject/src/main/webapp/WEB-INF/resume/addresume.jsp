<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<style type="text/css">
	div.addresume_entire{
		width: auto;
		margin: auto;
		margin-left: 100px;
	}
	textarea.intro:focus{
		outline: none;
	}
	div.explanation{
		background-color: #F3F9FE;
		width: 800px;
	}
	div.carer{
		min-width: 920px;
	}
	div.skill{
		height: auto;
		padding-bottom: 50px;
	}
	button.add{
		color: #021B80;
		border: none;
		font-weight: bold;
		font-size: 1.1em;
		background-color: white;
	}
	
	input.day{
		border: none;
		font-size: 0.8em;
	}
	
	input.school{
		font-weight: bold;
	}
	
	input.major{
		font-size: 0.9em;
	}
	
	input:focus{outline: none;}
	
	span.skillblock{
		border-radius: 100px;
		width: auto;
		height: 40px;
		background-color: #eee;
		margin-right: 10px;
		line-height: 40px;
		padding: 10px 10px 10px 10px;
	}
	
	
	select.sel{
		width: 150px;
		height: 30px;
		padding-left: 10px;
		font-size: 15px;
		color: gray;
		border-style: none;
		border-radius: 3px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		/*background: url('select-arrow.png') no-repeat 95% 50%;  화살표 아이콘 추가 */
		margin-left: 10px;
	}
	
	select.sel:focus{
		outline: none;
	}
	
	button.submit_resume{
		background-color: #021B80;
		color: white;
		border-radius: 40px;
		width: 100px;
		height: 40px;
		line-height: 30px;
		border: 0px solid black;
		
	}
	
	#btnskilladd:focus{
		outline: none;
	}
	
	
	
	* { box-sizing: border-box; }
body {
  font: 16px Arial;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}
#myInput {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}
input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9;
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important;
  color: #ffffff;
}
progress::-webkit-progress-value { background: #010D26; }
div.resume-toolbar{
	position: fixed;
    top: auto;
    left: 0;
    right: 0;
    bottom: 0;
    margin: 0;
    padding: 0 50px;
    background-color: white;
    border-top: 1px solid #e0e0e0;
    border: none;
}
</style>
<script type="text/javascript">
window.onload = function() {
	
	skills=[];
	

	
	//경력 추가버튼을 클릭했을 때 이벤트
	document.getElementById('btnaddcarer').onclick=function(){
		
	//객체 생성
	var tr=document.createElement("tr");
	var td1=document.createElement("td");
	var td2=document.createElement("td");
	var td3=document.createElement("td");
	var startday=document.createElement("input");
	var endday=document.createElement("input");
	var company=document.createElement("input");
	var depart=document.createElement("input");
	var spanx=document.createElement("span");
	
	//객체 속성,css지정
	spanx.setAttribute("class","glyphicon glyphicon-remove");
	
	startday.setAttribute("placeholder","YYYY-MM");
	startday.setAttribute("class","day");
	startday.setAttribute("name","c_startday");
	startday.setAttribute("maxlength","7");
	endday.setAttribute("placeholder","YYYY-MM");
	endday.setAttribute("class","day");
	endday.setAttribute("name","c_endday");
	endday.setAttribute("maxlength","7");

	company.style.border="none";
	company.style.fontWeight="bold";
	company.setAttribute("placeholder","회사명");
	company.setAttribute("name","company");
	
	depart.style.border="none";
	depart.style.fontSize="0.9em";
	depart.setAttribute("placeholder","부서명/직책");
	depart.setAttribute("name","department");
	
	//spanx.setAttribute("onclick","delspanx(this)");
	spanx.setAttribute("id","spanx");
	
	//객체에 삽입
	var addcarer=document.getElementById("addcarer");
	addcarer.appendChild(tr);
	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	td1.appendChild(startday);
	td1.appendChild(endday);
	
	td2.appendChild(company);
	
	td3.appendChild(depart);
	td3.appendChild(spanx);
		
		
	}
	
	//학력 추가 버튼을 클릭했을 때 이벤트
	document.getElementById('btnaddedu').onclick=function(){
		
		//객체 생성
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		var td3=document.createElement("td");
		var startday=document.createElement("input");
		var endday=document.createElement("input");
		var school=document.createElement("input");
		var major=document.createElement("input");
		var spanx=document.createElement("span");
		
		//객체 속성,css지정
		spanx.setAttribute("class","glyphicon glyphicon-remove");
		spanx.setAttribute("onclick","delspanx()")
		
		startday.setAttribute("placeholder","YYYY-MM");
		startday.setAttribute("class","day");
		startday.setAttribute("name","e_startday");
		startday.setAttribute("maxlength","7");
		endday.setAttribute("placeholder","YYYY-MM");
		endday.setAttribute("class","day");
		endday.setAttribute("name","e_endday");
		endday.setAttribute("maxlength","7");

		school.style.border="none";
		school.style.fontWeight="bold";
		school.setAttribute("placeholder","학교명");
		school.setAttribute("name","school");
		
		major.style.border="none";
		major.style.fontSize="0.9em";
		major.setAttribute("placeholder","전공 및 학위");
		major.setAttribute("name","major");
		
		//객체에 삽입
		var addedu=document.getElementById("addedu");
		addedu.appendChild(tr);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		td1.appendChild(startday);
		td1.appendChild(endday);
		
		td2.appendChild(school);
		
		td3.appendChild(major);
		td3.appendChild(spanx);
			
	}
	
	//기술 추가 이벤트
	document.getElementById('btnskilladd').onclick=function(){
		
		//값을 입력하지 않은 경우 alert창으로 경고
		var skill=document.getElementById('myInput').value;
		if(skill == ""){
			return
		}
		
		//이미 있는 값인지 체크해서 없을 경우에만 추가
		var skills=document.querySelectorAll(".skillblock");
		for (var i = 0; i < skills.length; i++) {
			if(skills[i].getAttribute("value") == skill){
				alert("이미 있는 스킬입니다.");
				
				//input 초기화
				document.getElementById('myInput').value="";
				return
			}
		}
		
		
		var skill_box=document.createElement('div');
		
		var skill_span=document.createElement("span");
		var spanx=document.createElement("span");
		var hidden=document.createElement("input");
		//skill_span.setAttribute("class","skillblock");
		//skill_span.setAttribute("class","glyphicon glyphicon-remove");
		
		skill_box.style.float="left";
		
		hidden.setAttribute("type","hidden");
		hidden.setAttribute("value",skill);
		hidden.setAttribute("name","skill");
		
		skill_span.innerHTML=skill;
		skill_span.setAttribute("name","skill");
		skill_span.setAttribute("value",skill);
		skill_span.setAttribute("class","skillblock");
		
		spanx.setAttribute("class","glyphicon glyphicon-remove");
		
		skill_span.appendChild(spanx);
		document.getElementById('skill').appendChild(skill_box);
		skill_box.appendChild(skill_span);
		skill_box.appendChild(hidden);
		
		
		
		//input 초기화
		document.getElementById('myInput').value="";

		
		
	}
	
	
	//수상 및 경력 추가버튼을 클릭시 이벤트
	document.getElementById("btnaddaward").onclick=function(){
		//객체 생성
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		var td3=document.createElement("td");
		var startday=document.createElement("input");
		var endday=document.createElement("input");
		var activity=document.createElement("input");
		var detail=document.createElement("input");
		var spanx=document.createElement("span");
		
		//객체 속성,css지정
		spanx.setAttribute("class","glyphicon glyphicon-remove");
		
		startday.setAttribute("placeholder","YYYY-MM");
		startday.setAttribute("class","day");
		startday.setAttribute("name","a_startday");
		startday.setAttribute("maxlength","7");
		endday.setAttribute("placeholder","YYYY-MM");
		endday.setAttribute("class","day");
		endday.setAttribute("name","a_endday");
		endday.setAttribute("maxlength","7");

		activity.style.border="none";
		activity.style.fontWeight="bold";
		activity.setAttribute("placeholder","활동명");
		activity.setAttribute("name","activity");

		
		detail.style.border="none";
		detail.style.fontSize="0.9em";
		detail.setAttribute("placeholder","세부사항");
		detail.setAttribute("name","detail");
		
		//객체에 삽입
		var addaward =document.getElementById('addaward');
		addaward.appendChild(tr);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		td1.appendChild(startday);
		td1.appendChild(endday);
		td2.appendChild(activity);
		td3.appendChild(detail);
		td3.appendChild(spanx);
	}
	
	//링크 추가 이벤트
	document.getElementById('btnaddlink').onclick=function(){
		//객체 생성
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		var link=document.createElement("input");
		var spanx=document.createElement("span");
		
		//객체 속성,css지정
		spanx.setAttribute("class","glyphicon glyphicon-remove");
		tr.setAttribute("width","200px");
		link.style.border="none";
		link.style.fontWeight="bold";
		link.setAttribute("placeholder","http://");
		link.style.minWidth="500px";
		
		//객체에 삽입
		var addlink =document.getElementById('addlink');
		link.setAttribute("name","link");
		addlink.appendChild(tr);
		tr.appendChild(td1);
		tr.appendChild(td2);
		td1.appendChild(link);
		td2.appendChild(spanx);
	}
	
	//외국어 추가 이벤트
	document.getElementById('btnaddfore').onclick=function(){
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		
		//객체를 생성하고, option값을 select 에 삽입
		var fore=["영어","중국어 북경어","중국어 광동어","일본어","한국어","독일어","스페인어","프랑스어","네덜란드어","노르웨이어","덴마크어"];
		var level=["유창","비지니스회화","일상회화"];
		
		var sel1=document.createElement("select");
		sel1.setAttribute("width","100px");
		sel1.setAttribute("name","lang");
		fore.forEach(function(elt, i, array) {
			var block=document.createElement("option");
			block.setAttribute("value",elt);
			block.innerHTML=elt;
			sel1.appendChild(block);
			
		});
		
		var sel2=document.createElement("select");
		sel2.setAttribute("width","100px");
		sel2.setAttribute("name","level");
		level.forEach(function(elt, i, array) {
			var block=document.createElement("option");
			block.setAttribute("value",elt);
			block.innerHTML=elt;
			sel2.appendChild(block);
			
				
		});
		
		var span=document.createElement("span");
		span.setAttribute("class","glyphicon glyphicon-remove");
		
		//스타일 지정
		sel1.setAttribute("class","sel");
		sel2.setAttribute("class","sel");
		
		//객체 삽입
		document.getElementById('selfore').appendChild(tr);
		tr.appendChild(td1);
		tr.appendChild(td2);
		td1.appendChild(sel1);
		td1.appendChild(sel2);
		td2.appendChild(span);
	}

}	

//글자수 세어주는 함수
function calc(){
	document.getElementById('result').value=document.getElementById('content').value.length;
	document.getElementById('b_result').innerHTML=document.getElementById('content').value.length+"자 작성했습니다!";
}

//스킬 검색
//컬럼명은 skill_name
function searchskill() {
	var autoInput=document.getElementById('myInput').value;
	//alert(autoInput);
	 $.ajax({
		type:"get",
		url:"http://api.dataatwork.org/v1/skills/normalize?skill_name="+autoInput,
		dataType:"json",
		success:function(data){
			$.each(data, function(i, elt) {
				skills[i]=elt.skill_name;
			});
			autocomplete(document.getElementById("myInput"), skills); 
			
		}


});
}

//삭제 이벤트
$(document).on("click",".glyphicon-remove",function(e){
	var spanx=e.target;
	var tr=spanx.parentNode.parentNode;
	tr.parentNode.removeChild(tr);
});

//자동 완성 기능
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
              b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
      x[i].parentNode.removeChild(x[i]);
    }
  }
}
/*execute a function when someone clicks in the document:*/
document.addEventListener("click", function (e) {
    closeAllLists(e.target);
});
}

</script>
</head>
<body>
<div class="addresume_entire">
<form action="insertresume" method="post">
<c:set var="user_id"><sec:authentication property="principal.user.id"/></c:set>
<input type="hidden" name="user_id" value="${user_id }">
<br><br>
<h5><sec:authentication property="principal.username"/></h5>
<h5><sec:authentication property="principal.user.email"/></h5>
<h5><sec:authentication property="principal.user.hp"/></h5>
<br><br><br>
<div class="intro">
<h5>간단 소개글</h5>
<hr>
<div class="explanation">
	<h6>• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요. </h6>
	<h6>• 3~5줄로 요약하여 작성하는 것을 추천합니다! </h6>
</div>
<textarea class="intro" name="intro" onkeyup="calc()" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요.(3~5줄 권장)"  style="width: 800px;height: 200px;border: none" id="content"></textarea>
</div>
<br><br>

<div class="carer">
<h5>경력</h5>
<hr>
<div class="explanation">
	<h6>• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요.  </h6>
	<h6>• 경력사항이 없는 경우 '신입'으로 작성해주세요. </h6>
	<h6>• 업무 성과는 되도록 구체적인 숫자 혹은 %로 표현해주세요!</h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddcarer">+ 추가</button>
<br><br>
<table id="addcarer">
	<tr>
		<td>
			<input name="c_startday" class="day" placeholder="YYYY-MM" maxlength="7">
			<input name="c_endday" class="day" placeholder="YYYY-MM" maxlength="7">
		</td>
		<td>
			<input name="company" placeholder="회사명" style="border: none;font-weight: bold;">
		</td>
		<td>
			<input placeholder="부서명/직책" name="department" style="border: none;font-size: 0.9em;">
			<span class="glyphicon glyphicon-remove"></span>
		</td>
	</tr>
</table>
<div style=""></div>
</div>
<br><br>

<div class="edu">
<h5>학력</h5>
<hr>
<div class="explanation">
	<h6>• 최신순으로 작성해주세요. </h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddedu">+ 추가</button>
<table id="addedu">
	<tr>
		<td>
			<input name="e_startday" class="day" placeholder="YYYY-MM" maxlength="7">
			<input name="e_endday" class="day" placeholder="YYYY-MM" maxlength="7">
		</td>
		<td>
			<input name="school" placeholder="학교명" style="border: none;font-weight: bold;">
		</td>
		<td>
			<input placeholder="전공 및 학위" name="major" style="border: none;font-size: 0.9em;">
			<span class="glyphicon glyphicon-remove"></span>
		</td>
	</tr>
</table>
</div>
<br><br>

<div class="skill" id="skill">
<h5>스킬</h5>
<hr>
<div class="explanation">
	<h6>• 개발 스택, 디자인 툴, 마케팅 툴 등 가지고 있는 직무와 관련된 스킬을 추가해보세요.</h6>
	<h6>• 데이터 분석 툴이나 협업 툴 등의 사용해본 경험이 있으신 툴들도 추가해보세요.</h6>
</div>
<br><br>

  <div class="autocomplete" style="width:300px;">
	<input type="text" style="border: none;" placeholder="보유 스킬을 검색해주세요" id="myInput" onkeyup="searchskill()">
 </div>
 <button type="button" class="btn btn-info" id="btnskilladd">추가</button><br><br>
</div>
<br><br><br>

<div class="award" id="award">
<h5>수상 및 기타</h5>
<hr>
<div class="explanation">
	<h6>• 수상 이력, 직무 관련 자격증, 수료한 교육이나 참석한 외부활동 등이 있다면 간략히 작성해주세요.</h6>
	<h6>• 지원하는 회사에서 요구하는 경우가 아니라면 운전면허증과 같은 자격증은 생략하는 것이 좋습니다!</h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddaward">+ 추가</button>
<table id="addaward">
	<tr>
		<td>
			<input name="a_startday" class="day" placeholder="YYYY-MM" maxlength="7">
			<input name="a_endday" class="day" placeholder="YYYY-MM" maxlength="7">
		</td>
		<td>
			<input name="activity" placeholder="활동명" style="border: none;font-weight: bold;">
		</td>
		<td>
			<input placeholder="세부사항" name="detail" style="border: none;font-size: 0.9em;">
			<span class="glyphicon glyphicon-remove"></span>
		</td>
	</tr>
</table>
</div>
<br><br>

<div class="fore" id="fore">
<h5>외국어</h5>
<hr>
<div class="explanation">
	<h6>• 외국어 자격증을 보유한 경우 작성해주세요. </h6>
	<h6>• 활용 가능한 외국어가 있다면, 어느정도 수준인지 레벨을 선택해주세요.</h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddfore">+ 추가</button>
<table id="selfore">
	<tr>
		<td>
			<select width="100" name="lang" class="sel">
				<c:forEach var="lang" items="${lang }">
					<option value="${lang }">${lang }</option>
				</c:forEach>
			</select>
			<select width="100" name="level" class="sel">
				<c:forEach var="level" items="${level }">
					<option value="${level }">${level }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<span class="glyphicon glyphicon-remove"></span>
		</td>
	</tr>
</table>
</div>
<br><br>

<div class="link" id="link">
<h5>링크</h5>
<hr>
<div class="explanation">
	<h6>• 깃헙, 노션으로 작성한 포트폴리오, 구글 드라이브 파일 등 업무 성과를 보여줄 수 있는 링크가 있다면 작성해주세요.</h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddlink">+ 추가</button>
<table id="addlink"></table>
</div>
<div class="resume-toolbar" style="position: fixed; bottom: 10px;left: 1300px;">
		<progress max="1000" value="0" id="result" style="height: 20px;"></progress>
		<br>
		<i class="fab fa-angellist" style="color: #7AACBF;font-size: 1.2em;"></i>
		<span id="b_result" style="margin-right: 20px;font-size: 0.8em;"></span>
</div>
<div class="botton" style="position: fixed; bottom: 10px;right: 100px;">
   <button type="submit" class="submit_resume" >작성 완료</button>
</div>
</form>
</div>
</body>
</html>