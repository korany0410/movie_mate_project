<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/mate/resources/images/logo_icon_2.png" />
<link rel="apple-touch-icon"
	href="/mate/resources/images/logo_icon_2.png" />
<title>무비메이트</title>
<link rel="stylesheet" href="/mate/resources/css/myPage.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<script type="text/javascript">
    function myList() {
	location.href = "movie_mate_myChoice_moreInfo.do";
    }
</script>
</head>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<div class="main_box">
		<div class="first_box">
			<img class="background" src="/mate/resources/images/photo.png" alt="" />
		</div>
		<div class="myProfile_box">
			<div class="profile_img">
				<c:choose>
					<c:when test="${userImg eq 'no_data.jpg'}">
						<img class="user" src="/mate/resources/images/user.png">
					</c:when>
					<c:otherwise>
						<img class="user" src="${userImg}" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="profile_name">${userName }</div>
		</div>
		<div class="second_box">
			<div class="analyze" onclick="analyzeList();">취향분석</div>
		</div>
		<div class="third_box">
			<div class="movie">
				<div class="card_body" onclick="myList();">
					<div class="movie_title">영화</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>