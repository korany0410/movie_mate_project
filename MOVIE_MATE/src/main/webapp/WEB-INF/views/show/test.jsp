<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비메이트</title>
<link rel="icon" href="/mate/resources/images/logo_icon_1.png" />
<link rel="apple-touch-icon" href="/mate/resources/images/logo_icon_1.png" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/mate/resources/css/reset.css" />
<link rel="stylesheet" href="/mate/resources/css/comment_moreInfo_screen.css" />
<script type="text/javascript" src="/mate/resources/js/httpRequest.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript" src="/mate/resources/js/login.js"></script>

<script type="text/javascript">

	var isLogin_value = "${isLogin}"; 

	function update_cocomment(f) {
		f.action = "moviemate_cocomment_insert.do";
		f.submit();
	}

	function isup_clicked(idx) {
		if (isLogin() == "login_no") {
			return;
		}

		var url = "user_comment_isup.do";
		var param = "comment_idx=" + idx + "&user_idx=${userIdx}";
		
		console.log(idx);
		console.log(${userIdx});
		
		sendRequest(url, param, resFnCommentUp, "GET");
	}

	function resFnCommentUp() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;	
			console.log(result)
			var dom = document.getElementById(result.split("/")[0]);
			var count = result.split("/")[1];
			var yesOrNo = result.split("/")[2];
			//좋아요 버튼 클릭시 배경 색 변경, 아이콘 색 변경
			var up = document.getElementById('up'+result.split("/")[0]);
			var upper = document.getElementById('upper'+result.split("/")[0]);
			var icon = document.getElementById('like_icon'+result.split("/")[0]);
			
			if(yesOrNo == 'no'){
				up.style.backgroundColor = "white";
				icon.className = "bx bx-like";				
			}else{			
				icon.className = "bx bxs-like";			
			}	
				dom.innerText = result.split("/")[1];	
		}	
	}

	
	//댓글버튼 클릭시 숨기기 보이기 기능
	function cocomment_input() {
		if (isLogin() == "login_no") {
			return;
		}
		var dom = document.getElementById("cocomment_input_textarea");
		var backgroundBox = document.getElementById("cocomment_input_btn");
		var cocommentComment = document.getElementById("cocomment_comment");
		
		if(dom.style.display == "block"){
			dom.style.display = "none";
			backgroundBox.style.backgroundColor = "white";
			cocommentComment.style.color = "rgba(0, 0, 0, 0.6)";
			cocommentComment.style.fontWeight = "normal";
			cocommentComment.className = "bx bx-message-rounded";
		} else {			
			dom.style.display = "block";
			backgroundBox.style.backgroundColor = "#f2f2f2";
			cocommentComment.style.color = "black";
			cocommentComment.style.fontWeight = "bold";
			cocommentComment.className = "bx bxs-message-rounded";
		}
		return;
	}
	
	//수정하기
	function modify(idx) {
         var comment = document.getElementById('comment'+idx);
         console.log(comment);
         var textarea = document.getElementById('comment_textarea'+idx);
         comment.style.display = "none";
         textarea.style.display = "block";
   }
	
	//수정 취소
	function cancel_modify(idx) {
		var comment = document.getElementById('comment'+idx);
        var textarea = document.getElementById('comment_textarea'+idx);
		comment.style.display = "block";
		textarea.style.display = "none";
	}
	//수정 완료
	function save_modify(idx) {

		var comment = document.getElementById('comment'+idx);
        var textarea = document.getElementById('comment_textarea'+idx);
    	comment.style.display = "block";
		textarea.style.display = "none";

		 location.href = "comment_moreInfo_save_modify.do?comment_idx="+idx;

	}
	
	//댓글 삭제
	function delete(idx) {
		
		return;
		
	}
	
	function clean_bot() {
	    if(confirm("클린봇을 작동시키겠습니까?")){
			var bot = document.getElementById('bot');
			var doing = document.getElementById('doing');
			
			bot.className = 'bx bx-bot bx-tada';
			doing.innerText = "이 작동중입니다...";
			
			setTimeout(function() {
			    console.log('Works!');
			    location.href="movie_mate_comment_moreInfo_screen.do?clean_bot=operation&movie_idx=${origin.movie_idx}&comment_idx=${origin.comment_idx}";
			  }, 3500);
	    }
	}
