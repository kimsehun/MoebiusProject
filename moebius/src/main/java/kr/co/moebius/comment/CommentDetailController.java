package kr.co.moebius.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/comment/{movie_no}/{cno}")
public class CommentDetailController {
	private static final Logger logger = LoggerFactory
			.getLogger(CommentDetailController.class);

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/delete", headers = "Accept=application/json;charset=UTF-8", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody	// json으로 자동 수정하기 위해 사용함.
	public Map<String, Object> deleteComment(@PathVariable int cno, @PathVariable int movie_no, HttpSession session, CommentVO commentVO)
			throws Exception {
		logger.info("삭제 번호 : " + cno);
		commentVO.setComment_no(cno);
		commentVO.setUser_id((String)session.getAttribute("user_id"));
		commentService.deleteComment(commentVO);
		return avgmap(movie_no);
	}
	
	//평점 평균
	private Map<String, Object> avgmap(int movie_no) {
		int cntstar = commentService.avgstar(movie_no);
		double sum=0;
		//평점평균 구하기
		List<CommentVO> list = commentService.getCommentList(movie_no);
		for(CommentVO vo : list) {
			sum +=vo.getComment_star();
		}
		
		double avg = sum/cntstar;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("avg", avg);
		logger.info("평균 : " + avg);
		return map;
	}
}