<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
</style>
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
</head>
<body>
   <h1>Movie Mate Top 10 영화</h1>

   <div id="carouselExample" class="carousel slide" >
      <div class="carousel-inner" >
         <div class="carousel-item active" >
            <c:forEach var="i" begin="0" end="4">
               <div style="float:left;">
                  <img alt="" src="${boxoffi_list[i].profile_img }" >
                  <div>${boxoffi_list[i].title }</div>
                  <div>${boxoffi_list[i].nation }</div>
                  <div>${boxoffi_list[i].genre }</div>
               
               </div>
            </c:forEach>
            <div class="carousel-caption d-none d-md-block"></div>
         </div>
         <div class="carousel-item">
            <c:forEach var="i" begin="5" end="9">
               <div style="float:left;">
                  <img alt="" src="${boxoffi_list[i].profile_img }">
               <div>${boxoffi_list[i].title }</div>
               <div>${boxoffi_list[i].nation }</div>
               <div>${boxoffi_list[i].genre }</div>
               </div>
            </c:forEach>
            <div class="carousel-caption d-none d-md-block"></div>
         </div>
         <div class="carousel-item">
            <c:forEach var="i" begin="10" end="14">
               <div style="float:left;">
                  <img alt="" src="${boxoffi_list[i].profile_img }">
               <div>${boxoffi_list[i].title }</div>
               <div>${boxoffi_list[i].nation }</div>
               <div>${boxoffi_list[i].genre }</div>
               </div>
            </c:forEach>
            <div class="carousel-caption d-none d-md-block"></div>
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExample" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExample" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>
</body>
</html>



















