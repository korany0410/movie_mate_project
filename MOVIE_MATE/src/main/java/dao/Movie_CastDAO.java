package dao;

import org.apache.ibatis.session.SqlSession;

public class Movie_CastDAO {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
