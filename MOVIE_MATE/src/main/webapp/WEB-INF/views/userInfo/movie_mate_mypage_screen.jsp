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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<script type="text/javascript">
    function myList() {
	location.href = "movie_mate_myChoice_moreInfo.do";
    }

    function modify() {
	location.href = "movie_mate_modify_screen.do?user_idx=${userIdx}&username=${userName}";
    }

    function analyzeList() {
	location.href = "movie_mate_analyze_screen.do?user_idx=${userIdx}";
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
			<i class='bx bxs-cog setting' onclick="modify();"></i>
			<img class="background" src="/mate/resources/images/mypage_background.png" onclick="location.href='movie_mate_main_screen.do'"/>
		</div>
		<div class="myProfile_box">
			<div class="profile_img">
				<c:choose>
					<c:when test="${userInfo.profile_img eq 'no_data.jpg'}">
						<img class="user" src="/mate/resources/images/user.png">
					</c:when>
					<c:otherwise>
						<img class="user"
							src="/mate/resources/upload/${userInfo.profile_img}" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="profile_name">${userInfo.username}</div>
		</div>
		<div class="second_box">
			<div class="analyze" onclick="analyzeList();">
				<i class='bx bx-bar-chart-alt-2' style='color: #7900ff'></i>
				취향분석
			</div>
		</div>
		<div class="second_box last">
			<div class="analyze" onclick="myList();">
				<i class='bx bx-film' style='color: #7900ff'></i>
				영화
			</div>
			<div style="height: 30px;"></div>
		</div>
	</div>

	
	

	<div class="wall"></div>

</body>
</html>