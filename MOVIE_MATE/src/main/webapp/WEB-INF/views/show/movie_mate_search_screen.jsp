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
<link rel="stylesheet"
	href="/mate/resources/css/search_screen.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css?ver=1" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<script>
	// content버튼 클릭 시 keyword에 해당하는 cast, movie정보 가져오기
	function content() {
		//Ajax
		var url = "movie_mate_search_content.do";
		var param = "keyword=" + keyword;
		//url과 파람을 보냄
		//보낸 결과를 자동으로 받기위해 callback메서드 만들기
		sendRequest(url, param, resultFn, "GET");
	}
	//중복체크 버튼 클릭 후 자동으로 호출되는 콜백 메서드
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			let data = xhr.responseText;

			let json = (new Function('return' + data))();

		}
	}
	 function choice_screen(idx) {
			location.href = "movie_mate_choice_screen.do?movie_idx=" + idx;
	}
</script>
<script>
//콘텐츠와 유저 셀렉트
$(document).ready(function() {
	$("#search_user_result").hide();
	$('#empty_search_user_result').hide();
	
    $("#userBtn").click(function() {
        $("#search_movie_result").hide();
        $("#search_user_result").show();
		$('#empty_search_movie_result').hide();
        $('#empty_search_user_result').show();
        $('#movie_box').hide();
    });
    $("#contentBtn").click(function(){
    	$("#search_user_result").hide();
    	$('#empty_search_user_result').hide();
    	$("#search_movie_result").show();
    	$('#empty_search_movie_result').show();
    	$('#movie_box').show();
    })
});

