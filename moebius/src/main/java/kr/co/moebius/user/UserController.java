package kr.co.moebius.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/regist", method=RequestMethod.GET)
	public void regist() {}
	
	@RequestMapping(value = "/regist", method=RequestMethod.POST)
	public String registAction(UserVO userVO, Model model) throws Exception {
		model.addAttribute("userVO", userVO);
		userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
		logger.info(userVO.toString());
		userService.registUser(userVO);
		return "/user/registAction";
	}
	
	@RequestMapping(value = "/zipcode", method=RequestMethod.GET)
	public void zipcode(){}

	@RequestMapping(value = "/zipcode", method=RequestMethod.POST)
	public void zipcodeAction(String area, Model model) throws Exception{
		List<ZipcodeVO> list = userService.searchZipcode(area);
		model.addAttribute("list", list);
		model.addAttribute("area", area);
	}
	
	@RequestMapping(value = "/idCheck", method=RequestMethod.GET)
	public void idCheck() {}
	
	@RequestMapping(value = "/idCheck", method=RequestMethod.POST)
	public String idCheckAction(String user_id, Model model) throws Exception {
		if (userService.searchId(user_id) >0 ) {
			model.addAttribute("msg", "아이디가 존재합니다.");
			model.addAttribute("url", "redirect:..");
			return "/user/result";
		} else {
			model.addAttribute("msg", "아이디를 사용하실 수 있습니다.");
			model.addAttribute("url", "redirect:..");
			return "/user/regist";
		}
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public void login() {}
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView loginAction(UserVO userVO, HttpSession session) {
		userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
		ModelAndView mav = new ModelAndView("result");
		
		try {
			UserVO userInfo = userService.getUser(userVO);
			
			//session처리
			session.setAttribute("user_id", userInfo.getUser_id());
			session.setAttribute("user_name", userInfo.getUser_name());
			
			mav.addObject("msg",userInfo.getUser_id()+ "님이 로그인되었습니다.");
					 		  // ../board/게시판번호/페이지
			mav.addObject("url","..");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mav.addObject("msg", "로그인에 실패했습니다.");
			mav.addObject("url","javascript:history.back();");
		}
		
		return mav;
	}
}
