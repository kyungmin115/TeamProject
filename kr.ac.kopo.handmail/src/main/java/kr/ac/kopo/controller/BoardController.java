package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.MemberVO;
import kr.ac.kopo.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//목록
	@GetMapping("list.do")
	public String selectList(Model model) {
		
		List<BoardVO> list;
		list = boardService.selectList();
		
		model.addAttribute("result", list);

		return "board/boardSelectList";
	}
	
	//추가
	@GetMapping("add.do")
	public String addform() {
			
		return "board/boardAdd";
	}
	
	@PostMapping("add.do")
	public String add(BoardVO vo, HttpSession session, @SessionAttribute("member") MemberVO memberVO) {
	
//		MemberVo memVo = (MemberVo)session.getAttribute("member"); //MemberController의 로그인 메서드에서 loginUser로 로그인 유저 정보를 저장함
		vo.setBoardWriter(memberVO.getMemId());
		
		int num = boardService.insertBoard(vo);	
		return "redirect:/board/list.do";
	}
}
