package dao;

import org.apache.ibatis.session.SqlSession;

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
	public int login(MovieMate_UserVO moviemate_uservo) {
		
		int count = sqlSession.selectOne("mmuser.login", moviemate_uservo);
		
		return count;
	}
	
}
