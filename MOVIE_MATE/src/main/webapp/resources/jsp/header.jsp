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
<link rel="stylesheet" href="/mate/resources/css/reset.css">
<link rel="stylesheet" href="/mate/resources/css/header.css?ver=1">
<script type="text/javascript" src="/mate/resources/js/header.js"></script>

<script>
function search() {
	  var query = document.querySelector('input[type="search"]').value;
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', 'movie_mate_search.do', true);
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      // 서버에서 반환한 응답을 처리하는 코드 작성
	    }
	  };
	  xhr.send('query=' + encodeURIComponent(query));
	}

</script>

</head>

<body>

	<nav class="navbar navbar-expand fixed-top">
  <div class="container-fluid">

    <a class="navbar-brand" aria-current="page" href="#">
      <img src="/mate/resources/images/logo_main.png" alt="" height="30">
    </a>


    <button class="navbar-toggler" type="button"
      data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">

      <form class="d-flex  ms-auto flex-shrink-0" role="search">
        <input class="form-control me-2" type="search"
          
          placeholder="콘텐츠, 인물, 컬렉션, 유저를 검색해보세요." aria-label="Search"
          onkeydown="if(event.keyCode==13) { event.preventDefault(); search(); }">       
      </form>

      <ul class="navbar-nav  ms-2 mb-2 mb-lg-0 flex-shrink-0">
        <li class="nav-item">
          <a class="nav-link" href="movie_mate_login_screen.do">로그인</a>
        </li>

      </ul>
      <ul class="navbar-nav mb-2 mb-lg-0 flex-shrink-0 ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="movie_mate_signUp_screen.do">
            <button class="btn btn-outline-success">회원가입</button>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
	
</body>
</html>