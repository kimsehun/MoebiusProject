package kr.co.moebius.reserve;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.moebius.location.LocationService;
import kr.co.moebius.location.LocationVO;
import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.screen.ScreenService;
import kr.co.moebius.screen.ScreenVO;
import net.wimpi.telnetd.io.terminal.ansi;

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
@RequestMapping(value="/")
public class ReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private ScreenService screenService;
	
	@RequestMapping(value="/reserve")
	public String reserve(Model model) throws Exception{
		
		//영화 제목 리스트 가져오기
		List<MovieVO> movieList = null;
		//극장 리스트 가져오기 
		List<LocationVO> locationList = null;
		
		// 오늘 날짜부터 그달의 말일까지 계산
		Calendar cal = Calendar.getInstance();
		List<Object> calList = new ArrayList<Object>();
		model.addAttribute("year", cal.get(Calendar.YEAR));
		model.addAttribute("month", cal.get(Calendar.MONTH)+1);
		int endday = cal.getActualMaximum((cal.get(Calendar.MONTH)+1));//getActualMaximum() : 그달의 마지막 달을 알려줌
		for(int d = cal.get(Calendar.DATE); d <= endday; d++) {
			calList.add(d);
		}
		
		try {
			movieList = movieService.selectMovie();
			locationList = locationService.selectLocation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("locationList", locationList);
		model.addAttribute("calList", calList);
		return "reserve/reserve";
	}
	
	@RequestMapping(value="/reserve/{movie_no}", 
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScreenVO> reserve(@PathVariable int movie_no) {
		List<ScreenVO> screenList = screenService.selectReserveScreen(movie_no);
		return screenList;
		}
}
