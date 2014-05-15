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
import net.wimpi.telnetd.io.terminal.ansi;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/reserve")
public class ReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value="/reserve")
	public Map<String, Object> reserve() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		//영화 제목 리스트 가져오기
		List<MovieVO> movieList = null;
		//극장 리스트 가져오기 
		List<LocationVO> locationList = null;
		
		// 오늘 날짜부터 그달의 말일까지 계산
		Calendar cal = Calendar.getInstance();
		List<Object> calList = new ArrayList<Object>();
		map.put("year", cal.get(Calendar.YEAR));
		map.put("month", cal.get(Calendar.MONTH)+1);
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
		
		map.put("movieList", movieList);
		map.put("locationList", locationList);
		map.put("calList", calList);
		return map;
	}
	
}
