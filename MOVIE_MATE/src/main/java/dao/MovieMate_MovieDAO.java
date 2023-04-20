package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_MovieVO;

public class MovieMate_MovieDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int openApi_insert(MovieMate_MovieVO movievo) {

		int count = sqlSession.selectOne("mmmovie.openApi_count", movievo);
		if (count < 1) {
			int res = sqlSession.insert("mmmovie.openApi_insert", movievo);
		}
		// System.out.println("res : " + res);

		return count;
	}

	// 유저가 고른 영화 정보
	public MovieMate_MovieVO selectOne(MovieMate_MovieVO movievo) {

		MovieMate_MovieVO vo = sqlSession.selectOne("mmmovie.selectOne", movievo);

		return vo;
	}

	// 박스오피스
	public List<MovieMate_MovieVO> boxOffice_list() {

		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.boxoffice_list");

		return list;
	}

	// top10
	public List<MovieMate_MovieVO> top10_list() {

		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.top10_list");

		return list;
	}

}
