package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RootController {

	@RequestMapping("/product/log.do")
	String index() {
		return "index";
	}
	@RequestMapping(value="/main.do")
	public String main() throws Exception{
		
		return "mail/main";
	}
}
