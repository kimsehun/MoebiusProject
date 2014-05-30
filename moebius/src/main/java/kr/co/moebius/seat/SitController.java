
package kr.co.moebius.seat;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String seat(HttpSession session, SitVO sitVO, Model model) throws Exception{

		
		String user_id = (String) session.getAttribute("user_id");
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

		logger.info(sitVO.toString());

		while(st1.hasMoreTokens()){
			
			try {
				
				
				//seat_no을 where문(seat_name = 선택한 좌석 이름)으로 가져옴
				//seat_no set 안에 넣음
				String seat_name = (String)st1.nextElement();
				sitVO.setSeat_name(seat_name);
				logger.info(sitVO.toString());
				sitVO.setSeat_no(sitService.getSeatno(sitVO));
				

				sitService.insertReserve(sitVO);

				sitService.updateReserveCount(sitVO.getMovie_no());

				sitService.updateStatus(sitVO.getUser_id());
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

