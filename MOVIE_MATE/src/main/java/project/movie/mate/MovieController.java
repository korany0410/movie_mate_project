package project.movie.mate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MovieMate_CastDAO;
import dao.MovieMate_CommentDAO;
import dao.MovieMate_Genre_RecDAO;
import dao.MovieMate_MovieDAO;
import dao.MovieMate_TagDAO;
import dao.MovieMate_UserDAO;
import dao.Movie_CastDAO;
import dao.Movie_TagDAO;
import dao.Movie_UserDAO;
import dao.User_CastDAO;
import dao.User_CommentDAO;
import db.DB;
import vo.BestGenre_ViewVO;
import vo.BestMovie_ViewVO;
import vo.CastList_ViewVO;
import vo.CommentList_ViewVO;
import vo.Filtering;
import vo.MovieMate_CastVO;
import vo.MovieMate_CommentVO;
import vo.MovieMate_MovieVO;
import vo.MovieMate_UserVO;
import vo.Movie_CommentVO;
import vo.Movie_UserVO;
import vo.MyPageList_ViewVO;
import vo.StarChart_ViewVO;
import vo.User_CastVO;
import vo.User_CommentVO;

@Controller
public class MovieController {

	private static final String VIEW_PATH = null;

	private static final int String = 0;

	Movie_CastDAO movie_castdao;
	Movie_TagDAO movie_tagdao;
	Movie_UserDAO movie_userdao;
	MovieMate_CastDAO moviemate_castdao;
	MovieMate_CommentDAO moviemate_commentdao;
	MovieMate_Genre_RecDAO moviemate_genre_recdao;
	MovieMate_MovieDAO moviemate_moviedao;
	MovieMate_TagDAO moviemate_tagdao;
	MovieMate_UserDAO moviemate_userdao;
	User_CastDAO user_castdao;

	Random random = new Random();

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	private MovieMate_MovieDAO user_commentdao;

	public MovieController(Movie_CastDAO movie_castdao, Movie_TagDAO movie_tagdao, Movie_UserDAO movie_userdao,
			MovieMate_CastDAO moviemate_castdao, MovieMate_CommentDAO moviemate_commentdao,
			MovieMate_Genre_RecDAO moviemate_genre_recdao, MovieMate_MovieDAO moviemate_moviedao,
			MovieMate_TagDAO moviemate_tagdao, User_CastDAO user_castdao, MovieMate_UserDAO moviemate_userdao) {
		this.movie_castdao = movie_castdao;
		this.movie_tagdao = movie_tagdao;
		this.movie_userdao = movie_userdao;
		this.moviemate_castdao = moviemate_castdao;
		this.moviemate_commentdao = moviemate_commentdao;
		this.moviemate_genre_recdao = moviemate_genre_recdao;
		this.moviemate_moviedao = moviemate_moviedao;
		this.movie_tagdao = movie_tagdao;
		this.user_castdao = user_castdao;
		this.moviemate_userdao = moviemate_userdao;
	}

