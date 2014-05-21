package kr.co.moebius.reserve;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.ParseConversionEvent;

import kr.co.moebius.location.LocationService;
import kr.co.moebius.location.LocationVO;
import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.schedule.ScheduleService;
import kr.co.moebius.schedule.ScheduleVO;
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
	
	@Autowired
	private ScheduleService scheduleService;
	
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


	@RequestMapping(value="/reserve/movie/{movie_no}", 
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScreenVO> reserveMovie(@PathVariable int movie_no) {
		List<ScreenVO> screenList = screenService.selectReserveScreen(movie_no);
		return screenList;
		}
	
	@RequestMapping(value="/reserve/location/{location_no}",
				headers = "Accept=application/json;charset=UTF-8",
				produces = { MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, Object> reserveLocation(@PathVariable int location_no, int movie_no) {
		
		Calendar cal = Calendar.getInstance();
		int endday = cal.getActualMaximum((cal.get(Calendar.MONTH)+1));//getActualMaximum() : 그달의 마지막 달을 알려줌
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> calList = new ArrayList<Object>();
		
		MovieVO movieVO = movieService.selectDate(movie_no);
		//년,월,일 으로 나누어 주기
		String year = movieVO.getMovie_edate().substring(0, 4);
		String month = movieVO.getMovie_edate().substring(5, 6);
		String day = movieVO.getMovie_edate().substring(6);
		
		map.put("year", cal.get(Calendar.YEAR));
		map.put("month", cal.get(Calendar.MONTH)+1);
		if((cal.get(Calendar.MONTH)+2) > Integer.parseInt(month)) {
			for(int d = cal.get(Calendar.DATE); d <= Integer.parseInt(day); d++) {
				calList.add(d);
			}
			map.put("calList", calList);
		} else {
			for(int d = cal.get(Calendar.DATE); d <= endday; d++) {
				calList.add(d);
			}
			map.put("calList", calList);
		}
		return map;
	}
	
	@RequestMapping(value="/reserve/schedule/{day}", 
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScheduleVO> reserveSchedule(@PathVariable int day, int movie_no, 
							int location_no, int year, String month) {
		//월 출력
		if(month.length() == 2) {
			month = 0 + month;
			month = month.substring(0,2);
		} else {
			month = month.substring(0,2);
		}
		
		String schedule_date = year + month + day;
		
		logger.info(schedule_date);
		
		ScheduleVO scheduleVO = new ScheduleVO();
		ScreenVO screenVO = new ScreenVO();
		
		//스크린 번호 가져오기
		screenVO.setMovie_no(movie_no);
		screenVO.setLocation_no(location_no);
		int screen_no = screenService.selectNo(screenVO);
		
		//뿌려줄 리스트
		List<ScheduleVO> duleList = new ArrayList<ScheduleVO>();
		
		//시간 가져오기
		scheduleVO.setScreen_no(screen_no);
		List<ScheduleVO> scheduleList = scheduleService.selectTime(scheduleVO);
		for(ScheduleVO vo : scheduleList) {
			ScheduleVO schedule = new ScheduleVO();
			if(Integer.parseInt(vo.getSchedule_date()) == Integer.parseInt(schedule_date)) {
				schedule.setSchedule_time(vo.getSchedule_time());
				logger.info(schedule.getSchedule_time());
				schedule.setSchedule_no(vo.getSchedule_no());
				schedule.setScreen_no(vo.getScreen_no());
				duleList.add(schedule);
			}
		}
		return duleList;
	}
}
