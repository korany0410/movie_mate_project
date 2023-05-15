<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="/mate/resources/css/kakaoSignUp.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/signUp.css?ver=1" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">
    var user_check1 = true;
    var user_check2 = false;
    var email_check = false;
    var pwd_check = false;

    window.onload = function() {
	check_username = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,18}$/;
	check_email = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
	email_check = check_email.test("${email}");
	console.log("user_check1 = " + user_check1);
	console.log("user_email = " + email_check);
    }
    function signUp(f) {
	if (!(user_check1 && user_check2)) {
	    if (!user_check1) {
		alert("이름 형식이 맞지 않습니다. 다시 입력해주세요.");
	    }
	    if (!user_check2) {
		alert("중복체크 해주세요.");
	    }
	    return;
	}
	if (!email_check) {
	    alert("이메일 형식이 맞지 않습니다. 다시 입력해주세요.");
	    return;
	}
	if (!pwd_check) {
	    alert("비밀번호 형식이 맞지 않습니다. 다시 입력해주세요.");
	    return;
	}
	var username = f.username.value;
	var email = f.email.value;
	var pwd = f.pwd.value;
	var url = "signUp.do";
	var param = "username=" + username + "&email=" + email + "&pwd=" + pwd;
	sendRequest(url, param, resSign, "GET");
    }

    function resSign() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;
	    console.log(result);
	    if (result == 'success') {
		alert("회원가입에 성공하셨습니다.");
		location.href = "movie_mate_main_screen.do";
		return;
	    } else {
		alert("회원가입에 실패하셨습니다. 다시 시도해주세요.");
		return;
	    }
	}
    }

    function double_check(f) {
	var username = f.username.value;
	var url = "double_check.do";
	var param = "username=" + username;
	sendRequest(url, param, resDouble, "GET");
    }

    function resDouble() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	    var result = xhr.responseText;
	    console.log(result);
	    if (result == 'possible') {
		alert("가능한 이름입니다.");
		user_check2 = true;
	    } else {
		user_check2 = false;
		alert("동일한 이름이 존재합니다. 다시 입력해주세요.");
		return;
	    }
	}
    }

    function validation(v) {
	var check;
	var value = document.getElementById(v).value;
	console.log(value);
	if (v == 'username') {
	    var name_check = document.getElementById('username_check');
	    check = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,18}$/;
	    user_check1 = check.test(value);
	    if (user_check1) {
		name_check.className = "bx bx-check-circle";
	    } else {
		name_check.className = "bx bx-x-circle";
	    }
	    user_check2 = false;
	} else if (v == 'email') {
	    check = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
	    email_check = check.test(value);
	} else if (v == 'pwd') {
	    check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	    pwd_check = check.test(value);
	}
	console.log(check.test(value));
    }
</script>
</head>
<body>
	<form>
		<div id="main_box">
			<div class="logo_box input-group mb-2">
				<div style="margin: 20px 0; text-align: center;">
					<img class="naver_img2" src="/mate/resources/images/logo_main.png"
						alt="" style="width: 100%; height: 50px;"
						onclick="location.href='movie_mate_main_screen.do'">
					<img class="naver_img2" src="/mate/resources/images/kakao2.png"
						alt="" style="width: 100px; height: 25px;"
						onclick="location.href='movie_mate_main_screen.do'">
				</div>
			</div>
			<div class="input_box input-group mb-2" id="id_box">
				<input type="text" name="username" value="${username}"
					class="form-control" id="username" aria-describedby="basic-addon2"
					onkeyup="validation('username');" />
				<div class="check">
					<div style="height: 10px;"></div>
					<i id="username_check" class="bx bx-check-circle"></i>
				</div>
				<span class="input-group-text" id="basic-addon2">
					<input type="button" class="btn" value="중복"
						onclick="double_check(this.form);" />
				</span>
			</div>
			<div class="input_box input-group mb-2" id="email_box">
				<input type="text" placeholder="${email}" disabled="disabled"
					class="form-control" id="email" onkeyup="validation('email');" />
			</div>
			<input type="hidden" id="email" name="email" value="${email}" />
			<div class="input_box input-group mb-2" id="pwd_box">
				<input type="text" name="pwd" placeholder="비밀번호"
					class="form-control" id="pwd" onkeyup="validation('pwd');" />
			</div>
			<div class="input_box input-group mb-2">
				<input type="button" value="회원가입" class="btn btn-outline-danger su"
					id="signUp_btn" onclick="signUp(this.form);" />
			</div>
			<div class="link_box input-group mb-2" id="link_box">
				이미 가입하셨나요? <a href="movie_mate_login_screen.do">로그인</a>
			</div>
		</div>
	</form>
</body>
</html>