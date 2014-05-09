package kr.co.moebius.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	
	//--------------------------------회원가입----------------------------------
	@RequestMapping(value = "/regist", method=RequestMethod.GET)
	public void regist() {}
	
	@RequestMapping(value = "/regist", method=RequestMethod.POST)
	public String registAction(UserVO userVO, Model model) throws Exception {
		model.addAttribute("userVO", userVO);
		userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
		userService.registUser(userVO);
		return "/user/registAction";
	}
	//--------------------------------우편검호----------------------------------
	@RequestMapping(value = "/zipcode", method=RequestMethod.GET)
	public void zipcode(){}

	@RequestMapping(value = "/zipcode", method=RequestMethod.POST)
	public void zipcodeAction(String area, Model model) throws Exception{
		List<ZipcodeVO> list = userService.searchZipcode(area);
		model.addAttribute("list", list);
		model.addAttribute("area", area);
	}
	
	//--------------------------------아이디 중복 검사----------------------------------
	@RequestMapping(value = "/idCheck",
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map idCheckAction(String user_id) throws Exception {
		Map<String, String> m = new HashMap<String, String>();
		if(userService.idCheck(user_id) != 0 ){
			m.put("msg", "가입불가");
		} else {
			m.put("msg", "가입가능");
		}
		return m;
	}
	
	//--------------------------------로그인----------------------------------
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
	
	//--------------------------------로그아웃----------------------------------
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model){
		String user_name = (String) session.getAttribute("user_name");
		String user_id = (String) session.getAttribute("user_id");
		String msg = user_name + "("+user_id+")님이 로그아웃 하셨습니다.";
		
		session.invalidate();
		model.addAttribute("msg",msg);
		model.addAttribute("url","..");
		
		return "result";
	}
	
	//--------------------------------회원탈퇴----------------------------------
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public void delete() {}
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String delete(UserVO userVO, Model model, HttpSession session) throws Exception {
		userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
		userService.deleteUser(userVO);
		session.invalidate();
		model.addAttribute("msg", "탈퇴 되었습니다.");
		model.addAttribute("url", "..");
		return "result";
	}
	
	//--------------------------------회원정보수정----------------------------------
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String update(UserVO userVO, Model model, HttpSession session) throws Exception {
		userVO.setUser_id((String)session.getAttribute("user_id"));
		userVO = userService.getUserInfo(userVO);
		model.addAttribute("userVO", userVO);
		return "/user/update";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public void updateAction(UserVO userVO, Model model, HttpSession session) throws Exception {
		userVO.setUser_id((String)session.getAttribute("user_id"));
		userVO.setUser_pwd(DigestUtils.md5Hex(userVO.getUser_pwd()));
		//userService.updateUser(userVO);
	}
	
}
