package dao;

import org.apache.ibatis.session.SqlSession;

public class MovieMate_Genre_RecDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
