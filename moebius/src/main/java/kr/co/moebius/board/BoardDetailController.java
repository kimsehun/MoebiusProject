package kr.co.moebius.board;

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
@RequestMapping(value="/board/{bno}/{pg}/{board_no}")
public class BoardDetailController {

	private static Logger logger = LoggerFactory.getLogger(BoardDetailController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String detail(@PathVariable int bno,@PathVariable int board_no,  Model model) throws Exception {
		BoardVO boardVO = null;
		try {
			boardService.updateCount(board_no);
			boardVO = boardService.getDetail(board_no);
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
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(@PathVariable int board_no, Model model) throws Exception{
		BoardVO boardVO = null;
		try {
			boardVO = boardService.getDetail(board_no);
			model.addAttribute("boardVO",boardVO);
			return "board/update";
				
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","수정할 값을 가져 올 수 없습니다.");
			model.addAttribute("url","..");
			return "result";
		}
		
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateAction(@PathVariable int bno, @PathVariable int board_no, BoardVO boardVO, HttpSession session, Model model) {
		
		
		
		UserVO userVO = new UserVO();
		
		userVO.setUser_id((String)session.getAttribute("user_id"));
		boardVO.setUserVO(userVO);
		
		logger.info(boardVO.toString());
		boardVO.setBno(bno);
		boardVO.setBoard_no(board_no);
		
		
		try {
			boardService.updateBoard(boardVO);
			//이렇게 주던지 /board/{bno}
			return "redirect:";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info(e.getMessage());
			model.addAttribute("msg", e.getMessage().replace("\n", " "));
			model.addAttribute("url","javascript:history.back();");
			return "result";
		}
	}


	
	@RequestMapping(value="/delete")
	public String deleteAction(@PathVariable int board_no, BoardVO boardVO, HttpSession session, Model model) throws Exception{
		UserVO userVO = new UserVO();
		
		userVO.setUser_id((String)session.getAttribute("user_id"));
		boardVO.setUserVO(userVO);
		
		boardVO.setBoard_no(board_no);
		
		try {
			boardService.deleteBoard(boardVO);
			return "redirect:..";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url","javascript:history.back();");
			return "result";
		}
		
		
	}
	

	
}
