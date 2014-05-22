
package kr.co.moebius.seat;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SitController {

	private static Logger logger = LoggerFactory.getLogger(SitController.class);
	
	@Autowired
	private SitService sitService;
	
	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String seat(HttpSession session, SitVO sitVO) throws Exception{
		
		logger.info(sitVO.toString());
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id == null){
			return "redirect:/user/login";
		} else{
			return "/reserve/seat";
		}
	}
	
	@RequestMapping(value="/reserve/seat/{seatName}", method=RequestMethod.POST)
	public String seatActon(@PathVariable String seatName) {
		logger.info(seatName);
		
		return "/user/userInfo";
	}
}

