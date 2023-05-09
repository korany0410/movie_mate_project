<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon" href="/mate/resources/images/logo_icon_1.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<title>무비메이트</title>
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link rel="stylesheet" href="/mate/resources/css/comment_screen.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script>
	function go_cocomment(cidx, midx) {
	location.href = "movie_mate_comment_moreInfo_screen.do?comment_idx="+cidx+"&movie_idx="+midx;
	}
	function user_info(username) {
		location.href = "movie_mate_mypage_screen.do?username=" + username;
	}
	function comment_moreInfo(idx) {
		location.href = "movie_mate_comment_moreInfo_screen.do?comment_idx="
				+ idx;
	}
</script>
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

	
	function moreInfo(idx) {
		document.getElementById('moreInfo' + idx).submit();
	}
	
	function isup_clicked(idx) {
		if (isLogin() == "login_no") {
			return;
		}
	
		var url = "user_comment_isup.do";
		var param = "comment_idx=" + idx + "&user_idx=${userIdx}";
		
		console.log(idx);
		console.log(${userIdx});

		sendRequest(url, param, resFnCommentUp, "GET");
	}

	function resFnCommentUp() {
		
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;	
			var dom = document.getElementById(result.split("/")[0]);

			var yesOrNo = result.split("/")[2];
			var up_count = result.split("/")[1];
			var box = document.getElementById('up');
			var count = document.getElementById('count');
			var up = document.getElementById('up'+result.split("/")[0]);
			var icon = document.getElementById('like_icon'+result.split("/")[0]);
			
			dom.innerText = result.split("/")[1];
			console.log("result : " + result);
			console.log("yesOrNo : " + yesOrNo);
			
			if (yesOrNo == 'no') {
				//count.innerText = up_count;
				icon.className = "bx bx-like";
			} else {
				//count.innerText = up_count;
				icon.className = "bx bxs-like";
			}
		}	
	}
	

</script>
</head>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<div class="back_img">뒤로 가기</div>
	<div class="comment">코멘트</div>
	<hr>
	<div class="main_box">
		<c:forEach var="vo" items="${comment_list}">
			<div class="comment_box">
				<form action="movie_mate_comment_moreInfo_screen.do" id="moreInfo${vo.comment_idx}">
					<input type="hidden" name="movie_idx" value="${movie_idx}"> <input type="hidden" name="comment_idx"
						value="${vo.comment_idx}">
					<div class="comment_info">
						<c:if test="${vo.user_profile_img eq 'no_data.jpg'}">
						</c:if>
						<div class="cocomment">
							<div class="comment_user_box">
								<div class="cocomment_profile_img">
									<c:choose>
										<c:when test="${vo.user_profile_img eq 'no_data.jpg'}">
											<img class="profile" alt="" src="/mate/resources/images/user.png">
										</c:when>
										<c:otherwise>
											<img class="profile" alt="" src="/mate/resources/upload/${vo.user_profile_img}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user_box_name" onclick="user_info('${vo.username}')">${vo.username}</div>
							</div>
							<div class="comment_starWant">
								<c:choose>
									<c:when test="${vo.star_score gt 0 }">
										<div>
											<i class='bx bxs-star' style='color: rgba(0, 0, 0, 0.7)'></i>${vo.star_score}</div>
									</c:when>
									<c:otherwise>
										<div>
											<i class='bx bxs-bookmark' style='color: rgba(0, 0, 0, 0.7)'></i>
											보고싶어요
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="comment_content" onclick="moreInfo('${vo.comment_idx}');">${vo.content}</div>
					<div class="cocomment_upComment_box">
						<div class="cocomment_up" id="up${vo.comment_idx}" onclick="isup_clicked('${vo.comment_idx}');">
							<c:choose>
								<c:when test="${vo.isup eq 'yes'}">
									<i id="like_icon${vo.comment_idx}" class='bx bxs-like'></i>
								</c:when>
								<c:otherwise>
									<i id="like_icon${vo.comment_idx}" class='bx bx-like'></i>
								</c:otherwise>
							</c:choose>
							<span id="${vo.comment_idx}"> ${vo.up} </span>
						</div>
						<div class="cocomment_comment" onclick="go_cocomment('${vo.comment_idx}','${movie_idx}');">
							<i class='bx bx-message-rounded'></i>
							${vo.count - 1}
						</div>
					</div>




				</form>
			</div>
		</c:forEach>
	</div>
	<footer>
		<%@ include file="/resources/jsp/footer.jsp"%>
	</footer>
</body>
</html>