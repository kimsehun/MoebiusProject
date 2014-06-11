package kr.co.moebius.reserve;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.moebius.location.LocationService;
import kr.co.moebius.location.LocationVO;
import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.schedule.ScheduleService;
import kr.co.moebius.schedule.ScheduleVO;
import kr.co.moebius.screen.ScreenService;
import kr.co.moebius.screen.ScreenVO;
import kr.co.moebius.user.UserService;
import kr.co.moebius.user.UserVO;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired
	private UserService userService;
	
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
		int endday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);//getActualMaximum() : 그달의 마지막 달을 알려줌
		for(int d = cal.get(Calendar.DATE); d <= endday; d++) {
			calList.add(d);
		}
		
		try {
			movieList = movieService.selectMovie();
			locationList = locationService.selectLocation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String today = calday(cal);
		//상영중인 영화만 골라낸다
		List<MovieVO> rankingList = new ArrayList<MovieVO>();
		for (MovieVO vo : movieList) {
			if (Integer.parseInt(vo.getMovie_sdate()) <= Integer.parseInt(today)) {
				// 상영날짜까지 남은 시간을 계산
				rankingList.add(vo);
			}
		}
		int movie_no = 0;
		
		model.addAttribute("movie_no",movie_no);
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("locationList", locationList);
		model.addAttribute("calList", calList);
		return "reserve/reserve";
	}


	//오늘 날짜를 가져온다.
	private String calday(Calendar cal) {

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
	
	
	@RequestMapping(value="/reserve/{movie_no}")
	public String reserveMovieNo(@PathVariable int movie_no, Model model) throws Exception {
		
		
		List<ScreenVO> locationList = screenService.selectReserveScreen(movie_no);
		List<MovieVO> movieList = movieService.selectMovie();
		
		Calendar cal = Calendar.getInstance();
		
		// 오늘 날짜부터 그달의 말일까지 계산
		List<Object> calList = new ArrayList<Object>();
		model.addAttribute("year", cal.get(Calendar.YEAR));
		model.addAttribute("month", cal.get(Calendar.MONTH)+1);
		int endday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);//getActualMaximum() : 洹몃떖��留덉�留��ъ쓣 �뚮젮以�
		for(int d = cal.get(Calendar.DATE); d <= endday; d++) {
			calList.add(d);
		}
		
		String today = calday(cal);
		List<MovieVO> rankingList = new ArrayList<MovieVO>();
		for (MovieVO vo : movieList) {
			if (Integer.parseInt(vo.getMovie_sdate()) <= Integer.parseInt(today)) {
				// 상영날짜까지 남은 시간을 계산
				rankingList.add(vo);
			}
		}
		model.addAttribute("movie_no", movie_no);
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("locationList",locationList);
		model.addAttribute("calList", calList);
		return "reserve/reserve";
	}
	

	//------------------------------지역 받아가기-------------------------
	@RequestMapping(value="/reserve/movie/{movie_no}", 
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScreenVO> reserveMovie(@PathVariable int movie_no) throws Exception {
		List<ScreenVO> screenList = screenService.selectReserveScreen(movie_no);
		return screenList;
	}
	
	//------------------------------영화 받아가기-------------------------
	@RequestMapping(value="/reserve/locationMovie/{location_no}",
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScreenVO> location(@PathVariable int location_no) throws Exception {
		List<ScreenVO> screenList = screenService.selectReserveMovie(location_no);
		
		logger.info(screenList.toString());
		return screenList;
	}
	
	//--------------------------ajax 날짜 받아가기------------------------
	@RequestMapping(value="/reserve/location/{location_no}",
				headers = "Accept=application/json;charset=UTF-8",
				produces = { MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, Object> reserveLocation(@PathVariable int location_no, int movie_no) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		int endday = cal.getActualMaximum((cal.get(Calendar.MONTH)+1));//getActualMaximum() : 그달의 마지막 달을 알려줌
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> calList = new ArrayList<Object>();
		
		//스크린 넘버 가져오기
		ScreenVO screenVO = new ScreenVO();
		screenVO.setLocation_no(location_no);
		screenVO.setMovie_no(movie_no);
		int screen_no = screenService.selectNo(screenVO);
		map.put("screen_no", screen_no);
		
		
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
	
	//-------------------------ajax 시간 받아가기-----------------------------
	@RequestMapping(value="/reserve/schedule/{day}", 
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ScheduleVO> reserveSchedule(@PathVariable String day, int movie_no, 
							int location_no, int year, String month) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		logger.info("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
		logger.info(cal.get(Calendar.HOUR_OF_DAY)+"");
		//월 출력
		if(month.length() == 2) {
			month = 0 + month;
			month = month.substring(0,2);
		} else {
			month = month.substring(0,2);
		}
		
		// 날짜가 한자리 숫자일때 0을 붙여서 db와 비교할때 알아서 받아드리도록한다.
		if (day.length() == 1) {
			day = 0 + day;
		}
		
		String schedule_date = year + month + day;
		
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
			// db날짜와 jsp에서 선택된 날짜 비교
			if(Integer.parseInt(vo.getSchedule_date()) == Integer.parseInt(schedule_date)) {
				//오늘 날짜와 jsp에서 선택된 날짜 비교
				if(cal.get(Calendar.DATE) == Integer.parseInt(day)) {
				String hour = vo.getSchedule_time().substring(0,2);
				//지금시간과 db 시간 비교
					if(cal.get(Calendar.HOUR_OF_DAY) < Integer.parseInt(hour)) {
					schedule.setSchedule_time(vo.getSchedule_time());
					logger.info(schedule.getSchedule_time());
					schedule.setSchedule_no(vo.getSchedule_no());
					schedule.setScreen_no(vo.getScreen_no());
					duleList.add(schedule);
					}
				} else {
						schedule.setSchedule_time(vo.getSchedule_time());
						schedule.setSchedule_no(vo.getSchedule_no());
						schedule.setScreen_no(vo.getScreen_no());
						duleList.add(schedule);
				}
			}
		}
		return duleList;
	}
	
	//--------------------------예약에서 로그인-------------------------
		@RequestMapping(value = "/reserve/login", method = RequestMethod.GET)
		public void login() {}

		@RequestMapping(value = "/reserve/reserveLogin", method=RequestMethod.POST)
		public ModelAndView reserveLogin(UserVO userVO, HttpSession session) {
			userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
			ModelAndView mav = new ModelAndView("result");
			
			try {
				UserVO userInfo = userService.getUser(userVO);
				
				//session처리
				session.setAttribute("user_id", userInfo.getUser_id());
				session.setAttribute("user_name", userInfo.getUser_name());
				
				mav.addObject("msg",userInfo.getUser_id()+ "님이 로그인되었습니다.");
				mav.addObject("url","../reserve");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				mav.addObject("msg", "로그인에 실패했습니다.");
				mav.addObject("url","javascript:history.back();");
			}
			
			return mav;
		}
}
