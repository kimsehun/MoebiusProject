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
	public String list(@PathVariable int bno,@PathVariable int pg,HttpSession session, Model model) throws Exception{
		
		String user_id = (String) session.getAttribute("user_id");
		
		//페이징 처리
		Pagination p = new Pagination(bno);

		//표현 될 페이지 수
		int pageSize = 5;
		
		p.setBno(bno);
		p.setStartnum((pg-1)*pageSize+1);
		p.setEndnum(pg*pageSize);
		
		
		//전체 레코드 수
		int totalRecord = boardService.totalRecord(bno);
		
		//페이지 갯수
		int pageCount = totalRecord / pageSize;
		if(totalRecord % pageSize != 0){
			pageCount++;
		}
		
		int blockSize = 5;
		int startPage = (pg -1) / blockSize * blockSize +1;
		int endPage = (pg -1) / blockSize * blockSize + blockSize;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		
		List<BoardVO> list = boardService.getBoardList(p);
		BoardInfoVO boardInfo = boardService.getBoardInfo(bno);
		
		
		model.addAttribute("totalRecord",totalRecord);
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("blockSize",blockSize);
	
		model.addAttribute("pg",pg);
		model.addAttribute("list",list);
		model.addAttribute("boardInfo",boardInfo);
		model.addAttribute("user_id",user_id);
		
		
		return "board/list";
	}

	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert(@PathVariable int bno, HttpSession session, Model model) throws Exception{
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("user_id",user_id);
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