	@RequestMapping("/data_insert.do")
	public String data_insert() throws IOException, ParseException {

		String[] category = { "sf", "가족", "갱스터", "계몽", "공포", "군사", "느와르", "드라마", "로드무비", "로맨스", "무협", "문예", "뮤지컬", "뮤직",
				"미스터리", "범죄", "사극", "사회물(경향)", "서부", "스릴러", "스포츠", "신파", "실험", "아동", "액션", "어드벤처", "옴니버스", "재난", "전기",
				"전쟁", "종교", "첩보", "청춘영화", "코미디", "판타지", "하이틴(고교)", "합작(번안물)", "활극" };

		for (String c : category) {
			String file_path = "C:\\embedded_kmz_spring\\work\\Project_movie_mate\\MOVIE_MATE\\src\\main\\webapp\\resources\\DB\\"
					+ c + ".txt";
			// 김볼탱 DB 절대 경로 :
			// C:\Embedded_Spring\work\project_3\MOVIE_MATE\src\main\webapp\resources\DB
			// 민지 DB 절대 경로 :
			// C:\\embedded_kmz_spring\\work\\Project_movie_mate\\MOVIE_MATE\\src\\main\\webapp\\resources\\DB
			DB db_text = new DB();
			String[] file_path_arr = db_text.run(file_path);
			for (String link : file_path_arr) {
				// 1. 경로 확인
				String s = URLEncoder.encode(c, "utf-8");
				System.out.println("api 경로 : " + link);
				link = link.replace("genre=" + c, "genre=" + s);
				System.out.println("api 경로 : " + link);

				// 2. URL url 생성
				StringBuilder urlBuilder = new StringBuilder(link);
				// 3. URL 객체 생성.
				URL url = new URL(urlBuilder.toString());
				// 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				// 5. 통신을 위한 메소드 SET.
				conn.setRequestMethod("GET");
				// 6. 통신을 위한 Content-type SET.
				conn.setRequestProperty("Content-type", "application/json");
				// 7. 통신 응답 코드 확인.
				// System.out.println("Response code: " + conn.getResponseCode());
				// 8. 전달받은 데이터를 BufferedReader 객체로 저장.
				BufferedReader rd;
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
				// 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				// 10. 객체 해제.
				rd.close();
				conn.disconnect();
				// 11. 전달받은 데이터 확인

				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
				JSONArray data = (JSONArray) jsonObject.get("Data");

				for (Object arr : data) {
					MovieMate_MovieVO moviemate_movievo = new MovieMate_MovieVO();
					JSONObject obj = (JSONObject) arr; // JSONArray 데이터를 하나씩 가져와 JSONObject로 변환해준다.
					JSONArray result = (JSONArray) obj.get("Result");
					for (Object arr2 : result) {
						JSONObject obj2 = (JSONObject) arr2;
						// System.out.print("title : " + obj2.get("title") + "/");
						String title = (String) obj2.get("title");
						title = title.trim();
						moviemate_movievo.setTitle(title);
						// System.out.print("nation : " + obj2.get("nation") + "/");
						String nation = (String) obj2.get("nation");
						nation = nation.trim();
						moviemate_movievo.setNation(nation);
						// System.out.print("img : " + obj2.get("posters") + "/");
						String img = (String) obj2.get("posters");
						String[] imgs = img.split("[|]");
						if (imgs.length == 0) {
							moviemate_movievo.setProfile_img("");
							moviemate_movievo.setBackground_img("");
						} else if (imgs.length == 1) {
							moviemate_movievo.setProfile_img(imgs[0]);
							moviemate_movievo.setBackground_img("");
						} else if (imgs.length >= 2) {
							moviemate_movievo.setProfile_img(imgs[0]);
							moviemate_movievo.setBackground_img(imgs[1]);
						}
						// System.out.println("genre : " + obj2.get("genre"));
						String genre = (String) obj2.get("genre");
						genre = genre.trim();
						moviemate_movievo.setGenre(genre);
						// System.out.println("company : " + obj2.get("company"));
						String company = (String) obj2.get("company");
						company = company.trim();
						moviemate_movievo.setCompany(company);
						JSONObject obj3 = (JSONObject) obj2.get("plots");
						JSONArray plot = (JSONArray) obj3.get("plot");
						for (Object arr3 : plot) {
							JSONObject obj4 = (JSONObject) arr3;
							// System.out.println(obj4.get("plotText"));
							String content = (String) obj4.get("plotText");
							if (obj4.get("plotLang").equals("한국어")) {
								if (content.length() == 0) {
									content = "내용설명이 한국어로 존재하지 않습니다.";
								}
								moviemate_movievo.setMovie_info(content);
								break;
							} else {
								content = "내용설명이 한국어로 존재하지 않습니다.";
								moviemate_movievo.setMovie_info(content);
							}
						}
						JSONObject obj5 = (JSONObject) obj2.get("ratings");
						JSONArray rating = (JSONArray) obj5.get("rating");
						for (Object arr4 : rating) {
							JSONObject obj6 = (JSONObject) arr4;
							// System.out.print("rating grade : " + obj6.get("ratingGrade") + " ");
							String grade = (String) obj6.get("ratingGrade");
							moviemate_movievo.setFilm_rating(grade.split("[|]")[0]);
							// System.out.println("release date : " + obj6.get("releaseDate") + " ");
							grade = grade.split("[|]")[0];
							if (grade.contains("중학생")) {
								grade = "15세미만관람불가";
							} else if (grade.contains("연소자")) {
								grade = "청소년관람불가";
							} else if (grade.contains("고등학생")) {
								grade = "18 세미만관람불가";
							}
							moviemate_movievo.setFilm_rating(grade);
							System.out.print("rating grade : " + grade);
							String date = (String) obj6.get("releaseDate");
							if (date.length() < 8) {
								moviemate_movievo.setRelease_date("19800101");
							} else {
								String[] date_arr = date.split("[|]");
								for (String d : date_arr) {
									if (d.length() == 8) {
										int err = Integer.parseInt(d.substring(6, 8));
										if (err == 0 || err >= 32) {
											d = d.substring(0, 6) + "01";
										}
										System.out.print(" | release date : " + d);
										moviemate_movievo.setRelease_date(d);
										break;
									}
								}
							}
							String runtime = (String) obj6.get("runtime");
							moviemate_movievo.setRunning_time(runtime.split("[|]")[0]);
							System.out.println(" | runtime : " + runtime.split("[|]")[0]);
							break;
						}
						int attandance = random.nextInt(990) + 10;
						double star_score = (double) random.nextInt(5) + random.nextDouble();
						star_score = Math.round(star_score * 10.0) / 10.0;
						moviemate_movievo.setAttandance(attandance);
						moviemate_movievo.setStar_score(star_score);
						System.out.println("attandance : " + attandance + " | start_score : " + star_score);
						moviemate_moviedao.openApi_insert(moviemate_movievo);
						JSONObject obj7 = (JSONObject) obj2.get("directors");
						JSONArray director = (JSONArray) obj7.get("director");
						for (Object arr5 : director) {
							MovieMate_CastVO moviemate_castvo = new MovieMate_CastVO();
							JSONObject obj8 = (JSONObject) arr5;
							// System.out.println("director : " + obj8.get("directorNm"));
							String name = (String) obj8.get("directorNm");
							if (name == null || name.length() == 0) {
								continue;
							}
							moviemate_castvo.setName(name);
							moviemate_castvo.setType("director");
							moviemate_castvo.setProfile_img("no_data.jpg");
							moviemate_castdao.openApi_insert(moviemate_castvo);
							movie_castdao.openApi_insert(moviemate_movievo, moviemate_castvo);
						}
						JSONObject obj9 = (JSONObject) obj2.get("actors");
						JSONArray actor = (JSONArray) obj9.get("actor");
						for (Object arr6 : actor) {
							MovieMate_CastVO moviemate_castvo = new MovieMate_CastVO();
							JSONObject obj10 = (JSONObject) arr6;
							// System.out.println("actor : " + obj10.get("actorNm"));
							String name = (String) obj10.get("actorNm");
							if (name == null || name.length() == 0) {
								continue;
							}
							moviemate_castvo.setName(name);
							moviemate_castvo.setType("actor");
							moviemate_castvo.setProfile_img("no_data.jpg");
							moviemate_castdao.openApi_insert(moviemate_castvo);
							movie_castdao.openApi_insert(moviemate_movievo, moviemate_castvo);
						}
						System.out.println("---------------------------");
					}
				}
			}
		}

		return "/WEB-INF/views/data/data_check.jsp";
	}

