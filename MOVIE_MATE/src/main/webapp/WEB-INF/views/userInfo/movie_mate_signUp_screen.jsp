<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">
    var user_check1 = false;
    var user_check2 = false;
    var email_check = false;
    var pwd_check = false;
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
	var url = "double_check.do";
	var param = "username=" + f.username.value;
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
	    check = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
	    user_check1 = check.test(value);
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
	<h1>회원 가입 페이지</h1>
	<div id="main_box">
		<form>
			<div class="input_box" id="id_box">
				<input type="text" name="username" placeholder="이름" id="username"
					onkeyup="validation('username');" />
				<input type="button" value="중복" onclick="double_check(this.form);" />
			</div>
			<div class="input_box" id="email_box">
				<input type="text" name="email" placeholder="이메일" id="email"
					onkeyup="validation('email');" />
			</div>
			<div class="input_box" id="pwd_box">
				<input type="text" name="pwd" placeholder="비밀번호" id="pwd"
					onkeyup="validation('pwd');" />
			</div>
			<div class="input_box" id="signUp_btn">
				<input type="button" value="회원가입" onclick="signUp(this.form);" />
			</div>
		</form>
		<div class="link_box" id="link_box">
			<span>이미 가입하셨나요?</span>
			<span>
				<a href="movie_mate_login_screen.do">로그인</a>
			</span>
		</div>
	</div>
</body>
</html>