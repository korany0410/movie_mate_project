package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_UserVO;
import vo.User_CastVO;
import vo.User_UserVO;


public class User_UserDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int isup_count(MovieMate_UserVO vo) {
		int res = sqlSession.selectOne("uuser.isupCount", vo);

		return res;
	}
	
	public User_UserVO selectOne(User_UserVO vo) {
		User_UserVO res = sqlSession.selectOne("uuser.userUserData",vo);
		return res;
	}
	public int insertData(User_UserVO vo) {

		int res = sqlSession.insert("uuser.insertData", vo);

		return res;
	}

	public int updateData(User_UserVO vo) {
		int res = sqlSession.update("uuser.updateData", vo);
		return res;
	}
	

}
