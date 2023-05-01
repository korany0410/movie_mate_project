<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_1.png" />
<title>무비메이트</title>
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link rel="stylesheet"
	href="/mate/resources/css/comment_moreInfo_screen.css" />
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall" style="height: 100px"></div>
	<div class="center_box">
		<c:forEach var="vo" items="${comment_list}">
			<div>${vo.username}</div>
			<div>${vo.title }</div>
			<div>${vo.release_date }</div>
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
			<div>${vo.movie_profile_img }</div>
			<div>${vo.content}</div>
			<div>${vo.up}</div>
			<div>댓글</div>
			


		</c:forEach>







	</div>

</body>
</html>