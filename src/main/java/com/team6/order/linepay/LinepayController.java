package com.team6.order.linepay;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.team6.delivery.model.Delivery;
import com.team6.delivery.model.DeliveryService;
import com.team6.order.model.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
@SessionAttributes({ "orderId", "account", "oriAmount", "discount", "discountPrice", "paidAmount", "payment", "pickup",
		"orderStatus", "detailsIds", "productIds", "products", "unitPrices", "quantitys", "subtotals", "notes",
		"member","address","date" })
public class LinepayController {

	@Autowired
	private OrderService oService;
	
	@Autowired
	private DeliveryService dService;

	@GetMapping("/linepayOrder")
	public ResponseEntity<Object> linepayOrder(@SessionAttribute("paidAmount") String amount,
			@SessionAttribute("products") String products, @SessionAttribute("orderId") String orderId, Model model)
			throws JSONException {
		JSONObject requestData = new JSONObject();
		requestData.put("productName", products);
		requestData.put("amount", amount);
		requestData.put("currency", "TWD");
		requestData.put("confirmUrl", "http://localhost:8080/order/confirmOrder");
		requestData.put("orderId", orderId);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Host", "sandbox-api-pay.line.me");
		headers.set("X-LINE-ChannelId", "2004697087");
		headers.set("X-LINE-ChannelSecret", "031beec8664958baafafb568379b7e2e");

		ResponseEntity<LinepayResponse> response = new RestTemplate().postForEntity(
				"https://sandbox-api-pay.line.me/v2/payments/request",
				new HttpEntity<>(requestData.toString(), headers), LinepayResponse.class);

		LinepayResponse responseBody = response.getBody();

		if (responseBody == null || responseBody.getInfo() == null || responseBody.getInfo().getPaymentUrl() == null) {
			return ResponseEntity.badRequest().body("Invalid LinePay response.");
		}

		String paymentWebUrl = responseBody.getInfo().getPaymentUrl().getWeb();
		if (paymentWebUrl == null || paymentWebUrl.isEmpty()) {
			return ResponseEntity.badRequest().body("Invalid payment URL.");
		}

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setLocation(URI.create(paymentWebUrl));

		return new ResponseEntity<>(responseHeaders, HttpStatus.FOUND);
	}

	@GetMapping("/confirmOrder")
	public ModelAndView confirmOrder(@RequestParam("transactionId") String transactionId,
			@SessionAttribute("paidAmount") String amount, @SessionAttribute("products") String products,
			@SessionAttribute("orderId") String orderId, @SessionAttribute("orderStatus") String orderStatus,
			@SessionAttribute("pickup")String pickup,HttpSession session,Delivery delivery)
			throws JSONException {

		JSONObject requestData = new JSONObject();
		requestData.put("amount", amount);
		requestData.put("currency", "TWD");

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Host", "sandbox-api-pay.line.me");
		headers.set("X-LINE-ChannelId", "2004697087");
		headers.set("X-LINE-ChannelSecret", "031beec8664958baafafb568379b7e2e");
		headers.set("X-LINE-MerchantDeviceType", "POS");
		headers.set("X-LINE-MerchantDeviceProfileId", "DUMMY");

		String url = "https://sandbox-api-pay.line.me/v2/payments/" + transactionId + "/confirm";

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<LinepayResponse> response = restTemplate.exchange(url, HttpMethod.POST,
				new HttpEntity<>(requestData.toString(), headers), LinepayResponse.class);

		if (response.getStatusCode() == HttpStatus.OK) {
			orderStatus = "訂單待處理(已付款)";
			oService.updateOrderStatus(orderId, orderStatus);
			if("外送".equals(pickup)) {
				String address = (String)session.getAttribute("address");
				String date = (String)session.getAttribute("date");
				delivery.setAddress(address);
				delivery.setDate(date);
				delivery.setOrderid(orderId);
				dService.Insert(delivery);
			}
			return new ModelAndView("redirect:/member/MemberAboutMe"); // Redirect to history order page
		} else {
			orderStatus = "訂單扣款失敗";
			oService.updatePayment(orderId, orderStatus);
			return new ModelAndView("forward:/WEB-INF/back-jsp/Err.jsp"); // Forward to error page
		}
	}

}
