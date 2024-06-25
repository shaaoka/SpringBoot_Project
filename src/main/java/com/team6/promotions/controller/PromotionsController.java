package com.team6.promotions.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team6.member.model.EmployeeAccountBean;
import com.team6.promotions.model.Promotions;
import com.team6.promotions.model.PromotionsService;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/promotions")
public class PromotionsController {

	@Autowired

	private PromotionsService promotionsService;

//    入口:http://localhost:8080/promotions/promotionsMain

	// 查詢全部
	@GetMapping("/promotionsMain")
	public String getAllPromotions(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								   Model model, HttpSession session) {
		if (bean != null) {
			List<Promotions> promotions = promotionsService.selectAll();
			model.addAttribute("promotions", promotions);
			model.addAttribute("emp",bean);
			return "back-html/promotions/GetAllPromotions";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 查詢單筆
	@GetMapping("/promotions/{id}")
	public String getPromotionsById(@PathVariable("id") String promotionsId, Model model,
									@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
									HttpSession session) {
		if (bean != null) {
			Promotions promotions = promotionsService.selectOne(promotionsId);
			model.addAttribute("promotions", promotions);
			model.addAttribute("emp",bean);
			return "back-html/promotions/GetPromotions";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@GetMapping("/promotions/insert")
	public String insertPromotions(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								   Model model, HttpSession session) {
		if (bean != null) {
			model.addAttribute("emp", bean);
			return "back-html/promotions/InsertPromotions";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@PostMapping("/promotions/insert")
	public String insertPromotions(@RequestParam("Promotions_id") String Promotions_id,
								   @RequestParam("Promotions_name") String Promotions_name,
								   @RequestParam("Promotions_content") String Promotions_content,
								   @RequestParam("Promotions_picture") MultipartFile mf,
								   @RequestParam("Promotions_discount") String Promotions_discount,
								   @RequestParam("Promotions_discountcode") String Promotions_discountcode,
								   @RequestParam("Promotions_startdate") LocalDate Promotions_startdate,
								   @RequestParam("Promotions_enddate") LocalDate Promotions_enddate,
								   @SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								   Model model, HttpSession session) {

		if (bean != null) {
			if (!mf.isEmpty()) {
				try {
					model.addAttribute("emp", bean);
					String fileName = mf.getOriginalFilename();
					String fileDir = "C:/Users/User/Documents/team6/team6/src/main/resources/static/images/promotions";
					File fileDirPath = new File(fileDir, fileName);

					mf.transferTo(fileDirPath);

					String Promotions_picture = "/images/promotions/" + fileName;

					Promotions result = new Promotions(Promotions_id, Promotions_name, Promotions_content,
							Promotions_picture, Promotions_discount, Promotions_discountcode, Promotions_startdate,
							Promotions_enddate);
					promotionsService.insertPromotions(result);
					return "redirect:/promotions/promotionsMain";
				} catch (IOException e) {
					e.printStackTrace();
					return "redirect:/error";
				}
			} else {
				Promotions result = new Promotions(Promotions_id, Promotions_name, Promotions_content, "",
						Promotions_discount, Promotions_discountcode, Promotions_startdate, Promotions_enddate);
				promotionsService.insertPromotions(result);
				return "redirect:/promotions/promotionsMain";
			}
		} else {
			session.invalidate();
			return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
		}
	}

	// ID更新單筆
	@GetMapping("/promotions/update/{id}")
	public String showUpdateForm(@PathVariable("id") String promotionsId, Model model,
								 @SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								 HttpSession session) {
		if (bean != null) {
			Promotions promotions = promotionsService.selectOne(promotionsId);
			model.addAttribute("promotions", promotions);
			model.addAttribute("emp", bean);
			return "back-html/promotions/DoUpdatePromotions";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 更新
	@PutMapping("/promotions/update")
	public String updatePromotions(Promotions promotions,
								   @SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								   HttpSession session) {
		if (bean != null) {
			boolean isSuccess = promotionsService.updatePromotions(promotions);
			return isSuccess ? "redirect:/promotions/promotionsMain" : "/FailPromotions";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 刪除
	@DeleteMapping("/promotions/delete/{id}")
	@ResponseBody
	public String deletePromotions(@PathVariable("id") String promotionsId,
								   @SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
								   HttpSession session) {
		if (bean != null) {
			boolean isSuccess = promotionsService.deletePromotions(promotionsId);
			return isSuccess ? "success" : "fail";
		}
		session.invalidate();
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

}