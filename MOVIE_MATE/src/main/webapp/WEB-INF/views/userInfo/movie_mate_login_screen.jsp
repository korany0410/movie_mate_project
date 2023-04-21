<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>

<script>
	function send(f) {
		var email = f.email.value;
		var pwd = f.pwd.value;
		var keyCode = window.event.keyCode;

		url = "login.do";
		param = "email=" + email + "&pwd=" + pwd;

		sendRequest(url, param, resFn, "POST");
	}
		
		function resFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;

				if (result == 'success') {
					alert("로그인 성공했습니다.");
					location.href = "movie_mate_main_screen.do";
				} else {
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					return;
				}
			}
		}
	
</script>


</head>
<body>

	<form>

		<h1>로그인</h1>

		<div>
			<input type="email" name="email" placeholder="이메일">
		</div>

		<div>
			<input type="password" name="pwd" placeholder="비밀번호">
		</div>

		<div>
			<input type="button" name="button" value="로그인"
				onclick="send(this.form);" onkeyup="enterkey();">
		</div>


		<div>
			계정이 없으신가요?<input type="button" name="button" value="회원가입"
				onclick="location.href='movie_mate_signUp_screen.do'">
		</div>

	</form>

</body>
</html>