<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon" href="/mate/resources/images/logo_icon_1.png" />
<title>무비메이트</title>
<link rel="stylesheet" href="/mate/resources/css/mainScreen.css?ver=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>



</head>
<script type="text/javascript">
    function choice_screen(idx) {
	location.href = "movie_mate_choice_screen.do?movie_idx=" + idx;
    }
</script>
<body>
	<!--<h1>메인 스크린 화면</h1>  -->
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<c:forEach var="map" items="${ total_chart }" varStatus="status">
		<div id="${map.key}" class="carousel slide">
			<div class="carousel-inner">
				<div class="title">${total_chart_name.get(map.key)}</div>
				<div class="carousel-item active">
					<c:forEach var="i" begin="0" end="4">
						<form>
							<div class="movieInfo_box" onclick="choice_screen(${map.value[i].movie_idx});">
								<div class="img_box">
									<div class="numbering">${i+1}</div>
									<img class="profile_img" alt="${map.value[i].title}" src="${map.value[i].profile_img }">
								</div>
								<div class="text_info_box">
									<div class="fw-bold info">${map.value[i].title}</div>
									<div class="info">${fn:substring(map.value[i].release_date,0,4)}•${map.value[i].nation}</div>
									<div class="info">평균★${map.value[i].star_score}</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
				<c:forEach var="index" begin="1" end="2">
					<div class="carousel-item">
						<c:forEach var="i" begin="${index * 5}" end="${index * 5 + 4}">
							<c:if test="${not empty map.value[i]}">
								<form>
									<div class="movieInfo_box" onclick="choice_screen(${map.value[i].movie_idx});">
										<div class="img_box">
											<div class="numbering">${i+1}</div>
											<img class="profile_img" alt="${map.value[i].title}" src="${map.value[i].profile_img }">
										</div>
										<div class="text_info_box">
											<div class="fw-bold info">${map.value[i].title}</div>
											<div class="info">${fn:substring(map.value[i].release_date,0,4)}•${map.value[i].nation}</div>
											<div class="info">평균★${map.value[i].star_score}</div>
										</div>
									</div>
								</form>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>

			<input type="button" class="carousel-control-prev"
				data-bs-target="#${ map.key }" data-bs-slide="prev" value="〈" />
			<input type="button" class="carousel-control-next"
				data-bs-target="#${ map.key }" data-bs-slide="next" value="〉" />
		</div>
	</c:forEach>
	<footer>
		<%@ include file="/resources/jsp/footer.jsp"%>
	</footer>



</body>
</html>


















