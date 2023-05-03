<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/footer.css">
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var url = "movie_count.do";
		var param = null;

		sendRequest(url, param, resFn, "GET");
	}

	function resFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var count = xhr.responseText;

			console.log(count);

			var dom = document.getElementById('count');
			dom.innerText = count;
		}
	}
</script>
</head>

<body>



	<div class="footer">
		<h3 class="footer_h3">
			지금까지 ★<span id="count"> </span>개의 평가가 쌓였어요.
		</h3>
		<div>
			<a href="#" class="footer_link"
				onclick="window.open('https://watcha.com/legals/agreement', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
				서비스 이용약관 | </a> <a href="#" class="footer_link"
				onclick="window.open('https://watcha.com/legals/privacy', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
				개인정보 처리방침 |</a> <a href="#" class="footer_link"
				onclick="window.open('https://watcha.team/', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
				회사 안내 </a>
		</div>

		<br>

		<div>
			고객센터 | <a href="#" class="footer_link"
				onclick="window.open('https://help.pedia.watcha.co.kr/hc/ko', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;" >cs@moviemate.co.kr,
			</a>02-515-9985 <br> <span>광고 문의 | ad_sales@moviemate.com</span> <br>
			제휴 및 대외 협력 |<a href="#" class="footer_link"
				onclick="window.open('https://watcha.team/contact', 'window_name', 'width=900, height=900, location=no, status=no, scrollbars=yes'); return false;">
				https://moviemate.team/contact</a>
		</div>

		<br>

		<div>
			<div>주식회사 무비메이트 | 대표 킹갓제너럴현준 | 서울특별시 서초구 강남대로 343 신덕빌딩 3층</div>
			<div>사업자 등록 번호 211-88-66013</div>
			<div class="last">movie mate © 2022 by MOVIE_MATE, Inc. All
				rights reserved.
			
			<span class="abs">	
				<a href="https://www.facebook.com/watchaKR/" target="_blank"> <img
			class="footer_facebook"
			src="https://w7.pngwing.com/pngs/752/373/png-transparent-computer-icons-facebook-logo-facebook-logo-fine-art-thumbnail.png" />
		</a> <a href="https://twitter.com/watcha_kr" target="_blank"> <img
			class="footer_twitter"
			src="https://w7.pngwing.com/pngs/396/989/png-transparent-logo-scalable-graphics-icon-twitter-logo-media-social-media-online-chat-thumbnail.png" />
		</a> <a href="https://github.com/korany0410?tab=repositories"
			target="_blank"> <img class="footer_github"
			src="https://w7.pngwing.com/pngs/914/758/png-transparent-github-social-media-computer-icons-logo-android-github-logo-computer-wallpaper-banner-thumbnail.png" />
		</a>
		</span>
			</div>	
		</div>
		
	</div>
	
	



</body>
</html>