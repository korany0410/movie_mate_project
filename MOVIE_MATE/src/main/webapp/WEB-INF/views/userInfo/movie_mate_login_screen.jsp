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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mate/resources/css/signUp.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>

<script type="text/javascript">
    function send(f) {
	var email = f.email.value;
	var pwd = f.pwd.value;
	var pathname = "${pathname}";

	if (pathname == "" || pathname == "logout.do") {
	    pathname = "movie_mate_main_screen.do";

	    url = "login.do";
	    param = "email=" + email + "&pwd=" + pwd + "&pathname=" + pathname;
	    sendRequest(url, param, resFn, "POST");

	}

	console.log(pathname);
	if (pathname == "" || pathname == "logout.do") {
	    pathname = "movie_mate_main_screen.do";
	}
	url = "login.do";
	param = "email=" + email + "&pwd=" + pwd + "&pathname=" + pathname;
	sendRequest(url, param, resFn, "POST");

    }

    function resFn() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;

	    console.log("result = " + result);

	    if (result != 'fail') {
		alert("로그인 성공했습니다.");
		location.href = result;
	    } else {
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		return;
	    }
	}
    }

    function kakao() {
	var pathname = "${pathname}";
	pathname = pathname.replaceAll("&", "@");
	var url = "path_save.do";
	var param = "pathname=" + pathname;

	sendRequest(url, param, resPathFn, "GET");
    }

    function resPathFn() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;
	    console.log(result);
	    location.href = "https://kauth.kakao.com/oauth/authorize?client_id=c5c9bf4e2eae7cd92e2e30cb7d2783d8&redirect_uri=http://localhost:9090/mate/movie_mate_login_kakao.do&response_type=code";
	}
    }

    function naver() {
	var pathname = "${pathname}";
	pathname = pathname.replaceAll("&", "@");
	var url = "path_save.do";
	var param = "pathname=" + pathname;

	sendRequest(url, param, naverLogin, "GET");
    }

    function naverLogin() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var clientId = "1WJZgSQ2gY4nooI1AGEz";
	    var redirectURI = "http://localhost:9090/mate/movie_mate_naver_signup.do";
	    var state = "STATE_STRING";
	    var url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="
		    + clientId
		    + "&redirect_uri="
		    + encodeURIComponent(redirectURI) + "&state=" + state
	    window.location.href = url;
	}
    }
</script>
</head>
</head>

<body>
	<form>
		<div id="main_box">
			<div class="logo_box input-group mb-2">
				<img class="logo_img" src="/mate/resources/images/logo_sub.png"
					onclick="location.href='movie_mate_main_screen.do'">
			</div>
			<div class="input_box input-group mb-2" id="email_box">
				<input type="email" name="email" class="form-control"
					placeholder="이메일">
			</div>
			<div class="input_box input-group mb-2" id="pwd_box">
				<input type="password" name="pwd" class="form-control"
					placeholder="비밀번호">
			</div>
			<div class="input_box input-group mb-2">
				<input type="button" name="button"
					style="background-color: #7900ff; color: white; border-color: #7900ff;"
					value="로그인" class="btn btn-outline-danger"
					onclick="send(this.form);">
			</div>
			<div class="openApi_box input-group mb-2">
				<input type="button" name="button"
					style="background-color: #F7E600; color: black; border-color: #F7E600;"
					value="카카오 간편로그인" class="btn btn-outline-danger" onclick="kakao();">
			</div>

			<div class="openApi_box input-group mb-2">
				<input type="button" name="button"
					style="background-color: #2DB400; color: black; border-color: #F7E600;"
					value="네이버 간편로그인" class="btn btn-outline-danger"
					onclick="naver();">
			</div>

			<div>
				계정이 없으신가요? <a href="movie_mate_signUp_screen.do">회원가입</a>
			</div>
	</form>
</body>
</html>