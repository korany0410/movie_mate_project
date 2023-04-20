package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;
import vo.MovieMate_MovieVO;
import vo.Movie_CastVO;

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

	// 전체조회
	public List<MovieMate_MovieVO> boxOffice_list() {

		
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.boxoffice_list");
		
		return list;
	}

	public List<MovieMate_MovieVO> top10_list() {

		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.top10_list");

		return list;
	}
	//화제의 감독 작품
	public List<MovieMate_MovieVO> director_list() {
	      MovieMate_CastVO vo = new MovieMate_CastVO();
	      vo.setName("스티븐 스필버그");
	      int cast_idx = sqlSession.selectOne("mmcast.selectOne", vo);
	      Movie_CastVO vo_3 = new Movie_CastVO();
	      vo_3.setCast_idx(cast_idx);
	      List<Movie_CastVO> list = sqlSession.selectList("mcast.selectCastList", vo_3);
	      List<MovieMate_MovieVO> movie_list = new ArrayList<MovieMate_MovieVO>();
	      for(Movie_CastVO movie : list) {
	         movie_list.add(sqlSession.selectOne("mmmovie.selectMovieIdx", movie));
	      }
	      return movie_list;
	   }


}
