package kr.co.moebius.comment;

import java.util.List;

public interface CommentMapper {

	public void insertComment(CommentVO commentVO);

	public List<CommentVO> getCommentList(int movie_no);

	public int avgstar(int movie_no);

	public void deleteComment(CommentVO commentVO);

}
