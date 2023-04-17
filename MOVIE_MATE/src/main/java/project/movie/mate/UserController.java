package project.movie.mate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MovieMate_UserDAO;
import vo.MovieMate_UserVO;

@Controller
public class UserController {

	MovieMate_UserDAO moviemate_userdao;

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

		if(res < 1) {
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
}
