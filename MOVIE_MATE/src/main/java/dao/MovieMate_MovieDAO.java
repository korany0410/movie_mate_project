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
	//전체조회
	public List<MovieMate_MovieVO> boxoffi_list(){
		List<MovieMate_MovieVO> list = sqlSession.selectList("mmmovie.boxoffi_list");
		return list;
	}
	
	
}
