package project.movie.mate;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MovieMate_UserDAO;
import service.KakaoLoginService;
import vo.MovieMate_UserVO;

@Controller
public class KakaoController {

	public KakaoLoginService iKakaoS;
	MovieMate_UserDAO moviemate_userdao;

	public KakaoController(KakaoLoginService iKakaoS, MovieMate_UserDAO moviemate_userdao) {
		// TODO Auto-generated constructor stub
		this.iKakaoS = iKakaoS;
		this.moviemate_userdao = moviemate_userdao;
	}

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname,
	// email정보가 담겨있음
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(Model model, @RequestParam(value = "code", required = false) String code,
			HttpSession session) throws Throwable {

		// 1번
		System.out.println("code:" + code);

		// 2번
		String access_Token = iKakaoS.getAccessToken(code.split(",")[0]);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행

		// 3번
		HashMap<String, Object> userInfo = iKakaoS.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		String username = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");
		String profile_image = (String) userInfo.get("profile_image");
		String pathname = (String) session.getAttribute("pathname");

		MovieMate_UserVO vo = new MovieMate_UserVO();
		vo.setEmail(email.trim());

		MovieMate_UserVO user_info = moviemate_userdao.kakaoLogin(vo);
		if (user_info != null) {
			session.setAttribute("isLogin", "yes");
			session.setAttribute("userName", user_info.getUsername());
			session.setAttribute("userIdx", user_info.getUser_idx());
			session.setAttribute("userImg", user_info.getProfile_img());
			return "redirect:" + pathname.replaceAll("@", "&");
		}

		model.addAttribute("email", email);
		model.addAttribute("username", username);
		model.addAttribute("profile_image", profile_image);
		return "/WEB-INF/views/userInfo/movie_mate_kakao_signup.jsp";
	}
}
