package com.team6.order.controller;

import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.team6.member.model.MemberAccountBean;
import com.team6.member.model.MemberService;
import com.team6.order.model.Order;
import com.team6.order.model.OrderDetails;
import com.team6.order.model.OrderService;
import com.team6.promotions.model.Promotions;
import com.team6.promotions.model.PromotionsService;

//前端
@Controller
@RequestMapping("/order")
@SessionAttributes({ "orderId", "account", "oriAmount", "discount", "discountPrice", "paidAmount", "payment", "pickup",
		"orderStatus", "detailsIds", "productIds", "products", "unitPrices", "quantitys", "subtotals", "notes",
		"member" })
public class PizzaOrderController {

	@Autowired
	private OrderService oService;

	@Autowired
	private PromotionsService promotionsService;

	@Autowired
	private MemberService memberService;

	// 前端store進入點 http://localhost:8080/order/pizzaOrder
	@RequestMapping(path = "/pizzaOrder", method = { RequestMethod.GET, RequestMethod.POST })
	public String PizzaOrderIndex(@SessionAttribute(value = "member", required = false) String member) {
		if (member != null) {
			return "forward:/WEB-INF/front-jsp/order/pizzaOrder.jsp";
		} else {
			return "forward:/WEB-INF/front-jsp/Index.jsp";
		}
	}

	// 前端 外送storer進入點 http://localhost:8080/order/deliveryOrder.jsp
	@RequestMapping(path = "/deliveryOrder", method = { RequestMethod.GET, RequestMethod.POST })
	public String DeliveryOrderIndex(@SessionAttribute(value = "member", required = false) String member) {
		if (member != null) {
			return "forward:/WEB-INF/front-jsp/order/deliveryOrder.jsp";
		} else {
			return "forward:/WEB-INF/front-jsp/Index.jsp";
		}
	}

	// 前端 歷史訂單
	@RequestMapping(path = "/historyOrder", method = { RequestMethod.GET, RequestMethod.POST })
	public String HistoryOrderIndex(@SessionAttribute(value = "member", required = false) String member) {
		if (member != null) {
			return "forward:/WEB-INF/front-jsp/member/MemberAboutMe.jsp";
		} else {
			return "forward:/WEB-INF/front-jsp/Index.jsp";
		}
	}

	// 前端查詢 會員歷史訂單
	@GetMapping(path = "searchOrderByAccount")
	@ResponseBody
	public List<Order> searchOrderByAccount(@SessionAttribute(value = "member") String member) {
		// 查詢會員帳號
		List<MemberAccountBean> memberAccountBeans = memberService.findAllByNotHidden();
		String account = null;
		for (MemberAccountBean mems : memberAccountBeans) {
			if (mems.getMaid() == Integer.valueOf(member)) {
				account = mems.getmAccount();
				break;
			}
		}

		if (account != null) {
			List<Order> orders = oService.findHistoryOrder(account);
			return orders;
		}
		System.out.println("account is null.");
		return Collections.emptyList();
	}

	// 前端查詢 會員查詢訂單明細
	@GetMapping("/memberSelectDetails")
	@ResponseBody
	public ResponseEntity<List<OrderDetails>> memberSelectDetails(@RequestParam("orderId") String orderId) {
		List<OrderDetails> orderDetails = oService.findDetailsById(orderId);
		if (orderDetails != null && !orderDetails.isEmpty()) {
			return ResponseEntity.ok(orderDetails);
		} else {
			return ResponseEntity.notFound().build(); // no information back to 404 Not Found
		}
	}

