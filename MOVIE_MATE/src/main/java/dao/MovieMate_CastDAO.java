package dao;

import org.apache.ibatis.session.SqlSession;

public class MovieMate_CastDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}