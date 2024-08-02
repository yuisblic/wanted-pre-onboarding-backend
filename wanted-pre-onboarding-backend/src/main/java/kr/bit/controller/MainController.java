package kr.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, Model model) {
		HttpSession oldSession = request.getSession(false); // 현재 세션이 없으면 null을 반환
        if (oldSession != null) {
            oldSession.invalidate(); // 기존 세션을 무효화
        }
        HttpSession session = request.getSession(true); // 새로운 세션 생성
		//기업용 로그인
		session.setAttribute("companyID", "ceo");
		session.setAttribute("companyPwd", "ceo");
		session.setAttribute("companyName", "원티드");
		session.setAttribute("nation", "한국");
		session.setAttribute("region", "서울");
		session.setAttribute("mvo", 0);
		//지원자용 로그인
//		session.setAttribute("memID", "user");
//		session.setAttribute("memPwd", "user");
//		session.setAttribute("memName", "사용자");
//		session.setAttribute("mvo", 1);
		return "redirect:/board/list";
	}
}
