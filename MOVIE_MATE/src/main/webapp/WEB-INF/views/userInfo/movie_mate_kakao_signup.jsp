<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mate/resources/css/kakaoSignUp.css?ver=1">
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	var user_check1 = false;
	var user_check2 = false;
	var email_check = false;
	var pwd_check = false;

	window.onload = function() {
		check_username = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,18}$/;
		check_email = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
		var username = "${name}";
		var email = "${email}";
		console.log(username);
		console.log(email);
		user_check1 = check_username.test(username);
		email_check = check_email.test(email);
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
		console.log(f);
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
				alert("동일한 이름이 존재합니다. 다시 입력해주세요.");
				return;
			}
		}
	}

	// /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
	function validation(v) {
		var check;
		var value = document.getElementById(v).value;
		console.log(value);
		if (v == 'username') {
			check = /^[A-Za-z][A-Za-z0-9]{2,18}[ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
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

<style>
 .img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 0 auto;
	display: block;
	
}

 .img2 {
	margin: 0 auto;
	display: block;
	padding-top: 20px;
	padding-bottom: 20px;
	cursor: pointer;
}

#id_box {margin-top: 20px;

}

.form-control{height: 30px;
width: 300px;
position: relative;
right: -50px;
margin-bottom: 20px;
}

#signUp_btn{cursor: pointer;
 background-color:#7900ff;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	color: white;
	position: relative;
	right: -75px;
}  

#joong {position: relative;
		left: 50px;}



</style>
</head>
<body>
	<%-- <form>
		<img class="img2" src="/mate/resources/images/logo_main.png" alt="" height="35">
		<h2>회원가입</h2>
		<h2>프로필 이미지</h2>
		<img class="img" src="${image}" /><span>이름</span> <input type="text" name="username" placeholder="이름"
			class="form-control" id="username" aria-describedby="basic-addon2"
			onkeyup="validation('username');" value="${name}" /> <input type="button" class="btn"
			value="중복" onclick="double_check(this.form);" /> email <input type=text value="${email}"
			onkeyup="validation('email');" name="email" /> <input type="password"
			onkeyup="validation('pwd');" name="pwd" id="pwd" /> <input type="button" value="회원가입"
			onclick="signUp(this.form);" />
	</form> --%>
	
	<form class="form">
		<div id="main_box">
			<div class="logo_box input-group mb-2">
			<img class="img2" src="/mate/resources/images/logo_main.png" alt="" height="35" onclick="location.href='movie_mate_main_screen.do'">
            <img class="img" src="${image}" />
				
			</div>
			<div class="input_box input-group mb-2" id="id_box">
				<input type="text" name="username" 
					class="form-control" id="username" aria-describedby="basic-addon2"
					onkeyup="validation('username');" value="${name}" /> <span
					class="input-group-text" id="basic-addon2"> <input
					type="button" class="btn" value="중복" id="joong"
					onclick="double_check(this.form);" />
				</span>
			</div>
			<div class="input_box input-group mb-2" id="email_box">
				<input type="text" name="email" 
					class="form-control" id="email" onkeyup="validation('email');" value="${email}" />
			</div>
			<div class="input_box input-group mb-2" id="pwd_box">
				<input type="password" name="pwd" placeholder="비밀번호"
					class="form-control" id="pwd" onkeyup="validation('pwd');"/>
			</div>
		     
		     <input type="button" value="회원가입" class="btn btn-outline-danger"
					id="signUp_btn" onclick="signUp(this.form);" />
			
		</div>
	</form>
	<script type="text/javascript">
		
	</script>
</body>
</html>