<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/acss/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
 $(document).ready( function () {
    $('#dataTable').DataTable();
    dom: 'iptfl'//데이터테이블위치수정기능추가
} );
 
/* jQuery(function($){
	$("#dataTable").DataTable({
		dom: 'iptfl'
		
			
			
			
			
	});
}); */

</script>
<style type="text/css">
div.dataTables_length { /* 몇개씩보여줄지결정 */
	font-size: 1.5em;
}

div.dataTables_filter { /* 검색창 */
	font-size: 1.5em;
}

table.dataTable {
	font-size: 1.2em;
}

div.dataTables_info { /* 총 갯수 */
	
}

ul.pagination { /* 페이징 */
	font-size: 1.5em;
}

#btnlogout {
	text-align: left;
	width: 130px;
	background-color: #021B80;
	color: white;
	border-radius: 5px;
	"
}

#btndel {
	width: 100%;
	float: right;
	background-color: #021B80;
	color: white;
	border-radius: 50px;
	border-style: 1px solid gray;
}

table tbody td {
	min-width: 50px;
}
</style>
</head>



<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center">
				<img class="img-profile rounded-circle" src="/img/p.png"
				style="width: 50px;">
				<div class="sidebar-brand-text mx-3">+Job</div>

			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->

			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-user-cog"></i> <span>관리자페이지</span></a></li>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading"></div>
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<button type="button" id="btnlogout" data-toggle="collapse"
					data-target="#collapseTwo" aria-expanded="true"
					aria-controls="collapseTwo" onclick="location.href='/adminlogout'">
					<i class="fas fa-sign-out-alt"></i> <span>로그아웃</span>
				</button> </a>
			</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/admin2/adminnotice/list" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-exclamation"></i>
					<span><b>공지관리</b></span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/admin2/adminmember/list" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-users-cog"></i> <span>회원관리</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/admin2/adminmember/elist" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-users"></i> <span>기업회원관리</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/admin2/admingonggo/list" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-users"></i> <span>채용공고관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="/admin2/adminreview/list" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo">  <i class="fas fa-edit"></i> </i> <span>기업리뷰관리</span>
			</a></li>



			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>


		</ul>
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Begin Page Content -->


				<!-- Page Heading -->



				<!-- DataTales Example -->
				<h2 style="margin-left: 200px; margin-top: 50px;">기업 리뷰 관리</h2>
				<br><br>
				<div class="review">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th bgcolor="#021B80" style="color: white;">번호</th>
								<th bgcolor="#021B80" style="color: white;">아이디</th>
								<th bgcolor="#021B80" style="color: white;">회사이름</th>
								<th bgcolor="#021B80" style="color: white; width: 70px;">전/현직장</th>
								<th bgcolor="#021B80" style="color: white;">직군</th>
								<th bgcolor="#021B80" style="color: white; width: 120px;">장점</th>
								<th bgcolor="#021B80" style="color: white; width: 120px;">단점</th>
								<th bgcolor="#021B80" style="color: white;">별점평균</th>
								<th bgcolor="#021B80" style="color: white;">사내문화</th>
								<th bgcolor="#021B80" style="color: white;">자기계발</th>
								<th bgcolor="#021B80" style="color: white;">근무환경</th>
								<th bgcolor="#021B80" style="color: white;">급여및복지</th>
								<th bgcolor="#021B80" style="color: white;">경영진</th>
								<th bgcolor="#021B80" style="color: white;">도움이돼요</th>
								<th bgcolor="#021B80" style="color: white;">작성일</th>
								<th bgcolor="#021B80" style="color: white;">삭제</th>




							</tr>
						</thead>
						<tfoot>
							<tr>

								<th bgcolor="#021B80" style="color: white;">번호</th>
								<th bgcolor="#021B80" style="color: white;">아이디</th>
								<th bgcolor="#021B80" style="color: white;">회사이름</th>
								<th bgcolor="#021B80" style="color: white;">전/현직장</th>
								<th bgcolor="#021B80" style="color: white;">직군</th>
								<th bgcolor="#021B80" style="color: white;">장점</th>
								<th bgcolor="#021B80" style="color: white;">단점</th>
								<th bgcolor="#021B80" style="color: white;">별점평균</th>
								<th bgcolor="#021B80" style="color: white;">사내문화</th>
								<th bgcolor="#021B80" style="color: white;">자기계발</th>
								<th bgcolor="#021B80" style="color: white;">근무환경</th>
								<th bgcolor="#021B80" style="color: white;">급여및복지</th>
								<th bgcolor="#021B80" style="color: white;">경영진</th>
								<th bgcolor="#021B80" style="color: white;">도움이돼요</th>
								<th bgcolor="#021B80" style="color: white;">작성일</th>
								<th bgcolor="#021B80" style="color: white;">삭제</th>



							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="n">
								<tr bgcolor="white" style="color:black; font-size: 1.1em;">
									<td>${n.count}</td>
									<td align="center">${dto.email}</td>
									<td align="center">${dto.empname}</td>
									<td align="center">${dto.prenow}</td>
									<td align="center">${dto.job_group}</td>
									<td align="center">${dto.good}</td>
									<td align="center">${dto.bad}</td>
									<td align="center">${dto.rating}</td>
									<td align="center">${dto.cul}</td>
									<td align="center">${dto.imp}</td>
									<td align="center">${dto.env}</td>
									<td align="center">${dto.sal}</td>
									<td align="center">${dto.ceo}</td>
									<td align="center">${dto.likes}</td>




									<td align="center"><fmt:formatDate
											value="${dto.writeday}" pattern="yyyy-MM-dd" /></td>

									<td colspan="2">
										<button type="button" id="btndel" onclick="javascript:deleteConfirm()" num="${dto.num}">삭제</button>
									</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>


				</div>
				
				<script type="text/javascript">
				function deleteConfirm(){
					var isDelete=confirm("삭제하시겠습니까?");
					var num=$("#btndel").attr("num");
					if(isDelete){
						location.href='reviewdelete?num='+num;
							alert("삭제되었습니다")
						}
					}
				</script>
				

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->




	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/vendor/jquery/jquery.min.js" />">  
	<script src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js" />">
 
    <!-- Core plugin JavaScript-->
 	<script src="<c:url value="/vendor/jquery-easing/jquery.easing.min.js" />">

    <!-- Custom scripts for all pages-->
 	<script src="<c:url value="/js/sb-admin-2.min.js" />">

    <!-- Page level plugins -->
     <script src="<c:url value="/vendor/datatables/jquery.dataTables.min.js"/> ">  
    <script src="<c:url value="/vendor/datatables/bootstrap4.min.js"/>"> 
    
      
   

    <!-- Page level custom scripts -->
  <script src="<c:url value="js/demo/chart-pie-demo.js" />"> 

</body>

</html>