	@RequestMapping(value = { "/", "/movie_mate_main_screen.do" })
	public String movie_mate_main_screen(Model model) {

		HttpSession session = request.getSession();

		if (session.getAttribute("isLogin") == null) {
			session.setMaxInactiveInterval(3600);
			session.setAttribute("isLogin", "no");
			session.setAttribute("userName", null);
			session.setAttribute("userIdx", null);
			session.setAttribute("userImg", null);
		}

		if (session.getAttribute("mode") == null) {
			session.setAttribute("mode", "bx bx-sun");
		}

		System.out.println("로그인 여부 : " + session.getAttribute("isLogin"));
		System.out.println("로그인 정보 : ");
		System.out.println("유저이름 : " + session.getAttribute("userName"));
		System.out.println("유저IDX : " + session.getAttribute("userIdx"));
		System.out.println("유저이미지 : " + session.getAttribute("userImg"));

		// 이주의 배우
		String actor = "조니 뎁";
		// 이주의 감독
		String director = "스티븐 스필버그";
		// 추천 장르
		String genre = "액션";

		// Movie Mate 명작 영화
		List<MovieMate_MovieVO> masterpiece_list = moviemate_moviedao.masterpiece_list();
		model.addAttribute("masterpiece_list", masterpiece_list);

		// 박스오피스 순위
		List<MovieMate_MovieVO> boxOffice_list = moviemate_moviedao.boxOffice_list();
		model.addAttribute("boxoffi_list", boxOffice_list);

		// Movie Mate Top 10 영화
		List<MovieMate_MovieVO> top10_list = moviemate_moviedao.top10_list();
		model.addAttribute("top10_list", top10_list);

		// 이주의 배우
		List<MovieMate_MovieVO> recommend_list = moviemate_moviedao.recommend_list(actor);
		model.addAttribute("recommend_list", recommend_list);

		// 화제감독의추천작
		List<MovieMate_MovieVO> director_list = moviemate_moviedao.director_list(director);
		model.addAttribute("director_list", director_list);

		// 평균별점
		List<MovieMate_MovieVO> avg_star_list = moviemate_moviedao.avg_star_list();
		model.addAttribute("avg_star_list", avg_star_list);

		// 이 주의 추천 장르
		List<MovieMate_MovieVO> genre_list = moviemate_moviedao.genre_list(genre);
		model.addAttribute("genre_list", genre_list);

		// 이 주의 인플루언서
		List<MovieMate_MovieVO> famous_list = moviemate_moviedao.famous_list();
		model.addAttribute("famous_list", famous_list);

		HashMap<String, List<MovieMate_MovieVO>> total_chart = new LinkedHashMap<String, List<MovieMate_MovieVO>>();
		HashMap<String, String> total_chart_name = new HashMap<String, String>();

		total_chart.put("boxOffice", boxOffice_list);
		total_chart_name.put("boxOffice", "박스오피스 순위");

		total_chart.put("top10", top10_list);
		total_chart_name.put("top10", "왓챠 top10 영화");

		total_chart.put("masterpiece", masterpiece_list);
		total_chart_name.put("masterpiece", "무비메이트 명작 영화");

		total_chart.put("director", director_list);
		total_chart_name.put("director", "MovieMate 화제의 감독 [" + director + "]");

		total_chart.put("recommend", recommend_list);
		total_chart_name.put("recommend", "MovieMate 이 주의 배우 [" + actor + "]");

		total_chart.put("avg_star", avg_star_list);
		total_chart_name.put("avg_star", "평균별점이 높은 영화순");

		total_chart.put("genre", genre_list);
		total_chart_name.put("genre", "이 주의 추천 장르 [" + genre + "]");

		total_chart.put("famous", famous_list);
		total_chart_name.put("famous", "이 주의 인플루언서 추천 영화 ");

		model.addAttribute("total_chart", total_chart);
		model.addAttribute("total_chart_name", total_chart_name);

		return "/WEB-INF/views/show/movie_mate_main_screen.jsp";
	}

