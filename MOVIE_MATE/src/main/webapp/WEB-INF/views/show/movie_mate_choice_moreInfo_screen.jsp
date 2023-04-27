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
</head>
<body>
	<!-- <h1> 내가 고른 영화들 더보기 화면 </h1> -->
	<h1>기본정보</h1>
	<hr>

	<h3>원제 : ${movie.title}</h3>
	<hr>
	<h3>개봉 연도 : ${fn:split(movie.release_date, '/')[0]}</h3>

	<hr>
	<h3>국가 : ${movie.nation}</h3>
	<hr>
	<h3>장르 : ${movie.genre}</h3>
	<hr>
	<c:if test="${ !empty movie.running_time }">
		<h3>상영시간 : ${hour}시간 ${min}분</h3>
	</c:if>

	<c:if test="${empty movie.running_time}">
		<h3>상영시간 정보 없음</h3>
	</c:if>


	<hr>
	<c:if test="${ !empty movie.film_rating }">
		<h3>연령 등급 : ${movie.film_rating}</h3>
	</c:if>

	<c:if test="${empty movie.film_rating }">
		<h3>연령 등급 정보 없음</h3>
	</c:if>

	<hr>
	<h3>내용 : ${movie.movie_info}</h3>
	<hr>
</body>
</html>