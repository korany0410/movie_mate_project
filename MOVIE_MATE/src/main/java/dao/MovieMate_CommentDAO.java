package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CommentList_ViewVO;
import vo.MovieMate_CommentVO;
import vo.MovieMate_MovieVO;
import vo.Movie_CommentVO;
import vo.User_CastVO;
import vo.User_CommentVO;

public class MovieMate_CommentDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CommentList_ViewVO> selectList(MovieMate_MovieVO movievo) {

		List<CommentList_ViewVO> comment_list = sqlSession.selectList("mmcomment.selectList", movievo);

		return comment_list;
	}

	public MovieMate_CommentVO my_comment(MovieMate_CommentVO commentvo) {

		MovieMate_CommentVO vo = sqlSession.selectOne("mmcomment.myComment", commentvo);

		return vo;
	}

	public int insert_comment(MovieMate_CommentVO commentvo) {

		int res = sqlSession.insert("mmcomment.insert", commentvo);

		return res;
	}

	public int update_comment(MovieMate_CommentVO commentvo) {

		int res = sqlSession.update("mmcomment.update", commentvo);

		return res;
	}

	public int selectCount() {

		int res = sqlSession.selectOne("mmcomment.commentCount");

		return res;
	}

	public List<CommentList_ViewVO> selectCommentList(Movie_CommentVO vo) {

		List<CommentList_ViewVO> comment_list = sqlSession.selectList("mmcomment.commentList", vo);

		return comment_list;
	}

	public int cocomment_insert(MovieMate_CommentVO vo) {

		int cocomment_insert = sqlSession.insert("mmcomment.cocommentInsert", vo);

		return cocomment_insert;

	}

	public CommentList_ViewVO selectCommentOrigin(Movie_CommentVO vo) {

		CommentList_ViewVO comment_origin = sqlSession.selectOne("mmcomment.commentOrigin", vo);

		return comment_origin;
	}

	public int isup_count(CommentList_ViewVO vo) {

		int res = sqlSession.selectOne("mmcomment.isupCount", vo);

		return res;
	}

	public CommentList_ViewVO commentselectOne(CommentList_ViewVO vo) {

		CommentList_ViewVO res = sqlSession.selectOne("mmcomment.userCommentData", vo);

		return res;
	}

	public int insertData(CommentList_ViewVO vo) {

		int res = sqlSession.insert("mmcomment.insertData", vo);

		return res;
	}

	public int updateData(CommentList_ViewVO vo) {

		int res = sqlSession.update("mmcomment.updateData", vo);

		return res;
	}

	public int increaseUp(User_CommentVO vo) {

		int res = sqlSession.update("mmcomment.increaseUp", vo);

		return res;
	}

	public int decreaseUp(User_CommentVO vo) {

		int res = sqlSession.update("mmcomment.decreaseUp", vo);

		return res;
	}

	public int reload(User_CommentVO vo) {

		int res = sqlSession.selectOne("mmcomment.reload", vo);

		return res;
	}

	public CommentList_ViewVO update_isup(CommentList_ViewVO cl_vo, User_CommentVO uc_vo) {

		User_CommentVO res = sqlSession.selectOne("ucomment.userCommentData", uc_vo);
		System.out.println(res);
		System.out.println(cl_vo);
		if (res != null) {
			cl_vo.setIsup(res.getIsup());
		}
		return cl_vo;

	}

	public int delete_comment(MovieMate_CommentVO commentvo) {

		System.out.println(commentvo.getComment_idx());
		int res = sqlSession.update("mmcomment.delete_comment", commentvo);

		return res;
	}
	
}
