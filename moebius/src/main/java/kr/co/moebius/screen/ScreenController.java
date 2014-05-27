package kr.co.moebius.screen;

import java.io.IOException;
import java.util.List;

import kr.co.moebius.location.LocationService;
import kr.co.moebius.location.LocationVO;
import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.schedule.ScheduleService;
import kr.co.moebius.schedule.ScheduleVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/screen")
public class ScreenController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScreenController.class);
	
	@Autowired
	private ScreenService screenService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String screenInsert(Model model) {
		//영화 정보 가져오기
		List<MovieVO> movieList = null; 
		List<LocationVO> locationList = null;
		
		try {
			movieList = movieService.selectMovie();
			locationList = locationService.selectLocation();
			
			model.addAttribute("movieList",movieList);
			model.addAttribute("locationList", locationList);
			
			return "/screen/insert";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "불러오기 실패했습니다.");
			model.addAttribute("url","..");
			return "result";
		}
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String screenInsertAction(ScreenVO screenVO, Model model) throws Exception {
		//어느 장소에서 영화를 틀어줄껀지를 정한다.
		try {
			screenService.insertAction(screenVO);
		} catch (RuntimeException e) {
			model.addAttribute("msg", "해당 영화는 이미 이 지역에 있습니다.");
			model.addAttribute("url","../screen/insert");
			return "result";
		} catch (IOException e) {
			model.addAttribute("msg", "이미 해당 상영관에 영화가 존재합니다.");
			model.addAttribute("url","../screen/insert");
			return "result";
		} catch (Exception e) {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url","../screen/insert");
			return "result";
		}
		int screen_no  = screenService.selectNo(screenVO);
		
		ScheduleVO scheduleVO = new ScheduleVO();
		
		//영화번호를 통해 영화 시작일과 마지막일을 받아옴
		MovieVO movieVO = movieService.selectDate(screenVO.getMovie_no());
		for(int i = Integer.parseInt(movieVO.getMovie_sdate()); i <= Integer.parseInt(movieVO.getMovie_edate()); i++ ) {
			logger.info(i+"");
			int t = (int)(Math.random()*2)+8;//랜덤시
			int m = (int)(Math.random()*59);// 랜덤분
			for(; t < 22 ; t=t+3) {
				String schedule_time = t + ":" + m;
				scheduleVO.setSchedule_date(i+"");
				scheduleVO.setSchedule_time(schedule_time);
				scheduleVO.setScreen_no(screen_no);
				scheduleService.insertSchedule(scheduleVO);
			}
		}
		model.addAttribute("msg","등록 완료");
		model.addAttribute("main/home");
		return "result";
	}
}
