package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.PageMaker;
import kr.ac.kopo.model.ProductVO;
import kr.ac.kopo.model.SearchCriteria;
import kr.ac.kopo.service.BoardService;
import kr.ac.kopo.service.ProductService;

@Controller
@RequestMapping(value="/product/")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("insert.do")
	public String insert() {
		
		return "product/ProdAdd";
	}
	
	@PostMapping("insert.do")
	public String insertProd(ProductVO vo) {
		
		productService.insertProd(vo);
		
		return "product/ProdAdd";
	}
	
	@PostMapping("delete.do")
	public String delete() {
		
		productService.delete();
		
		return "product/ProdAdd";
	}
	
	@GetMapping("list.do")
	public String selectList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		List<ProductVO> list;
		List<ProductVO> list1;
		List<ProductVO> list2;
		list = productService.selectList(scri);
		list1 = productService.selectList1(scri);
		list2 = productService.selectList2(scri);
		
		
		List<BoardVO> boardlist;
		boardlist = boardService.selectList();
		
		model.addAttribute("board", boardlist);
		
		
		model.addAttribute("result", list);
		model.addAttribute("result1", list1);
		model.addAttribute("result2", list2);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "product/prodList2";
	}
	
	@GetMapping("search.do")
	public String searchList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		List<ProductVO> list;
		list = productService.selectList(scri);
		
		model.addAttribute("result", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "product/search";
	}
	
	@GetMapping("event.do")
	public String serviceList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		System.out.println(scri);
		
		List<ProductVO> list;
		list = productService.selectEvent(scri);
		
		model.addAttribute("result", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		
		return "mail/event";
	}
	@RequestMapping(value = "category.do")
	public String category(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		List<ProductVO> list;
		list = productService.category(scri);
		
		model.addAttribute("result", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		
		return "mail/category";
	}	
	
}
