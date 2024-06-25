<%@page import="java.util.*" %>
	<%@page import="com.team6.product.model.ProductCategory" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert Product data</title>
				<style>
					body {
						margin: 0;
						padding: 0;
						display: flex;
						justify-content: center;
						align-items: center;
						background-color: #cdb4db;
					}

					.div1 {
						border-radius: 6%;
						justify-content: center;
						align-items: center;
						width: 30%;
						min-width: 300px;
						height: 100vh;
						padding: 30px;
						margin: 30px;
						background-color: #f8edeb;
					}

					.div2 {
						font-family: 標楷體;
						text-align: center;
						align-items: center;
						background-color: #fcd5ce;
						min-width: 240px;
						height: 90%;
						min-height: 480px;
						padding: 30px;
						padding-bottom: 30px;
						font-size: 20px;
						color: #336699;
						font-weight: 700;
						border-radius: 8%;
						position: relative;
					}

					.div2 h2 {
						margin-top: 5px;
					}

					.div2 fieldset {
						border-radius: 15%;
						justify-content: center;
						align-items: center;
						display: inline-block;
						box-sizing: border-box;
						font-family: 標楷體;
					}

					a,
					a:visited {
						text-decoration: none;
						color: blue;
					}

					button {
						margin-right: 20px;
					}

					img {
						width: 10vw;
						height: 10vw;
					}

					p.img {
						margin-left: 80px;
					}
				</style>
			</head>

			<body>
				<div class="div1">

					<div class="div2">

						<h2>新增商品</h2>


						<form method="post" action="Product_Insert" enctype="multipart/form-data">

							<legend>選擇類別:
								<select name="categoryId">
									<% List<ProductCategory> productCategories = (ArrayList<ProductCategory>)request.getAttribute("findAllProductCategory");
											for (ProductCategory productCategory : productCategories) {
											%>
											<option value="<%= productCategory.getCategoryId() %>"><%= productCategory.getCategoryName() %></option>
											<%} %>

								</select>
							</legend>
							<p>

								<legend>輸入商品名稱:</legend>
								<input id="pName" type="text" name="productName" />
							<p>

								<legend>輸入商品介紹:</legend>
								<input id="pDesc" type="text" name="productDesc" />
							<p>
								<legend>上傳商品圖片:</legend>
							<p class="img">
								<input type="file" id="fileInput" name="productImg_url" onchange="previewFile()">
							</p>
							<p>
								<img src="" id="previewImage" alt="圖片預覽">
							</p>

							<p>

								<legend>上傳商品價格:</legend>
								<input id="pPrice" type="text" name="productPrice" />
							<p>
							<p>

								<legend>上傳商品數量:</legend>
								<input id="pQuantity" type="text" name="productQuantity" />
							<p>

								<button type="button" onclick="onetap()"><b>一個大括號</b></button>
								<button type="submit"><b>新增</b></button>
							</p>
						</form>
						<a href="product.atcion"><button><b>回首頁</b></button></a>

					</div>

				</div>

				<script>
					function previewFile() {
						const fileInput = document.getElementById('fileInput');
						const previewImage = document.getElementById('previewImage');
						const file = fileInput.files[0];

						if (file) {
							const reader = new FileReader();
							reader.onload = event => {
								previewImage.src = event.target.result;
							};
							reader.readAsDataURL(file);
						}
					}

					function onetap() {
						let pName = document.querySelector('#pName');
						let pDesc = document.querySelector('#pDesc');
						let pPrice = document.querySelector('#pPrice');
						pName.value = '測試44';
						pDesc.value = '這是冊4';
						pPrice.value = 444;
						pQuantity.value = 10;
					}



				</script>
			</body>

			</html>