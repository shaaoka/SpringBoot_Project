package com.team6.delivery.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.team6.delivery.model.Data;
import com.team6.delivery.model.Delivery;
import com.team6.delivery.model.DeliveryService;
import com.team6.member.model.EmployeeAccountBean;
import com.team6.order.model.OrderDetails;
import com.team6.order.model.OrderService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

	@Autowired
	private DeliveryService dService;

	@Autowired
	private OrderService oService;

	//員工列表
	static List<String> employeeList = null;
	static {
		employeeList = new ArrayList<>();
		employeeList.add("林佳蓉");
		employeeList.add("陳建宏");
		employeeList.add("黃美玲");
		employeeList.add("蔡政恩");
		employeeList.add("謝俊逸");
	}

	// delivery後台
	// 網址 http://localhost/delivery/home
	// 網址 http://127.0.0.1:8080/delivery/home

	//======================== 外送後台 外送單功能 =========================//
	// 新增外送單 ok
	@PostMapping("/insert")
	public ResponseEntity<String> AddDelivery(@RequestBody Delivery delivery) {
		try {
			dService.Insert(delivery);
			return new ResponseEntity<>("新增外送訂單成功", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("新增外送訂單失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 刪除外送單 ok
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public String DelDelivery(@PathVariable("id") int id) {
		dService.DelDelivery(id);
		return "刪除成功";
	}

	// 軟刪除外送單
	@PutMapping("/delete/soft/{id}")
	@ResponseBody
	public String SoftDelDelivery(@PathVariable("id") int id) {
		dService.UpdStateZero(id);
		return "success";
	}

	// 修改外送單
	@PutMapping("/update")
	public ResponseEntity<String> UpdDelivery(@RequestBody Delivery delivery) {
		try {
			dService.Update(delivery);
			return new ResponseEntity<>("更新外送訂單成功", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("更新外送訂單失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	// 復原取消的訂單
	@PutMapping("/rollback/{id}")
	public ResponseEntity<String> UpdDelivery(@PathVariable("id") int id ) {
		try {
			dService.UpdRollBack(id);
			return new ResponseEntity<>("更新外送訂單成功", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("更新外送訂單失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 查詢狀態 != 0 全部 ok
	@GetMapping("/home")
	public String DeliveryHome(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) {
			List<Delivery> delivery = dService.FindPending();
			m.addAttribute("delivery", delivery);
			m.addAttribute("emp",bean);
			return "/back-html/delivery/delivery";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 查詢單筆外送單 ok
	@GetMapping("/update/{id}")
	public String FindOne(@PathVariable("id") int id, Model m) {
		Delivery delivery = dService.FindById(id);
		m.addAttribute("delivery", delivery);
		return "/back-html/delivery/update";
	}

	// 查詢明細 ok
	@GetMapping("/details/{id}")
	public String FindByOrderDetails(@PathVariable("id") String id,@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) { 
			List<OrderDetails> OrderDetails = oService.findDetailsById(id);
			m.addAttribute("OrderDetails", OrderDetails);
			m.addAttribute("total", OrderDetails.get(0).getOrder().getPaidAmount());
			m.addAttribute("customer", OrderDetails.get(0).getOrder().getAccount());
			m.addAttribute("emp",bean);
			return "/back-html/delivery/detail";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	//======================== 外送後台 外送員工功能 =========================//
	// 外送員工畫面 ok
	@GetMapping("/emp")
	public String DeliveryEmp(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,Model m) {
		if (bean != null) { 
			m.addAttribute("emp",bean);
			return "/back-html/delivery/emp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 外送員工圖表資料
	@GetMapping("/ename")
	@ResponseBody
	public List<Integer> DeliveryEmp() {
		int ename1 = dService.countDeliveriesByEname("陳建宏");
		int ename2 = dService.countDeliveriesByEname("林佳蓉");
		int ename3 = dService.countDeliveriesByEname("謝俊逸");
		int ename4 = dService.countDeliveriesByEname("黃美玲");
		int ename5 = dService.countDeliveriesByEname("蔡政恩");

		List<Integer> emp = new ArrayList<>();
		emp.add(ename1);
		emp.add(ename2);
		emp.add(ename3);
		emp.add(ename4);
		emp.add(ename5);

		return emp;
	}


	// 修改已接單 ok
	@PutMapping("/accept/{id}")
	public ResponseEntity<String> UpdAcceptDeliveryOrder(@PathVariable("id") int id) {
		try {
			dService.UpdAccept(id);
			return new ResponseEntity<>("更新狀態成功", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("更新狀態失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 修改多筆員工外送中 => 外送結束
	@PutMapping("/update/arrivedall")
	public ResponseEntity<String> UpdDeliveryArrivedAll() {
		try {
			dService.DeliveryArrivedAll();
			return new ResponseEntity<>("更新多筆外送結束狀態成功", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("更新狀態失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 修改員工接單和開始外送
	@PutMapping("/update/ename/{id}")
	public ResponseEntity<String> UpdDeliveryEmp(@RequestBody Delivery delivery) {
		try {
			String ename = delivery.getEname();
			int id = delivery.getId();
			dService.UpdEnameDeliveryOrder(ename, id);
			return new ResponseEntity<>("員工開始外送", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("開始外送失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 修改外送結束 ok
	@PutMapping("/update/arrived/{id}")
	public ResponseEntity<String> UpdEndDeliveryOrder(@PathVariable("id") int id) {
		try {
			dService.UpdDeliveryArrived(id);
			return new ResponseEntity<>("結束外送", HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>("結束外送失敗: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 查詢取消的訂單 ok
	@GetMapping("/state/cancel") 
	public String CancelDeliveryOrder(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) {
			List<Delivery> delivery = dService.FindCancelDelivery();
			m.addAttribute("delivery", delivery);
			m.addAttribute("emp",bean);
			return "/back-html/delivery/cancelorder";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 查詢接受的訂單 ok
	@GetMapping("/state/accept")
	public String AccptDeliveryOrder(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) {
			List<Delivery> delivery = dService.FindAccept();
			m.addAttribute("employeeList", employeeList);
			m.addAttribute("delivery", delivery);
			m.addAttribute("emp",bean);
			return "/back-html/delivery/accept";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// 查詢外送中的訂單 ok
	@GetMapping("/state/now")
	public String StartDeliveryOrder(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) {
			List<Delivery> delivery = dService.FindNowDelivery();
			m.addAttribute("delivery", delivery);
			m.addAttribute("emp",bean);
			return "/back-html/delivery/start";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}


	// 查詢結束外送的訂單 ok
	@GetMapping("/history")
	public String ArrivedDeliveryOrder(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, Model m) {
		if (bean != null) {
			List<Delivery> delivery = dService.FindDeliveryArrived();
			m.addAttribute("delivery", delivery);
			m.addAttribute("emp",bean);
			return "/back-html/delivery/history";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	//========================外送後台 資料下載功能=========================//

	// 匯出json OK
	@PostMapping("/json")
	public ResponseEntity<String> SaveJson() {
		try {
			dService.SaveJson();
			return ResponseEntity.ok("JSON數據已成功寫入");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("無法保存JSON數據：" + e.getMessage());
		}
	}


	// 匯出xml OK
	@PostMapping("/xml")
	public ResponseEntity<String> SaveXml() {
		try {
			dService.SaveXml();
			return ResponseEntity.ok("xml數據已成功寫入");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("無法保存xml數據：" + e.getMessage());
		}
	}

	// 匯出excel OK
	@PostMapping("/excel")
	public ResponseEntity<String> SaveExcel() {
		try {
			dService.SaveExcel();
			return ResponseEntity.ok("Excel數據已成功寫入");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("無法保存Excel數據：" + e.getMessage());
		}
	}

	//========================外送後台 資料匯出功能=========================//


	@GetMapping("/download")
	@ResponseBody
	public List<Delivery> Download() {
		List<Delivery> delivery =	dService.FindAll();
		return delivery;

	}




}