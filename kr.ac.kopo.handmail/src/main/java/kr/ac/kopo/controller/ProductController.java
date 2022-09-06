package kr.ac.kopo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.ProductVO;
import kr.ac.kopo.service.ProductService;

@Controller
@RequestMapping(value="/product/")
public class ProductController {

	@Autowired
	ProductService productService;
	
	public String insert() {
		
		return "product/ProdAdd";
	}
	
	
	public String insertProd(ProductVO vo) {
		
		productService.insertProd(vo);
		
		return "product/ProdAdd";
	}
}
