<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	background: black;
	color: white;
	text-decoration: none;
}

h1 {
	text-align: center;
}

.facebook {
	position: absolute;
	width: 3rem;
	height: 3rem;
	cursor: pointer;
	top: 30%;
	right: 20%;
}

.twitter {
	position: absolute;
	width: 3rem;
	height: 3rem;
	cursor: pointer;
	top: 30%;
	right: 17%;
}

.B_logo {
	position: absolute;
	width: 3rem;
	height: 3rem;
	cursor: pointer;
	right: 14%;
	top: 30%;
	border: 1px solid #eaeaea;
}

.text {
	padding: 3rem 0rem;
	position: relative;
	left: 20rem;
	position: relative;
}

.facebook:hover {
	opacity: 0.7;
}

.twitter:hover {
	opacity: 0.7;
}

.B_logo:hover {
	opacity: 0.7;
}
</style>
</head>

<body>

	
		<h1>
			지금까지 <span style="color: red">★ 689,397,981개의 평가</span>가 쌓였어요.
		</h1>

		<div class="text">
			<div>
				<a href="#"
					onclick="window.open('https://watcha.com/legals/agreement', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">
					서비스 이용약관 | </a> <a href="#"
					onclick="window.open('https://watcha.com/legals/privacy', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">
					개인정보 처리방침 |</a> <a href="#"
					onclick="window.open('https://watcha.team/', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">
					회사 안내 </a>
			</div>

			<br>

			<div>
				<span>고객센터 |</span> <a href="#"
					onclick="window.open('https://help.pedia.watcha.co.kr/hc/ko', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">cs@moviemate.co.kr,
				</a>02-515-9985 <br> <span>광고 문의 | ad_sales@moviemate.com</span> <br>
				<span>제휴 및 대외 협력 |</span><a href="#"
					onclick="window.open('https://watcha.team/contact', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">
					https://moviemate.team/contact</a>
			</div>

			<br>

			<div>
				<div>주식회사 무비메이트 | 대표 킹갓제너럴현준 | 서울특별시 서초구 강남대로 343 신덕빌딩 3층</div>
				<div>사업자 등록 번호 211-88-66013</div>
				<div>movie mate © 2022 by MOVIE_MATE, Inc. All rights
					reserved.</div>
			</div>
		</div>
		<div class="img">
			<img class="facebook" src="/mate/resources/images/facebook.png"
				onclick="window.open('https://www.facebook.com/watchaKR/', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">
			<img class="twitter" src="/mate/resources/images/twitter.png"
				onclick="window.open('https://twitter.com/watcha_kr', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">

			<img class="B_logo" src="/mate/resources/images/B_logo.png"
				onclick="window.open('https://watcha.team/', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes');">

		</div>



</body>
</html>