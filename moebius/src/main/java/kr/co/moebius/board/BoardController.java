package kr.co.moebius.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		model.addAttribute("bno",bno);
		model.addAttribute("list",list);
		model.addAttribute("boardInfo",boardInfo);
	
		return "board/list";
	}
}
