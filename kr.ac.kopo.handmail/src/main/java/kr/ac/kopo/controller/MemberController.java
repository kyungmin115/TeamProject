package kr.ac.kopo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.model.MemberVO;
import kr.ac.kopo.service.MemberService;

@Controller
@RequestMapping(value="/member/")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("join.do")
	public String joinForm() {
		
		return "member/MemAdd";
	}
	
	@PostMapping("join.do")
	public String join(MemberVO vo) throws Exception {
		
		String inputPass = vo.getMemPass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setMemPass(pwd);
		
		memberService.insertMem(vo);
		
		return "redirect:/product/log.do";
	}
	
	
	
	
	
	
	
	@PostMapping("login.do")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr ) throws Exception {
		
		session.getAttribute("member");
		MemberVO login = memberService.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getMemPass(), login.getMemPass());

		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		
		return "redirect:/product/log.do";
		
	}
	
	@GetMapping("logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/product/list.do";
	}
	
	
	
}
