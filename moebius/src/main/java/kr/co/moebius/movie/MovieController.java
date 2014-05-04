package kr.co.moebius.movie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger =LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping("/insert")
	public void moiveInsert(){}

}
