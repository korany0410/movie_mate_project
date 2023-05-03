<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_1.png" />
<title>무비메이트</title>
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link rel="stylesheet" href="/mate/resources/css/comment_screen.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script>
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

	function up_clicked() {
		if (isLogin() == "login_no") {
			return;
		}
		var comment_idx = document.getElementById('comment_idx').value;
		var user_idx = document.getElementById('user_idx').value;

		var url = "comment_user_up.do";
		var param = "comment_idx=" + cast_idx + "&user_idx=" + user_idx;

		sendRequest(url, param, resFnup, "GET");
	}

	function resFnup() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
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

		}
	}
	
	function moreInfo(idx) {
		document.getElementById('moreInfo'+idx).submit();
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
					<input type="hidden" name="movie_idx" value="${movie_idx}">
					<input type="hidden" name="comment_idx" value="${vo.comment_idx}">
					<div class="comment_info">
<<<<<<< HEAD
						<div class="comment_name" onclick="user_info('${vo.username}')">${vo.username}</div>
						<c:if test="${vo.profile_img eq 'no_data.jpg'}">
 
						</c:if>
						<c:choose>
							<c:when test="${vo.star_score gt 0 }">
								<div>${vo.star_score }</div>
							</c:when>
							<c:otherwise>
								<div>${vo.want_view}</div>
							</c:otherwise>
						</c:choose>
						<hr class="comment_hr">
						<div class="comment_content"
							onclick="comment_moreInfo('${vo.comment_idx}')">${vo.content}</div>
						<div class="cocomment">
							<span>댓글 수</span>
=======
						<div class="comment_user_box">
							<span class="user_box_profile_img">
								<c:if test="${vo.user_profile_img eq 'no_data.jpg'}">
								</c:if>
							</span>
							<div class="user_box_name" onclick="user_info('${vo.username}')">${vo.username}</div>
>>>>>>> e4483e11074e296092da92289357d4aa12be8438
						</div>
						<div class="comment_starWant">
							<c:choose>
								<c:when test="${vo.star_score gt 0 }">
									<div>
										<i class='bx bxs-star' style='color: rgba(0, 0, 0, 0.7)'></i>${vo.star_score}</div>
								</c:when>
								<c:otherwise>
									<div>${vo.want_view}</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="comment_content" onclick="moreInfo('${vo.comment_idx}');">${vo.content}</div>
					<div class="cocomment">
						${vo.up}
						<span class="cocomment" onclick="moreInfo('${vo.comment_idx}');">
							<i class='bx bxs-message-rounded'
								style='color: rgba(0, 0, 0, 0.47)'></i>${vo.count}</span>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>