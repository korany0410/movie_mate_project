package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MovieMate_CommentVO;
import vo.User_CommentVO;


public class User_CommentDAO {
	SqlSession sqlSession;

	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//comment_isup ==============================	
	
	public int isup_count(MovieMate_CommentVO vo) {
		int res = sqlSession.selectOne("ucomment.isupCount", vo);

		return res;
	}

	public User_CommentVO selectOne(User_CommentVO vo) {

		User_CommentVO res = sqlSession.selectOne("ucomment.userCommentData", vo);

		return res;
	}

	public int insertData(User_CommentVO vo) {

		int res = sqlSession.insert("ucomment.insertData", vo);

		return res;
	}

	public int updateData(User_CommentVO vo) {
		
		int res = sqlSession.update("ucomment.updateData", vo);
		
		return res;
	}
	

	
	
	
	
	
	
	
	
	
	
}
