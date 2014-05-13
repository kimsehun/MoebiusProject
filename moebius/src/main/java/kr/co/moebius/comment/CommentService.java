package kr.co.moebius.comment;

import java.util.List;

public interface CommentService {

	void insertComment(CommentVO commentVO);

	List<CommentVO> getCommentList(int movie_no);

	int avgstar(int movie_no);

	void deleteComment(CommentVO commentVO);



}
