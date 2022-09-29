package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.model.MemberVO;
import kr.ac.kopo.model.RecipeVO;
import kr.ac.kopo.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	//목록
	@GetMapping("list.do")
	public String selectList(Model model) {
		
		List<RecipeVO> list;
		list = recipeService.selectList();
		
		model.addAttribute("result", list);

		return "recipe/recipeSelectList";
	}
	
	//추가
	@GetMapping("add.do")
	public String addform() {
			
		return "recipe/recipeAdd";
	}
	
	@PostMapping("add.do")
	public String add(RecipeVO vo, HttpSession session, @SessionAttribute("member") MemberVO memberVO) {
	
//		MemberVo memVo = (MemberVo)session.getAttribute("member"); //MemberController의 로그인 메서드에서 loginUser로 로그인 유저 정보를 저장함
		vo.setRecipeWriter(memberVO.getMemId());
		
		int num = recipeService.insertRecipe(vo);	
		return "redirect:/recipe/list.do";
	}
	
//	@RequestMapping(value ="edit.do", method = RequestMethod.GET)
	@GetMapping("edit.do")
	public String editForm(int recipeNo, Map<String,Object> map) {
		
		RecipeVO vo = recipeService.selectRecipe(recipeNo);
		map.put("recipeVO", vo);
		
		return "recipe/recipeEdit";
		
	}
	
//	@RequestMapping(value ="edit.do", method = RequestMethod.POST)
	@PostMapping("edit.do")
	public String edit(RecipeVO vo) {

	int num = recipeService.updateRecipe(vo);
	
	return "redirect:/recipe/list.do";
	}
	
	@GetMapping("del.do")
	public String del(int recipeNo) {

	int num = recipeService.delRecipe(recipeNo);
	return "redirect:/recipe/list.do";

	}
}
