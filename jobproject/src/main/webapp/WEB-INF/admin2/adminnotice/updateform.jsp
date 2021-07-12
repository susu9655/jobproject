<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

 

    <!-- Custom styles for this template-->
    <link href="/acss/sb-admin-2.min.css" rel="stylesheet">
    <style type="text/css">
    		div.updatenotice {
    		position: absolute;
    		top: 200px;
    		left:400px;  	
    		border: 2px solid black;
    		border-radius:5px;
    		padding: 2em;
    		background-color: white;
    		color:black;
    	}
    	
    	
    	#btnlogout {
	text-align: left;
	width: 130px;
	background-color: #021B80; 
	color:white;
	border-radius: 5px;" 
		
	
	}
     
    </style> 
</head>


<body id="page-top">

 
    <!-- Page Wrapper -->
    <div id="wrapper">

 
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

 
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
                <img class="img-profile rounded-circle" src="/img/p.png" style="width:50px;">
                <div class="sidebar-brand-text mx-3">+Job</div>   
           </a>

 

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">

                <a class="nav-link" href="/admin2/adminnotice/list">

                    <i class="fas fa-user-cog"></i>

                    <span>관리자페이지</span></a>

            </li>

            <!-- Divider -->

            <hr class="sidebar-divider">

            

             <!-- Heading -->

            <div class="sidebar-heading">

            </div>

 

            <!-- Nav Item - Pages Collapse Menu -->
               <li class="nav-item">
                <button type="button" 
                id="btnlogout"
                data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo"
                    onclick="location.href='/adminlogout'">
                  <i class="fas fa-sign-out-alt"></i>
                    <span>로그아웃</span></button>
                </a>
            </li>
            

            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminnotice/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-exclamation"></i>
                    <span>공지관리</span>
                </a>
            </li>

            

              <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminmember/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                   <i class="fas fa-users-cog"></i>
                    <span>회원관리</span>
                </a>
            </li>

            

               <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminmember/elist" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-users"></i>
                    <span>기업회원관리</span>
                </a>
            </li>
            
             <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/admingonggo/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-users"></i>
                    <span>채용공고관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminreview/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-edit"></i>
                    <span>기업리뷰관리</span>
                </a>
            </li>
              

           

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

 

                <!-- Topbar -->

                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

 

                    <!-- Sidebar Toggle (Topbar) -->

                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

 


                <!-- Begin Page Content -->

                <div class="container-fluid">

 

                    <!-- Page Heading -->

              <div class="updatenotice">

                    <form action="update" method="post" enctype="multipart/form-data">
                    	<!-- hidden -->
						<input type="hidden" name="num_n" value="${dto.num_n}">
				
						
				
						
                    

                    		<h2 style="color:black;"><b>공지글 수정</b></h2>
           						<br>
                    
									<b style="font-size: 1.3em;color:black;margin-right: 20px;">카테고리</b>
                    			<b><select name="category" required="required" value="${dto.category}" 
                    				style="font-size: 1.2em;color:black;">
									<option value="공지">공지</option>
									<option value="안내">안내</option>
									<option value="기타">기타</option>
									<option value="이벤트">이벤트</option>	
								</select></b>	
								<br><br>
                    			<b style="font-size: 1.2em;color:black;">작성자</b><input type="text" name="writer" 
                    			 class="form-control"  required="required"  value="${dto.writer}" style="width:150px;" >
                   					<br>
                   					
                   					<b>제목</b>
									<input type="text" name="subject" value="${dto.subject}"
									class="form-control" required="required"  >
								<b>사진</b>
								
									<input type="file" name="upload" class="form-control">		
								
									<b>내용</b>
						
									<textarea name="content" class="form-control"
									required="required" style="width: 450px;height: 100px;">${dto.content}</textarea>
								<br>
								
									<button type="submit"
									style="width: 120px;font-size: 1em;font-weight: bold;margin-left: 80px;
									border-radius: 5px;background-color: #021B80;color:white;"
									onclick="alert('수정되었습니다.')">글수정</button>
				
									<button type="button"
									style="width: 120px;font-size: 1em;font-weight: bold;
									border-radius: 5px;background-color: #021B80;color:white;"
									onclick="history.back()">이전</button>
									
									
								
							
                    </form>
                </div>
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