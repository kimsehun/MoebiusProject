package kr.co.moebius.movie;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger =LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void moiveInsert(HttpServletRequest request, Model model){
		Calendar cal = Calendar.getInstance();
		int year = 0;
		int month = 0;
		int day = 0;
		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			day = Integer.parseInt(request.getParameter("day"));
			cal.set(year, month - 1, 1);
		} catch(NumberFormatException e) {
			// year와 month값이 파라메터로 전달되지 않은 경우
			// 이때는 현재시간으로 월을 설정
			year = cal.get(Calendar.YEAR);
			month= cal.get(Calendar.MONTH) + 1;
			day = cal.get(Calendar.DATE);
		}
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public void insertAction(MovieVO movieVO,
								String s_year,
								String s_month,
								String s_day,
								String e_year,
								String e_month,
								String e_day) {
		
		//달과 월이 1자리 숫자이면 0을 붙여서 movieVO의 sdate에 넣어준다.
		if(s_month.length() == 1) s_month = "0" + s_month;
		if(s_day.length() == 1) s_day = "0" + s_day;
		String sdate = new String(s_year + s_month + s_day);
		movieVO.setMovie_sdate(sdate);

		//달과 월이 1자리 숫자이면 0을 붙여서 movieVO의 sdate에 넣어준다.
		if(e_month.length() == 1) e_month = "0" + e_month;
		if(e_day.length() == 1) e_day = "0" + e_day;
		String edate = new String(e_year + e_month + e_day);
		movieVO.setMovie_edate(edate);
		
		
	}
}
