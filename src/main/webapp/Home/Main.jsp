<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

</head>
<meta charset="UTF-8">
<title>동네 축구</title>
</head>	
<style>
#bg{
    position: fixed;
    top: 0%;
    left: 0%;
    width: 55%;
    height: 55%;
    
}

#bg img{
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    min-width: 50%;
    min-height: 50%;
    
}
h1{
position: relative;
z-index: 2;
color: white;
text-align: center;
}
</style>
<body>
	
	<header>
		<jsp:include page="/layout/header.jsp" />
	</header>
	<h2>동네축구</h2>
	<div id="bg">
        <img src="../resources/img/ann.jpg" alt="시작화면 배경이미지">
    </div>
    <h1></h1>
    <h1></h1>
	<footer>
		<jsp:include page="/layout/footer.jsp" />
	</footer>
</body>
</html>