package kr.co.moebius.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {

	@RequestMapping(value="/reserve")
	public String reserve() throws Exception{
		return "reserve/reserve";
	}
	
}
