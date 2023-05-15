function isLogin() {
	console.log(isLogin_value);
		console.log("login");
	if(isLogin_value == 'no'){
	    if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
		var pathname = (location.pathname + location.search).substring(6);
		pathname = pathname.replaceAll("&","@");
			location.href="movie_mate_login_screen.do?pathname=" + pathname;
	    }
		return "login_no";
	}
	return "login_yes";
}
    