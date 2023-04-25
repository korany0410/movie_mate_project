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

	// Movie Mate Top 10 영화
	public List<MovieMate_MovieVO> top10_list() {

		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.top10_list");

		return list;
	}

	// 화제의 감독 작품
	public List<MovieMate_MovieVO> director_list() {
		MovieMate_CastVO vo = new MovieMate_CastVO();
		vo.setName("스티븐 스필버그");
		int cast_idx = sqlSession.selectOne("mmcast.selectOne", vo);
		Movie_CastVO vo_3 = new Movie_CastVO();
		vo_3.setCast_idx(cast_idx);
		List<Movie_CastVO> list = sqlSession.selectList("mcast.selectCastList", vo_3);
		List<MovieMate_MovieVO> movie_list = new ArrayList<MovieMate_MovieVO>();
		for (Movie_CastVO movie : list) {
			movie_list.add(sqlSession.selectOne("mmmovie.selectMovieIdx", movie));
		}
		return movie_list;
	}

	// 영화명 검색 조회
	public List<MovieMate_MovieVO> search_movie(String searchKeyword) {

		List<MovieMate_MovieVO> list_title = sqlSession.selectList("mmmovie.search_movie", searchKeyword);
		List<MovieMate_MovieVO> list_cast = recommend_list(searchKeyword);
		list_title.addAll(list_cast);
		return list_title;
	}

	// Movie Mate 명작 영화
	public List<MovieMate_MovieVO> masterpiece_list() {
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.masterpiece_list");
		return list;

	}

	// Movie Mate가 추천하는 이 주의 배우

	public List<MovieMate_MovieVO> recommend_list(String keyword) {
		List<MovieMate_MovieVO> movie_list = new ArrayList<MovieMate_MovieVO>();
		MovieMate_CastVO vo = new MovieMate_CastVO();
		vo.setName(keyword);
		int cast_idx = 0;
		try {
			cast_idx = sqlSession.selectOne("mmcast.selectOne", vo);
		} catch (Exception e) {
			// TODO: handle exception
			return movie_list;
		}
		Movie_CastVO vo_2 = new Movie_CastVO();
		vo_2.setCast_idx(cast_idx);
		List<Movie_CastVO> list = sqlSession.selectList("mcast.selectCastList", vo_2);
		for (Movie_CastVO movie : list) {
			movie_list.add(sqlSession.selectOne("mmmovie.selectMovieIdx", movie));
		}
		return movie_list;
	}
	
	// 평균 별점이 높은 영화 
	public List<MovieMate_MovieVO> avg_star_list(){
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.avg_star_list");
		return list;
	}
	
	// 이 주의 추천 장르 
	public List<MovieMate_MovieVO> genre_list(){
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.genre_list");
		return list;
	}
	
	
	// 이 주의 인플루언서 
	  public List<MovieMate_MovieVO> famous_list(){
	  List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.famous_list");
	  return list; }
	 
	
	

}























