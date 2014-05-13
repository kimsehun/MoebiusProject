package kr.co.moebius.comment;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(
			value="/insert",
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<CommentVO> insertComment(CommentVO commentVO) throws Exception {
		commentService.insertComment(commentVO);
		return commentService.getCommentList(commentVO.getMovie_no());
	}
	
	@RequestMapping(
			value="/{movie_no}",
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<CommentVO> listComment(@PathVariable int movie_no) throws Exception {
		return commentService.getCommentList(movie_no);
	}
	
}
