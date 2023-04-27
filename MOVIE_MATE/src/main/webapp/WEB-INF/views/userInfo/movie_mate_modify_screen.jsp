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
	crossorigin="anonymous">
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
</head>
<body>
	<form>
		<div id="main_box">
			<div class="logo_box input-group mb-2">
				<img class="logo_img" alt=""
					src="/mate/resources/images/logo_sub.png">
			</div>
			<div class="input_box input-group mb-2" id="id_box">
				<input type="text" name="username" placeholder="이름"
					class="form-control" id="username" aria-describedby="basic-addon2"
					onkeyup="validation('username');" />
				<span class="input-group-text" id="basic-addon2">
					<input type="button" class="btn" value="중복"
						onclick="double_check(this.form);" />
				</span>
			</div>
			<div class="input_box input-group mb-2" id="email_box">
				<input type="text" name="email" placeholder="이메일"
					class="form-control" id="email" onkeyup="validation('email');" />
			</div>
			<div class="input_box input-group mb-2" id="pwd_box">
				<input type="text" name="pwd" placeholder="비밀번호"
					class="form-control" id="pwd" onkeyup="validation('pwd');" />
			</div>
			<div class="input_box input-group mb-2">
				<input type="button" value="회원가입" class="btn btn-outline-danger"
					id="signUp_btn" onclick="signUp(this.form);" />
			</div>
			<div class="link_box input-group mb-2" id="link_box">
				이미 가입하셨나요? <a href="movie_mate_login_screen.do">로그인</a>
			</div>
			<div class="openApi_box input-group mb-2"></div>
		</div>
	</form>
</body>
</html>