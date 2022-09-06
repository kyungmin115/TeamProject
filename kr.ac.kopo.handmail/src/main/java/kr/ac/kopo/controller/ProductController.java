package kr.ac.kopo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.ProductVO;
import kr.ac.kopo.service.ProductService;

@Controller
@RequestMapping(value="/product/")
public class ProductController {

	@Autowired
	ProductService productService;
	
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
	
	
}
