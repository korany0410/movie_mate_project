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

	// 박스오피스 순위
	public List<MovieMate_MovieVO> boxoffi_list() {
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.boxoffi_list");
		return list;
	}
	
	// Movie Mate Top 10 영화
	public List<MovieMate_MovieVO> top10_list() {
		
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.top10_list");
		
		return list;
	}

	// Movie Mate 명작 영화
	  public List<MovieMate_MovieVO> masterpiece_list(){
	  List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.masterpiece_list"); 
	  return list; 
	  
	  }

}
