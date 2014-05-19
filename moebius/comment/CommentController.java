package kr.co.moebius.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private MovieService movieService;
	
	// 삽입후 리스트 뿌려주기
	@RequestMapping(
			value="/insert",
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, Object> insertComment(CommentVO commentVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			commentService.insertComment(commentVO);
			map.put("result", "true");
			//영화 포인트 등록 부분
			commentService.count(commentVO);
			return avgmap(map,commentVO.getMovie_no());
		} catch (RuntimeException e) {
			map.put("result", "false");
			map.put("msg", "이미 등록된 아이디 입니다.");
			return avgmap(map,commentVO.getMovie_no());
		} catch(Exception e) {
			map.put("result", "false");
			map.put("msg","오류발생");
			return avgmap(map,commentVO.getMovie_no());
		}
		
	}

	//처음부터 리스트 뿌려주기
	@RequestMapping(
			value="/{movie_no}",
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, Object> listComment(@PathVariable int movie_no, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		return avgmap(map,movie_no);
	}
	
	//평점평균
	private Map<String, Object> avgmap(Map<String, Object> map, int movie_no) {
		int cntstar = commentService.avgstar(movie_no);
		double sum = 0;
		//평점평균 구하기
		List<CommentVO> list = commentService.getCommentList(movie_no);
		for(CommentVO vo : list) {
			sum +=vo.getComment_star();
		}
		double avg = sum/cntstar;
		map.put("list", list);
		map.put("avg", avg);
		return map;
	}
}