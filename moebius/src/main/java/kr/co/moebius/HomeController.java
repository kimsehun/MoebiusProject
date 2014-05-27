package kr.co.moebius;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import kr.co.moebius.board.BoardController;
import kr.co.moebius.board.BoardInfoVO;
import kr.co.moebius.board.BoardService;
import kr.co.moebius.board.BoardVO;
import kr.co.moebius.board.Pagination;
import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/")
	public String home() {
		return "main/home";
	}
	
	//오늘 날짜를 YYYYMMDD 형식으로 반환한다.
		private String calday() {
			Calendar cal = Calendar.getInstance();

			String year = cal.get(Calendar.YEAR) + "";
			String month = (cal.get(Calendar.MONTH) + 1) + "";
			String day = cal.get(Calendar.DATE) + "";
			if (month.length() == 1) {
				month = "0" + month;
			}
			if (day.length() == 1) {
				day = "0" + day;
			}
			return year + month + day;
		}
		
		
	@RequestMapping("/main/notice")
	public String homeBoard(Model model) throws Exception{
		
		int bno = 1;
		int pg = 1;
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

		return "main/notice";
	}
	
	@RequestMapping("/main/rank")
	public String rank(Model model) throws Exception {
		String today = calday();
		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.ranking();
		//상영작만 따로 저장할 list를 만든다.
		List<MovieVO> rankinglist = new ArrayList<MovieVO>();
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) < Integer.parseInt(today)) {
				//상영날짜까지 남은 시간을 계산
				rankinglist.add(vo);
			}
		}
		model.addAttribute("rankinglist",rankinglist);
		
		return "main/rank";
	}
	
	@RequestMapping("/main/question")
	public String homeBoardQ(Model model) throws Exception{
		
		int bno = 2;
		int pg = 1;
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
		
		return "main/notice";
	}
	
	@RequestMapping("main/plan")
	public String homePlan(Model model) throws Exception {
		String today = calday();

		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.search();
		// 상영작만 따로 저장할 list를 만든다.
		List<MovieVO> list2 = new ArrayList<MovieVO>(); // 예정작
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) > Integer.parseInt(today)) {
				// 상영날짜까지 남은 시간을 계산
				vo.setDday(Integer.parseInt(vo.getMovie_sdate())
						- Integer.parseInt(today));
				list2.add(vo);
			}
		}
		model.addAttribute("list2", list2);
		
		return "main/plan";
	}
}
