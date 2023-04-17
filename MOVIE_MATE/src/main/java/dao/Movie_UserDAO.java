package dao;

import org.apache.ibatis.session.SqlSession;

public class Movie_UserDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
