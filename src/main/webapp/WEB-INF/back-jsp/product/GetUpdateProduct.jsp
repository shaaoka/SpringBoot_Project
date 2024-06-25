<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.team6.product.model.ProductCategory" %>
<%@page import="com.team6.product.model.ProductState" %>

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>修改產品資料</title>
		<style>
			a,
			a:visited {
				text-decoration: none;
				color: blue;
			}

			button {
				margin: 0 20px 0 35px;
			}

			div.a {
				text-align: center;
			}

			img {
				width: 12vw;
				height: 12vw;
			}
		</style>
	</head>

	<body style="background-color: #fdf5e6">
		<div align="center">

			<h2>修改產品資料</h2>
			<jsp:useBean id="productBean" scope="request" class="com.team6.product.model.ProductBean" />
			<form method="post" action="Product_DoUpdate" enctype="multipart/form-data">
				<input type="hidden" name="_method" value="PUT">
				<table>
					<tr>
						<td>商品編號</td>
						<td><input type="text" name="productId" readonly value="<%=productBean.getProductId()%>"></td>
					</tr>
					<tr>
						<td>選擇類別</td>
						<td><select name="categoryId">
									<% List<ProductCategory> productCategories = (ArrayList<ProductCategory>)request.getAttribute("findAllProductCategory");
											for (ProductCategory productCategory : productCategories) {
											%>
											<option value="<%= productCategory.getCategoryId() %>">
												<%= productCategory.getCategoryName() %>
											</option>
											<%} %>

								</select>
					</td>
					</tr>
					<tr>
						<td>商品名稱</td>
						<td><input type="text" name="productName" value="<%=productBean.getProductName()%>"></td>
					</tr>
					<tr>
						<td>商品介紹</td>
						<td><input type="text" name="productDesc" value="<%=productBean.getProductDesc()%>"></td>
					</tr>
					<tr>
						<td>商品圖片</td>
						<td>
							<input type="file" id="fileInput" name="productImg_url" onchange="previewFile()">
							<p>
								<img src="<%=productBean.getProductImg_url()%>" id="previewImage" alt="圖片預覽">
						</td>

					</tr>
					<tr>
						<td>商品價格</td>
						<td><input type="text" name="productPrice" value="<%=productBean.getProductPrice()%>"></td>
					</tr>
					<tr>
						<td>商品數量</td>
						<td><input type="text" name="productQuantity" value="<%=productBean.getProductQuantity()%>"></td>
					</tr>
					<tr>
						<td>選擇狀態</td>
						<td>
						<select name="productStateId">
									<% List<ProductState> productStates = (ArrayList<ProductState>)request.getAttribute("allProductState");
									for (ProductState productState : productStates) {
									%>
									<option value="<%= productState.getProductStateId()%>"><%= productState.getProductStateName()%></option>
									<%} %>

						</select>
						</td>
					</tr>

				</table>
				<p>
				<div class="a"><button type="submit">更新</button></div>
			</form>
			<p>
				<a href="product.atcion"><button><b>回首頁</b></button></a>
		</div>

		<script>
			function previewFile() {
				const fileInput = document.getElementById('fileInput');
				const previewImage = document.getElementById('previewImage');
				const file = fileInput.files[0];

				if (file) {
					const reader = new FileReader();
					reader.onload = function (event) {
						event.target.value = ' ';
						previewImage.src = event.target.result;
					};
					reader.readAsDataURL(file);
					event.target.value = ' ';
				}
			}
		</script>

	</body>

	</html>