	@RequestMapping("/movie_mate_choice_screen.do")
	public String movie_mate_choice_screen(Model model, MovieMate_MovieVO moviemate_movievo) {

		HttpSession session = request.getSession();
		moviemate_movievo = moviemate_moviedao.selectOne(moviemate_movievo);
		List<MovieMate_CastVO> cast_list = moviemate_castdao.movie_castList(moviemate_movievo);
		List<CommentList_ViewVO> comment_list = moviemate_commentdao.selectList(moviemate_movievo);

		System.out.println("choice" + comment_list.size());
		if (!session.getAttribute("isLogin").equals("no")) {
			int user_idx = (int) session.getAttribute("userIdx");
			for (CommentList_ViewVO vo : comment_list) {
				vo.getDel_info();
				User_CommentVO uc = new User_CommentVO();
				uc.setComment_idx(vo.getComment_idx());
				uc.setUser_idx(user_idx);
				vo = moviemate_commentdao.update_isup(vo, uc);
			}
		}
		// List<MovieMate_MovieVO> movie_list =
		// moviemate_moviedao.select_similarList(moviemate_movievo);

		MovieMate_CommentVO my_comment = null;
		HashMap<Integer, MovieMate_MovieVO> movie_list = moviemate_moviedao.select_similarList(moviemate_movievo);
		Movie_UserVO vo = new Movie_UserVO();

		if (session.getAttribute("isLogin").equals("yes")) {
			my_comment = new MovieMate_CommentVO();
			int user_idx = (int) session.getAttribute("userIdx");
			int movie_idx = moviemate_movievo.getMovie_idx();
			String user_name = (String) session.getAttribute("userName");

			my_comment.setCom_username(user_name);
			my_comment.setM_ref(movie_idx);
			my_comment = moviemate_commentdao.my_comment(my_comment);

			System.out.println(user_name);
			System.out.println(user_idx);
			System.out.println(movie_idx);
			System.out.println(my_comment);

			vo.setUser_idx(user_idx);
			vo.setMovie_idx(movie_idx);

			int count = movie_userdao.selectOne(vo);
			if (count < 1) {
				movie_userdao.initialize(vo);
			}
		}

		Movie_UserVO mu_vo = movie_userdao.selectInfo(vo);

		System.out.println("캐스팅된 사람 수 : " + cast_list.size());
		System.out.println("댓글 개수 : " + comment_list.size());
		System.out.println("비슷한 영화 개수 : " + movie_list.size());

		int cast_page = 0;
		int comment_page = 0;
		if (cast_list.size() > 6) {
			cast_page = (cast_list.size() - 1) / 6;
		}
		if (comment_list.size() > 2) {
			comment_page = (comment_list.size() - 1) / 2;
		}

		model.addAttribute("movieUser_info", mu_vo);
		model.addAttribute("maxCast_page", cast_page);
		model.addAttribute("maxComment_page", comment_page);
		model.addAttribute("movie_info", moviemate_movievo);
		model.addAttribute("cast_list", cast_list);
		model.addAttribute("comment_list", comment_list);
		model.addAttribute("my_comment", my_comment);
		model.addAttribute("movie_user", mu_vo);
		model.addAttribute("movie_list", movie_list);

		return "/WEB-INF/views/show/movie_mate_choice_screen.jsp";
	}

