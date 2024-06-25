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
				<div class="card">
					<div class="card-body">
						<button class="btn btn-dark" onclick="goToOrderByEmployee()">
							<i class="fa-solid fa-utensils">點餐</i>
						</button>
					</div>
					<div>

						<!-- order div -->


						<div class="card-body p-4">
							<div class="row justify-content-end p-2">
								<!--<h5 class="card-title fw-semibold mb-4">DönerPizza 訂單管理</h5>  -->

								<div class="row">
									<div class="col-auto">
										<label for="searchInput" class="col-form-label">查詢：</label>
									</div>
									<div class="col-auto">
										<input type="text" id="searchInput" class="form-control"
											placeholder="">
									</div>
									<div class="col-1">
										<button class="btn btn-white border export-btn">
											<h4>
												<i class="fa-solid fa-file-export"></i>
											</h4>
										</button>
									</div>
								</div>
								<div
									class="text-center bg-white font-weight-bold text-primary col-12"
									id="totalDataCount"></div>
							</div>
							<!-- 表格内容容器 -->
							<div class="table-responsive shadow">

								<table class="table table-striped text-nowrap mb-0 align-middle">
									<thead class="text-dark fs-4">
										<tr>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">訂單編號</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">訂購人</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">原始金額</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">折扣碼</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">折扣金額</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">付款金額</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">付款方式</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">取餐方式</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">訂單狀態</h6>
											</th>
											<th class="border-bottom-1">
												<h6 class="fw-semibold mb-0">取消原因</h6>
											</th>
										</tr>
									</thead>

									<tbody id="orderTableBody">

									</tbody>
								</table>
							</div>
							<!-- 显示总记录数和当前页码信息 -->
							<!-- 分页控件 -->
							<div class="container">
								<div class="row">
									<div class="col-auto">
										<div class="d-flex flex-column align-items-end">
											<div class="pagination-info m-2">
												<span id="paginationInfo"></span>
											</div>
										</div>
										<div class="col-auto">
											<div class="input-group">
												<input type="number" id="pageNumberInput"
													class="form-control" placeholder="跳轉頁碼"
													style="width: 120px;">
												<div class="input-group-append">
													<button id="goToPageBtn" class="btn btn-dark m-1">跳轉</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-7"></div>
									<!-- 空白的 col-auto -->
									<div class="col-auto ml-auto">
										<!-- 要置右邊的 col-auto -->
										<div class="pagination-container">
											<ul class="pagination justify-content-end m-3">
												<li class="page-item" id="firstPage"><a
													class="page-link" href="#">«</a></li>
												<li class="page-item" id="prevPage"><a
													class="page-link" href="#">‹</a></li>
												<li class="page-item" id="nextPage"><a
													class="page-link" href="#">›</a></li>
												<li class="page-item" id="lastPage"><a
													class="page-link" href="#">»</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>

							<!-- details Modal -->
							<div class="container">
								<div class="row">
									<div class="col-12">
										<div id="orderDetailsModal" class="modal fade" tabindex="-1"
											role="dialog" aria-labelledby="orderDetailsModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title text-center"
															id="orderDetailsModalLabel"></h5>
													</div>
													<div class="modal-body">
														<div class="table-responsive">
															<table id="orderDetailsTable" class="table table-border">
																<thead>
																	<tr>
																		<th class="text-nowrap">產品名稱</th>
																		<th class="text-nowrap">單價</th>
																		<th class="text-nowrap">數量</th>
																		<th class="text-nowrap">小計</th>
																		<th class="text-nowrap">餐點備註</th>
																		<th>刪除</th>
																	</tr>
																</thead>
																<tbody id="orderDetailsTableBody">
																	<!-- Order details will be dynamically populated here -->
																</tbody>
															</table>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-dark newDetails"
															id="showAddDetailsModal" data-toggle="modal"
															data-target="#addDetailsModal">
															新增餐點 <input type="hidden" id="orderIdInput">
														</button>

														<button type="button" class="btn btn-dark border close"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- discount modal -->
							<div id="updateDiscountModal" class="modal" tabindex="-1"
								role="dialog">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">選擇優惠折扣碼</h5>
										</div>
										<div class="modal-body">
											<select id="discountSelect" class="form-control">

											</select> <br>
											<h6 id="discountPrice" style="display: none;">
												<span class="float-right discountPrice p-3">折扣金額:</span>
											</h6>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-dark"
												id="confirmDiscountBtn">確定</button>
											<button type="button" class="btn btn-dark close"
												data-dismiss="modal">關閉</button>
										</div>
									</div>
								</div>
							</div>

							<!-- cancelNote modal -->
							<div class="modal fade" id="cancelNoteModal" tabindex="-1"
								role="dialog" aria-labelledby="cancelNoteModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="cancelNoteModalLabel">請簡述取消原因(30字內)：
											</h5>
										</div>
										<div class="modal-body">
											<input type="text" id="cancelNoteInput" class="form-control">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-dark"
												id="confirmCancelNoteBtn">確定</button>
											<button type="button" class="btn btn-dark close"
												data-dismiss="modal">取消</button>
										</div>
									</div>
								</div>
							</div>

							<!-- insert detail -->
							<div class="modal fade" id="addDetailsModal" tabindex="-1"
								role="dialog" aria-labelledby="addDetailsModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="addDetailsModalLabel">新增餐點</h5>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="productCategorySelect" class="p-1">餐點類別：</label>
												<select class="form-control" id="productCategorySelect">
												</select>
											</div>
											<br>
											<div class="form-group">
												<label for="orderProductSelect" class="p-1">選擇餐點：</label> <select
													class="form-control" id="orderProductSelect" disabled>
												</select>
											</div>
											<br>
											<div class="form-group">
												<label for="quantityInput" class="p-1">數量：</label> <input
													type="number" class="form-control" id="quantityInput"
													placeholder="" min="1" max="10">
											</div>
											<br>
											<div class="form-group">
												<label for="noteInput" class="p-1" disabled>餐點備註：</label> <input
													type="text" class="form-control" id="noteInput"
													placeholder="">
											</div>
											<br>
											<div>
												<label>醬料選擇：</label> <input type="radio" name="sauce"
													value="紅醬" disabled> 紅醬 <input type="radio"
													name="sauce" value="白醬" disabled> 白醬
											</div>
											<br>
											<div>
												<label>加料選擇：</label> <input type="checkbox" id="cheese"
													value="加起司" disabled> 加起司 <input type="checkbox"
													id="mushroom" value="加洋菇" disabled> 加洋菇
											</div>


										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-dark" id="addDetailsBtn">確定</button>
											<button type="button" class="btn btn-dark closeInsertDetails"
												data-dismiss="modal">關閉</button>
										</div>
									</div>
								</div>
							</div>


							<!-- export modal -->
							<div class="modal" id="exportModal" tabindex="-1" role="dialog">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">
												<b>選擇匯出格式</b>
											</h5>
										</div>
										<div class="modal-body">
											<button class="btn btn-primary export-format-btn m-2"
												data-format="excel">EXCEL</button>
											<button class="btn btn-primary export-format-btn m-2"
												data-format="json">JSON</button>
											<button class="btn btn-primary export-format-btn m-2"
												data-format="xml">XML</button>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-dark closeExport"
												data-dismiss="modal">
												<b>關閉</b>
											</button>
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


					<script src="../../../static/back/js/order/orderCRUD.js"></script>
					<script src="../../../static/back/js/order/detailsCRUD.js"></script>
					<script src="../../../static/back/js/order/employeeOrder.js"></script>

					<!-- sweetalert -->
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>