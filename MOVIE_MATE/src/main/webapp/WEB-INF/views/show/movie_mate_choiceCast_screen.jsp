<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/reset.css?ver=1" />
<link rel="stylesheet"
	href="/mate/resources/css/choiceCast_screen.css?ver=1" />
<script>
	
</script>
</head>
<body>
	<!--<h1>메인 스크린 화면</h1>  -->
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<div class="center_box">

		<div class="cast_name">${cast_name}</div>
		<div>
			<c:if test="${cast_type eq 'actor' }">
				<span class="cast_type">배우</span>
			</c:if>
			<c:if test="${cast_type eq 'director' }">
				<span class="cast_type">감독</span>
			</c:if>
		</div>

		<div class="isup_box">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"></li>
				<li class="isup_li list-group-item"><img class="isup_img"
					src="/mate/resources/images/isup_unclicked.png"> 좋아요 " "명이 이
					인물을 좋아합니다</li>
				<li class="list-group-item"></li>
			</ul>
		</div>

		<div class="movie">영화</div>


		<ul class="list-group list-group-flush">

			<li class="list-group-item"></li>
			<li class="list-group-item">
				<div class="row">
					<div class="col-2"></div>
					<div class="col-6">제목</div>
					<div class="col-2">역할</div>
					<div class="col-2">평가</div>
				</div>
			</li>




			<c:forEach var="vo" items="${movie_list}">
				<li class="list-group-item">
					<div class="row">
						<div class="col-1">${fn:substring(vo.release_date,0,4)}</div>
						<div class="col-1">
							<img class="title_img" src="${vo.profile_img}" alt="" />
						</div>
						<div class="col-6">${vo.title}</div>
						<div class="col-2">

							<c:if test="${cast_type eq 'actor' }">
								<span>배우</span>
							</c:if>
							<c:if test="${cast_type eq 'director' }">
								<span>감독</span>
							</c:if>
						</div>
						<div class="col-2">평균★${vo.star_score}</div>
					</div>
				</li>

			</c:forEach>
		</ul>
	</div>

	<div></div>
</body>
</html>