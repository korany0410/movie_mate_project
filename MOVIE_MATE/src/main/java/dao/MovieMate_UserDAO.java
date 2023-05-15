package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import vo.MovieMate_CastVO;
import vo.MovieMate_MovieVO;
import vo.MovieMate_UserVO;

public class MovieMate_UserDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// (회원가입)
	public int signUp(MovieMate_UserVO moviemate_uservo) {

		int res = sqlSession.insert("mmuser.signUp", moviemate_uservo);

		return res;
	}

	// (username 중복확인)
	public int double_check(MovieMate_UserVO moviemate_uservo) {

		int count = sqlSession.selectOne("mmuser.double_check", moviemate_uservo);

		return count;
	}

	// (email 중복확인)
	public int email_check(MovieMate_UserVO moviemate_uservo) {

		int count = sqlSession.selectOne("mmuser.email_check", moviemate_uservo);

		return count;
	}

	// (로그인 확인)
	public MovieMate_UserVO login(MovieMate_UserVO moviemate_uservo) {

		MovieMate_UserVO user_info = sqlSession.selectOne("mmuser.login", moviemate_uservo);

		return user_info;
	}

	// 회원명 검색 조회
	public List<MovieMate_UserVO> search_user(String searchKeyword) {

		List<MovieMate_UserVO> list = sqlSession.selectList("mmuser.search_user", searchKeyword);
		return list;
	}

	// 회원 정보 수정
	public MovieMate_UserVO userInfo_idx(int user_idx) {

		MovieMate_UserVO vo = sqlSession.selectOne("mmuser.userInfo_idx", user_idx);

		return vo;
	}

	// 마이페이지

	public List<MovieMate_UserVO> mypage(String page) {

		List<MovieMate_UserVO> list = sqlSession.selectList("mmuser.mypage", page);
		return list;
	}

	public MovieMate_UserVO userInfo(MovieMate_UserVO vo) {

		MovieMate_UserVO res = sqlSession.selectOne("mmuser.userInfo", vo);

		return res;
	}

	public int update_userInfo(MovieMate_UserVO uservo) {

		int res = sqlSession.update("mmuser.update_userInfo", uservo);

		return res;
	}

	public MovieMate_UserVO kakaoLogin(MovieMate_UserVO vo) {

		System.out.println("kakaoLogin :" + vo.getEmail());
		MovieMate_UserVO res = sqlSession.selectOne("mmuser.kakaoLogin", vo);
		return res;

	}
	
	public MovieMate_UserVO naverLogin(MovieMate_UserVO vo) {

		System.out.println("naverLogin :" + vo.getEmail());
		MovieMate_UserVO res = sqlSession.selectOne("mmuser.kakaoLogin", vo);
		return res;

	}

}
