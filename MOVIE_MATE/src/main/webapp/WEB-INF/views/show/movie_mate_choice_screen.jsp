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
<link rel="stylesheet" href="/mate/resources/css/choiceScreen.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">
    function isLogin() {
	var isLogin = "${isLogin}";
	if(isLogin == 'no'){
	    if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
			location.href="movie_mate_login_screen.do";
	    }
		return "login_no";
	}
	return "login_yes";
    }
    
    function setStarScore(i) {
	if(isLogin() == "login_no"){
	    return;
	}
	var score = document.getElementById('starpoint_' + i);
	var user_idx = "${userIdx}";
	var movie_idx = document.getElementById('movie_idx');
	console.log(score.value);
	console.log(user_idx);
	console.log(movie_idx.value);
	var url = "update_starScore.do";
	var param = "user_idx=" + user_idx + "&movie_idx=" + movie_idx.value
	+ "&star_score=" + score.value;
	
	sendRequest(url, param, resFnStar, "GET");
    }
    
    function resFnStar() {
	if(xhr.readyState == 4 && xhr.status == 200){
	    var result = xhr.responseText * 2;
	    console.log(result);
	}
    }
    
    function want_view(f) {
	if(isLogin() == "login_no"){
	    return;
	}
	var user_idx = f.user_idx.value;
	var movie_idx = f.movie_idx.value;
	var url = "movie_user_want.do";
	var param = "user_idx=" + user_idx + "&movie_idx=" + movie_idx;
	
	sendRequest(url, param, resFnWant, "GET");
    }
    
    function resFnWant() {
	if(xhr.readyState == 4 && xhr.status == 200){
	    var result = xhr.responseText;
	    console.log(result);
		var img = document.getElementById('want');
	    if(result == 'yes'){
			img.src = "/mate/resources/images/check.png";
	    } else {
			img.src = "/mate/resources/images/plus.png";
	    }
	}
    }
    
    function write_comment() {
	if(isLogin() == "login_no"){
	    return;
	}
	var input_box = document.getElementById('myComment_input_box');
	input_box.style.display = "block";
	}
    
    function update_comment(f) {
		f.action = "update_comment.do";
		f.submit();
    }
    
    function choiceCast_screen(idx, name, type){
    	location.href = "movie_mate_choiceCast_screen.do?cast_idx=" + idx + "&name=" + name + "&type=" + type ;
    }
    
    function choice_screen(idx) {
	location.href = "movie_mate_choice_screen.do?movie_idx=" + idx;
    }
    
    function watcha() {
	window.open('https://watcha.com/?browser_open_type=external');
    }
    
    function go_cocomment(cidx, midx) {
		location.href = "movie_mate_comment_moreInfo_screen.do?comment_idx="+cidx+"&movie_idx="+midx;
	}
    function go_userInfo(username) {
		location.href = "movie_mate_mypage_screen.do?username="+username;
	}
    
    
	function isup_clicked(idx) {
		if (isLogin() == "login_no") {
			return;
		}
	
		var url = "user_comment_isup.do";
		var param = "comment_idx=" + idx + "&user_idx=${userIdx}";
		
		console.log(idx);
		console.log(${userIdx});

		sendRequest(url, param, resFnup, "GET");
	}

	function resFnup() {
		
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;	
			
			var dom = document.getElementById(result.split("/")[0]);
			
			dom.innerText = result.split("/")[1];
			console.log(result);
			/*
			var yesOrNo = result.split("/")[0];
			var up_count = result.split("/")[1];
			var box = document.getElementById('up_li');
			var count = document.getElementById('count');
			var icon = document.getElementById('like_icon');

			if (yesOrNo == 'no') {
				box.style.color = "black";
				count.innerText = up_count;
				icon.className = "bx bx-like";
			} else {
				box.style.color = "#7900FF";
				count.innerText = up_count;
				icon.className = "bx bxs-like";
			}
			*/
		}
	}
    
/* 	function moreInfo(idx) {
		location.href = "movie_mate_comment_moreInfo_screen.do?comment_idx"+idx;
	} */
	
