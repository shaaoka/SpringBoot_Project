<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>產品資料</title>
<style>
a, a:visited {
	text-decoration: none;
	color: blue;
	margin-right: 20px;
}
img {
	width: 12vw;
	height: 12vw;
}
</style>
</head>

<body style="background-color: #fdf5e6">
	<div align="center">
		<h2>產品資料</h2>
		<jsp:useBean id="productBean" scope="request"
			class="com.team6.product.model.ProductBean" />
		<table>
			<tr>
				<td>商品編號</td>
				<td><input type="text" readonly value="<%=productBean.getProductId()%>"></td>
			</tr>
			<tr>
				<td>類別名稱</td>
				<td><input type="text" readonly value="<%=productBean.getProductCategory().getCategoryName()%>"></td>
			</tr>
			<tr>
				<td>商品名稱</td>
				<td><input type="text" readonly value="<%=productBean.getProductName()%>"></td>
			</tr>
			<tr>
				<td>商品介紹</td>
				<td><input type="text" readonly value="<%=productBean.getProductDesc()%>"></td>
			</tr>
			<tr>
				<td>產品圖片</td>
				<td><img alt="暫無圖片" src="<%=productBean.getProductImg_url()%>"></td>
			</tr>
			<tr>
				<td>商品價格</td>
				<td><input type="text" readonly value="<%=productBean.getProductPrice()%>"></td>
			</tr>
			<tr>
				<td>商品數量</td>
				<td><input type="text" readonly value="<%=productBean.getProductQuantity()%>"></td>
			</tr>
			<tr>
				<td>商品狀態</td>
				<td><input type="text" readonly value="<%=productBean.getProductState().getProductStateName()%>"></td>
			</tr>
			<tr>
				<td>上架時間</td>
				<td><input type="text" readonly value="<%=productBean.getProductCreateDate()%>"></td>
			</tr>

		</table>
		<p>
			<a href="product.atcion"><button><b>回首頁</b></button></a>	
			<a href="Product_SelectAll"><button><b>查詢所有資料</b></button></a> 
	</div>
</body>

</html>