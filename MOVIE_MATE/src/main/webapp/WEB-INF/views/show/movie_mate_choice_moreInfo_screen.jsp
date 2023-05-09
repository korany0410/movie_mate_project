<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_1.png" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
	crossorigin="anonymous"></script>

<title>무비메이트</title>

<style>
.content {
	width: 65vw;
	margin: 0 auto;
}

.more_span {
	display: inline-block;
	padding: 0px 150px;
	text-align: left;
}

.more_h3 {
	display: inline-block;
	width: 200px;
	margin: 10px;
}

.more_info {
	padding: 0px 8px;
}

.more_h3 {
	font-size: 22px !important;
	font-weight: bold;
}

.bx:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- <h1> 내가 고른 영화들 더보기 화면 </h1> -->
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div style="height: 100px;"></div>
	<i class='bx bx-arrow-back' style="font-size: 25px; color: #7900ff;" onclick="javascript:history.go(-1);"></i>
	<br>
	<h1 style="font-weight: bold; margin-top: 15px;">기본정보</h1>
	<hr>
	<div class="content">
		<h3 class="more_h3">원제</h3>
		<span class="more_span">${movie.title}</span>
		<hr>
		<h3 class="more_h3">개봉 연도</h3>
		<span class="more_span"> ${fn:split(movie.release_date, '/')[0]}</span>
		<hr>
		<h3 class="more_h3">국가</h3>
		<span class="more_span">${movie.nation} </span>
		<hr>
		<h3 class="more_h3">장르</h3>
		<span class="more_span"> ${movie.genre} </span>
		<hr>
		<c:if test="${ !empty movie.running_time }">
			<h3 class="more_h3">상영시간</h3>
			<span class="more_span"> ${hour}시간 ${min}분</span>
		</c:if>

		<c:if test="${empty movie.running_time}">
			<h3 class="more_h3">상영시간</h3>
			<span class="more_span"> 정보 없음</span>
		</c:if>


		<hr>
		<c:if test="${ !empty movie.film_rating }">
			<h3 class="more_h3">연령 등급</h3>
			<span class="more_span"> ${movie.film_rating}</span>
		</c:if>

		<c:if test="${empty movie.film_rating }">
			<h3 class="more_h3">연령 등급</h3>
			<span class="more_span"> 정보 없음</span>
		</c:if>

		<hr>
		<h3 class="more_h3">내용</h3>
		<br> <span class="more_info">${movie.movie_info}</span>
		<hr>
	</div>
	<div style="height: 150px;"></div>
	<footer>
		<%@ include file="/resources/jsp/footer.jsp"%>
	</footer>
</body>
</html>