	@RequestMapping("/movie_mate_choiceCast_screen.do")
	public String movie_mate_choiceCast_screen(Model model, MovieMate_CastVO vo) {

		System.out.println("캐스트 idx 테스트 : " + vo.getCast_idx());
		HttpSession session = request.getSession();
		int user_idx;
		if (session.getAttribute("userIdx") == null) {
			model.addAttribute("user_castInfo", null);
		} else {
			user_idx = (int) session.getAttribute("userIdx");
			User_CastVO uc_vo = new User_CastVO();
			uc_vo.setUser_idx(user_idx);
			uc_vo.setCast_idx(vo.getCast_idx());

			uc_vo = user_castdao.selectOne(uc_vo);
			if (uc_vo == null) {
				model.addAttribute("user_castInfo", null);
			} else {
				model.addAttribute("user_castInfo", uc_vo);
			}

		}

		int isUpCount = user_castdao.isup_count(vo);
		List<MovieMate_MovieVO> movie_list = moviemate_moviedao.castMovieList(vo);
		model.addAttribute("movie_list", movie_list);
		model.addAttribute("cast_name", vo.getName());
		model.addAttribute("cast_type", vo.getType());
		model.addAttribute("cast_info", vo);
		model.addAttribute("isUpCount", isUpCount);
		return "/WEB-INF/views/show/movie_mate_choiceCast_screen.jsp";
	}

	@RequestMapping("/movie_mate_comment_moreInfo_screen.do")
	public String movie_mate_comment_moreInfo_screen(Model model, Movie_CommentVO mc_vo, String clean_bot) {
		CommentList_ViewVO comment_view_origin = moviemate_commentdao.selectCommentOrigin(mc_vo);
		List<CommentList_ViewVO> comment_view_list = moviemate_commentdao.selectCommentList(mc_vo);

		if (clean_bot != null && clean_bot.equals("operation")) {
			System.out.println("클린 봇 작동...");
			Filtering filter_class = new Filtering();
			String[] filter_arr = filter_class.getFilter();
			HashMap<Integer, Integer> contain = new HashMap<Integer, Integer>();
			for (String word : filter_arr) {
				for (int i = 0; i < comment_view_list.size(); i++) {
					if (comment_view_list.get(i).getContent().contains(word)) {
						contain.put(i, i);
					}
				}
			}
			List<CommentList_ViewVO> list = new ArrayList<CommentList_ViewVO>();
			for (int i = 0; i < comment_view_list.size(); i++) {
				if (contain.get(i) == null) {
					list.add(comment_view_list.get(i));
				}
			}
			comment_view_list = list;
		}

		System.out.println(comment_view_list.size());

		HttpSession session = request.getSession();
		System.out.println("choice" + comment_view_list.size());
		if (!session.getAttribute("isLogin").equals("no")) {
			int user_idx = (int) session.getAttribute("userIdx");
			for (CommentList_ViewVO vo2 : comment_view_list) {
				User_CommentVO uc = new User_CommentVO();
				uc.setComment_idx(vo2.getComment_idx());
				uc.setUser_idx(user_idx);
				vo2 = moviemate_commentdao.update_isup(vo2, uc);
			}
			User_CommentVO uc = new User_CommentVO();
			uc.setComment_idx(comment_view_origin.getComment_idx());
			uc.setUser_idx(user_idx);
			comment_view_origin = moviemate_commentdao.update_isup(comment_view_origin, uc);
		}

		model.addAttribute("clean_bot", clean_bot);
		model.addAttribute("origin", comment_view_origin);
		model.addAttribute("list", comment_view_list);

		return "/WEB-INF/views/show/movie_mate_comment_moreInfo_screen.jsp";
	}

