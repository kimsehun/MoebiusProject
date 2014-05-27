package kr.co.moebius.movie;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/movie/detail/{movie_no}")
public class MovieDetailController {

	@Autowired
	private MovieService movieService;
	
	// 영화 상세보기페이지에 영화 정보를 db에서 읽어와서 뿌려준다.
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String detail(@PathVariable int movie_no, Model model) throws Exception {
		MovieVO movieVO = movieService.detail(movie_no);
		model.addAttribute("movieVO",movieVO);
		return "movie/detail";
	}
}

