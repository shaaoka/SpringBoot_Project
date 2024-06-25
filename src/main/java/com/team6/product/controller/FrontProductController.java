package com.team6.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team6.member.model.MemberAccountBean;
import com.team6.product.model.ProductBean;
import com.team6.product.model.ProductService;

//@SessionAttributes(names = {})
@Controller
@RequestMapping(path = "/product")
public class FrontProductController {
	
	@Autowired
	private ProductService productService;
	
	
//	SessionStatus status
//	status.isComplete();
	
	/*因為thymeleaf會搶路徑,所以要forward:*/
	
	// 前端畫面main
	@GetMapping("/product.front")
	public String frontPageMain(@SessionAttribute(value = "member", required = false) MemberAccountBean member) {
		
		if (member != null) {
			return "forward:/WEB-INF/front-jsp/product/product.jsp";
		}
		
		return "forward:/WEB-INF/front-jsp/product/productNoLogin.jsp";
	}
	
	// 前端產品頁查詢類別
	@GetMapping("/product.selectWithState/{categoryId}")
	@ResponseBody
	public Page<ProductBean> productWithState(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "6") int size, @PathVariable("categoryId") Integer categoryId) {
		System.out.println("==================================");
		System.out.println("categoryId: " + categoryId);
		System.out.println("==================================");
		Pageable pageable = PageRequest.of(page, size, Sort.by("productId").ascending());
		
		if (categoryId != 0) {
			return productService.findAllProductWithStateAndCategory(categoryId, pageable);
		}
		
		return productService.findAllProductWithState(pageable);
		
	}
	
	// 模糊查詢
	@GetMapping("/product.selectNameWithState")
	@ResponseBody
	public List<ProductBean> productNameWithState(@RequestParam("productName") String productName) {
		return productService.findByNameLikeWithState(productName);
	}
	
	
	// 隨機查5筆資料
	@GetMapping("/product.selectRandomProducts")
	@ResponseBody
	public List<ProductBean> selectRandomProducts() {
		int quantity = 5;
		Pageable pageable = PageRequest.of(0, quantity);
		return productService.findRandomProducts(pageable);
	}
	
	
	
}