	// 點餐insert
	@PostMapping("/createPizzaOrder")
	@ResponseBody
	public ResponseEntity<String> createPizzaOrder(@RequestBody Map<String, Object> orderData,
			@SessionAttribute(value = "member") String member, Model model) {
		String orderId = generateOrderId();
		String discount = orderData.get("discount") != null ? orderData.get("discount").toString() : "";
		String payment = (String) orderData.get("payment");
		String pickup = (String) orderData.get("pickup");
		String orderStatus = "訂單待處理(未付款)";

		// 查詢會員帳號
		List<MemberAccountBean> memberAccountBeans = memberService.findAllByNotHidden();
		String account = null;
		for (MemberAccountBean mems : memberAccountBeans) {
			if (mems.getMaid() == Integer.valueOf(member)) {
				account = mems.getmAccount();
				break;
			}	
		}
		// 查詢折扣金額
		List<Promotions> discountList = promotionsService.selectAllDiscount();

		if ("".equals(discount)) {
			oService.insertOrderWithoutDiscount(orderId, account, payment, pickup, orderStatus);
		} else {
			Integer discountPrice = null;
			for (Promotions promo : discountList) {
				if (promo.getPromotions_discountcode().equals(discount)) {
					try {
						discountPrice = Integer.valueOf(promo.getPromotions_discount());
					} catch (NumberFormatException e) {
						return ResponseEntity.badRequest().body("Discount price can not be found.");
					}
					break;
				}
			}

			// 有折扣的insert
			if (discountPrice != null) {
				oService.insertOrderWithDiscount(orderId, account, discount, discountPrice, payment, pickup,
						orderStatus);
			}
		}

		List<Map<String, Object>> orderDetailsList = (List<Map<String, Object>>) orderData.get("orderDetails");
		if (orderDetailsList != null) {
			List<String> detailsIds = new ArrayList<>();
			List<String> productIds = new ArrayList<>();
			List<String> products = new ArrayList<>();
			List<String> unitPrices = new ArrayList<>();
			List<String> quantities = new ArrayList<>();
			List<String> subtotals = new ArrayList<>();
			List<String> notes = new ArrayList<>();

			for (Map<String, Object> detailData : orderDetailsList) {
				OrderDetails detail = new OrderDetails();
				detail.setOrderId(orderId);
				detail.setProductId(detailData.get("productId") != null ? detailData.get("productId").toString() : "");
				detail.setProduct(detailData.get("product") != null ? detailData.get("product").toString() : "");
				detail.setUnitPrice(
						detailData.get("totalPrice") != null ? detailData.get("totalPrice").toString() : "");
				detail.setQuantity(detailData.get("quantity") != null ? detailData.get("quantity").toString() : "");
				detail.setNote(detailData.get("note") != null ? detailData.get("note").toString() : "");

				oService.insertDetails(detail);

				detailsIds.add(detail.getDetailsId().toString());
				productIds.add(detail.getProductId());
				products.add(detail.getProduct());
				unitPrices.add(detail.getUnitPrice());
				quantities.add(detail.getQuantity());
				subtotals.add(detail.getUnitPrice());
				notes.add(detail.getNote());
			}

			Order order = oService.findOrderById(orderId);

			if (payment.equals("LinePay")) {
				model.addAttribute("orderId", orderId);
				model.addAttribute("account", order.getAccount());
				model.addAttribute("oriAmount", order.getOriAmount());
				model.addAttribute("discount", order.getDiscount());
				model.addAttribute("discountPrice", order.getDiscountPrice());
				model.addAttribute("paidAmount", order.getPaidAmount());
				model.addAttribute("payment", order.getPayment());
				model.addAttribute("pickup", order.getPickup());
				model.addAttribute("orderStatus", orderStatus);
				model.addAttribute("detailsIds", detailsIds);
				model.addAttribute("productIds", productIds);
				model.addAttribute("products", products);
				model.addAttribute("unitPrices", unitPrices);
				model.addAttribute("quantities", quantities);
				model.addAttribute("subtotals", subtotals);
				model.addAttribute("notes", notes);
			}

			return ResponseEntity.ok("{\"message\": \"Order inserted successfully.\"}");
		} else {
			return ResponseEntity.badRequest().body("Order details list is null or empty.");
		}
	}

	// 生成orderId
	private String generateOrderId() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date());
	}
}
