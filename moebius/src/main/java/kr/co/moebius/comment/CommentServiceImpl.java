package kr.co.moebius.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public void insertComment(CommentVO commentVO) {
		commentMapper.insertComment(commentVO);
	}

	@Override
	public List<CommentVO> getCommentList(int movie_no) {
		
		return commentMapper.getCommentList(movie_no);
	}

}
