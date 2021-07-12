<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="entire">
<div class="nav">
	<tiles:insertAttribute name="nav"/>
</div>
<div class="body">
	<tiles:insertAttribute name="body"/>
</div>
<div class="footer">
	<tiles:insertAttribute name="footer"/>
</div>
</div>
</body>
</html>