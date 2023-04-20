package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;
import vo.MovieMate_MovieVO;

public class MovieMate_CastDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int openApi_insert(MovieMate_CastVO castvo) {

		int count = sqlSession.selectOne("mmcast.openApi_count", castvo);
		if (count < 1) {
			int res = sqlSession.insert("mmcast.openApi_insert", castvo);
		}

		return count;
	}

	// 배우명 검색 조회
	public List<MovieMate_CastVO> search_cast(String searchKeyword) {

		List<MovieMate_CastVO> list = sqlSession.selectList("mmcast.search_cast", searchKeyword);
		
		return list;
	}

}
