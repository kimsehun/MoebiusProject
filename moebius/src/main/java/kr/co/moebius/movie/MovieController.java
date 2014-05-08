package kr.co.moebius.movie;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	private static final Logger logger =LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void moiveInsert(HttpServletRequest request, Model model){
		Calendar cal = Calendar.getInstance();
		int year = 0;
		int month = 0;
		int day = 0;
		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			day = Integer.parseInt(request.getParameter("day"));
			cal.set(year, month - 1, 1);
		} catch(NumberFormatException e) {
			// year와 month값이 파라메터로 전달되지 않은 경우
			// 이때는 현재시간으로 월을 설정
			year = cal.get(Calendar.YEAR);
			month= cal.get(Calendar.MONTH) + 1;
			day = cal.get(Calendar.DATE);
		}
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertAction(MovieVO movieVO,
								FileUploadCommand fuc,
								String s_year,
								String s_month,
								String s_day,
								String e_year,
								String e_month,
								String e_day,
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
		
		//달과 월이 1자리 숫자이면 0을 붙여서 movieVO의 sdate에 넣어준다.
		if(s_month.length() == 1) s_month = "0" + s_month;
		if(s_day.length() == 1) s_day = "0" + s_day;
		String sdate = new String(s_year + s_month + s_day);
		movieVO.setMovie_sdate(sdate);

		//달과 월이 1자리 숫자이면 0을 붙여서 movieVO의 sdate에 넣어준다.
		if(e_month.length() == 1) e_month = "0" + e_month;
		if(e_day.length() == 1) e_day = "0" + e_day;
		String edate = new String(e_year + e_month + e_day);
		movieVO.setMovie_edate(edate);
		
		//관리자 등록
		UserVO userVO = new UserVO();
		userVO.setUser_id((String)session.getAttribute("user_id"));
		movieVO.setUserVO(userVO);
		
		try {
			movieService.insertAction(movieVO);
			return "home";
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("msg", "영화 등록 실패");
			model.addAttribute("url", "javascript:history.back();");
			return "result";
		}
	}

	//파일 디렉토리 없으면 생성
	private void createUploadDir() {
		//directory 지정
		File dir = new File(uploadUrl);
		
		//dir이 존재하지 않으면 폴더 생성
		if(!dir.exists()) dir.mkdir();
	}
	
}