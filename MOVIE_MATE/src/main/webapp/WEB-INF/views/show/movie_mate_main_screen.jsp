<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/mainScreen.css?ver=1" />
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
</head>
<body>
	<c:forEach var="map" items="${ total_chart }" varStatus="status">
		<div id="${map.key}" class="carousel slide">
			<div class="carousel-inner">
				<div class="title">${total_chart_name.get(map.key)}</div>
				<div class="carousel-item active">
					<c:forEach var="i" begin="0" end="4">
						<div class="movieInfo_box">
							<img class="profile_img" alt=""
								src="${map.value[i].profile_img }">
							<div class="fw-bold">${map.value[i].title }</div>
							<div>${map.value[i].nation }</div>
							<div>${map.value[i].genre }</div>
						</div>
					</c:forEach>
				</div>
				<c:forEach var="index" begin="1" end="5">
					<div class="carousel-item">
						<c:forEach var="i" begin="${index * 5}" end="${index * 5 + 4}">
							<div class="movieInfo_box">
								<img class="profile_img" alt=""
									src="${map.value[i].profile_img }">
								<div class="fw-bold">${map.value[i].title }</div>
								<div>${map.value[i].nation }</div>
								<div>${map.value[i].genre }</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<input type="button" class="carousel-control-prev"
				data-bs-target="#${ map.key }" data-bs-slide="prev" value="&lt;" />
			<input type="button" class="carousel-control-next"
				data-bs-target="#${ map.key }" data-bs-slide="next" value="&gt;" />
		</div>
	</c:forEach>
</body>
</html>

















