
package kr.co.moebius.seat;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import kr.co.moebius.movie.MovieService;
import kr.co.moebius.movie.MovieVO;
import kr.co.moebius.user.UserService;
import kr.co.moebius.user.UserVO;

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

@Controller
public class SitController {

	private static Logger logger = LoggerFactory.getLogger(SitController.class);
	
	@Autowired
	private SitService sitService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String seat(HttpSession session, SitVO sitVO, Model model) throws Exception{

		//상영관 등급 처리
		String user_id = (String) session.getAttribute("user_id");
		if(user_id != null) {
			int grade = movieService.getGrade(sitVO.getMovie_no());
			int age = 0;
			switch (grade) {
			case 1:
				age = 15;
				break;
			case 2:
				age = 19;
				break;
			default:
				break;
			}
			if(age > userService.getAge(user_id)) {
				model.addAttribute("msg", "상영을 관람 하시기에 적절하지 못합니다.");
				model.addAttribute("url", "/moebius/reserve");
				return "result";
			}
			int userPoint = userService.getPoint(user_id);
			int moviePoint = movieService.getMoviePoint(sitVO.getMovie_no());
//			if(userPoint < moviePoint) {
//				model.addAttribute("msg", "사용가능한 포인트가 부족합니다.");
//				model.addAttribute("url", "/moebius/reserve");
//				return "result";
//			}
		}
		
		sitVO.setUser_id(user_id);
		
		sitVO.setScreen_name(sitService.getScreenName(sitVO.getScreen_no()));

		logger.info(sitVO.toString());
		
		model.addAttribute("user_id",user_id);
		model.addAttribute("sitVO",sitVO);

		if(user_id == null){
			return "redirect:/reserve/login";
		
		} else{
			List<String> list = sitService.getReservedSeat(sitVO);
			
			model.addAttribute("list",list);
			return "reserve/seat";

		}
	}
	
	@RequestMapping(value="/reserve/seatA/{seatName}",
			headers = "Accept=application/json;charset=UTF-8", 
			produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public Map<String, Object> seatActon(@PathVariable String seatName, SitVO sitVO) {
		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringTokenizer st1 = new StringTokenizer(seatName.toString(),",");

		while(st1.hasMoreTokens()){
			
			try {
				
				//seat_no을 where문(seat_name = 선택한 좌석 이름)으로 가져옴
				//seat_no set 안에 넣음
				String seat_name = (String)st1.nextElement();
				sitVO.setSeat_name(seat_name);
				logger.info(sitVO.toString());
				logger.info("1");
				sitVO.setSeat_no(sitService.getSeatno(sitVO));
				logger.info(sitVO.toString());
				logger.info("2");
				sitVO.setMovie_point(movieService.getMoviePoint(sitVO.getMovie_no()));
				logger.info("3");
				sitVO.setUser_point(userService.getUserPoint(sitVO.getUser_id()));
				logger.info("4");
				sitService.insertReserve(sitVO);

				sitService.updateReserveCount(sitVO.getMovie_no());
				userService.usePoint(sitVO);

				map.put("res", res);
				
			} catch (RuntimeException e) {
				res = 1;
				map.put("res", res);
				map.put("msg", e.getMessage());
			} catch (Exception e) {
				map.put("res", res);
				map.put("msg", e.getMessage());
			}
		}
		map.put("sitVO",sitVO);
		return map;
	}
}

