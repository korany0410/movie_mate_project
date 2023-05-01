<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/mate/resources/css/myPage.css?ver=1" />
<link rel="stylesheet" href="/mate/resources/css/modify.css" />
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
   rel='stylesheet'>
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>
</head>
<script type="text/javascript">
    function profile_change(input) {
   var file = input.files[0];
   var img = document.getElementById('upload_img');
   img.src = URL.createObjectURL(file);
    }

    function username_confirm() {
   var username = document.getElementById('username').value;
   var username_check = document.getElementById('username_check');
   check = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
   if (check.test(username)) {
       var url = "double_check.do";
       var param = "username=" + username;
       sendRequest(url, param, resNameCheck, "GET");
   } else {
       username_check.className = "bx bx-x-circle";
   }
    }

    function resNameCheck() {
   if (xhr.readyState == 4 && xhr.status == 200) {
       var result = xhr.responseText;
       if (result == 'possible') {
      username_check.className = "bx bx-check-circle";
       } else {
      username_check.className = "bx bx-x-circle";
       }
   }
    }

    function password_confirm() {
   check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
   pwd_check = check.test(value);
    }
</script>
<body>
   <header>
      <%@ include file="/resources/jsp/header.jsp"%>
   </header>
   <div class="wall"></div>
   <form method="post" enctype="multipart/form-data">
      <div class="main_box">
         <div class="first_box">
            <i class='bx bxs-cog setting' onclick="modify();"></i>
            <img class="background" src="/mate/resources/images/photo.png"
               alt="" />
         </div>
         <div class="myProfile_box">
            <div class="profile_img">
               <input id="file_input" name="profile_img" type="file"
                  onchange="profile_change(this);" />
               <c:choose>
                  <c:when test="${userImg eq 'no_data.jpg'}">
                     <img class="user" id="upload_img"
                        src="/mate/resources/images/user.png">
                  </c:when>
                  <c:otherwise>
                     <img class="user" id="upload_img" src="${userImg}" alt="" />
                  </c:otherwise>
               </c:choose>
               <label for="file_input">
                  <i class='bx bxs-camera-plus' style='color: #ffffff;'
                     onchange="profile_change(this);"></i>
               </label>
            </div>
         </div>
         <div class="second_box">
            <div class="analyze">
               <i class='bx bxs-envelope' style='color: #7900ff; font-size: 25px'></i>
               <input class="form-control" type="text"
                  placeholder="${userInfo.email}" readonly="readonly" />
            </div>
         </div>
         <div class="second_box">
            <div class="analyze">
               <i class='bx bxs-face' style='color: #7900ff; font-size: 25px'></i>
               <input class="form-control" name="username" id="username"
                  type="text" placeholder="${userInfo.username}"
                  onkeyup="username_confirm();" />
               <i id="username_check" class='bx bx-x-circle'></i>
            </div>
         </div>
         <div class="second_box last">
            <div class="analyze">
               <i class='bx bxs-lock' style='color: #7900ff; font-size: 25px'></i>
               <div>
                  <div style="display: flex">
                     <input class="form-control pwd" type="password"
                        placeholder="${fn:substring(userInfo.pwd,0,4)}****" />
                     <i id="pwd_check" class='bx bx-x-circle'></i>
                  </div>
                  <div style="display: flex;">
                     <input class="form-control pwd_confirm" type="password" />
                     <i id="pwd_confirm_check" class='bx bx-x-circle'></i>
                  </div>
               </div>
            </div>
            <div style="height: 30px;"></div>
         </div>
      </div>
   </form>
</body>
</html>