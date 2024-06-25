<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team6.order.model.Order,com.team6.order.model.OrderDetails,com.team6.promotions.model.Promotions"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order Management</title>

<link rel="shortcut icon" type="image/png"
	href="../../../static/images/logos/favicon.png" />

<link rel="stylesheet" href="../../../static/back/css/styles.min.css" />

<style>
.updateNote-btn:hover {
	font-weight: bold;
}

.updateDiscount-btn:hover {
	font-weight: blod;
}
</style>

<!-- Font Awesome-->
<script src="https://kit.fontawesome.com/60e7a8ebe3.js"
	crossorigin="anonymous"></script>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<aside class="left-sidebar">
			<!-- Sidebar scroll-->
			<div>
				<div
					class="brand-logo d-flex align-items-center justify-content-between">
					<a href="./index.html" class="text-nowrap logo-img"> <img
						src="../../../static/images/indexImages/DonerPizzaSmall.png"
						width="180" alt="" />
					</a>
					<div
						class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
						id="sidebarCollapse">
						<i class="ti ti-x fs-8"></i>
					</div>
				</div>
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
					<ul id="sidebarnav">
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">後台功能列表</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/order/order.action" aria-expanded="false"> <span>
									<i class="ti ti-alert-circle"></i>
							</span> <span class="hide-menu">訂單管理功能</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">其他功能列表</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/emp/Member.SelectAll/1" aria-expanded="false"> <span>
									<i class="ti ti-layout-dashboard"></i>
							</span> <span class="hide-menu">會員管理功能</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/product/Product_Test_Main" aria-expanded="false"> <span>
									<i class="ti ti-article"></i>
							</span> <span class="hide-menu">產品管理功能</span>
						</a></li>

						<li class="sidebar-item"><a class="sidebar-link"
							href="/reservation/reservemain.controller" aria-expanded="false">
								<span> <i class="ti ti-cards"></i>
							</span> <span class="hide-menu">訂位管理功能</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/delivery/home" aria-expanded="false"> <span> <i
									class="ti ti-file-description"></i>
							</span> <span class="hide-menu">外送管理功能</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/promotions/promotionsMain" aria-expanded="false"> <span>
									<i class="ti ti-typography"></i>
							</span> <span class="hide-menu">活動管理功能</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/emp/EmpGoBackToEmpIndex" aria-expanded="false"> <span>
									<i class="ti ti-typography"></i>
							</span> <span class="hide-menu">返回主頁</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="ti ti-menu-2"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-icon-hover"
							href="javascript:void(0)"> <i class="ti ti-bell-ringing"></i>
								<div class="notification bg-primary rounded-circle"></div>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="/member/user.png" alt="" width="35" height="35"
									class="rounded-circle">${emp.detailBean.empName}
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-user fs-6"></i>
											<p class="mb-0 fs-3">My Profile</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-mail fs-6"></i>
											<p class="mb-0 fs-3">My Account</p>
										</a> </a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-list-check fs-6"></i>
											<p class="mb-0 fs-3">My Task</p>
										</a> <a href="/emp/logout"
											class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->
			<div class="container-fluid">
				<!-- 返回訂單主要的按鈕 -->
				<button class="btn btn-dark backToOrderIndex m-2"
					onclick="goToOrderIndex()">
					<i class="ti ti-cards"><b>返回訂單</b></i>
				</button>

				<div class="card">
					<div class="card-body">
						<!-- order div -->

						<div class="row shadow">
							<div class="col-md-6">
								<!-- 左边的容器，放置订单信息 -->
								<div class="left-container">
									<input id="orderId" type="hidden" name="orderId" value="">
									<br>
									<div class="row">
										<h5>
											<i class="fa-solid fa-list-ul"></i>
										</h5>
										<div class="col-auto">
											<div class="form-group">
												<label class="fw-semibold mb-0">客人選項：</label><select
													name="customerName" class="form-select">
													<option value="內用客人">內用客人</option>
													<option value="外帶客人">外帶客人</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<div class="form-group">
												<label class="fw-semibold mb-0">付款方式：</label> <select
													name="payment" class="form-select">
													<option value="現金">現金</option>
													<option value="LinePay">LinePay</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<div class="form-group">
												<label class="fw-semibold mb-0">取餐方式：</label> <select
													name="pickup" class="form-select">
													<option value="內用">內用</option>
													<option value="外帶">外帶</option>
												</select>
											</div>
											<br> <input type="hidden" name="orderStatus"
												value="訂單待處理(未付款)">
										</div>
										<div class="col-3">
											<div class="form-group">
												<label class="fw-semibold mb-0">折扣碼：</label> <select
													id="discountSelect" name="discount" class="form-select">
													<option value=""></option>
												</select> <input type="hidden" name="discountAmount"
													id="discountAmount" value="">
											</div>
										</div>
									</div>

									<div class="form-container shadow p-3">
										<h4>
											<i class="fa-solid fa-utensils"></i>
										</h4>
										<div class="form-group">
											<label for="productCategorySelect"
												class="p-1 fw-semibold mb-0">餐點類別：</label> <select
												class="form-control" id="productCategorySelect">
											</select>
										</div>
										<br>
										<div class="form-group">
											<label for="orderProductSelect" class="p-1 fw-semibold mb-0">選擇餐點：</label>
											<select class="form-control" id="orderProductSelect" disabled>
											</select>
										</div>
										<br>
										<div class="form-group">
											<label for="quantityInput" class="p-1 fw-semibold mb-0">數量：</label>
											<input type="number" class="form-control" id="quantityInput"
												placeholder="" min="1" max="10">
										</div>
										<br>
										<div class="form-group">
											<label for="noteInput" class="p-1 fw-semibold mb-0" disabled>餐點備註：</label>
											<input type="text" class="form-control" id="noteInput"
												placeholder="">
										</div>
										<br>
										<div>
											<label class="fw-semibold mb-0">醬料選擇：</label> <input
												type="radio" name="sauce" value="紅醬" disabled> 紅醬 <input
												type="radio" name="sauce" value="白醬" disabled> 白醬
										</div>
										<br>
										<div>
											<label class="fw-semibold mb-0">加料選擇：</label> <input
												type="checkbox" id="cheese" value="加起司" disabled>
											加起司 <input type="checkbox" id="mushroom" value="加洋菇" disabled>
											加洋菇
										</div>
										<button onclick="addOrder()" class="btn btn-dark"
											style="float: right">新增餐點</button>
										<br> <br> <br>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<!-- 右边的容器，放置餐点明细 -->
								<div class="right-container">


									<div class="table-responsive shadow m-3">
										<table
											class="table table-striped text-nowrap mb-0 align-middle">
											<thead class="text-dark fs-4">
												<tr>
													<td class="fw-semibold mb-0">餐點</td>
													<td class="fw-semibold mb-0">數量</td>
													<td class="fw-semibold mb-0">單價</td>
													<td class="fw-semibold mb-0">備註</td>
													<!-- 这里继续添加其他表头 -->
												</tr>
											</thead>
											<tbody id="orderDetailsTable">
												<!-- 这里是用JavaScript添加的行 -->
											</tbody>
										</table>
										<button type="submit"
											class="btn btn-dark m-3 employeeOrder-btn"
											style="float: right">
											<b>點餐結束</b>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- orderFinish Modal -->
					<div class="modal fade" id="orderDetailsModal" tabindex="-1"
						role="dialog" aria-labelledby="orderDetailsModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="modal-title fw-semibold mb-0"
										id="orderDetailsModalLabel">
										<i class="fa-solid fa-pizza-slice"> Dönerbox pizza</i>
									</h3>
								</div>
								<hr>
								<div class="modal-body">
									<!-- 這裡插入訂單明細的表格 -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-dark EmployeeOrder-close"
										data-dismiss="modal">
										<b>關閉</b>
									</button>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>


		<script src="../../../static/back/libs/jquery/dist/jquery.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script
			src="../../../static/back/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="../../../static/back/js/sidebarmenu.js"></script>
		<script src="../../../static/back/js/app.min.js"></script>
		<script src="../../../static/back/libs/simplebar/dist/simplebar.js"></script>


		<script src="../../../static/back/js/order/employeeOrder.js"></script>

		<!-- sweetalert -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>