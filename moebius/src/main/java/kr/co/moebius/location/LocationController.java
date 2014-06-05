package kr.co.moebius.location;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/location")
public class LocationController {
	
	private static final Logger logger = LoggerFactory.getLogger(LocationController.class);
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value="/place", method=RequestMethod.GET)
	public Map<String, Object> select() throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<LocationVO> list = locationService.selectLocation();
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping(value="/place", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAction(int location_no) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			LocationVO vo = locationService.getSelect(location_no);
			map.put("vo", vo);
			
//			logger.info(vo.toString());

			return map;
			
	}
	
}
