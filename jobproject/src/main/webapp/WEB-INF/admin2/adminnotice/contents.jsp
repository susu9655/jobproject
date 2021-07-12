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
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/acss/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
#noticecontent {
	position: absolute;
	top: 100px;
	left: 400px;
	background-color: "white"; 
	width: 800px;
	border:1px solid black;
}

#btnlogout {
	text-align: left;
	width: 130px;
	background-color: #021B80;
	color: white;
	border-radius: 5px;
	"
}

#btn {
	width: 80px;
	background-color: #021B80;
	color: white;
	border-radius: 5px;
	
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

			<li class="nav-item active"><a class="nav-link" href="/admin2/adminnotice/list"> <i
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
					<span>공지관리</span>
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
				aria-controls="collapseTwo"> <i class="fas fa-edit"></i> <span>기업리뷰관리</span>
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
				<div class="container-fluid">


					<table class="table table-bordered" id="noticecontent"
					bgcolor="white">

						<tr>
							<td><b style="font-size: 1.5em;">${dto.subject}</b> <span
								style="color: gray; float: right;"> <fmt:formatDate
										value="${dto.writeday}" pattern="yyyy-MM-dd" />
							</span></td>
						</tr>
						<tr>
							<td>카테고리:<b style="margin-right: 20px;">${dto.category}</b>작성자:<b>${dto.writer}</b>
								<span style="float: right;">조회 ${dto.viewcount}</span>
							</td>
						</tr>
						<tr>
							<td align="center">${dto.content} <br>
							<br> 
									<img src="/noticephoto/${dto.photo}" style="
									max-width: 500px;"onerror="this.src='/noticephoto/+job.png'">
				
								
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" id="btn" style="margin-left: 200px;"
									onclick="location.href='addform'">글쓰기</button>



								<button type="button" id="btn"
									onclick="javascript:updateConfirm()">수정</button>

								<button type="button" id="btn"
									onclick="javascript:deleteConfirm()"
									>삭제</button>

								<button type="button" id="btn" onclick="location.href='list'">목록</button>
							</td>
						</tr>
					</table>

			
				</div>
				<script type="text/javascript">
				function deleteConfirm(){
					var isDelete=confirm("삭제하시겠습니까?");
					if(isDelete){
						location.href='delete?num_n=${dto.num_n}'
							alert("삭제되었습니다")
						}
					}

				function updateConfirm(){
					var isUpdate=confirm("수정하시겠습니까?");
					if(isUpdate){
						location.href='updateform?num_n=${dto.num_n}'
							
						}
					}

				</script>
				
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<!-- Bootstrap core JavaScript-->


	<script src="<c:url value="/vendor/jquery/jquery.min.js" />">
<script src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js" />">

    <!-- Core plugin JavaScript-->
   <script src="<c:url value="/vendor/jquery-easing/jquery.easing.min.js" />">

    <!-- Custom scripts for all pages-->
  <script src="<c:url value="/js/sb-admin-2.min.js" />">

</body>

</html>