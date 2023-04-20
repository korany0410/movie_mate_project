<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/choiceScreen.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
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
    function setStarScore(i) {
	var score = document.getElementById('starpoint_' + i);
	var isLogin = "${isLogin}";
	if(isLogin == 'no'){
	    if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
			location.href="movie_mate_login_screen.do";
			console.log("a");
	    }
	}
	console.log(isLogin);
	console.log(score.value);
    }
    window.onload = function() {
	var isLogin = "${isLogin}";
	var comment_box1 = document.getElementById('comment_1');
	if(isLogin == 'no'){
		comment_box1.style.display = "block";
	}
		console.log("a");
    }
</script>
</head>
<body>
	<div class="main_box">
		<div class="first_box">
			<div class="thumbnailImg_box row">
				<div class="left col-6"></div>
				<div class="right col-6"></div>
			</div>
			<div class="movieTitle_box ">
				<div class="title_box">
					<div class="main_img">
						<img class="title_img" src="${movie_info.profile_img}" alt="" />
					</div>
					<div class="title_info">
						<div class="title">${movie_info.title}</div>
						<div class="release_date">
							<span> ${fn:substring(movie_info.release_date,0,4)} • </span>
							<span> ${movie_info.genre} • ${movie_info.nation} </span>
						</div>
						<div class="input_box">
							<div class="evaluation">
								<div class="eval_title">평가하기</div>
								<div class="starpoint_wrap">
									<div class="starpoint_box">
										<c:forEach var="i" begin="1" end="10">
											<label for="starpoint_${i}" class="label_star"
												title="${i / 2.0}">
												<span class="blind">${i / 2.0}</span>
											</label>
											<input type="radio" name="starpoint" id="starpoint_${i}"
												class="star_radio" value="${i / 2.0}"
												onclick="setStarScore(${i});">
										</c:forEach>
										<span class="starpoint_bg"></span>
									</div>
								</div>
							</div>
							<div class="inter">
								<div>+ 보고싶어요</div>
							</div>
							<div class="inter">
								<div>연필 코멘트</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="second_box row">
			<div class="dummy col-1"></div>
			<div class="left_box col-6">
				<div class="myComment_box" id="comment_1">내가 코멘트 남긴 내용</div>
				<div class="myComment_input_box"></div>
				<div class="info_box">
					<div class="head_box">
						<div class="head_title">기본정보</div>
						<div class="head_btn">
							<input class="more_btn" type="button" value="더보기" />
						</div>
					</div>
					<div class="content_box">
						<div class="content_title"></div>
						<div class="content_info">
							<div>${fn:substring(movie_info.release_date,0,4)}•
								${movie_info.genre}</div>
							<div>${movie_info.nation}•${movie_info.film_rating}</div>
							<div class="content_movie_info">${movie_info.movie_info}</div>
						</div>
					</div>
				</div>
				<div class="cast_box">
					<div class="head_title">출연/제작</div>
					<div id="cast_list" class="carousel slide">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row">
									<c:forEach var="i" begin="0" end="5">
										<div class="movieInfo_box col-6">
											<form>
												<div class="cast_info">
													<div class="cast_name">${cast_list[i].name}</div>
													<div class="cast_type">
														<c:if test="${cast_list[i].type eq 'actor' }">
															<span>배우</span>
														</c:if>
														<c:if test="${cast_list[i].type eq 'director' }">
															<span>감독</span>
														</c:if>
													</div>
												</div>
											</form>
										</div>
									</c:forEach>
								</div>
							</div>
							<c:forEach var="index" begin="1" end="${maxCast_page - 1}">
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="i" begin="${index * 6 }"
											end="${index * 6 + 5}">
											<div class="movieInfo_box col-6">
												<form>
													<div class="cast_info">
														<div class="cast_name">${cast_list[i].name}</div>
														<div class="cast_type">
															<c:if test="${cast_list[i].type eq 'actor' }">
																<span>배우</span>
															</c:if>
															<c:if test="${cast_list[i].type eq 'director' }">
																<span>감독</span>
															</c:if>
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
							data-bs-target="#cast_list" data-bs-slide="prev" value="&lt;" />
						<input type="button" class="carousel-control-next"
							data-bs-target="#cast_list" data-bs-slide="next" value="&gt;" />
					</div>
				</div>
				<div class="starScore_box"></div>
				<div class="comment_box">
					<div class="head_title">코멘트</div>
					<div id="comment_list" class="carousel slide">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row">
									<c:forEach var="i" begin="0" end="1">
										<div class="commentInfo_box col-5">
											<form>
												<div class="comment_info">
													<div class="comment_name">${comment_list[i].com_username}이름</div>
													<div class="comment_content">
														${comment_list[i].com_content } 코멘트 내용</div>
													<div class="cocomment">
														<span>댓글 수</span>
													</div>
												</div>
											</form>
										</div>
									</c:forEach>
								</div>
							</div>
							<c:forEach var="index" begin="1" end="2">
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="i" begin="${index * 2 }"
											end="${index * 2 + 1}">
											<div class="commentInfo_box col-5">
												<form>
													<div class="comment_info">
														<div class="comment_name">${comment_list[i].com_username}이름</div>
														<div class="comment_content">
															${comment_list[i].com_content } 코멘트 내용</div>
														<div class="cocomment">
															<span>댓글 수</span>
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
							data-bs-target="#comment_list" data-bs-slide="prev" value="&lt;" />
						<input type="button" class="carousel-control-next"
							data-bs-target="#comment_list" data-bs-slide="next" value="&gt;" />
					</div>
				</div>
				<div class="similar_box">
					<div class="head_title">비슷한 작품</div>
				</div>
			</div>
			<div class="right_box col-4"></div>
			<div class="dummy col-1"></div>
		</div>
	</div>
</body>
</html>