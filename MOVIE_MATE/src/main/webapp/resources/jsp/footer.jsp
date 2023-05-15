<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/footer.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">

    window.onload = function footer() {
	var url = "movie_count.do";
	var param = null;

	console.log("footer 생성...");
	sendRequest(url, param, resFn, "GET");
    }

    function resFn() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;
	    var count = result.split("/")[0];
	    var mode = result.split("/")[1];
	    var button = document.getElementById("dark_mode_button");
	    var body = document.body;
	    var logo_main = document.getElementById("logo_main");
	    if (mode == "bx bx-sun") {
		logo_main.src = "/mate/resources/images/logo_main.png";
		button.className = "bx bx-sun";
		button.style.color = "black";
	    body.classList.remove("dark_mode");
	    body.classList.add("white_mode");
	    } else {
		logo_main.src = "/mate/resources/images/logo_main_white.png";
		button.className = "bx bx-moon";
		button.style.color = "white";
	    body.classList.remove("white_mode");
	    body.classList.add("dark_mode");
	    }

	    var dom = document.getElementById('footer_count');
	    dom.innerText = count;
	}


    }

</script>
</head>

<body>
	<div class="footer_box">
		<div class="margin_box">
			<h3 class="footer_h3" style='font-size: 25px'>
				<span> 지금까지 </span>
				<i class='bx bxs-star bx-flashing'>
					<span id="footer_count" style="font-size: 25px;"></span>
				</i>
				<span> 개의 평가가 쌓였어요. </span>
			</h3>
			<div class="info_icon_box">
				<div class="info_box">
					<div class="info_box_top">
						<a href="#" class="footer_link"
							onclick="window.open('https://watcha.com/legals/agreement', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
							서비스 이용약관 | </a>
						<a href="#" class="footer_link"
							onclick="window.open('https://watcha.com/legals/privacy', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
							개인정보 처리방침 |</a>
						<a href="#" class="footer_link"
							onclick="window.open('https://watcha.team/', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
							회사 안내 </a>
					</div>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">언어선택</button>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item" href="#">한국어</a>
							</li>
							<li>
								<a class="dropdown-item" href="#">English</a>
							</li>
						</ul>
					</div>
					<br>
					<div>
						고객센터 |
						<a href="#" class="footer_link"
							onclick="window.open('https://help.pedia.watcha.co.kr/hc/ko', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">cs@moviemate.co.kr,
						</a>
						02-515-9985 <br>
						<span>광고 문의 | ad_sales@moviemate.com</span>
						<br> 제휴 및 대외 협력 |
						<a href="#" class="footer_link"
							onclick="window.open('https://watcha.team/contact', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
							https://moviemate.team/contact</a>
					</div>

					<br>
					<div class="info_box_bottom">
						<div>주식회사 무비메이트 | 대표 박성준 | 서울특별시 서초구 강남대로 343 신덕빌딩 3층</div>
						<div>사업자 등록 번호 211-88-66013</div>
						<div class="last">movie mate © 2022 by MOVIE_MATE, Inc. All rights reserved.</div>
					</div>
				</div>
				<div class="icon_box">
					<a class="link_icon" href="https://www.facebook.com/watchaKR/" target="_blank">
						<i class='bx bxl-facebook-circle link_icon_i'></i>
					</a>
					<a class="link_icon" href="https://twitter.com/watcha_kr" target="_blank">
						<i class='bx bxl-twitter link_icon_i'></i>
					</a>
					<a class="link_icon" href="https://github.com/korany0410?tab=repositories" target="_blank">
						<i class='bx bxl-github link_icon_i'></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>