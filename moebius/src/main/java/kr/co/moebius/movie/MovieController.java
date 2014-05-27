package kr.co.moebius.movie;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.moebius.schedule.ScheduleService;
import kr.co.moebius.screen.ScreenService;
import kr.co.moebius.screen.ScreenVO;
import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Value("${upload.url}")
	private String uploadUrl;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ScreenService screenService;
	
	@Autowired
	private ScheduleService scheduleService; 
	
	private static final Logger logger =LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void moiveInsert(Model model){}
	
	// 모든 정보를 읽어와서 db에 연결시킨다.
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertAction(MovieVO movieVO,
								FileUploadCommand fuc,
								HttpSession session,
								Model model) throws IllegalStateException, IOException {
		
		CommonsMultipartFile cmf = fuc.getUpFile();
		
		String originalName = cmf.getOriginalFilename();
	
		//마지막 세글자(확장자 : jpg, gif, png, bmp ...)를 ext에 저장
		String ext = originalName.substring(originalName.length() - 3).toLowerCase();

		File saveFile = new File(uploadUrl, originalName);
		
		//파일의 경로가 존재하지 않을 때 exception으로 빠짐
		try {
			cmf.transferTo(saveFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//경로가 없으면 경로를 만들면 됨
			createUploadDir();
			cmf.transferTo(saveFile);
		}
		
		//파일 경로 vo에 삽입
		movieVO.setMovie_poster(originalName);
		
		//관리자 등록
		UserVO userVO = new UserVO();
		userVO.setUser_id((String)session.getAttribute("user_id"));
		movieVO.setUserVO(userVO);
		
		try {
			movieService.insertAction(movieVO);
			return "main/home";
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("msg", "영화 등록 실패");
			model.addAttribute("url", "javascript:history.back();");
			return "result";
		}
	}
	
	// 영화정보를 count 순으로 화면에 뿌려준다.
	@RequestMapping(value = "/ranking")
	public void ranking(Model model) throws Exception {
		String today = calday();
		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.ranking();
		// 상영작만 따로 저장할 list를 만든다.
		List<MovieVO> rankinglist = new ArrayList<MovieVO>();
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) <= Integer.parseInt(today)) {
				// 상영날짜까지 남은 시간을 계산
				rankinglist.add(vo);
			}
		}
		model.addAttribute("rankinglist", rankinglist);
	}
	
	// 미개봉 영화 정보를 화면에 뿌려준다.
	@RequestMapping(value = "/plan")
	public void plan(Model model) throws Exception {
		Calendar cal = Calendar.getInstance();
		// 오늘 날짜 계산해서 넣어준다.
		String today = calday();

		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.search();
		// 상영작만 따로 저장할 list를 만든다.
		List<MovieVO> list2 = new ArrayList<MovieVO>(); // 예정작
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) > Integer.parseInt(today)) {
				// 상영날짜까지 남은 시간을 계산
				int endday = cal.getActualMaximum((cal.get(Calendar.MONTH)+1));//getActualMaximum() : 그달의 마지막 달을 알려줌
				String month = vo.getMovie_sdate().substring(5, 6);
				String day = vo.getMovie_sdate().substring(6);
				
				if ((cal.get(Calendar.MONTH) + 1) < Integer.parseInt(month)) {
					vo.setDday((endday - cal.get(Calendar.DATE))
							+ Integer.parseInt(day));
				} else {
					vo.setDday(Integer.parseInt(vo.getMovie_sdate())
							- Integer.parseInt(today));
				}
				list2.add(vo);
			}
		}
		model.addAttribute("list2", list2);
	}

	//파일을 읽어와서 화면에 뿌려준다.
	@RequestMapping("/download")
	public void download(String fileName, HttpServletResponse response) throws IOException{
		File file = new File(uploadUrl, fileName);
		
		response.setContentType("aplication/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(fileName,"UTF-8")+"\"");
		
		InputStream is = null;
		OutputStream os = response.getOutputStream();
		
		//받아온 파일을 inputStream을 이용해서 읽어오고 outPutStream을 이용해서 내보냄
		is=new FileInputStream(file);
		FileCopyUtils.copy(is, os);
		
		if(is != null) try {is.close();} catch(Exception e){}
		//파일 닫기 전에 flush
		if(os != null) try { os.flush(); os.close();} catch(Exception e){}
	}

	//디렉토리 생성
	private void createUploadDir() {
		logger.info("upload 디렉토리 생성");
		//directory 지정
		File dir = new File(uploadUrl);
		
		//dir이 존재하지 않으면 폴더 생성
		if(!dir.exists()) dir.mkdir();
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

		// 영화 삭제
		@RequestMapping(value="/delete")
		public String delete(Model model) throws Exception {
			
			List<MovieVO> list = movieService.getMovieList();
			model.addAttribute("list", list);
			
			logger.info(list.toString());
			
			return "movie/delete";
		}
		// 영화 삭제 번호 선택
		@RequestMapping(value="/{movie_no}/delete")
		public String deleteAction(@PathVariable int movie_no, Model model) throws Exception {
			
			logger.info("movie_no : " + movie_no);
			try {
				List<ScreenVO> screen_no = screenService.selectScreen(movie_no);
				logger.info("screen_no : " + screen_no);
				for (ScreenVO i : screen_no)
					scheduleService.deleteschedule(i.getScreen_no());
				screenService.deleteScreen(movie_no);
				movieService.deleteMovie(movie_no);
				return "redirect:../delete";
			} catch (Exception e) {
				logger.info(e.getMessage());
				model.addAttribute("msg","삭제 실패!");
				model.addAttribute("url","javascript:history.back();");
				return "result";
			}
			
		}
		
}