<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
	div.container {
	
		width: 500px;
	
	}
	
	</style>


</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        
                                <div class="p-5">
                                    <div class="text-center">
                                    <img class="img-profile rounded-circle"
                                    src="/img/p.png"
                                    style="width:50px;">
                                    	 <h1 class="h1 text-gray-900 mb-4"><b>+Job</b> 관리자 로그인</h1>
                                        <h1 class="h4 text-gray-900 mb-4">관리자만 로그인이 가능합니다</h1>
                                    </div>
                                    
                                    
                                    <form class="user" action="adminloginprocess" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputId" style="font-size: 1.3em;"
                                                placeholder="아이디" name="id" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" style="font-size: 1.3em;"
                                                placeholder="비밀번호" name="pass" required>
                                        </div>
        
                                        <button type="submit" class="btn btn-primary btn-user btn-block"
                                        style="font-size: 1.3em;">로그인</button>   
                                                                                                
                                    </form>
                                </div>         
                            </div>                           
                        </div>                         
                    </div>                    
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
    

</body>

</html>