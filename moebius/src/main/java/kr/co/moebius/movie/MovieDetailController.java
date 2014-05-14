package kr.co.moebius.movie;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/movie/detail/{movie_no}")
public class MovieDetailController {

	@Value("${upload.url}")
	private String uploadUrl;
	
	@Autowired
	private MovieService movieService;
	
	// 영화 상세보기페이지에 영화 정보를 db에서 읽어와서 뿌려준다.
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String detail(@PathVariable int movie_no, Model model) {
		MovieVO movieVO = movieService.detail(movie_no);
		model.addAttribute("movieVO",movieVO);
		return "movie/detail";
	}
	
	//그림을 받아와서 뿌려준다.
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
}

