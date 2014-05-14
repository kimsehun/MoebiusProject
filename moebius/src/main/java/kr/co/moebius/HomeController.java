package kr.co.moebius;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	private MovieService movieService;

	@RequestMapping("/")
	public String home(Model model) {
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
}
