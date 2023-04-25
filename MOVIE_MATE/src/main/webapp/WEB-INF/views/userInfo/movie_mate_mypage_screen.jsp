<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.back {
	display:block;
	  padding-top: 100px;
      margin: 0 auto;
      width: 850px;		
}

.user {border: 5px solid black;
border-radius:50%;
position:absolute;
position-top: 300px;
position-left:-500px;
}

</style>
</head>
<body>

<!-- <h1> 마이 페이지 화면 </h1> -->
<header>
   <%@ include file="/resources/jsp/header.jsp"%>
</header>

<div >
   <img class="back" src="/mate/resources/images/photo.png">
</div>

<div  >
   <img class="user" src="/mate/resources/images/user.png">
</div>
<div>${ username }</div>

<div class="card" style="width: 20rem; height: 20rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><a href="#" class="btn btn-primary"></a>영화</h5>
    <p class="card-text"></p>
    
  </div>
</div>


</body>
</html>