	@RequestMapping("/movie_mate_search_screen.do")
	public String movie_mate_search_screen(Model model, String keyword) {

		// 검색 결과를 받아와서 model에 추가
		List<MovieMate_MovieVO> search_movie_result = moviemate_moviedao.search_movie(keyword);
		// List<MovieMate_CastVO> search_cast_result =
		// moviemate_castdao.search_cast(keyword);
		List<MovieMate_UserVO> search_user_result = moviemate_userdao.search_user(keyword);

		System.out.println("search_screen.do parameter keyword : " + keyword);
		System.out.println("영화 검색결과 수" + search_movie_result.size());
		System.out.println("유저 검색결과 수" + search_user_result.size());

		int movie_page = 0;

		if (search_movie_result.size() > 9) {
			movie_page = (search_movie_result.size() - 1) / 9;
		}

		int slide_page = 0;

		if (search_movie_result.size() > 6) {
			slide_page = (search_movie_result.size() - 1) / 6;
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("search_movie", search_movie_result);
		model.addAttribute("movie_page", movie_page);
		model.addAttribute("slide_page", slide_page);
		model.addAttribute("search_user", search_user_result);

		return "/WEB-INF/views/show/movie_mate_search_screen.jsp";
	}

	@RequestMapping("/movie_mate_choice_moreInfo.do")
	public String movie_mate_choice_moreInfo(Model model, int movie_idx) {

		MovieMate_MovieVO vo = moviemate_moviedao.selectOne(movie_idx);
		model.addAttribute("movie", vo);
		if (vo.getRunning_time() != null && !vo.getRunning_time().isEmpty()) {
			int hour = Integer.parseInt(vo.getRunning_time()) / 60;
			int min = Integer.parseInt(vo.getRunning_time()) % 60;
			model.addAttribute("hour", hour);
			model.addAttribute("min", min);
		}

		return "/WEB-INF/views/show/movie_mate_choice_moreInfo_screen.jsp";
	}

	@RequestMapping("/movie_user_want.do")
	@ResponseBody
	public String movie_user(Movie_UserVO movie_uservo) {

		System.out.println(movie_uservo.getUser_idx());
		System.out.println(movie_uservo.getMovie_idx());

		HttpSession session = request.getSession();

		String status = movie_userdao.change(movie_uservo);
		String mode = (String) session.getAttribute("mode");

		return status + "/" + mode;
	}

	@RequestMapping("/cast_user_isup.do")
	@ResponseBody
	public String cast_user(User_CastVO user_castvo) {

		MovieMate_CastVO count = new MovieMate_CastVO();
		count.setCast_idx(user_castvo.getCast_idx());
		User_CastVO vo = user_castdao.selectOne(user_castvo);
		if (vo == null) {
			user_castdao.insertData(user_castvo);
			user_castvo.setIsUp("yes");
		} else {
			if (vo.getIsUp().equals("yes")) {
				user_castvo.setIsUp("no");
			} else {
				user_castvo.setIsUp("yes");
			}
		}
		user_castdao.updateData(user_castvo);
		int isUpCount = user_castdao.isup_count(count);
		return user_castvo.getIsUp() + "/" + isUpCount;
	}

	@RequestMapping("/update_comment.do")
	public String update_comment(MovieMate_CommentVO my_comment) {

		MovieMate_CommentVO vo = moviemate_commentdao.my_comment(my_comment);

		System.out.println(vo);
		int movie_idx = my_comment.getM_ref();

		if (vo == null) {
			System.out.println("데이터 인서트");
			moviemate_commentdao.insert_comment(my_comment);
		} else {
			moviemate_commentdao.update_comment(my_comment);
		}

		return "movie_mate_choice_screen.do?movie_idx=" + movie_idx;
	}

	@RequestMapping("/update_starScore.do")
	@ResponseBody
	public String update_starScore(Movie_UserVO vo) {

		System.out.println("starScore" + vo.getStar_score());
		movie_userdao.update_starScore(vo);
		double avg = movie_userdao.avg(vo);
		avg = Math.round(avg * 10) / 10.0;
		System.out.println("평점 평군 : " + avg);
		vo.setStar_score(avg);
		moviemate_moviedao.update_starScore(vo);

		return Double.toString(vo.getStar_score());
	}

	@RequestMapping("/movie_mate_myChoice_moreInfo.do")
	public String movie_mate_myChoice_moreInfo(Model model) {
		HttpSession session = request.getSession();

		int user_idx = (int) session.getAttribute("userIdx");

		List<MyPageList_ViewVO> myStarScore_list = moviemate_moviedao.myList_starScore(user_idx);
		List<MyPageList_ViewVO> myWant_list = moviemate_moviedao.myList_want(user_idx);

		System.out.println("내가 별점준 영화 갯수 : " + myStarScore_list.size());
		System.out.println("내가 좋아요 영화 갯수 : " + myWant_list.size());

		int maxStarPage = 0;
		if (myStarScore_list.size() > 11) {
			maxStarPage = (myStarScore_list.size() - 1) / 11;
		}

		int maxWantPage = 0;
		if (myWant_list.size() > 11) {
			maxWantPage = (myWant_list.size() - 1) / 11;
		}

		model.addAttribute("maxWantPage", maxWantPage);
		model.addAttribute("maxStarPage", maxStarPage);
		model.addAttribute("myStarScore_list", myStarScore_list);
		model.addAttribute("myWant_list", myWant_list);

		return "/WEB-INF/views/userInfo/movie_mate_myChoice_moreInfo_screen.jsp";
	}

	@RequestMapping("/movie_mate_comment.do")
	public String movie_mate_comment(Model model, MovieMate_MovieVO vo) {

		List<CommentList_ViewVO> comment_list = moviemate_commentdao.selectList(vo);

		HttpSession session = request.getSession();
		System.out.println("choice" + comment_list.size());
		if (!session.getAttribute("isLogin").equals("no")) {
			int user_idx = (int) session.getAttribute("userIdx");
			for (CommentList_ViewVO vo2 : comment_list) {
				User_CommentVO uc = new User_CommentVO();
				uc.setComment_idx(vo2.getComment_idx());
				uc.setUser_idx(user_idx);
				vo2 = moviemate_commentdao.update_isup(vo2, uc);
			}
		}

		model.addAttribute("comment_list", comment_list);
		model.addAttribute("movie_idx", vo.getMovie_idx());

		return "/WEB-INF/views/show/movie_mate_comment_screen.jsp";

	}

	@RequestMapping("/movie_mate_analyze_screen.do")
	public String movie_mate_analyze(Model model, MovieMate_UserVO uservo) {

		List<StarChart_ViewVO> star_scoreList = movie_userdao.star_scoreList(uservo);
		HashMap<Double, Integer> star_map = new LinkedHashMap<Double, Integer>();

		for (int i = 1; i <= 10; i++) {
			star_map.put(i / 2.0, 0);
		}

		for (StarChart_ViewVO vo : star_scoreList) {
			star_map.put(vo.getStar_score(), vo.getCount());
		}

		double avg = 0;
		double most = 0;
		int count = 0;

		for (Double key : star_map.keySet()) {
			avg += key * star_map.get(key);
			count += star_map.get(key);
			if (most <= star_map.get(key)) {
				most = star_map.get(key);
				model.addAttribute("most", key);
			}
		}
		avg = avg / count;

		List<CastList_ViewVO> actorList = moviemate_castdao.actorList(uservo);
		List<CastList_ViewVO> directorList = moviemate_castdao.directorList(uservo);
		List<BestMovie_ViewVO> movieList = moviemate_moviedao.bestMovieList(uservo);
		List<BestGenre_ViewVO> genreList = moviemate_moviedao.bestGenreList(uservo);

		System.out.println("배우 수 : " + actorList.size());
		System.out.println("감독 수 : " + directorList.size());
		System.out.println("영화 국가 종류 : " + movieList.size());

		List<CastList_ViewVO> bestActorList = new ArrayList<CastList_ViewVO>();
		List<CastList_ViewVO> bestDirectorList = new ArrayList<CastList_ViewVO>();
		HashMap<String, double[]> bestMovieList = new LinkedHashMap<String, double[]>();
		HashMap<String, double[]> bestGenreList = new LinkedHashMap<String, double[]>();

		int runtime = moviemate_moviedao.runtime(uservo);

		for (BestMovie_ViewVO vo : movieList) {
			System.out.println(vo.getNation());
			if (!vo.getNation().equals("국가 미표시")) {
				for (String nation : vo.getNation().split(",")) {
					double[] origin = bestMovieList.getOrDefault(nation, new double[2]);
					double[] insert = new double[] { vo.getAvg(), vo.getCount() };
					insert[0] = Math.round((insert[0] + origin[0]) / 2);
					insert[1]++;
					bestMovieList.put(nation, insert);
				}
			}
		}

		for (BestGenre_ViewVO vo : genreList) {
			for (String genre : vo.getGenre().split(",")) {
				double[] origin = bestGenreList.getOrDefault(genre, new double[2]);
				double[] insert = new double[] { vo.getAvg(), vo.getCount() };
				insert[0] = Math.round((insert[0] + origin[0]) / 2);
				insert[1]++;
				bestGenreList.put(genre, insert);
			}
		}
		List<String> keySet = new ArrayList<String>(bestMovieList.keySet());
		List<String> keySet2 = new ArrayList<String>(bestGenreList.keySet());

		keySet.sort(new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return (int) (bestMovieList.get(o2)[0] - bestMovieList.get(o1)[0]);
			}
		});

