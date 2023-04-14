package dao;

import org.apache.ibatis.session.SqlSession;

public class MovieMate_TagDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
