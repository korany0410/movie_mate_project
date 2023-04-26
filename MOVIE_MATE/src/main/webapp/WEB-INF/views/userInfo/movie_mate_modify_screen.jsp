<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/webapp/resources/js/httpRequest.js"></script>

</head>

<script>
/* function send(form) {
    var name = form.username.value.trim();
    var pwd1 = form.pwd1.value.trim();
    var pwd2 = form.pwd2.value.trim();
    
    if (pwd1 === '') {
        alert("비밀번호를 입력해주세요.");
        return;
    }
    
    if (pwd2 !== pwd1){
        alert("비밀번호가 일치하지 않습니다.")
        return;
    }
    
    var url = "movie_mate_modify_screen.do";
    var params = "username=" + name + "&pwd=" + pwd1 + "&user_idx=" + user_idx;
    
    sendRequest(url, params, resultFn, "POST");
}

function resultFn() {
    if (xhr.readyState === 4 && xhr.status === 200) {
        var data = xhr.responseText;
        location.href = "movie_mate_main_screen.do";
    }
} */
</script>
<body>

	<form>
		<div>
			이름 <input name="username" type="text" value="${userInfo.username}">
		</div>


		<div>
			비밀번호 <input type="password" name="pwd1">
		</div>
		
		<div>
			비밀번호 확인 <input type="password" name = "pwd2">
		</div>
		<div>
			<input type="button" value="수정하기" onclick="send(this.form)">


		</div>


	</form>
</body>
</html>