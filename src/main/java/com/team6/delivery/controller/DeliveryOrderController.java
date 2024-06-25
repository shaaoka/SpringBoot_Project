package com.team6.delivery.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team6.delivery.model.Data;
import com.team6.delivery.model.Delivery;
import com.team6.delivery.model.DeliveryService;
import com.team6.member.model.MemberAccountBean;
import com.team6.member.model.MemberDetailBean;

import jakarta.servlet.http.HttpSession;



@Controller
public class DeliveryOrderController {

	@Autowired
	private DeliveryService dService;
	
//  線上點餐前端頁面
//	http://localhost:8080/test
//	@GetMapping("/test")
	@RequestMapping(path = "/delivery", method = { RequestMethod.GET, RequestMethod.POST })
	public String DeliveryHome(@SessionAttribute(value = "member", required = false) MemberAccountBean memberAccountBean ,Model m) {
		if (memberAccountBean != null) {
//			m.addAttribute(member);
			m.addAttribute("member",memberAccountBean);
			return "/front-html/delivery/FrontDelivery";
		} else {
			return "forward:/WEB-INF/front-jsp/Login.jsp";
		}
	}
		
	
//	線上點餐前端傳送到session
	@PostMapping("/save")
	@ResponseBody
	public String saveaddress(HttpSession session,@RequestBody Data data) {
		String address = data.getAddress();
		String date = data.getDate();
		session.setAttribute("address", address);
		session.setAttribute("date", date);
		return "成功";
	}

	

	
}
