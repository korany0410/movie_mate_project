package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BestGenre_ViewVO;
import vo.BestMovie_ViewVO;
import vo.MovieMate_CastVO;
import vo.MovieMate_MovieVO;
import vo.MovieMate_UserVO;
import vo.Movie_CastVO;

import vo.Movie_UserVO;
import vo.MyPageList_ViewVO;
import vo.SimilarVO;


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
	public List<MovieMate_MovieVO> director_list(String keyword) {
		MovieMate_CastVO vo = new MovieMate_CastVO();
		vo.setName(keyword);
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
	public List<MovieMate_MovieVO> avg_star_list() {
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.avg_star_list");
		return list;
	}

	// 이 주의 추천 장르
	public List<MovieMate_MovieVO> genre_list(String genre) {
		MovieMate_MovieVO vo = new MovieMate_MovieVO();
		vo.setGenre(genre);
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.genre_list", vo);
		return list;
	}

	// 이 주의 인플루언서
	public List<MovieMate_MovieVO> famous_list() {
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.famous_list");
		return list;
	}

	// 비슷한 작품 12개 추천
	public HashMap<Integer, MovieMate_MovieVO> select_similarList(MovieMate_MovieVO movievo) {
		HashMap<Integer, MovieMate_MovieVO> total_map = new HashMap<Integer, MovieMate_MovieVO>();
		HashMap<Integer, MovieMate_MovieVO> return_map = new HashMap<Integer, MovieMate_MovieVO>();
		String[] keywords = movievo.getGenre().split(",");
		String release_date = movievo.getRelease_date();
		SimilarVO si = new SimilarVO();
		si.setRelease_date(release_date);
		si.setMovie_idx(movievo.getMovie_idx());
		int nums = (12 / keywords.length) - 1;
		while (total_map.size() <= 12) {
			nums++;
			si.setNumber(nums);
			for (String keyword : keywords) {
				System.out.println(keyword);
				si.setGenre(keyword);
				List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.selectCategory", si);
				System.out.println("각 장르별 영화 갯수 : " + list.size());
				for (MovieMate_MovieVO vo : list) {
					total_map.put(vo.getMovie_idx(), vo);
				}
			}
		}
		for (int key : total_map.keySet()) {
			return_map.put(key, total_map.get(key));
			if (return_map.size() == 12) {
				break;
			}
		}
		return return_map;
	}

	// 더보기
	public MovieMate_MovieVO selectOne(int movie_idx) {

		MovieMate_MovieVO vo = sqlSession.selectOne("mmmovie.moviemate_movie", movie_idx);
		return vo;
	}


	// 내가 누른 인물의 모든 출연 영화 리스트
	public List<MovieMate_MovieVO> castMovieList(MovieMate_CastVO vo) {

		List<MovieMate_MovieVO> totalList = new ArrayList<MovieMate_MovieVO>();
		List<Movie_CastVO> movieIdxList = sqlSession.selectList("mcast.selectCastList", vo);
		for(Movie_CastVO mc_vo : movieIdxList) {
			totalList.add(sqlSession.selectOne("mmmovie.selectMovieIdx", mc_vo));
		}
		return totalList;
	}

	// 내가 별점 준 영화 리스트
	public List<MyPageList_ViewVO> myList_starScore(int user_idx) {

		List<MyPageList_ViewVO> starList = sqlSession.selectList("muser.starList", user_idx);
	
		return starList;
	}

	// 내가 보고싶어요 준 영화 리스트
	public List<MyPageList_ViewVO> myList_want(int user_idx) {

		List<MyPageList_ViewVO> wantList = sqlSession.selectList("muser.wantList", user_idx);
	
		return wantList;
	}

	// 내가 좋아요 누른 영화 중 베스트 영화
	public List<BestMovie_ViewVO> bestMovieList(MovieMate_UserVO vo){
		
		List<BestMovie_ViewVO> res = sqlSession.selectList("mmmovie.bestMovieList", vo);
		
		return res;
	}
	
	// 내가 좋아요 누른 영화중 베스트 장르
	public List<BestGenre_ViewVO> bestGenreList(MovieMate_UserVO vo){
		
		List<BestGenre_ViewVO> res = sqlSession.selectList("mmmovie.bestGenreList", vo);
		
		return res;
	}
	
	// 런타임
	public int runtime(MovieMate_UserVO vo) {
		
		int res = sqlSession.selectOne("mmmovie.runtime", vo);
		
		return res;
	}
	
	// 영화 평균 계산
	public int  update_starScore(Movie_UserVO vo) {
		
		int res = sqlSession.update("mmmovie.update_starScore", vo);
		
		return res;
	}


}
