<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>

<!-- <h1> 마이 페이지 화면 </h1> -->
<header>
   <%@ include file="/resources/jsp/header.jsp"%>
</header>

<div >
   <img  src="/mate/resources/images/photo.png">
</div>

<div  >
   <img  src="/mate/resources/images/user.png">
</div>

<div class="name"> ${ username } </div>


<div class="card" style="width: 20rem; height: 20rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><a href="#" class="btn btn-primary"></a>영화</h5>
    <p class="card-text"></p>
    
  </div> 



</body>
</html>