		keySet2.sort(new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return (int) (bestGenreList.get(o2)[0] - bestGenreList.get(o1)[0]);
			}
		});

		for (String key : keySet) {
			System.out.println(key + " : " + bestMovieList.get(key)[0] + "," + bestMovieList.get(key)[1]);
		}

		for (String key : keySet2) {
			System.out.println(key + " : " + bestGenreList.get(key)[0] + "," + bestGenreList.get(key)[1]);
		}

		if (actorList.size() <= 15) {
			bestActorList = actorList;
		} else {
			for (int i = 0; i < 15; i++) {
				bestActorList.add(actorList.get(i));
			}
		}

		int bestActorSize = 0;

		if (bestActorList.size() >= 3) {
			bestActorSize = (bestActorList.size() - 1) / 3;
		}

		int bestDirectorSize = 0;

		if (bestDirectorList.size() >= 3) {
			bestDirectorSize = (bestDirectorList.size() - 1) / 3;
		}

		if (directorList.size() <= 15) {
			bestDirectorList = directorList;
		} else {
			for (int i = 0; i < 15; i++) {
				bestDirectorList.add(directorList.get(i));
			}
		}

		model.addAttribute("bestActorSize", bestActorSize);
		model.addAttribute("bestDirectorSize", bestDirectorSize);
		model.addAttribute("bestActorList", bestActorList);
		model.addAttribute("bestDirectorList", bestDirectorList);
		model.addAttribute("avg", Math.round(avg * 10.0) / 10.0);
		model.addAttribute("size", count);
		model.addAttribute("star_map", star_map);
		model.addAttribute("bestMovieV", bestMovieList);
		model.addAttribute("bestMovieK", keySet);
		model.addAttribute("bestGenreV", bestGenreList);
		model.addAttribute("bestGenreK", keySet2);
		model.addAttribute("runtime", runtime);
		return "/WEB-INF/views/userInfo/movie_mate_analyze_screen.jsp";

	}

	@RequestMapping("/movie_count.do")
	@ResponseBody
	public String movie_count(Model model) {
		int count_user = movie_userdao.selectCount();
		int count_comment = moviemate_commentdao.selectCount();

		HttpSession session = request.getSession();

		String mode = (String) session.getAttribute("mode");

		System.out.println(mode);

		return Integer.toString(count_comment + count_user) + "/" + mode;
	}

	@RequestMapping("/moviemate_cocomment_insert.do")
	public String moviemate_cocomment_insert(Model model, MovieMate_CommentVO vo) {

		moviemate_commentdao.cocomment_insert(vo);

		return "redirect:movie_mate_comment_moreInfo_screen.do?movie_idx=" + vo.getM_ref() + "&comment_idx="
				+ vo.getC_ref();

	}

	// movie_mate_comment_moreInfo_screen 글 수정
	@RequestMapping("/comment_moreInfo_save_modify.do")
	public String save_modify(MovieMate_CommentVO commentvo) {

		moviemate_commentdao.update_comment(commentvo);

		return "redirect:movie_mate_comment_moreInfo_screen.do?comment_idx=" + commentvo.getC_ref() + "&movie_idx="
				+ commentvo.getM_ref();
	}

	@RequestMapping("/del_comment.do")
	public String del_comment(MovieMate_CommentVO commentvo) {

		moviemate_commentdao.delete_comment(commentvo);

		return "redirect:movie_mate_comment_moreInfo_screen.do?comment_idx=" + commentvo.getC_ref() + "&movie_idx="
				+ commentvo.getM_ref();

	}

	@RequestMapping("/del_origin_comment.do")
	public String del_origin_comment(MovieMate_CommentVO commentvo) {
		moviemate_commentdao.delete_comment(commentvo);
		return "redirect:movie_mate_comment_moreInfo_screen.do?comment_idx=" + commentvo.getC_ref() + "&movie_idx="
				+ commentvo.getM_ref();
	}

	@RequestMapping("/del_origin_comment_screen.do")
	public String del_origin_comment_screen(MovieMate_CommentVO commentvo) {
		moviemate_commentdao.delete_comment(commentvo);
		return "redirect:movie_mate_comment.do?&movie_idx=" + commentvo.getM_ref();
	}

	@RequestMapping("/del_origin_comment_choice.do")
	public String del_origin_comment_choice(MovieMate_CommentVO commentvo) {
		moviemate_commentdao.delete_comment(commentvo);
		return "redirect:movie_mate_choice_screen.do?&movie_idx=" + commentvo.getM_ref();
	}

	@RequestMapping("/darkMode.do")
	@ResponseBody
	public String darkMode(String mode) {

		if (mode.equals("bx bx-moon")) {
			mode = "bx bx-sun";
		} else {
			mode = "bx bx-moon";
		}

		HttpSession session = request.getSession();

		session.setAttribute("mode", mode);

		System.out.println(mode);

		return mode;
	}
}
