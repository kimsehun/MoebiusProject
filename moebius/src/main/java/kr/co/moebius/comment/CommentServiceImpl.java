package kr.co.moebius.comment;

import java.util.List;

import kr.co.moebius.movie.MovieMapper;
import kr.co.moebius.user.UserMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	
	private static final Logger logger = LoggerFactory.getLogger("CommentServiceImpl.class");
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insertComment(CommentVO commentVO) throws Exception {
		//이미 댓글을 등록햇으면 두번 등록하지 못함
		if(commentMapper.overId(commentVO) > 0) throw new RuntimeException();
		commentMapper.insertComment(commentVO);
	}

	@Override
	public List<CommentVO> getCommentList(int movie_no) {
		return commentMapper.getCommentList(movie_no);
	}

	@Override
	public int avgstar(int movie_no) {
		return commentMapper.avgstar(movie_no);
	}
	
	@Override
	public void deleteComment(CommentVO commentVO) {
		commentMapper.deleteComment(commentVO);
	}
	
	@Override
	public void count(CommentVO commentVO) {
		if(commentMapper.compareCount(commentVO) == 0) {
			logger.info(commentVO.toString());
			if(commentMapper.countUp(commentVO) > 0) {
				userMapper.pointUp(commentVO.getUser_id());
			}
		}
		
	}

}
