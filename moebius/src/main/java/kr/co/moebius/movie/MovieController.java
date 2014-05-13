package kr.co.moebius.movie;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
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

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	
	// 영화 입력 화면을 가기전 오늘 날짜를 읽어와서 화면에 뿌려준다.
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
	
	// 모든 정보를 읽어와서 db에 연결시킨다.
	@RequestMapping(value="/insert", method=RequestMethod.POST)
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
		
		// 확장자가 이미지 확장자이면 이미지 크기와 용량을 줄이자
		if (ext.equals("gif") || ext.equals("jpg") || ext.equals("png")
				|| ext.equals("bmp")) {
			createThumbnailImage(originalName, ext);
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
			return "main/home";
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("msg", "영화 등록 실패");
			model.addAttribute("url", "javascript:history.back();");
			return "result";
		}
	}
	
	// 영화정보를 count 순으로 화면에 뿌려준다.
	@RequestMapping(value="/ranking")
	public void ranking(Model model){
		String today = calday();
		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.ranking();
		//상영작만 따로 저장할 list를 만든다.
		List<MovieVO> rankinglist = new ArrayList<MovieVO>();
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) < Integer.parseInt(today)) {
				//상영날짜까지 남은 시간을 계산
				rankinglist.add(vo);
			}
		}
		model.addAttribute("rankinglist",rankinglist);
	}
	
	// 미개봉 영화 정보를 화면에 뿌려준다.
	@RequestMapping(value="/plan")
	public void plan(Model model) {
		// 오늘 날짜 계산해서 넣어준다.
		String today = calday();

		// 영화정보를 가져와서 오늘 날짜와 비교한다.
		List<MovieVO> list = movieService.search();
		//상영작만 따로 저장할 list를 만든다.
		List<MovieVO> list2 = new ArrayList<MovieVO>();	// 예정작
		for (MovieVO vo : list) {
			if (Integer.parseInt(vo.getMovie_sdate()) > Integer.parseInt(today)) {
				//상영날짜까지 남은 시간을 계산
				vo.setDday(Integer.parseInt(vo.getMovie_sdate())-Integer.parseInt(today));
				list2.add(vo);
			} 
		}
		model.addAttribute("list2",list2);
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
	
	//파일 이미지 축소
	private void createThumbnailImage(String originalName, String ext) throws IOException {
		// TODO Auto-generated method stub
		
		ParameterBlock pb = new ParameterBlock();
		
		//원본 이미지를 pb에 넣기
		pb.add(uploadUrl + "/" + originalName);
		//Rendering 작업
		RenderedOp rOp = JAI.create("fileload", pb);
		BufferedImage bi = rOp.getAsBufferedImage();
		
		//가로길이, 세로길이, 이미지색상타입설정
		BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
		
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi, 0, 0, 100, 100, null);
		
		File file = new File(uploadUrl + "/sm_" + originalName);
		ImageIO.write(thumb, ext, file);
		
	}

	//디렉토리 생성
	private void createUploadDir() {
		logger.info("upload 디렉토리 생성");
		//directory 지정
		File dir = new File(uploadUrl);
		
		//dir이 존재하지 않으면 폴더 생성
		if(!dir.exists()) dir.mkdir();
	}
	
}