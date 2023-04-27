<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_2.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_2.png" />
<title>무비메이트</title>
<style type="text/css">
.wall {
	height: 100px;
}

.back {
	display: block;
	margin: 0 auto;
}

.user {
	position: absolute;
	top: 290px;
	right: 60%;
	border: 3px solid black;
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

.name {
	position: absolute;
	top: 390px;
	right: 59%;
	font-weight: bold;
	font-size: x-large;
}

.card {
	position: relative;
	right: -650px;
	cursor: pointer;
}

.movie {
	text-decoration: none;
}
</style>

<script type="text/javascript">
	function myList() {
		location.href = "movie_mate_myChoice_moreInfo.do";
	}
</script>


</head>
<body>

	<!-- <h1> 마이 페이지 화면 </h1> -->
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>

	<div>
		<img class="back" src="/mate/resources/images/photo.png">
	</div>

	<div>
		<img class="user" src="/mate/resources/images/user.png">
	</div>
	<div class="wall"></div>
	<div class="name">${ userName }</div>


	<div class="card" style="width: 20rem; height: 20rem;">
		<img src="" class="card-img-top">
		<div class="card-body" onclick="myList();">
			<h5 class="card-title">영화</h5>
			<p class="card-text"></p>

		</div>
	</div>
</body>
</html>