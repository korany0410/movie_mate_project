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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
  	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
   integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
   integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
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
			var yesOrNo = result.split("/")[0];
			var isup_count = result.split("/")[1];
			var box = document.getElementById('isup_li');
			var count = document.getElementById('count');
			var icon = document.getElementById('like_icon');

			if (yesOrNo == 'no') {
				box.style.color = "black";
				count.innerText = isup_count;
				icon.className = "bx bx-like";
			} else {
				box.style.color = "#7900FF";
				count.innerText = isup_count;
				icon.className = "bx bxs-like";
			}

		}
	}

	function choice_screen(idx) {
		location.href = "movie_mate_choice_screen.do?movie_idx=" + idx;
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
		<div class="cast_type">
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

					<c:choose>
						<c:when test="${empty user_castInfo}">
							<li class="isup_li list-group-item" id="isup_li"
								onclick="isup_clicked();">
								<i id="like_icon" class='bx bx-like'></i>
								<span> 좋아요 </span>
								<span id="count">${isUpCount}</span>
								<span>명이 이 인물을 좋아합니다 </span>
							</li>
						</c:when>
						<c:when test="${user_castInfo.isUp eq 'no' }">
							<li class="isup_li list-group-item" id="isup_li"
								onclick="isup_clicked();">
								<i id="like_icon" class='bx bx-like'></i>
								<span> 좋아요 </span>
								<span id="count">${isUpCount}</span>
								<span>명이 이 인물을 좋아합니다 </span>
							</li>
						</c:when>
						<c:otherwise>
							<li style="color: #7900ff;" class="isup_li list-group-item"
								id="isup_li" onclick="isup_clicked();">
								<i id="like_icon" class='bx bxs-like'></i>
								<span> 좋아요 </span>
								<span id="count">${isUpCount}</span>
								<span>명이 이 인물을 좋아합니다 </span>
							</li>
						</c:otherwise>
					</c:choose>
					<li class="list-group-item"></li>
				</ul>
			</form>
		</div>
		<div class="movie">영화</div>
		<div class="movie_list_box">
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
					<li class="list-group-item movie_list"
						onclick="choice_screen('${vo.movie_idx}')">
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
	</div>

	<div></div>
	 <footer>
      <%@ include file="/resources/jsp/footer.jsp"%>
   	</footer>
</html>