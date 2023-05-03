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
<link rel="stylesheet"
	href="/mate/resources/css/commentScreen.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link rel="stylesheet" href="/mate/resources/css/comment_screen.css" />

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
				<form>
					<div class="comment_info">
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
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>