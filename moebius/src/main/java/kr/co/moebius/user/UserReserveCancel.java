package kr.co.moebius.user;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.moebius.movie.MovieService;
import kr.co.moebius.reserve.ReserveService;
import kr.co.moebius.reserve.ReserveVO;
import kr.co.moebius.schedule.ScheduleService;
import kr.co.moebius.schedule.ScheduleVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserReserveCancel {
	
	private static final Logger logger = LoggerFactory.getLogger(UserReserveCancel.class);
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/cancel/{movie_no}/{schedule_no}/{seat_no}", method=RequestMethod.GET)
	public String cancel(@PathVariable int movie_no, @PathVariable int schedule_no,
						@PathVariable int seat_no, Model model, HttpSession session) {
		
		ReserveVO vo = new ReserveVO();
		vo.setMovie_no(movie_no);
		
		try {
			//영화 포인트 가져오기
			vo.setMovie_point(movieService.getMoviePoint(movie_no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setSchedule_no(schedule_no);
		vo.setSeat_no(seat_no);
		vo.setUser_id((String) session.getAttribute("user_id"));
		
		ScheduleVO scheduleVO = new ScheduleVO();
		
		Calendar cal = Calendar.getInstance();
		
		// 시간 가져오기
		scheduleVO = scheduleService.selectTime1(schedule_no);
		
		String day = scheduleVO.getSchedule_date();
		if (day.length() == 1) {
			day = "0" + day;
		}
		
		try {
			// 오늘 날짜와 jsp에서 선택된 날짜 비교
			if (cal.get(Calendar.DATE) == Integer.parseInt(day)) {
				String hour = scheduleVO.getSchedule_time().substring(0, 2);
				// 지금시간과 db 시간 비교
				if (cal.get(Calendar.HOUR_OF_DAY) < Integer.parseInt(hour)) {

					// 예매 취소와 포인트 반환
					reserveService.cancel(vo);
				}
			} else if (cal.get(Calendar.DATE) < Integer.parseInt(day)) {
				// 예매 취소와 포인트 반환
				reserveService.cancel(vo);
			}
		} catch (Exception e) {
			model.addAttribute("msg","예매취소 불가");
			model.addAttribute("url","/moebius/user/userInfo");
			
			return "result";
		}
		
		model.addAttribute("msg","예매취소 되었습니다.");
		model.addAttribute("url","/moebius/user/userInfo");
		
		return "result";
	}
}