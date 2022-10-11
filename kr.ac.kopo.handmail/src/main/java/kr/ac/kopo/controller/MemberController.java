package kr.ac.kopo.controller;


import java.util.List;
import java.util.Map;
import java.util.HashMap;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
//		session.getAttribute("member");
		MemberVO loginUser = memberService.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getMemPass(), loginUser.getMemPass());

		if(loginUser != null && pwdMatch == true) {
			session.setAttribute("member", loginUser);
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
	
	@GetMapping("update.do")
	public String selectMem(MemberVO vo, String memId, Map<String, Object> map) throws Exception{
			
		vo = memberService.selectMem(memId);
		map.put("memberVO", vo);
		
		return "/mail/memselect";
	}
	
	@PostMapping("update.do")
	public String update(MemberVO vo) {
		String inputPass = vo.getMemPass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setMemPass(pwd);
		
		int num = memberService.updateMem(vo);
				
		return "redirect:../product/log.do";
		}
	
	@GetMapping("list.do")
	public String selectMemList(MemberVO vo, String memId, Model model) throws Exception{
		
		List<MemberVO> list;
		list = memberService.selectMemList();
		
		model.addAttribute("result", list);
		
		return "/mail/memList";
	}
	
	@GetMapping("delete.do")
	public String delMem(MemberVO vo) throws Exception{
		memberService.delMem(vo);
		
		return "redirect:../product/log.do";
	}
	
	
	@RequestMapping(value = "check.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> dupCheck(MemberVO vo, String memId) {
		MemberVO mvo = memberService.selectMem(memId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", mvo==null); // 사용가능한경우 {result:true}, 불가능한경우 {result:false} 
		return map;
	}
	
	@GetMapping("fix.do")
	public String fix(MemberVO vo, String memId, Map<String, Object> map) throws Exception{
			
		
		return "/mail/fix";
	}
	
	@PostMapping("fix.do")
	public String fix(MemberVO vo) {		
		
		return "redirect:/member/update.do?memId="+vo.getMemId();
		}

}
