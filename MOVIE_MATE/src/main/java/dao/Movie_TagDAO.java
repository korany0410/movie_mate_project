package dao;

import org.apache.ibatis.session.SqlSession;

public class Movie_TagDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
