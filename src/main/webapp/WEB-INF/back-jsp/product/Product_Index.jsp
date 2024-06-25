<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>產品後台管理</title>
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
				height: 80vh;
				padding: 30px;
				margin: 30px;
				background-color: #f8edeb;
			}

			.div2 {
				font-family: 標楷體;
				text-align: center;
				align-items: center;
				background-color: #fcd5ce;
				height: 60%;
				min-height: 480px;
				padding: 30px;
				padding-bottom: 30px;
				font-size: 20px;
				color: #336699;
				font-weight: 700;
				border-radius: 8%;
				position: relative;
			}

			.div2 fieldset {
				border-radius: 15%;
				justify-content: center;
				align-items: center;
				display: inline-block;
				width: 80%;
				box-sizing: border-box;
				margin: 10px;
				font-family: 標楷體;
			}

			.header {
				text-align: left;
				display: flex;
				align-content: center;
				margin: 10px 0px 10px 0px;
			}

			.header h2 {
				color: #272640;
				margin: 20px 0px 10px 0px;
			}


			.header img {
				justify-self: start;
				margin-right: 60px;
				width: 100px;
				height: 100px;
				border-radius: 60%;
			}

			button {
				margin: 2px;
				font-size: 18px;
				color: #4a4e69;
				font-family: 標楷體;
			}

			.btn1 {
				margin: 0;
				margin-top: 2px;
				font-size: 14px;
			}

			.btn2 {
				margin-top: 10px;
				font-size: 18px;
			}

			footer {
				position: absolute;
				bottom: 20px;
				left: 0;
				width: 100%;
				text-align: center;
			}

			footer button {
				font-size: 20px;
				font-family: 標楷體;
			}


			a,
			a:visited {
				text-decoration: none;
				color: blue;
			}

			.form {
				display: inline-block
			}
		</style>
	</head>

	<body>
		<div class="div1">


			<div class="div2">

				<div class="header"><img src="/product/images/pizza.jpg">
					<h2>產品後台管理</h2>
				</div>

				<fieldset>
					<legend align="left"><b>查詢產品</b></legend>
					<form method="get" action="Product_SelectByName">
						<label for="search"><b>品名:</b></label> <input type="text" id="search"
							placeholder="Enter Product Name" name="productName" required>
						<button class="btn1" type="submit"><b>查詢</b></button>
					</form>
					<a href="Product_SelectAll"><button class="btn2"><b>查詢所有產品</b></button></a>
				</fieldset>
				<br>
				<br>
				<fieldset>
					<legend align="left"><b>新增、刪除產品</b></legend>
					<a href="InsertProductMain"><button><b>新增產品</b></button></a>
					<a href="DeleteInsertProductMain"><button><b>刪除產品</b></button></a>
				</fieldset>
				<br>
				<br>
				<footer>
					<a href="/member/MemberGoBackToIndex"><button><b>返回後台管理</b></button></a>
				</footer>

			</div>

		</div>

	</body>

	</html>