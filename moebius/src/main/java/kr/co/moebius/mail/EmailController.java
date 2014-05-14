package kr.co.moebius.mail;

import javax.servlet.http.HttpSession;

import kr.co.moebius.board.BoardService;
import kr.co.moebius.user.UserService;
import kr.co.moebius.user.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mail")
public class EmailController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@RequestMapping(value="/email", method=RequestMethod.GET)
	public String email(Model model, HttpSession session){
		String user_id = (String) session.getAttribute("user_id");
		UserVO userVO = null;
		try {
			userVO = userService.emailaddr(user_id);
			model.addAttribute("userVO",userVO);
			return "mail/email";
		} catch (Exception e) {
			model.addAttribute("msg","로그인을 먼저 해주세요");
			model.addAttribute("url","/moebius/user/login");
			return "result";
		}
	}
	
	
	
	@RequestMapping(value="/email", method=RequestMethod.POST)
	public String emailAction(HttpSession session, String board_content, String user_email){
		String smtpHost = "mx2.naver.com";
		String fromAddr = user_email;
		String toAddr = "hoansang7@naver.com";
		String subject = session.getAttribute("user_id")+"님으로부터 문의사항입니다.";
		String mailBody = board_content;
		
		boolean result = MailAction.sendMail(smtpHost, fromAddr, toAddr, subject, mailBody);
		if(result){
			logger.info("문의사항 메일 발송 완료");
		}else{
			logger.info("문의사항 메일 발송 실패");
		}
		return "mail/email";
	}
}
