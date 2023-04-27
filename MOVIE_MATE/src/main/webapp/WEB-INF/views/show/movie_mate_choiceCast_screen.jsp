<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/mate/resources/css/reset.css?ver=1" />
<link rel="stylesheet"
	href="/mate/resources/css/choiceCast_screen.css?ver=1" />
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon" <title>무비메이트</title>
	href="/mate/resources/images/logo_icon_1.png" />
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script>
	function isLogin() {
		var isLogin = "${isLogin}";
		if (isLogin == 'no') {
			if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href = "movie_mate_login_screen.do";
			}
			return "login_no";
		}
		return "login_yes";
	}

	function isup_clicked() {
		if (isLogin() == "login_no") {
			return;
		}
		var cast_idx = document.getElementById('cast_idx').value;
		var user_idx = document.getElementById('user_idx').value;

		var url = "cast_user_isup.do";
		var param = "cast_idx=" + cast_idx + "&user_idx=" + user_idx;

		sendRequest(url, param, resFnIsup, "GET");
	}

	function resFnIsup() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			console.log(result);
			var img = document.getElementById('isup_img');
			var box = document.getElementById('isup_li');
			var count = document.getElementById('count');
			console.log(box.style.backgroundColor);
			console.log("${isUpCount}");
			if (result == 'no') {
				img.src = "/mate/resources/images/isup_clicked.png";
				box.style.color = "black";
				count.innerText = "${isUpCount}";

			} else {
				img.src = "/mate/resources/images/isup_unclicked.png";
				box.style.color = "red";
				count.innerText = "${isUpCount + 1}";
			}

		}
	}
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
		<div class="isup_box" id="isup">
			<form>
				<input type="hidden" id="cast_idx" value="${cast_info.cast_idx}" />
				<input type="hidden" id="user_idx" value="${userIdx}" />
				<ul class="list-group list-group-flush">
					<li class="list-group-item"></li>
					<li class="isup_li list-group-item" id="isup_li"
						onclick="isup_clicked();">
						<img class="isup_img" id="isup_img"
							src="/mate/resources/images/isup_unclicked.png">
						<span> 좋아요 "</span> <span id="count">${isUpCount}</span> <span>"명이 이
							인물을 좋아합니다 </span>
					</li>
					<li class="list-group-item"></li>
				</ul>
			</form>
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
						<div class="col-1 text col1">
							<div class="wall-2"></div>
							${fn:substring(vo.release_date,0,4)}
						</div>
						<div class="col-1 text">
							<c:choose>
								<c:when test="${empty vo.profile_img}">
									<img class="title_img" alt=""
										src="/mate/resources/images/no_data.png"
										style="border: 1px solid black;">
								</c:when>
								<c:otherwise>
									<img class="title_img" src="${vo.profile_img}" alt="" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-6 text">
							<div class="wall-2"></div>
							${vo.title}
						</div>
						<div class="col-2 text col1">
							<div class="wall-2"></div>
							<c:if test="${cast_type eq 'actor' }">
								<span>배우</span>
							</c:if>
							<c:if test="${cast_type eq 'director' }">
								<span>감독</span>
							</c:if>
						</div>
						<div class="col-2 text col2">
							<div class="wall-2"></div>
							평균★${vo.star_score}
						</div>
					</div>
				</li>

			</c:forEach>
		</ul>
	</div>

	<div></div>
</html>