</script>
</head>
<body>
	<header>
		<%@ include file="/resources/jsp/header.jsp"%>
	</header>
	<div class="wall" style="height: 100px"></div>
	<div class="center_box">
		<div class="user_info" style="display: flex;">
			<div class="profile_img">
				<c:choose>
					<c:when test="${origin.user_profile_img eq 'no_data.jpg'}">
						<img class="profile" alt="" src="/mate/resources/images/user.png">
					</c:when>
					<c:otherwise>
						<img class="profile" alt="" src="/mate/resources/upload/${origin.user_profile_img}">
					</c:otherwise>
				</c:choose>
			</div>
			${origin.username}
		</div>
		<div class="movie_box">
			<div>
				<img class="movie_profile_img" src="${origin.movie_profile_img}" alt="" />
			</div>
			<div class="movie_info_box">
				<div class="title">${origin.title}</div>
				<div class="release_date">${fn:substring(origin.release_date,0,4)}</div>
				<c:choose>
					<c:when test="${origin.star_score gt 0 }">
						<div class="comment" style='width: 75px'>
							<i class='bx bxs-star' style='color: rgba(0, 0, 0, 0.7)'></i>
							<span>${origin.star_score}</span>
						</div>

					</c:when>
					<c:otherwise>
						<div class="comment" style='width: 140px'>
							<i class='bx bxs-bookmark' style='color: rgba(0, 0, 0, 0.7)'></i>
							보고싶어요
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="content">${origin.content}</div>
		<div class="count-box">
			<div class="my_cocomment_up count" id="up${origin.comment_idx}" onclick="isup_clicked('${origin.comment_idx}');">
				좋아요
				<span id="${origin.comment_idx}">${origin.up} </span>
			</div>
			<div class="count">댓글${origin.count-1}</div>
		</div>
		<div class="button_box row">
			<div class="button_up col-4" id="up${origin.comment_idx}" onclick="isup_clicked('${origin.comment_idx}');">
				<c:choose>
					<c:when test="${origin.isup eq 'yes' }">
						<i id="like_icon${origin.comment_idx}" class='bx bxs-like'></i>
					</c:when>
					<c:otherwise>
						<i id="like_icon${origin.comment_idx}" class='bx bx-like'></i>
					</c:otherwise>
				</c:choose>
				좋아요
			</div>
			<div class="button_comment col-4" id="cocomment_input_btn" onclick="cocomment_input();">
				<i class='bx bx-message-rounded' id="cocomment_comment">댓글</i>
			</div>
			<div class="button_share col-4">
				<i class='bx bx-share-alt'>공유</i>

			</div>
		</div>
		<form class="cocomment_input_box" id="cocomment_input_textarea" style="display: none;">
			<div class="comment_user_box">
				<div class="comment_profile_img">
					<c:choose>
						<c:when test="${userImg eq 'no_data.jpg'}">
							<img class="profile" alt="" src="/mate/resources/images/user.png">
						</c:when>
						<c:otherwise>
							<img class="profile" alt="" src="/mate/resources/upload/${userImg}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="com_username">${userName}</div>
			</div>
			<input type="hidden" name="com_username" value="${userName}" />
			<textarea class="comemnt_textarea" name="com_content" placeholder="${origin.title}에 대한 생각을 자유롭게 표현해주세요." rows="4"
				cols="50"></textarea>
			<input type="hidden" name="c_ref" value="${origin.comment_idx}" /> <input type="hidden" name="m_ref"
				value="${origin.movie_idx}" /> <input type="button" class="update_btn update_btn_save" value="저장"
				onclick="update_cocomment(this.form);" /> <input type="button" class="update_btn update_btn_cancel" value="취소"
				onclick="     " />
			<div style="height: 30px;"></div>
		</form>

		<c:choose>
			<c:when test="${empty clean_bot}">
				<div class="cleanBot_box" onclick="clean_bot();">
					<i id="bot" class='bx bxs-bot' style='color: #7900ff'>클린봇</i>
					<span id="doing"> 이 악성댓글을 감지합니다. </span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="cleanedBot_box" onclick="clean_bot();">
					<i id="bot" class='bx bxs-bot bx-spin bx-rotate-90' style='color: #7900ff'></i>
					<span style="color: #7900FF;">클린봇</span>
					<span id="doing">이 악성댓글을 처리했어요!. </span>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="cocomment_list_box">
			<c:forEach var="vo" items="${list}">
				<div class="cocomment_user_box">
					<div class="cocomment_imgNameRegdateBox_Setting_box">
						<div class="cocomment_img_usernameBox_regdate_box">
							<div class="cocomment_profile_img">
								<c:choose>
									<c:when test="${vo.user_profile_img eq 'no_data.jpg'}">
										<img class="profile" alt="" src="/mate/resources/images/user.png">
									</c:when>
									<c:otherwise>
										<img class="profile" alt="" src="/mate/resources/upload/${vo.user_profile_img}">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="cocomment_username_regdate_box">
								<div class="cocomment_username">${vo.username}</div>
								<div class="cocomment_regdate">${vo.regdate}</div>
							</div>
						</div>
					</div>
					<div style="display: flex;">

						<div id="comment${vo.comment_idx}" class="cocomment_content" style="width: 1050px;">
							<pre class="cocomment_con">${vo.content}</pre>
						</div>
						<div id="comment_textarea${vo.comment_idx}" class="cocomment_content" style="width: 1050px; display: none;">
							<textarea rows="" cols="" style="width: 100%;"></textarea>
							<input type="button" value="취소하기" onclick="cancel_modify('${vo.comment_idx}');" /> <input type="button"
								value="변경하기" onclick="save_modify('${vo.comment_idx}');" />

						</div>
						<div class="dropdown">
							<button style="background-color: white !important; border: none !important;" class="btn btn-secondary"
								type="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class='bx bx-dots-vertical-rounded' style='color: rgba(0, 0, 0, 0.5); font-size: 20px;'></i>
							</button>
							<ul class="dropdown-menu">
								<li>
									<a class="dropdown-item dropdown_modify" href="javascript:void(0);" onclick="modify('${vo.comment_idx}');">수정하기</a>
								</li>
								<li>
									<a class="dropdown-item dropdown_delete" href="javascript:void(0);" onclick="delete('${vo.comment_idx}');">삭제하기</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="cocomment_up" id="up${vo.comment_idx}">
						<c:choose>
							<c:when test="${vo.isup eq 'yes' }">
								<i id="like_icon${vo.comment_idx}" class='bx bxs-like' onclick="isup_clicked('${vo.comment_idx}');"> </i>
							</c:when>
							<c:otherwise>
								<i id="like_icon${vo.comment_idx}" class='bx bx-like' onclick="isup_clicked('${vo.comment_idx}');"> </i>
							</c:otherwise>
						</c:choose>
						<span class='like_btn' id="${vo.comment_idx}"> ${vo.up} </span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class=bottom_marin style='margin-bottom: 200px'></div>
	<footer>
		<%@ include file="/resources/jsp/footer.jsp"%>
	</footer>
</body>
</html>