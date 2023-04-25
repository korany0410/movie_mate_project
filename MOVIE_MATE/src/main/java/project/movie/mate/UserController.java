package project.movie.mate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.MovieMate_UserDAO;
import vo.MovieMate_MovieVO;
import vo.MovieMate_UserVO;

@Controller
public class UserController {

	MovieMate_UserDAO moviemate_userdao;

	@Autowired // 자동주입 : spring으로부터 자동생성이 가능한 객체를 new없이 알아서 생성해 준다.
	HttpServletRequest request;

	public UserController(MovieMate_UserDAO moviemate_userdao) {
		this.moviemate_userdao = moviemate_userdao;
	}

	@RequestMapping("/movie_mate_signUp_screen.do")
	public String movie_mate_signUp_screen() {

		return "/WEB-INF/views/userInfo/movie_mate_signUp_screen.jsp";
	}

	@RequestMapping("/signUp.do")
	@ResponseBody
	public String signUp(MovieMate_UserVO moviemate_uservo) {

		int res = moviemate_userdao.signUp(moviemate_uservo);

		if (res < 1) {
			return "fail";
		}

		return "success";
	}

	@RequestMapping("/double_check.do")
	@ResponseBody
	public String double_check(MovieMate_UserVO moviemate_uservo) {

		int count = moviemate_userdao.double_check(moviemate_uservo);

		System.out.println("double_check.do -> count : " + count);

		if (count < 1) {
			return "possible";
		}

		return "imposiible";
	}

	@RequestMapping("/movie_mate_login_screen.do")
	public String movie_mate_login_screen() {

		return "/WEB-INF/views/userInfo/movie_mate_login_screen.jsp";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public String login(MovieMate_UserVO moviemate_uservo) {

		MovieMate_UserVO user_info = moviemate_userdao.login(moviemate_uservo);
		if (user_info == null) {
			return "fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("isLogin", "yes");
			session.setAttribute("userName", user_info.getUsername());
			session.setAttribute("userIdx", user_info.getUser_idx());
			session.setAttribute("userImg", user_info.getProfile_img());
			System.out.println("로그인 성공");
			System.out.println("---유저 정보---");
			System.out.println("이메일 : " + user_info.getEmail());
			System.out.println("이름 : " + user_info.getUsername());
			System.out.println("비밀번호 : " + user_info.getPwd());
			return "success";
		}
	}

	@RequestMapping("/logout.do")
	public String logout() {

		HttpSession session = request.getSession();
		session.setAttribute("isLogin", "no");
		session.setAttribute("userName", null);
		session.setAttribute("userIdx", null);
		session.setAttribute("userImg", null);

		return "movie_mate_main_screen.do";
	}
	@RequestMapping("/movie_mate_mypage_screen.do")
	public String mypage() {
		
		
		return "/WEB-INF/views/userInfo/movie_mate_mypage_screen.jsp";
	}
	
	

	
	
	
}
