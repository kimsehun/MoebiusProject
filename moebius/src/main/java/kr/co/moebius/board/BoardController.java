package kr.co.moebius.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/{bno}/{pg}")
public class BoardController {
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/")
	public String list(@PathVariable int bno,Model model) throws Exception{
		
		Pagination p = new Pagination(bno);
		List<BoardVO> list = boardService.getBoardList(p);
		BoardInfoVO boardInfo = boardService.getBoardInfo(bno);
		

		model.addAttribute("list",list);
		model.addAttribute("boardInfo",boardInfo);
	
		return "board/list";
	}

	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert(@PathVariable int bno, Model model) throws Exception{
		return "board/insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertAction(@PathVariable int bno, BoardVO boardVO, HttpSession session, Model model) {

		UserVO userVO = new UserVO();
		logger.info(boardVO.toString());
		logger.info(userVO.toString());
		userVO.setUser_id((String)session.getAttribute("user_id"));
		boardVO.setUserVO(userVO);
		
		boardVO.setBno(bno);

		try {
			boardService.insertBoard(boardVO);
			//이렇게 주던지 /board/{bno}
			return "redirect:";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info(e.getMessage());
			model.addAttribute("msg","글 입력 실패");
			model.addAttribute("url","javascript:history.back();");
			return "result";
		}
	}
}
