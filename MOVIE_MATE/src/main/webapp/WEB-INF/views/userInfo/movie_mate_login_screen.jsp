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




<%-- /*  function send(f) {
		var email = f.email.value;
		var pwd = f.pwd.value;
		var keyCode = window.event.keyCode;
		var pathname = "${pathname}";

		url = "login.do";
		param = "email=" + email + "&pwd=" + pwd + "&pathname=" + pathname;
  */ --%>
<script type="text/javascript">
	/*  function send(f) {
		console.log("a");
		var email = f.email.value;
		var pwd = f.pwd.value;
		var pathname = "${pathname}";
		url = "login.do";
		param = "email=" + email + "&pwd=" + pwd + "&pathname=" + pathname;
		sendRequest(url, param, resFn, "POST");
	} */


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
    } 

    function resFn() {
   if (xhr.readyState == 4 && xhr.status == 200) {
       var result = xhr.responseText;
       if (result != 'fail') {
      alert("로그인 성공했습니다.");
      location.href = result;
       } else {
      alert("아이디 또는 비밀번호가 일치하지 않습니다.");
      return;
       }
   }
    }
    </script>
    
   <!-- 카카오 로그인 테스트 --> 
    <style>
.wrap {
   width: 490px;
   padding: 40px 20px 20px 20px;
   background-color: #f5f6f7;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%,-50%);
   border-radius: 30px;
   box-sizing: border-box;
}

.title {
   margin: 0 auto;
    width: 240px;
    height: 44px;
    text-align: center;
    font-size: 25px;
    background-repeat: no-repeat;
    background-position: 0 0;
    background-size: 240px auto;
    margin-bottom: 20px;
}
.kakao{
   margin-top: 15px;
   height: 60px;
   border: solid 1px #FEE500;
   background: #FEE500;
   color: #3c1d1e;
   font-size: 18px; 
   box-sizing: border-box;
   border-radius: 5px;
   cursor: pointer;
   width: 450px;
   display: flex;
}
.kakao_i{
   background: url(resources/icons/kakao.png) no-repeat;
   width: 40px;
   height: 100%;
   background-size: 90%;
   background-position: 50%;
   margin: 0 20px;
}
.kakao_txt{
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 16px;
   padding-right: 60px;
}

a {
   text-decoration: none;
}

</style>
    
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
				<input type="button" name="button" style="background-color: #7900ff"
					value="로그인" class="btn btn-outline-danger"
					onclick="send(this.form);">
			</div>
			<div class="link_box input-group mb-2" id="link_box">
				계정이 없으신가요? <a href="movie_mate_signUp_screen.do">회원가입</a>
			</div>
			<div class="openApi_box input-group mb-2"></div>
		</div>
	<div class="wrap">
    <div class="title">로그인</div>
     <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=c5c9bf4e2eae7cd92e2e30cb7d2783d8&redirect_uri=http://localhost:9090/mate/movie_mate_login_kakao.do&response_type=code">
     	<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->
        
      	<div class="kakao_i"></div>
      	<div class="kakao_txt">카카오톡으로 간편로그인 </div>
   	</a>
    </div>
	</form>  
	
    
</body>
</html>