package com.team6.order.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository oRepos;

	@Autowired
	private DetailsRepository dRepos;

	// 後端 查詢訂單全部
	public Page<Order> findOrderAll(Pageable pageable) {
		return oRepos.findOrderAll(pageable);
	}

	// 後端 一般查詢全部
	public List<Order> findAllOrders() {
		return oRepos.findAll();
	}

	// 後端 模糊查詢
	public List<Order> findOrdersByKeyword(String keyword) {
		return oRepos.findOrdersByKeyword(keyword);
	}

	// 後端 查詢單筆訂單明細
	public Order findOrderById(String orderId) {
		Optional<Order> op1 = oRepos.findById(orderId);

		if (op1.isPresent()) {
			return op1.get();
		}

		return null;
	}

	// 後端 查詢單筆餐點明細
	public List<OrderDetails> findDetailsById(String orderId) {
		List<OrderDetails> details = dRepos.findByOrderId(orderId);

		if (!details.isEmpty()) {
			return details;
		}
		return null;
	}

	//前端 查詢會員所有訂單
	public List<Order> findHistoryOrder(String account) {
		List<Order> orders = oRepos.findHistoryOrderByAccount(account);
		
		if(!orders.isEmpty()) {
			return orders;
		}
		return null;
	}
	
	// 後端 更新折扣碼、金額
	public void updateDiscount(String orderId, String discount, Integer discountPrice) {
		oRepos.updatDiscountByOrderId(orderId, discount, discountPrice);
	}

	// 後端 更新付款方式
	public void updatePayment(String orderId, String payment) {
		oRepos.updatePaymentByOrderId(orderId, payment);
	}

	// 後端 更新取餐方式
	public void updatePickup(String orderId, String pickup) {
		oRepos.updatePickupByOrderId(orderId, pickup);
	}

	// 後端 更新訂單狀態
	public void updateOrderStatus(String orderId, String orderStatus) {
		oRepos.updateOrderStatusByOrderId(orderId, orderStatus);
	}

	// 後端 更新取消訂單備註
	public void updateCancelNote(String orderId, String cancelNote) {
		oRepos.updateCancelNoteByOrderId(orderId, cancelNote);
	}

	// 後端 更新數量
	public void updateQuantity(Integer detailsId, String quantity) {
		dRepos.updateQuantityByDetailsId(detailsId, quantity);
	}

	// 後端 更新餐點備註
	public void updateNote(Integer detailsId, String note) {
		dRepos.updateNoteByDetailsId(detailsId, note);
	}

	// 後端 刪除餐點明細
	public void deleteOrderDetail(Integer detailsId) {
		dRepos.deleteByDetailsId(detailsId);
	}

	// 後端 新增訂單(根據不同參數)
	public void insertOrderWithoutDiscount(String orderId, String account, String payment, String pickup,
			String orderStatus) {
		oRepos.insertOrderWithoutDiscount(orderId, account, payment, pickup, orderStatus);
	}
	
	public void insertOrderWithDiscount(String orderId, String account, String discount, Integer discountPrice,
			String payment, String pickup, String orderStatus) {
		oRepos.insertOrderWithDiscount(orderId, account, discount, discountPrice, payment, pickup, orderStatus);
	}

	// 新增餐點
	public OrderDetails insertDetails(OrderDetails orderDetails) {
		return dRepos.save(orderDetails);
	}

	// 匯出 excel
	public void saveExcel(List<Order> orders, String fileName) {
		String folderPath = "C:/EXCEL";

		try {
			Path path = Paths.get(folderPath);
			if (!Files.exists(path)) {
				Files.createDirectories(path);
			}

			String filePath = folderPath + "/" + fileName;
			Workbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("Order Data");

			// 创建标题行
			Row headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("Order ID");
			headerRow.createCell(1).setCellValue("Account");
			headerRow.createCell(2).setCellValue("Original Amount");
			headerRow.createCell(3).setCellValue("Discount");
			headerRow.createCell(4).setCellValue("Discount Price");
			headerRow.createCell(5).setCellValue("Paid Amount");
			headerRow.createCell(6).setCellValue("Payment");
			headerRow.createCell(7).setCellValue("Pickup");
			headerRow.createCell(8).setCellValue("Order Status");
			headerRow.createCell(9).setCellValue("Cancel Note");

			// 填入订单数据
			int rowNum = 1;
			for (Order order : orders) {
				Row row = sheet.createRow(rowNum++);
				row.createCell(0).setCellValue(order.getOrderId());
				row.createCell(1).setCellValue(order.getAccount());
				row.createCell(2).setCellValue(order.getOriAmount());
				row.createCell(3).setCellValue(order.getDiscount());
				row.createCell(4).setCellValue(order.getDiscountPrice());
				row.createCell(5).setCellValue(order.getPaidAmount());
				row.createCell(6).setCellValue(order.getPayment());
				row.createCell(7).setCellValue(order.getPickup());
				row.createCell(8).setCellValue(order.getOrderStatus());
				row.createCell(9).setCellValue(order.getCancelNote());
			}

			try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
				workbook.write(outputStream);
				System.out.println("Excel file has been successfully saved: " + filePath);
			} catch (IOException e) {
				System.err.println("Failed to write Excel file: " + filePath);
				e.printStackTrace();
			}
		} catch (IOException e) {
			System.err.println("Failed to create target folder: " + folderPath);
			e.printStackTrace();
		}
	}

	// export json
	public void saveJson(List<Order> orders, String fileName) {
		String folderPath = "C:/JSON";

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			String filePath = folderPath + "/" + fileName;
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.writeValue(new File(filePath), orders);
			System.out.println("JSON file has been successfully saved: " + filePath);
		} catch (IOException e) {
			System.err.println("Failed to write JSON file: " + e.getMessage());
			e.printStackTrace();
		}
	}

	// export xml
	public void saveXml(List<Order> orders, String fileName) {
		String folderPath = "C:/XML";

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			String filePath = folderPath + "/" + fileName;
			XStream xstream = new XStream(new DomDriver());
			xstream.alias("order", Order.class);
			xstream.toXML(orders, new FileOutputStream(filePath));
			System.out.println("XML file has been successfully saved: " + filePath);
		} catch (IOException e) {
			System.err.println("Failed to write XML file: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