</script>
</head>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<div class="search_result">"${keyword}"의 검색결과</div>
	<hr>
	<%-- 콘텐츠, 유저 버튼--%>
	<ul class="nav nav-underline">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" id="contentBtn"
				href="#">콘텐츠</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="userBtn" href="#">유저</a>
		</li>
	</ul>
	<hr>
	<%-- 검색결과 없을때 출력 --%>
	<div id="empty_search_movie_result">
		<c:if test="${empty search_movie}">"${keyword}"의 단어가 포함된 콘텐츠 정보를 찾지 못했습니다.</c:if>
	</div>
	<div id="empty_search_user_result">
		<c:if test="${empty search_user}">"${keyword}"의 단어가 포함된 유저 정보를 찾지 못했습니다.</c:if>
	</div>

	<%-- 콘텐츠 검색결과 출력 --%>
	<div id="search_movie_result" class="carousel slide">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="row item">
					<c:forEach var="i" begin="0" end="5">
						<c:if test="${not empty search_movie[i]}">
							<div class="movieInfo_box col-2"
								onclick="choice_screen(${search_movie[i].movie_idx});">
								<form>
									<div class="img_box">
										<c:choose>
											<c:when
												test="${search_movie[i].profile_img eq 'no_data.jpg'}">
												<img class="profile_img" alt="${search_movie[i].title}"
													src="/mate/resources/images/no_data.png">
											</c:when>
											<c:when test="${empty search_movie[i].profile_img}">
												<img class="profile_img" alt="${search_movie[i].title}"
													src="/mate/resources/images/no_data.png">
											</c:when>
											<c:otherwise>
												<img class="profile_img" alt="${search_movie[i].title}"
													src="${search_movie[i].profile_img}">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="movie_info_text_box">
										<div class="fw-bold info">${search_movie[i].title}</div>
										<div class="info">${fn:substring(search_movie[i].release_date,0,4)}•${search_movie[i].nation}</div>
										<div class="info">평균★${search_movie[i].star_score}</div>
									</div>
								</form>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<c:forEach var="index" begin="1" end="${slide_page}">
				<div class="carousel-item">
					<div class="row item">
						<c:forEach var="i" begin="${index * 6}" end="${index * 6 + 5}">
							<c:if test="${not empty search_movie[i]}">
								<div class="movieInfo_box col-2"
									onclick="choice_screen(${search_movie[i].movie_idx});">
									<form>
										<div class="img_box">
											<c:choose>
												<c:when
													test="${search_movie[i].profile_img eq 'no_data.jpg'}">
													<img class="profile_img" alt="${search_movie[i].title}"
														src="/mate/resources/images/no_data.png">
												</c:when>
												<c:when test="${empty search_movie[i].profile_img}">
													<img class="profile_img" alt="${search_movie[i].title}"
														src="/mate/resources/images/no_data.png">
												</c:when>
												<c:otherwise>
													<img class="profile_img" alt="${search_movie[i].title}"
														src="${search_movie[i].profile_img}">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="movie_info_text_box">
											<div class="fw-bold info">${search_movie[i].title}</div>
											<div class="info">${fn:substring(search_movie[i].release_date,0,4)}•${search_movie[i].nation}</div>
											<div class="info">평균★${search_movie[i].star_score}</div>
										</div>
									</form>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		<input type="button" class="carousel-control-prev"
			data-bs-target="#search_movie_result" data-bs-slide="prev" value="〈" />
		<input type="button" class="carousel-control-next"
			data-bs-target="#search_movie_result" data-bs-slide="next" value="〉" />
	</div>

	<%-- 유저 검색결과 출력 --%>
	<c:if test="${not empty search_user}">
		<div id="search_user_result">
			<c:forEach var="user" items="${search_user}">
				<img alt="" src="${user.profile_img }">
				<p>${user.username}</p>
			</c:forEach>
			<div id="cast_list" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="row">
							<c:forEach var="i" begin="0" end="8">
								<c:if test="${not empty search_user[i]}">
									<div class="movieInfo_box col-4">
										<form class="box">
											<div class="movieInfo_box_2"
												onclick="choice_screen(${search_user[i].user_idx});">
												<div class="img_box_2">
													<c:choose>
														<c:when
															test="${search_user[i].profile_img eq 'no_data.jpg'}">
															<img class="profile_img_2" alt=""
																src="/mate/resources/images/no_data.png">
														</c:when>
														<c:when test="${empty search_user[i].profile_img}">
															<img class="profile_img_2" alt=""
																src="/mate/resources/images/no_data.png">
														</c:when>
														<c:otherwise>
															<img class="profile_img_2" alt=""
																src="${search_user[i].profile_img}">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="info_box_2">
													<div class="fw-bold info_2">${search_user[i].username}</div>
												</div>
											</div>
										</form>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:forEach var="index" begin="1" end="${movie_page}">
						<div class="carousel-item">
							<div class="row">
								<c:forEach var="i" begin="${index * 9 }" end="${index * 9 + 8}">
									<div class="movieInfo_box col-4">
										<form>
											<div class="cast_info">
												<div class="movieInfo_box_2"
													onclick="choice_screen(${search_movie[i].movie_idx});">
													<div class="img_box_2">
														<img class="profile_img_2" alt="${search_movie[i].title}"
															src="${search_movie[i].profile_img }">
													</div>
													<div class="info_box_2">
														<div class="fw-bold info_2">${search_movie[i].title}</div>
														<div class="info_3">${fn:substring(search_movie[i].release_date,0,4)}
															• ${search_movie[i].nation}</div>
														<%-- <div class="info">평균★${search_movie[i].star_score}</div> --%>
													</div>
												</div>
											</div>
										</form>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
				<input type="button" class="carousel-control-prev"
					data-bs-target="#cast_list" data-bs-slide="prev" value="〈" />
				<input type="button" class="carousel-control-next"
					data-bs-target="#cast_list" data-bs-slide="next" value="〉" />
			</div>
		</div>
	</c:if>
	<hr>
	<%-- 영화 검색결과 출력 --%>
	<c:if test="${not empty search_movie }">
		<div id="movie_box">
			<div id="cast_list" class="carousel slide">
				<div class="carousel-inner">
					<div class="head_title">영화</div>
					<div class="carousel-item active">
						<div class="row">
							<c:forEach var="i" begin="0" end="8">
								<c:if test="${not empty search_movie[i]}">
									<div class="movieInfo_box col-4">
										<form class="box">
											<div class="movieInfo_box_2"
												onclick="choice_screen(${search_movie[i].movie_idx});">
												<div class="img_box_2">
													<c:choose>
														<c:when
															test="${search_movie[i].profile_img eq 'no_data.jpg'}">
															<img class="profile_img_2" alt="${search_movie[i].title}"
																src="/mate/resources/images/no_data.png">
														</c:when>
														<c:when test="${empty search_movie[i].profile_img}">
															<img class="profile_img_2" alt="${search_movie[i].title}"
																src="/mate/resources/images/no_data.png">
														</c:when>
														<c:otherwise>
															<img class="profile_img_2" alt="${search_movie[i].title}"
																src="${search_movie[i].profile_img}">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="info_box_2">
													<div class="fw-bold info_2">${search_movie[i].title}</div>
													<div class="info_3">${fn:substring(search_movie[i].release_date,0,4)}•${search_movie[i].nation}</div>
												</div>
											</div>
										</form>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:forEach var="index" begin="1" end="${movie_page}">
						<div class="carousel-item">
							<div class="row">
								<c:forEach var="i" begin="${index * 9 }" end="${index * 9 + 8}">
									<div class="movieInfo_box col-4">
										<form>
											<div class="cast_info">
												<div class="movieInfo_box_2"
													onclick="choice_screen(${search_movie[i].movie_idx});">
													<div class="img_box_2">
														<img class="profile_img_2" alt="${search_movie[i].title}"
															src="${search_movie[i].profile_img }">
													</div>
													<div class="info_box_2">
														<div class="fw-bold info_2">${search_movie[i].title}</div>
														<div class="info_3">${fn:substring(search_movie[i].release_date,0,4)}•${search_movie[i].nation}</div>
														<%-- <div class="info">평균★${search_movie[i].star_score}</div> --%>
													</div>
												</div>

											</div>
										</form>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
				<input type="button" class="carousel-control-prev"
					data-bs-target="#cast_list" data-bs-slide="prev" value="〈" />
				<input type="button" class="carousel-control-next"
					data-bs-target="#cast_list" data-bs-slide="next" value="〉" />
			</div>
		</div>
	</c:if>
	<footer style="height: 100px;"> </footer>
	<footer>
		<%@ include file="/resources/jsp/footer.jsp"%>
	</footer>

</body>
</html>
