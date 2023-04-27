package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;
import vo.User_CastVO;

public class User_CastDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int isup_count(MovieMate_CastVO vo) {
		int res = sqlSession.selectOne("ucast.isupCount", vo);

		return res;
	}

	public User_CastVO selectOne(User_CastVO vo) {

		User_CastVO res = sqlSession.selectOne("ucast.userCastData", vo);

		return res;
	}

	public int insertData(User_CastVO vo) {

		int res = sqlSession.insert("ucast.insertData", vo);

		return res;
	}

	public int updateData(User_CastVO vo) {
		int res = sqlSession.update("ucast.updateData", vo);
		return res;
	}
}
