package kr.ac.kopo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.MemberVO;

@Controller
public class RootController {

	@RequestMapping("/product/log.do")
	String index(HttpSession session, Map<String, Object> map) {
		MemberVO member = new MemberVO();
		System.out.println("test");
		
		if(session.getAttribute("member") != null) {
			member = (MemberVO) session.getAttribute("member");
		}
		
		map.put("member", member);
		
		return "index";
	}
	@RequestMapping(value="/main.do")
	public String main() throws Exception{
		
		return "mail/main";
	}
	
	@RequestMapping(value="/views.do")
	public String introduction() throws Exception{
		
		return "introduction";
	}
	
	@RequestMapping(value="/views2.do")
	public String main1() throws Exception{
		
		return "NewFile";
	}
	
	
}
