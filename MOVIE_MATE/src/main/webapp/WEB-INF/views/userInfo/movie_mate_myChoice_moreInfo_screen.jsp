<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_2.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_2.png" />
<title>무비메이트</title>
<link rel="stylesheet"
	href="/mate/resources/css/myChoiceMoreInfo.css?ver=1" />
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
	
<script type="text/javascript">
	function choice_screen(idx) {
		location.href = "movie_mate_choice_screen.do?movie_idx=" + idx;
	}
</script>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall">
		<hr>
	</div>
	<div id="starScore" class="carousel slide">
		<div class="carousel-inner">
			<div class="title">평가 (${fn:length(myStarScore_list)})</div>
			<div class="carousel-item active">
				<c:forEach var="i" begin="0" end="10">
					<c:if test="${not empty myStarScore_list[i]}">
						<form>
							<div class="movieInfo_box"
								onclick="choice_screen(${myStarScore_list[i].movie_idx});">
								<div class="img_box">
									<img class="profile_img" alt="${myStarScore_list[i].title}"
										src="${myStarScore_list[i].profile_img }">
								</div>
								<div class="fw-bold info">${myStarScore_list[i].title}</div>
								<div class="info gold">평가함★${myStarScore_list[i].star_score}</div>
							</div>
						</form>
					</c:if>
				</c:forEach>
			</div>
			<c:forEach var="index" begin="1" end="${maxStarPage}">
				<div class="carousel-item">
					<c:forEach var="i" begin="${index * 11}" end="${index * 11 + 10}">
						<c:if test="${not empty myStarScore_list[i]}">
							<form>
								<div class="movieInfo_box"
									onclick="choice_screen(${myStarScore_list[i].movie_idx});">
									<div class="img_box">
										<img class="profile_img" alt="${myStarScore_list[i].title}"
											src="${myStarScore_list[i].profile_img }">
									</div>
									<div class="fw-bold info">${myStarScore_list[i].title}</div>
									<div class="info gold">평가함★${myStarScore_list[i].star_score}</div>
								</div>
							</form>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<input type="button" class="carousel-control-prev star_btn"
			data-bs-target="#starScore" data-bs-slide="prev" value="&lt;" />
		<input type="button" class="carousel-control-next star_btn"
			data-bs-target="#starScore" data-bs-slide="next" value="&gt;" />
	</div>
	<hr>
	<div id="want" class="carousel slide">
		<div class="carousel-inner">
			<div class="title">보고싶어요 (${fn:length(myWant_list)})</div>
			<div class="carousel-item active">
				<c:forEach var="i" begin="0" end="9">
					<c:if test="${not empty myWant_list[i]}">
						<form>
							<div class="movieInfo_box"
								onclick="choice_screen(${myWant_list[i].movie_idx});">
								<div class="img_box">
									<img class="profile_img" alt="${myWant_list[i].title}"
										src="${myWant_list[i].profile_img }">
								</div>
								<div class="fw-bold info">${myWant_list[i].title}</div>						
							</div>
						</form>
					</c:if>
				</c:forEach>
			</div>
			<c:forEach var="index" begin="1" end="2">
				<div class="carousel-item">
					<c:forEach var="i" begin="${index * 10}" end="${index * 10 + 10}">
						<c:if test="${not empty myWant_list[i]}">
							<form>
								<div class="movieInfo_box"
									onclick="choice_screen(${myWant_list[i].movie_idx});">
									<div class="img_box">
										<img class="profile_img" alt="${myWant_list[i].title}"
											src="${myWant_list[i].profile_img }">
									</div>
									<div class="fw-bold info">${myWant_list[i].title}</div>
								</div>
							</form>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<input type="button" class="carousel-control-prev"
			data-bs-target="#want" data-bs-slide="prev" value="&lt;" />
		<input type="button" class="carousel-control-next"
			data-bs-target="#want" data-bs-slide="next" value="&gt;" />
	</div>

</body>
</html>