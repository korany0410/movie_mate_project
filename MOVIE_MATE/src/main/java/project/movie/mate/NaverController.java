package project.movie.mate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import dao.MovieMate_UserDAO;
import service.NaverLoginBO;
import vo.MovieMate_UserVO;

@Controller
public class NaverController {
	@Autowired
	NaverLoginBO naverLoginBO;
	MovieMate_UserDAO moviemate_userdao;

	public NaverController(NaverLoginBO naverLoginBO, MovieMate_UserDAO moviemate_userdao) {
		// TODO Auto-generated constructor stub
		this.naverLoginBO = naverLoginBO;
		this.moviemate_userdao = moviemate_userdao;
	}

	// 로그인 화면
	@RequestMapping(value = "/movie_mate_naver_signup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverOauth2ClientCallback(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

		String serverUrl = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}

		String url = naverLoginBO.getAuthorizationUrl(session, serverUrl);
		String[] link = url.split("&");
		int size = url.split("&").length - 1;
		System.out.println("session : " + session);
		System.out.println("serverurl : " + serverUrl);
		System.out.println(url);
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, link[size], serverUrl);
		if (oauthToken == null) {
			System.out.println("d");
			model.addAttribute("msg", "네이버 로그인 access 토큰 발급 오류 입니다.");
			model.addAttribute("url", "/");
			return "/common/redirect";
		}

		// 로그인 사용자 정보를 읽어온다
		String apiResult = naverLoginBO.getUserProfile(oauthToken, serverUrl);

		org.json.simple.parser.JSONParser jsonParser = new org.json.simple.parser.JSONParser();
		Object obj = jsonParser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		System.out.println("obj : " + response_obj);
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String username = (String) response_obj.get("name");
		String profile_image = (String) response_obj.get("profile_image");
		String pathname = (String) session.getAttribute("pathname");

		MovieMate_UserVO vo = new MovieMate_UserVO();
		vo.setEmail(email.trim());

		MovieMate_UserVO user_info = moviemate_userdao.naverLogin(vo);
		if (user_info != null) {
			System.out.println(pathname);
			session.setAttribute("isLogin", "yes");
			session.setAttribute("userName", user_info.getUsername());
			session.setAttribute("userIdx", user_info.getUser_idx());
			session.setAttribute("userImg", user_info.getProfile_img());
			return "redirect:" + pathname.replaceAll("@", "&");
		}

		model.addAttribute("email", email);
		model.addAttribute("username", username);
		model.addAttribute("profile_image", profile_image);

		// movie_mate_naver_signup.jsp로 리다이렉트
		return "/WEB-INF/views/userInfo/movie_mate_naver_signup.jsp";
	}
}