package kr.co.moebius.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/location")
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value="/place", method=RequestMethod.GET)
	public void select() {}
	
	@RequestMapping(value="/place", method=RequestMethod.POST)
	public String selectAction(LocationVO locationVO, Model model) throws Exception {
			
			locationVO = locationService.getSelect(locationVO);
			model.addAttribute("vo", locationVO);
			
			return "location/select";
	}
	
}
