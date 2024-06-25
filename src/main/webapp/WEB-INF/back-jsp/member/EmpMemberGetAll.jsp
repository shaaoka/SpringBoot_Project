<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台系統</title>
<link rel="shortcut icon" type="image/png"
	href="/images/member/pizzaQ.png" />
<link rel="stylesheet" href="/back/css/styles.min.css" />
<link rel="stylesheet" href="/back/css/member/userPhoto.css" />
<script src="https://kit.fontawesome.com/60e7a8ebe3.js" crossorigin="anonymous"></script>
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
					<a href="#" class="text-nowrap logo-img"> <img
						src="/images/member/DonerPizzaSmall.png" width="180" alt="" />
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
							href="/emp/Member.SelectAll/1" aria-expanded="false"> <span>
									<i class="ti ti-layout-dashboard"></i>
							</span> <span class="hide-menu">會員管理功能</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">其他功能列表</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/product/Product_Test_Main" aria-expanded="false"> <span>
									<i class="ti ti-article"></i>
							</span> <span class="hide-menu">產品管理功能</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/order/order.action" aria-expanded="false"> <span>
									<i class="ti ti-alert-circle"></i>
							</span> <span class="hide-menu">訂單管理功能</span>
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
									<i class="ti ti-list-check fs-6"></i>
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
									<img src="/member/pizzaQ.png" alt="" width="35" height="35"
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
			<div class="container-fluid ">
				<!--  Row 1 -->
				<div class="row">
					<div class="col-lg-8 d-flex align-items-strech">
						<div class="card w-100">
							<div class="card-body">
								<div
									class="d-sm-flex d-block align-items-center justify-content-between mb-9">
									<div class="mb-3 mb-sm-0">
										<h5 class="card-title fw-semibold">註冊概況</h5>
									</div>
									<div>
										<select class="form-select">
											<option value="1">2024 年 2 月</option>
											<option value="2">2024 年 3 月</option>
											<option value="3">2024 年 4 月</option>
											<option value="4">2024 年 5 月</option>
										</select>
									</div>
								</div>
								<div id="chart"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-lg-12">
								<!-- Yearly Breakup -->
								<div class="card overflow-hidden">
									<div class="card-body p-4">
										<h5 class="card-title mb-9 fw-semibold">每年註冊頻率</h5>
										<div class="row align-items-center">
											<div class="col-8">
												<h4 class="fw-semibold mb-3">$36,358</h4>
												<div class="d-flex align-items-center mb-3">
													<span
														class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
														<i class="ti ti-arrow-up-left text-success"></i>
													</span>
													<p class="text-dark me-1 fs-3 mb-0">+5.7%</p>
													<p class="fs-3 mb-0">去年</p>
												</div>
												<div class="d-flex align-items-center">
													<div class="me-4">
														<span
															class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
														<span class="fs-2">23年3月</span>
													</div>
													<div>
														<span
															class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
														<span class="fs-2">23年4月</span>
													</div>
												</div>
											</div>
											<div class="col-4">
												<div class="d-flex justify-content-center">
													<div id="breakup"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<!-- Monthly Earnings -->
								<div class="card">
									<div class="card-body">
										<div class="row alig n-items-start">
											<div class="col-8">
												<h5 class="card-title mb-9 fw-semibold">每月註冊率</h5>
												<h4 class="fw-semibold mb-3">$6,820</h4>
												<div class="d-flex align-items-center pb-1">
													<span
														class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
														<i class="ti ti-arrow-down-right text-danger"></i>
													</span>
													<p class="text-dark me-1 fs-3 mb-0">+9%</p>
													<p class="fs-3 mb-0">去年</p>
												</div>
											</div>
											<div class="col-4">
												<div class="d-flex justify-content-end">
													<div
														class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
														<i class="ti ti-currency-dollar fs-6"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="earning"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<h5 class="card-title fw-semibold mb-4">所有會員</h5>
								<table class="table text-nowrap mb-0 align-middle">
									<tr>
										<td class="border-bottom-0"><span>查詢：</span><input
											type="text" id="select" value=""></td>
										<td
											class="border-bottom-0 d-grid gap-2 d-md-flex justify-content-md-end"
											oncontextmenu="selectByName()">
											<button onclick="openMemberDownloadModal()"
												class="btn btn-primary mx-5"><i class="fa-solid fa-file-export"></i>下載</button>
											<button onclick="openMemberInsertModal()"
												class="btn btn-primary mx-5"><i
											class="ti ti-user fs-6"></i>新憎會員</button>
										</td>
									</tr>
								</table>

								<div class="table-responsive">
									<!-- table -->
									<!-- all查詢 開始 -->
									<table class="table text-nowrap mb-0 align-middle"
										id="showmember"></table>
									<table id="showpage"
										class="table text-nowrap mb-0 align-middle">
										<tr>
											<td class="border-bottom-0">總共 ${totalPages} 頁 有
												${totalElements} 筆資料</td>
											<td class="border-bottom-0">
												<nav>
													<ul class="pagination text-nowrap mb-0 align-middle"
														id="showpage">
														<li class="page-item"><span
															class="page-link disabled">上一頁</span></li>
														<c:forEach var="i" begin="1" end="${totalPages}" step="1">
															<li class="page-item"><button
																	class="btn btn-primary page-link active" id="myPage"
																	type="button" onclick="page(${i})">${i}</button></li>
														</c:forEach>
														<li class="page-item"><a class="page-link" href="#">下一頁</a></li>
													</ul>
												</nav>

											</td>
										</tr>
									</table>
									<!-- all查詢 結束 -->

									<!-- 模糊查詢 開始 -->
									<table class="table text-nowrap mb-0 align-middle"
										id="showmemberByName"></table>
									<table id="showpageByName"
										class="table text-nowrap mb-0 align-middle"></table>
									<!-- 模糊查詢 結束 -->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- insert Modal -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="memberInsertModal" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="memberInsertModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title text-center" id="memberInsertModalLabel">註冊新會員</h5>
							</div>
							<div class="modal-body">
								<div class="table-responsive">
									<table id="memberInsertTable" class="table table-border">
										<tbody id="memberInsertTableBody">
											<tr>
												<td class="text-nowrap">使用者帳號</td>
												<td class="text-nowrap"><input type="text"
													class="form-control" id="InsertAccount"
													aria-describedby="textHelp" name="account" required
													placeholder="請輸入帳號"></td>
											</tr>
											<tr>
												<td class="text-nowrap">電子信箱</td>
												<td class="text-nowrap"><input type="email"
													class="form-control" id="InsertEmail"
													aria-describedby="emailHelp" name="mEmail" required
													placeholder="請輸入電子信箱"></td>
											</tr>
											<tr>
												<td class="text-nowrap">密碼</td>
												<td class="text-nowrap"><input type="password"
													class="form-control" id="InsertPassword" name="password"
													required placeholder="請輸入密碼"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary"
									onclick="memberInsert()">註 冊</button>
								<button type="button" class="btn btn-dark border close"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- insert Modal end -->
	<!-- details Modal -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="memberDetailsModal" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="memberDetailsModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title text-center" id="memberDetailsModalLabel"></h5>
							</div>
							<div class="modal-body">
								<div class="table-responsive">
									<table id="memberDetailsTable" class="table table-border">
										<tbody id="memberDetailsTableBody">
											<!-- member details will be dynamically populated here -->
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									id="goToUpdateDetailsModal" >
									修改資料
								</button>
								<button type="button" class="btn btn-danger border close"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- details Modal end -->
	<!-- updateDetails Modal -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="memberUpdateDetailsModal" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="memberUpdateDetailsModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title text-center"
									id="memberUpdateDetailsModalLabel"></h5>
							</div>
							<div class="modal-body">
								<div class="table-responsive">
									<table id="memberUpdateDetailTable" class="table table-border">
										<tbody id="memberUpdateDetailTableBody">
										
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-dark"
									onclick="updateMemberDetail()" >
									確定更新
								</button>

								<button type="button" class="btn btn-danger border close"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- updateDetails Modal end -->
	<!-- download Modal -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="memberDownloadModal" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="memberDownloadModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title text-center"
									id="memberDownloadModalLabel">
									<i class="fa-solid fa-file-export"></i>下載檔案
								</h5>
							</div>
							<div class="modal-body">
								<div class="table-responsive">
									<table id="memberDownloadTable" class="table table-border">
										<tbody id="memberDownloadTableBody">
											<tr>
												<td class="text-center"><button type="button"
														class="btn btn-success" id="csv" onclick="download('csv')">
														Csv 檔案</button></td>
												<td class="text-center"><button type="button"
														class="btn btn-danger" id="xml" onclick="download('xml')">
														Xml 檔案</button></td>

												<td class="text-center"><button type="button"
														class="btn btn-warning" id="json"
														onclick="download('json')">Json 檔案</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-dark border mt-1 close"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- download Modal end -->
	
	<script src="/back/libs/jquery/dist/jquery.min.js"></script>
	<script src="/back/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/back/js/sidebarmenu.js"></script>
	<script src="/back/js/app.min.js"></script>
	<script src="/back/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/back/libs/simplebar/dist/simplebar.js"></script>
	<script src="/back/js/dashboard.js"></script>
	<script src="/back/js/member/EmpMemberGetAll.js"></script>
</body>

</html>