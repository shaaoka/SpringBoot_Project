<%@page import="com.team6.product.model.ProductBean" %>
	<%@page import="java.util.*" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<%!@SuppressWarnings("unchecked")%>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>所有產品資料</title>
					<style>
						a,
						a:visited {
							text-decoration: none;
							color: blue;
						}

						img {
							width: 12vw;
							height: 12vw;
						}

						#btn {
							position: fixed;
							bottom: 10px;
							right: 10px;
						}
					</style>
					<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
				</head>

				<body style="background-color: #fdf5e6">
					<div align="center">
						<h2>所有產品資料</h2>
						<div>${err}</div>
						<table border="1">
							<tr style="background-color: #a8fefa">
								<th>產品編號</th>
								<th>產品類別</th>
								<th>產品名稱</th>
								<th>產品介紹</th>
								<th>產品圖片</th>
								<th>產品價格</th>
								<th>產品數量</th>
								<th>產品狀態</th>
								<th>修改</th>
								<th>狀態</th>
								<th>上架時間</th>
								<% List<ProductBean> productBeans = (ArrayList<ProductBean>)
										request.getAttribute("productBeans");
										for (ProductBean productBean : productBeans) {
										%>

							<tr>
								<td>
									<%=productBean.getProductId()%>
								</td>
								<td>
									<%=productBean.getProductCategory().getCategoryName()%>
								</td>
								<td>
									<a href="Product_SelectOneById?productId=<%=productBean.getProductId()%>">
										<%=productBean.getProductName()%>
									</a>
								</td>
								<td>
									<%=productBean.getProductDesc()%>
								</td>
								<td><img alt="暫無圖片" src="<%=productBean.getProductImg_url()%>"></td>
								<td>
									<%=productBean.getProductPrice()%>
								</td>
								<td>
									<%=productBean.getProductQuantity()%>
								</td>
								<td data-product-id="<%=productBean.getProductId()%>">
									<%=productBean.getProductState().getProductStateName()%>
								</td>
								<td>
									<a
										href="Product_GetpProductById?productId=<%=productBean.getProductId()%>"><button>修改</button></a>
								</td>
								<td>
									<select onchange="change('<%=productBean.getProductId()%>', this.value)">
										<option>修改狀態</option>
										<option value="1">上架中</option>
										<option value="0">已下架</option>
									</select>
								</td>
								<td>
									<%=productBean.getProductCreateDate()%>
								</td>
							</tr>
							<% } %>
						</table>
						<h3>
							共<%=productBeans.size()%>筆產品
						</h3>
						<p>

							<a href="product.atcion"><button id="btn">回首頁</button></a>

					</div>
					<script>

						function change(productId, productStateId) {
							// let path = "${pageContext.request.contextPath}/Product_ChangeState?productId="
							// 	+ productId + "&productStateId=" + productStateId;
							// window.location.href = path;
							// 分隔
							let path = "Product_ChangeState";
							$.ajax({
								url: path,
								method: 'PUT',
								data: { "productId": productId, "productStateId": productStateId },
								success: function (response) {
									$('[data-product-id="' + productId + '"]').html(response.productStateName);
								},
								error: (xhr, status, error) => console.log(error)
							})

						}
					</script>

				</body>

				</html>