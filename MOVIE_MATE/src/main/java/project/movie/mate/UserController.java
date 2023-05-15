package project.movie.mate;

import java.io.File;
import java.util.List;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.MovieMate_CommentDAO;
import dao.MovieMate_UserDAO;
import dao.User_CommentDAO;
import vo.MovieMate_CommentVO;
import vo.MovieMate_UserVO;
import vo.Movie_UserVO;
import vo.PathNameVO;
import vo.StarChart_ViewVO;

import vo.User_CommentVO;

@Controller
public class UserController {

	MovieMate_UserDAO moviemate_userdao;
	User_CommentDAO user_commentdao;
	MovieMate_CommentDAO moviemate_commentdao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	public UserController(MovieMate_UserDAO moviemate_userdao, User_CommentDAO user_commentdao,
			MovieMate_CommentDAO moviemate_commentdao) {
		this.moviemate_userdao = moviemate_userdao;
		this.user_commentdao = user_commentdao;
		this.moviemate_commentdao = moviemate_commentdao;
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

		HttpSession session = request.getSession();

		String s_name = (String) session.getAttribute("userName");

		if (s_name != null && s_name.equals(moviemate_uservo.getUsername())) {
			return "possible";
		}

		if (count < 1) {
			return "possible";
		}

		return "imposiible";
	}

	@RequestMapping("/email_check.do")
	@ResponseBody
	public String email_check(MovieMate_UserVO moviemate_uservo) {

		int count = moviemate_userdao.email_check(moviemate_uservo);

		System.out.println("double_check.do -> count : " + count);

		HttpSession session = request.getSession();

		if (count < 1) {
			return "possible";
		}

		return "imposiible";
	}

	@RequestMapping("/movie_mate_login_screen.do")
	public String movie_mate_login_screen(Model model, PathNameVO pathname, String code) {
		System.out.println("로그인 경로 : " + pathname.getPathname());
		if (code != null) {
			System.out.println(code);
		}
		model.addAttribute("pathname", pathname.getPathname());
		return "/WEB-INF/views/userInfo/movie_mate_login_screen.jsp";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public String login(MovieMate_UserVO moviemate_uservo, PathNameVO pathname) {

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
			System.out.println("리다이렉트 : " + pathname.getPathname());
			return pathname.getPathname().replaceAll("@", "&");
		}
	}

	@RequestMapping("/logout.do")
	public String logout() {
		HttpSession session = request.getSession();

		session.setAttribute("isLogin", "no");
		session.setAttribute("userName", null);
		session.setAttribute("userIdx", null);
		session.setAttribute("userImg", null);

		return "redirect:movie_mate_main_screen.do";
	}

	@RequestMapping("/movie_mate_mypage_screen.do")
	public String mypage(Model model, MovieMate_UserVO vo) {

		MovieMate_UserVO userInfo = moviemate_userdao.userInfo(vo);

		model.addAttribute("userInfo", userInfo);
		return "/WEB-INF/views/userInfo/movie_mate_mypage_screen.jsp";
	}

	@RequestMapping("/mymovie.do")
	public String mymovie() {

		return "/WEB-INF/views/userInfo/movie_mate_myChoice.jsp";
	}

	@RequestMapping("/movie_mate_modify_screen.do")
	public String movie_mate_modify_screen(Model model) {

		HttpSession session = request.getSession();

		int user_idx = (int) session.getAttribute("userIdx");
		MovieMate_UserVO user_info = moviemate_userdao.userInfo_idx(user_idx);
		System.out.println("수정페이지 로그인 정보 : " + user_idx);
		model.addAttribute("userInfo", user_info);

		return "/WEB-INF/views/userInfo/movie_mate_modify_screen.jsp";
	}

	@RequestMapping("/modify_userInfo.do")
	public String modify_userInfo(MovieMate_UserVO uservo) {

		HttpSession session = request.getSession();

		//String currentPaht = Paths.get("").toAbsolutePath().toString();
		String webPath = "/resources/upload/";
		String savePath = app.getRealPath(webPath);
		System.out.println("절대경로 : " + savePath);

		MultipartFile photo = uservo.getPhoto();

		String profile_img = uservo.getProfile_img();
		if (!photo.isEmpty()) {
			profile_img = photo.getOriginalFilename();

			File saveFile = new File(savePath, profile_img);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				profile_img = String.format("%d_%s", time, profile_img);
				saveFile = new File(savePath, profile_img);
			}

			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		uservo.setProfile_img(profile_img);
		moviemate_userdao.update_userInfo(uservo);

		session.setAttribute("userName", uservo.getUsername());
		session.setAttribute("userImg", uservo.getProfile_img());

		return "movie_mate_mypage_screen.do";
	}

	@RequestMapping("/path_save.do")
	@ResponseBody
	public String save_path(PathNameVO pathname) {

		System.out.println(pathname.getPathname());

		HttpSession session = request.getSession();

		session.setAttribute("pathname", pathname.getPathname());

		return "result";
	}

	@RequestMapping("/movie_mate_login_kakao.do")
	public String kakao(@RequestParam String code) {
		System.out.println(code);

		return "kakaoLogin?code=" + code;
	}

	@RequestMapping("/user_comment_isup.do")
	@ResponseBody
	public String user_comment(User_CommentVO uc_vo) {

		User_CommentVO data = user_commentdao.selectOne(uc_vo);

		if (data == null) {
			user_commentdao.insertData(uc_vo);
			moviemate_commentdao.increaseUp(uc_vo);
			uc_vo.setIsup("yes");
		} else {
			if (data.getIsup().equals("yes")) {
				data.setIsup("no");
				uc_vo.setIsup("no");
				user_commentdao.updateData(data);
				moviemate_commentdao.decreaseUp(data);
			} else {
				data.setIsup("yes");
				uc_vo.setIsup("yes");
				user_commentdao.updateData(data);
				moviemate_commentdao.increaseUp(data);
			}
		}
		int up = moviemate_commentdao.reload(uc_vo);
		return Integer.toString(uc_vo.getComment_idx()) + "/" + Integer.toString(up) + "/" + uc_vo.getIsup();
	}

}
