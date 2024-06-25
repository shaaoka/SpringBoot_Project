<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Delete Product data</title>
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

			a,
			a:visited {
				text-decoration: none;
				color: blue;
			}

			button {
				margin-right: 20px;
			}
		</style>
	</head>

	<body>
		<div class="div1">

			<div class="div2">


				<h1>刪除產品資料</h1>
				<form method="post" action="Product_Delete">
					<input type="hidden" name="_method" value="DELETE">
					<h2>請注意!資料刪除無法復原</h2>
					<h3>請注意!資料刪除無法復原</h3>
					<h4>請注意!資料刪除無法復原</h4>
					輸入產品編號 : <input type="text" name="productId" required />
					<p>
						<button type="submit"><b>刪除</b></button>
				</form>
				<a href="product.atcion"><button><b>回首頁</b></button></a>

			</div>

		</div>
	</body>

	</html>