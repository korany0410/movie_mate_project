<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="/mate/resources/css/reset.css">
<link rel="stylesheet" href="/mate/resources/css/header.css?ver=1">
<script>
    function search(f) {
	// 검색어 가져오기
	var keyword = f.keyword.value.trim();
	f.keyword.value = keyword;
	f.action = "movie_mate_search_screen.do";
	f.submit();
	console.log(f.keyword.value);
    }

    function login() {
	var pathname = (location.pathname + location.search).substring(6);
	pathname = pathname.replaceAll("&", "@");
	location.href = "movie_mate_login_screen.do?pathname=" + pathname;
    }

    function logout() {
	if (confirm("로그아웃 하시겠습니까?")) {
	    location.href = "logout.do";
	}
    }

    function signUp() {
	location.href = "movie_mate_signUp_screen.do";
    }
    function darkMode() {
	var url = "darkMode.do";
	var button = document.getElementById("dark_mode_button");
	var param = "mode=" + button.className;
	sendRequest(url, param, resDarkMode, "GET");
    }
    function resDarkMode() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;
	    var body = document.body;
	    var button = document.getElementById("dark_mode_button");
	    var logo_main = document.getElementById("logo_main");
	    if (result == "bx bx-sun") {
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
	    console.log(button.className);
	}
    }
</script>
</head>
<body>
	<nav id="navbar" class="navbar fixed-top navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="movie_mate_main_screen.do"> <img
					id="logo_main" src="/mate/resources/images/logo_main.png"
					style="width: 220px;" alt="" height="35">
			</a>
			<div class="collapse navbar-collapse d-flex justify-content-end"
				id="navbarSupportedContent">
				<form>
					<input class="form-control search_control" type="search"
						name="keyword" placeholder="콘텐츠, 인물, 컬렉션, 유저를 검색해보세요."
						aria-label="Search"
						onkeydown="if(event.keyCode==13) { event.preventDefault(); search(this.form); }">
				</form>
				<c:choose>
					<c:when test="${isLogin eq 'no' }">
						<ul class="navbar-nav mb-2 mb-lg-0 ms-2 flex-shrink-0">
							<li class="nav-item">
								<button class="btn btn-outline-success header_btn"
									onclick="login();">로그인</button>
							</li>
						</ul>
						<ul class="navbar-nav mb-2 mb-lg-0 ms-2 flex-shrink-0">
							<li class="nav-item">
								<button class="btn btn-outline-success header_btn"
									onclick="signUp();">회원가입</button>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav mb-2 mb-lg-0 ms-2 flex-shrink-0">
							<li class="nav-item profile_box">
								<a class="nav-link"
									href="movie_mate_mypage_screen.do?username=${userName}"> <c:choose>
										<c:when test="${userImg eq 'no_data.jpg'}">
											<img class="profile" src="/mate/resources/images/user.png">
										</c:when>
										<c:otherwise>
											<img class="profile" src="/mate/resources/upload/${userImg}"
												alt="" />
										</c:otherwise>
									</c:choose>
								</a>
							</li>
						</ul>
						<ul class="navbar-nav mb-2 mb-lg-0 ms-2 flex-shrink-0">
							<li class="nav-item">
								<button class="btn btn-outline-success header_btn"
									onclick="logout();">로그아웃</button>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="darkMode_box">
				<div>
					<button onclick="darkMode();" id="dark_mode" class="dark_mode_btn">
						<i id="dark_mode_button" class='bx bx-moon'></i>
					</button>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>