package kr.co.moebius.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value="/board/{bno}/{pg}/{no}")
public class BoardDetailController {

	private static Logger logger = LoggerFactory.getLogger(BoardDetailController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/")
	public String detail(@PathVariable int bno,@PathVariable int no, BoardVO boardVO, Model model) throws Exception {

		try {
			boardVO = boardService.getDetail(no);
			logger.info(boardVO.toString());
			model.addAttribute("boardVO",boardVO);
			model.addAttribute("bno",bno);
			return "board/detail";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","글을 가져오지 못했습니다.");
			model.addAttribute("url","..");
			return "result";
			
		}
		
	}
	
}