</script>
</head>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
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
											<label for="starpoint_${i}" class="label_star" title="${i / 2.0}"> <span class="blind">${i / 2.0}</span>
											</label>
											<c:choose>
												<c:when test="${i eq movie_user.star_score * 2 }">
													<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i / 2.0}"
														onclick="setStarScore(${i});" checked="checked">
												</c:when>
												<c:otherwise>
													<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i / 2.0}"
														onclick="setStarScore(${i});">
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<span class="starpoint_bg"></span>
									</div>
								</div>
							</div>
							<div class="inter" id="wanted">
								<c:choose>
									<c:when test="${movieUser_info.want_view eq 'no' }">
										<img id="want" src="/mate/resources/images/plus.png" alt="" />
									</c:when>
									<c:when test="${empty movieUser_info.want_view}">
										<img id="want" src="/mate/resources/images/plus.png" alt="" />
									</c:when>
									<c:otherwise>
										<img id="want" src="/mate/resources/images/check.png" alt="" />
									</c:otherwise>
								</c:choose>
								<form>
									<input type="hidden" name="user_idx" value="${userIdx}" /> <input type="hidden" name="movie_idx"
										id="movie_idx" value="${movie_info.movie_idx}" /> <input class="want_btn" type="button" value="보고싶어요"
										onclick="want_view(this.form);" />
								</form>
							</div>
							<div class="inter" id="commented">
								<img id="pancel" src="/mate/resources/images/pancel.png" alt="" />
								<input class="want_btn" type="button" value="글쓰기" onclick="write_comment();" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="second_box row">
			<div class="dummy col-1 col-lg-2"></div>
			<div class="left_box col-6 col-lg-5">
				<c:if test="${not empty my_comment}">
					<div id="myComment_box">
						<div class="img_box">
							<c:choose>
								<c:when test="${userImg eq 'no_data.jpg'}">
									<img class="p_img" src="/mate/resources/images/user.png" alt="" />
								</c:when>
							</c:choose>
							<c:if test=""></c:if>
						</div>
						<div class="comment_box">${my_comment.com_content}</div>
					</div>
				</c:if>
				<div id="myComment_input_box">
					<label for="exampleFormControlTextarea1" class="input_title">${movie_info.title}</label>
					<form>
						<textarea class="form-control input_box" id="exampleFormControlTextarea1" name="com_content" rows="3"></textarea>
						<input type="hidden" name="m_ref" value="${movie_info.movie_idx}" /> <input type="hidden" name="com_username"
							value="${userName}" />
						<c:if test="${not empty my_comment }">
							<input type="hidden" name="comment_idx" value="${my_comment.comment_idx}" />
						</c:if>
						<input type="button" class="update_btn" value="저장" onclick="update_comment(this.form);" />
					</form>
				</div>
				<div class="info_box">
					<div class="head_box">
						<div class="head_title">기본정보</div>
						<div class="head_btn">

							<input class="more_btn" type="button" value="더보기"
								onclick="location.href='movie_mate_choice_moreInfo.do?movie_idx=${movie_info.movie_idx}'" />


						</div>
					</div>
					<div class="content_box">
						<div class="content_title"></div>
						<div class="content_info">
							<div>${fn:substring(movie_info.release_date,0,4)}•${movie_info.genre}</div>
							<div>${movie_info.nation}•${movie_info.film_rating}</div>
							<div class="content_movie_info">${movie_info.movie_info}</div>
						</div>
					</div>
				</div>
				<div class="cast_box">
					<div class="head_title">출연/제작</div>
					<div id="cast_list" class="carousel slide">
						<div class="carousel-inner cast_inner">
							<div class="carousel-item actor active">
								<div class="row">
									<c:forEach var="i" begin="0" end="5">

										<div class="movieInfo_box col-6">
											<form>
												<div class="comment_list[i]"
													onclick="choiceCast_screen('${cast_list[i].cast_idx}','${cast_list[i].name}','${cast_list[i].type}')">
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
							<c:forEach var="index" begin="1" end="${maxCast_page}">
								<div class="carousel-item actor">
									<div class="row">
										<c:forEach var="i" begin="${index * 6 }" end="${index * 6 + 5}">
											<c:if test="${not empty cast_list[i]}">

												<div class="movieInfo_box col-6">
													<form>
														<div class="comment_list[i]"
															onclick="choiceCast_screen('${cast_list[i].cast_idx}','${cast_list[i].name}','${cast_list[i].type}')">
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
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</div>
						<input type="button" class="carousel-control-prev cast_btn" data-bs-target="#cast_list" data-bs-slide="prev"
							value="&lt;" /> <input type="button" class="carousel-control-next cast_btn" data-bs-target="#cast_list"
							data-bs-slide="next" value="&gt;" />
					</div>
				</div>
				<div class="starScore_box"></div>
				<div class="comment_box">
					<div class="head_box">
						<div class="head_title">코멘트</div>
						<div class="head_btn">
							<input class="more_btn" type="button" value="더보기"
								onclick="location.href='movie_mate_comment.do?movie_idx=${movie_info.movie_idx}'" />
						</div>
					</div>
					<div id="comment_list" class="carousel slide">
						<div class="carousel-inner com_box">
							<div class="carousel-item active">
								<div class="row">
									<c:forEach var="i" begin="0" end="1">
										<div class="commentInfo_box col-6">
											<form>
												<div class="comment_info">
													<div class="comment_name" onclick="go_userInfo('${comment_list[i].username}')">
														${comment_list[i].username}</div>
													<div class="go_cocomment"
														onclick="go_cocomment('${comment_list[i].comment_idx}','${movie_info.movie_idx}');">
														<div class="comment_content">${comment_list[i].content }</div>
													</div>
													<div class="cocomment_upComment_box">
														<div class="cocomment_up" id="up">
															<i id="like_icon" class='bx bx-like' onclick="isup_clicked('${comment_list[i].comment_idx}');"></i>
															<span id="${comment_list[i].comment_idx}"> ${comment_list[i].up} </span>
														</div>
														<div class="cocomment_comment"
															onclick="go_cocomment('${comment_list[i].comment_idx}','${movie_info.movie_idx}');">
															<i class='bx bx-message-rounded'></i>
															${comment_list[i].count}
														</div>
													</div>
												</div>
											</form>
										</div>
									</c:forEach>
								</div>
							</div>
							<c:forEach var="index" begin="1" end="${maxComment_page}">
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="i" begin="${index * 2 }" end="${index * 2 + 1}">
											<c:if test="${not empty comment_list[i]}">
												<div class="commentInfo_box col-6"
													onclick="go_cocomment('${comment_list[i].comment_idx}','${movie_info.movie_idx}')">
													<form>
														<div class="comment_info">
															<div class="comment_name" onclick="go_userInfo('${comment_list[i].username}')">
																${comment_list[i].username}</div>
															<div class="go_cocomment"
																onclick="go_cocomment('${comment_list[i].comment_idx}','${movie_info.movie_idx}')">
																<div class="comment_content">${comment_list[i].content }</div>
															</div>
															<div class="cocomment_upComment">
																<div class="cocomment_up_box" id="up">
																	<i id="like_icon" class='bx bx-like' onclick="isup_clicked('${comment_list[i].comment_idx}');"></i>
																	<span id="${comment_list[i].comment_idx}"> ${comment_list[i].up} </span>
																</div>
																<div class="cocomment_comment"
																	onclick="go_cocomment('${comment_list[i].comment_idx}','${movie_info.movie_idx}')">
																	<i class='bx bx-message-rounded'></i>
																	${comment_list[i].count}
																</div>
															</div>
														</div>
													</form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</div>
						<input type="button" class="carousel-control-prev comment_btn" data-bs-target="#comment_list" data-bs-slide="prev"
							value="&lt;" /> <input type="button" class="carousel-control-next comment_btn" data-bs-target="#comment_list"
							data-bs-slide="next" value="&gt;" />
					</div>
				</div>
				<div class="similar_box">
					<div class="head_title">비슷한 작품</div>
					<div class="row">
						<c:forEach var="map" items="${movie_list}" varStatus="status">
							<div class="similar_movie col-4 col-md-3" onclick="choice_screen(${map.value.movie_idx});">
								<div class="movieImg_box">
									<img class="movie_img" alt="" src="${map.value.profile_img}">
								</div>
								<div class="fw-bold info star_title">${map.value.title}</div>
								<div class="info star_comment">평균★${map.value.star_score}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="right_box col-4 col-lg-3" onclick="watcha();">
				<div class="adImg_box">
					<img class="ad_img" src="/mate/resources/images/ad.png" alt="" />
				</div>
				<div class="ad_content">
					<div class="ad_box">
						<div style="font-weight: bold; font-size: 15px;">#왓챠영화파티</div>
						<div style="color: gray; font-size: 12px">재방송은 없다! 기회는 단 한번!</div>
					</div>
					<div class="ad_btn">
						<input class="now" type="button" value="지금 왓챠!" />
					</div>
				</div>
			</div>
			<div class="dummy col-1 col-lg-2"></div>
		</div>
	</div>
</body>
</html>