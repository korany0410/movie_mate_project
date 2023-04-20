package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CastVO;
import vo.MovieMate_MovieVO;
import vo.Movie_CastVO;

public class Movie_CastDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int openApi_insert(MovieMate_MovieVO movievo, MovieMate_CastVO castvo) {

		Movie_CastVO mc_vo = new Movie_CastVO();

		int movie_idx = sqlSession.selectOne("mcast.movie_idx", movievo);
		//System.out.println("movie_idx = " + movie_idx);
		int cast_idx = sqlSession.selectOne("mcast.cast_idx", castvo);
		//System.out.println("cast_idx = " + cast_idx);
		mc_vo.setMovie_idx(movie_idx);
		mc_vo.setCast_idx(cast_idx);

		int count = sqlSession.selectOne("mcast.openApi_count", mc_vo);
		//System.out.println("count = " + count);
		if (count < 1) {
			int res = sqlSession.insert("mcast.openApi_insert", mc_vo);

		}

		return count;
	}

	public List<Movie_CastVO> selectList(MovieMate_MovieVO movievo) {

		List<Movie_CastVO> cast_list = sqlSession.selectList("mcast.selectList", movievo);

		return cast_list;
	}
}
