<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_2.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_2.png" />
<title>무비메이트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
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
<link rel="stylesheet" href="/mate/resources/css/analyze.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>
<body>
	<div class="main_box">
		<div class="profile_box box">
			<img class="profile_box"
				src="/mate/resources/images/analyze_profile.png"
				onclick="location.href='movie_mate_main_screen.do'" />
		</div>
		<div class="star_score box">
			<div class="star_title title2">별점 분포</div>
			<div id="inbody_chart">
				<script>
		var $arrColors = ['#FFFFFF','#EBDAFF','#D8B6FF','#C591FF','#B26DFF','#9F48FF','#8C24FF','#7900FF','#6700DA','#5600B6','#450091'];
	    new Morris.Bar({
		element : 'inbody_chart',
		data : [ {
		    day : '0',
		    rank : 0
		}, {
		    day : '0.5',
		    rank : ${star_map.get(0.5)}
		}, {
		    day : '1',
		    rank : ${star_map.get(1.0)}
		}, {
		    day : '1.5',
		    rank : ${star_map.get(1.5)}
		}, {
		    day : '2',
		    rank : ${star_map.get(2.0)}
		}, {
		    day : '2.5',
		    rank : ${star_map.get(2.5)}
		}, {
		    day : '3',
		    rank : ${star_map.get(3.0)}
		}, {
		    day : '3.5',
		    rank : ${star_map.get(3.5)}
		}, {
		    day : '4',
		    rank : ${star_map.get(4.0)}
		}, {
		    day : '4.5',
		    rank : ${star_map.get(4.5)}
		}, {
		    day : '5',
		    rank : ${star_map.get(5.0)}
		} ],
		xkey : 'day',
		ykeys : [ 'rank' ],
		labels : [ '수' ],
		pointSize : [ '5px' ],
		lineWidth : [ '3px' ],
		resize : [ 'true' ],
		smooth : [ 'true' ],
		animate : [ 'true' ],
		hideHover: 'always',
		barColors : function (row, series, type) {
		        return $arrColors[row.x];
		    }
	    });
	</script>
			</div>
			<div class="star_stat row" style="margin-bottom: 10px;">
				<div class="avg col-4">
					<div class="top">${avg}</div>
					<div class="bottom">별점 평균</div>
				</div>
				<div class="count col-4">
					<div class="top">${size}</div>
					<div class="bottom">별점 개수</div>
				</div>
				<div class="most col-4">
					<div class="top">${most}</div>
					<div class="bottom">많이 준 별점</div>
				</div>
			</div>
		</div>
		<div class="user_like">
			<div class="actor box">
				<div id="actor_c" class="carousel slide">
					<div class="actor_title title2">선호 배우</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="actorInfo_box">
								<c:forEach var="i" begin="0" end="2">
									<form>
										<div class="info">
											<div class="name">${bestActorList[i].name}</div>
											<div class="stat">
												<fmt:formatNumber value="${bestActorList[i].avg}" pattern="" />
												점• ${bestActorList[i].count}편
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>
						<c:forEach var="index" begin="1" end="${bestActorSize}">
							<div class="carousel-item">
								<c:forEach var="i" begin="${index * 3}" end="${index * 3 + 2}">
									<form>
										<div class="info">
											<div class="name">${bestActorList[i].name}</div>
											<div class="stat">
												<fmt:formatNumber value="${bestActorList[i].avg}" pattern="" />
												점• ${bestActorList[i].count}편
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
					<input type="button" class="carousel-control-prev act_btn"
						data-bs-target="#actor_c" data-bs-slide="prev" value="&lt;" />
					<input type="button" class="carousel-control-next act_btn"
						data-bs-target="#actor_c" data-bs-slide="next" value="&gt;" />
				</div>
			</div>
			<div class="director box">
				<div id="director_c" class="carousel slide">
					<div class="director_title title2">선호 감독</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="directorInfo_box">
								<c:forEach var="i" begin="0" end="2">
									<c:if test="${not empty bestDirectorList[i]}">
										<form>
											<div class="info">
												<div class="name">${bestDirectorList[i].name}</div>
												<div class="stat">
													<fmt:formatNumber value="${bestActorList[i].avg}"
														pattern="" />
													점• ${bestDirectorList[i].count}편
												</div>
											</div>
										</form>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<c:forEach var="index" begin="1" end="${bestDirectorSize}">
							<div class="carousel-item">
								<c:forEach var="i" begin="${index * 3}" end="${index * 3 + 2}">
									<form>
										<div class="info">
											<div class="name">${bestDirectorList[i].name}</div>
											<div class="stat">
												<fmt:formatNumber value="${bestActorList[i].avg}" pattern="" />
												점• ${bestDirectorList[i].count}편
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
					<input type="button" class="carousel-control-prev dir_btn"
						data-bs-target="#director_c" data-bs-slide="prev" value="&lt;" />
					<input type="button" class="carousel-control-next dir_btn"
						data-bs-target="#director_c" data-bs-slide="next" value="&gt;" />
				</div>
			</div>
		</div>
		<div class="like box">
			<div class="nation">
				<div class="nation title2">영화 선호국가</div>
				<div class="row">
					<c:choose>
						<c:when test="${fn:length(bestMovieK) <= 3}">
							<c:forEach var="i" begin="0" end="2">
								<c:if test="${not empty bestMovieK[i]}">
									<div class="col-${12/fn:length(bestMovieK)}"
										style="text-align: center;">
										<div style="font-size: 20px; font-weight: bold;">${bestMovieK[i]}</div>
										<div style="font-size: 15px; color: gray;">
											<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[0]}"
												pattern="" />
											점 •
											<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[1]}"
												pattern="" />
											편
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="0" end="2">
								<div class="col-4">
									<div style="font-size: 20px; font-weight: bold;">${bestMovieK[i]}</div>
									<div style="font-size: 15px; color: gray;">
										<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[0]}"
											pattern="" />
										점 •
										<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[1]}"
											pattern="" />
										편
									</div>
								</div>
							</c:forEach>
							<div style="height: 20px;"></div>
							<c:forEach var="i" begin="3" end="${fn:length(bestMovieK)-1}">
								<div class="info">
									<div class="name">${bestMovieK[i]}</div>
									<div class="stat">
										<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[0]}"
											pattern="" />
										점 •
										<fmt:formatNumber value="${bestMovieV.get(bestMovieK[i])[1]}"
											pattern="" />
										편
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr style="width: 90%; margin-left: 5%;">
			<div class="genre">
				<div class="nation title2">영화 선호장르</div>
				<div class="row">
					<c:choose>
						<c:when test="${fn:length(bestGenreK) <= 3}">
							<c:forEach var="i" begin="0" end="2">
								<div class="col-${12/fn:length(bestGenreK)}">
									<div style="font-size: 20px; font-weight: bold;">${bestGenreK[i]}</div>
									<div style="font-size: 15px; color: gray;">
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[0]}"
											pattern="" />
										점 •
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[1]}"
											pattern="" />
										편
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="0" end="2">
								<div class="col-4">
									<div style="font-size: 20px; font-weight: bold;">${bestGenreK[i]}</div>
									<div style="font-size: 15px; color: gray;">
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[0]}"
											pattern="" />
										점 •
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[1]}"
											pattern="" />
										편
									</div>
								</div>
							</c:forEach>
							<div style="height: 20px;"></div>
							<c:forEach var="i" begin="3" end="${fn:length(bestGenreK)-1}">
								<div class="info">
									<div class="name">${bestGenreK[i]}</div>
									<div class="stat">
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[0]}"
											pattern="" />
										점 •
										<fmt:formatNumber value="${bestGenreV.get(bestGenreK[i])[1]}"
											pattern="" />
										편
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr style="width: 90%; margin-left: 5%;">
			<div class="time title2">영화 감상 시간</div>
			<div
				style="text-align: center; font-size: 22px; color: #7900ff; font-weight: bold; margin-bottom: 20px;">${runtime}시간</div>
		</div>
	</div>
</body>
</html>