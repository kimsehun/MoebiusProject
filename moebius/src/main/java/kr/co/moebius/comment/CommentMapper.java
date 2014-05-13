package kr.co.moebius.comment;

public interface CommentMapper {

	public void insertComment(CommentVO commentVO);

	public void getCommentList(int movie_no);

}
