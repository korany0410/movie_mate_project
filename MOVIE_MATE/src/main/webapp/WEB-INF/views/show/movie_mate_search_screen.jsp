<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/mate/resources/css/search_screen.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css?ver=1" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// content버튼 클릭 시 keyword에 해당하는 cast, movie정보 가져오기
	function content() {
		//Ajax
		var url = "movie_mate_search_content.do";
		var param = "keyword=" + keyword;
		//url과 파람을 보냄
		//보낸 결과를 자동으로 받기위해 callback메서드 만들기
		sendRequest(url, param, resultFn, "GET");
	}
	//중복체크 버튼 클릭 후 자동으로 호출되는 콜백 메서드
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			let data = xhr.responseText;

			let json = (new Function('return' + data))();

		}
	}
</script>
</head>
<body>

	<!--<h1>서치 스크린 화면</h1>  -->
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall"></div>
	<div class="search_result">"${keyword}"의 검색결과</div>

	<hr>
	<%-- 영화 검색결과 출력 --%>
	<form>
		<div>
			<input type="button" value="콘텐츠" onclick="content(this.form)">

		</div>
	</form>
	
	<div>
		${title}
	</div>


</body>
</html>
