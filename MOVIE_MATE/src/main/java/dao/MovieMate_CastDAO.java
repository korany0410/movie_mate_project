package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;

public class MovieMate_CastDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int openApi_insert(MovieMate_CastVO castvo) {
		
		int count = sqlSession.selectOne("mmcast.openApi_count", castvo);
		if(count < 1) {			
			int res = sqlSession.insert("mmcast.openApi_insert", castvo);
		}
		
		return count;
	}
}
