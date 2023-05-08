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
<title>무비메이트</title>

<style>
.content {
	display: inline;
	position: absolute;
	padding: 0px 400px;
}

span {
	display: inline-block;
	padding: 0px 150px;
	text-align: left;
}

h3 {
	display: inline-block;
	width: 200px;
	margin: 10px;
}

.info {
	padding: 0px 8px;
}

</style>
</head>
<body>
	<!-- <h1> 내가 고른 영화들 더보기 화면 </h1> -->
	<h1>기본정보</h1>
	<hr>
	<div class="content">
		<h3>원제</h3>
		<span>${movie.title}</span>
		<hr>
		<h3>개봉 연도</h3>
		<span> ${fn:split(movie.release_date, '/')[0]}</span>

		<hr>
		<h3>국가</h3>
		<span>${movie.nation} </span>
		<hr>
		<h3>장르</h3>
		<span> ${movie.genre} </span>
		<hr>
		<c:if test="${ !empty movie.running_time }">
			<h3>상영시간</h3>
			<span> ${hour}시간 ${min}분</span>
		</c:if>

		<c:if test="${empty movie.running_time}">
			<h3>상영시간</h3>
			<span> 정보 없음</span>
		</c:if>


		<hr>
		<c:if test="${ !empty movie.film_rating }">
			<h3>연령 등급</h3>
			<span> ${movie.film_rating}</span>
		</c:if>

		<c:if test="${empty movie.film_rating }">
			<h3>연령 등급</h3>
			<span> 정보 없음</span>
		</c:if>

		<hr>
		<h3>내용</h3>
		<br> <span class="info">${movie.movie_info}</span>
		<hr>
	</div>
</body>
</html>