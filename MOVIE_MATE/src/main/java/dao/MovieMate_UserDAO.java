package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;
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
	
	//(로그인 확인)
	public MovieMate_UserVO login(MovieMate_UserVO moviemate_uservo) {
		
		MovieMate_UserVO user_info = sqlSession.selectOne("mmuser.login", moviemate_uservo);
		
		return user_info;
	}
	
	//회원명 검색 조회
	public List<MovieMate_UserVO> search_user(String searchKeyword) {
	 
		List<MovieMate_UserVO> list = sqlSession.selectList("mmuser.search_user",searchKeyword);
		return list;
	}
	
}
