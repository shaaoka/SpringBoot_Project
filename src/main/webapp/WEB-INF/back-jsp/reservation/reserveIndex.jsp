<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,java.util.List,com.team6.reservation.model.*" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>訂位管理功能</title>
		<link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />
		<link rel="stylesheet" href="/back/css/member/EmpIndexGoToInsertMember.css" />
		<link rel="stylesheet" href="/back/css/styles.min.css" />
		<script src="/back/js/member/EmpIndexGoToInsertMember.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

		<style>
			.column-left {
				float: left;
				width: 48%;
				/* 調整寬度以適應您的設計 */
			}

			.column-right {
				float: right;
				width: 48%;
				/* 調整寬度以適應您的設計 */
			}

			.up {
				position: relative;
				top: -30px;
				/* 根據需要調整這個值 */
			}
		</style>
	</head>

	<body>
		<!--  Body Wrapper -->
		<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
			data-sidebar-position="fixed" data-header-position="fixed">
			<!-- Sidebar Start -->
			<aside class="left-sidebar">
				<!-- Sidebar scroll-->
				<div>
					<div class="brand-logo d-flex align-items-center justify-content-between">
						<a href="#" class="text-nowrap logo-img"> <img src="/images/member/DonerPizzaSmall.png"
								width="180" alt="" />
						</a>
						<div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
							<i class="ti ti-x fs-8"></i>
						</div>
					</div>
					<!-- Sidebar navigation-->
					<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
						<ul id="sidebarnav">
							<li class="nav-small-cap"><i class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
									class="hide-menu">後台功能列表</span></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/reservation/reservemain.controller"
									aria-expanded="false"> <span> <i class="ti ti-cards"></i>
									</span> <span class="hide-menu">訂位管理功能</span>
								</a></li>
							<li class="nav-small-cap"><i class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
									class="hide-menu">其他功能列表</span></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/emp/Member.SelectAll/1"
									aria-expanded="false"> <span>
										<i class="ti ti-layout-dashboard"></i>
									</span> <span class="hide-menu">會員管理功能</span>
								</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/product/Product_Test_Main"
									aria-expanded="false"> <span>
										<i class="ti ti-article"></i>
									</span> <span class="hide-menu">產品管理功能</span>
								</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/order/order.action"
									aria-expanded="false"> <span>
										<i class="ti ti-alert-circle"></i>
									</span> <span class="hide-menu">訂單管理功能</span>
								</a></li>

							<li class="sidebar-item"><a class="sidebar-link" href="/delivery/home"
									aria-expanded="false"> <span> <i class="ti ti-file-description"></i>
									</span> <span class="hide-menu">外送管理功能</span>
								</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/promotions/promotionsMain"
									aria-expanded="false"> <span>
										<i class="ti ti-typography"></i>
									</span> <span class="hide-menu">活動管理功能</span>
								</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="/emp/EmpGoBackToEmpIndex"
									aria-expanded="false"> <span>
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
							<li class="nav-item d-block d-xl-none"><a class="nav-link sidebartoggler nav-icon-hover"
									id="headerCollapse" href="javascript:void(0)"> <i class="ti ti-menu-2"></i>
								</a></li>
							<li class="nav-item"><a class="nav-link nav-icon-hover" href="javascript:void(0)"> <i
										class="ti ti-bell-ringing"></i>
									<div class="notification bg-primary rounded-circle"></div>
								</a></li>
						</ul>
						<div class="navbar-collapse justify-content-end px-0" id="navbarNav">
							<ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
								<li class="nav-item dropdown"><a class="nav-link nav-icon-hover"
										href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
										aria-expanded="false">
										<img src="/member/user.png" alt="" width="35" height="35"
											class="rounded-circle">${emp.detailBean.empName}
									</a>
									<div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
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
											</a>
											</a> <a href="javascript:void(0)"
												class="d-flex align-items-center gap-2 dropdown-item"> <i
													class="ti ti-list-check fs-6"></i>
												<p class="mb-0 fs-3">My Task</p>
											</a> <a href="/emp/logout"
												class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
										</div>
									</div>
								</li>
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
									<div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
										<div class="mb-3 mb-sm-0">
											<h5 class="card-title fw-semibold">歷史訂位紀錄</h5>
										</div>
										<div>
											<select class="form-select">
												<option value="1">2024</option>
												<option value="2">2023</option>
												<option value="3">2022</option>
												<option value="4">2021</option>
											</select>
										</div>
									</div>
									<div id="historyChart"></div>

								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="row">
								<div class="col-lg-12">
									<!-- Yearly Breakup -->
									<div class="card overflow-hidden">
										<div class="card-body p-4">
											<h5 class="card-title mb-9 fw-semibold">今日營業額</h5>
											<div class="row align-items-center">
												<div class="col-8">
													<h4 class="fw-semibold mb-3">$36,358</h4>
													<div class="d-flex align-items-center mb-3">
														<span
															class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
															<i class="ti ti-arrow-up-left text-success"></i>
														</span>
														<p class="text-dark me-1 fs-3 mb-0">+9%</p>
														<p class="fs-3 mb-0">yesterday</p>
													</div>
													<div class="d-flex align-items-center">
														<div class="me-4">
															<span
																class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
															<span class="fs-2">2024-5</span>
														</div>
														<div>
															<span
																class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
															<span class="fs-2">2024-4</span>
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
													<h5 class="card-title mb-9 fw-semibold">本月營業額</h5>
													<h4 class="fw-semibold mb-3">$188,820</h4>
													<div class="d-flex align-items-center pb-1">
														<span
															class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
															<i class="ti ti-arrow-down-right text-danger"></i>
														</span>
														<p class="text-dark me-1 fs-3 mb-0">+9%</p>
														<p class="fs-3 mb-0">last month</p>
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
									<div id="ReservationComfirm">
										<div class="column-left">
											<div>
												<h2 style="margin-bottom: 10px;" class="fw-semibold">待確認預訂訊息</h2>
											</div>
											<form action="/reservation/selectByStatus" method="get">
												<button class="btn btn-primary position-relative"
													style="margin-top: 15px;">
													查詢
													<span
														class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
														<%= request.getAttribute("selectReservationStatusCounts") %>
													</span>
												</button>
											</form>
										</div>
										<div class="column-right">
											<h2 style="margin-bottom: 10px;" class="fw-semibold">目前用餐客人資訊</h2>
											<form method="get" action="/reservation/selectAllChecked">
												<div class="up">
													<br>目前共 <span id="result"
														style="font-weight: bold; color: red;"></span>
													位客人正在用餐<br>
													<button value="selectAllChecked" name="checkin"
														class="btn btn-primary">查詢</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-lg-4 order-lg-2">
							<div class="card-body pt-3 p-4 card ">
								<h2 class=" fw-semibold">報到</h2>
								<div class="d-flex align-items-center justify-content-between">
									<div id="CheckIn">
										<div>
											<h5>依姓名查詢</h5>
											<form method="get" action="/reservation/checkInByName">
												<div>
													姓名：<input type="text" placeholder="支援模糊查詢" name="nameSelect">
												</div>
												<button value="selectByName" name="checkin" style="margin-top: 5px;"
													class="btn btn-primary">查詢</button>
											</form>
										</div>
										<br>
										<div>
											<h5>依電話查詢</h5>
											<form method="get" action="/reservation/checkInByPhone">
												<div>
													電話：<input type="text" placeholder="" name="phoneSelect">
												</div>
												<button value="selectByPhone" name="checkin" style="margin-top: 5px;"
													class="btn btn-primary">查詢</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-4 order-lg-3">
							<div class="card-body pt-3 p-4 card ">
								<h2 class="fw-semibold">新增現場用餐</h2>
								<div class="d-flex align-items-center justify-content-between">
									<form method="post" action="/reservation/dineInCustomer"
										onsubmit="submitForm(event)">
										<div style="margin-bottom: 10px;">
											<label for="date" style="margin-right: 10px;">用餐日期：</label>
											<input type="date" id="date" name="date" style="background-color:#FCFEDC"
												required>
										</div>
										<div style="margin-bottom: 10px;">
											<label for="time" style="margin-right: 10px;">用餐時間：</label>
											<input id="time" type="text" name="time"
												style=width:60px;background-color:#FCFEDC required>
										</div>
										<div style="margin-bottom: 10px;">
											<label for="people" style="margin-right: 10px;">用餐人數：</label>
											<input type="number" id="people" name="people" min="1" style=width:60px
												required>
										</div>
										<div style="margin-bottom: 20px;">
											<label for="note" style="margin-bottom: 10px;">備註：</label>
											<textarea id="note" name="note" rows="1"></textarea>
											<button type="submit" name="checkin" value="customerReserve"
												class="btn btn-primary">送出</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-4 order-lg-1">
							<div class="card-body pt-3 p-4 card ">
								<h2 class="fw-semibold">查詢預訂訊息</h2>
								<div class="d-flex align-items-center justify-content-between">
									<div>
										<h5>依日期查詢</h5>
										<form method="get" action="/reservation/selectByDate">
											<div id="reservationStatus">
												<input id="dateSelect" type="date" name="dateSelect"
													style="background-color:#FCFEDC;">
												<div>
													<button value="selectByDate" name="checkin" style="margin-top: 5px;"
														class="btn btn-primary">查詢</button>
										</form>
									</div>
									<br>
									<div>
										<h5>依月份查詢</h5>
										<form method="get" action="/reservation/selectByMonthAndYear/1">
											<div id="reservationStatus">
												<input id="monthSelect" type="month" name="monthSelect"
													required="required" style="background-color:#FCFEDC;">
												<div>
													<button value="selectByMonth" name="checkin"
														style="margin-top: 5px;" class="btn btn-primary">查詢</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script src="/back/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
			<script src="/back/js/sidebarmenu.js"></script>
			<script src="/back/js/app.min.js"></script>
			<script src="/back/libs/apexcharts/dist/apexcharts.min.js"></script>
			<script src="/back/libs/simplebar/dist/simplebar.js"></script>
			<script src="/back/js/dashboard.js"></script>
			<script src="/back/js/member/EmpMemberGetAll.js"></script>

			<script>

				var now = new Date();

				var currentDate = now.toLocaleDateString('sv-SE');
				var currentTime = now.toTimeString().split(' ')[0].substring(0, 5); // 只保留時和分

				document.getElementById('date').value = currentDate;
				document.getElementById('time').value = currentTime;
				document.getElementById('dateSelect').value = currentDate;


				function submitForm(event) {
					var numberOfPeople = parseInt(document.getElementById("people").value);
					var date = document.getElementById("date").value;
					var time = document.getElementById("time").value;
					var note = document.getElementById("note").value;

					var dateToString = date.toString();
					var timeToString = time.toString();
					var note = note.toString();

					event.preventDefault();

					if (numberOfPeople > 20) {
						alert("用餐人數超過限制，最多只能容納20人。");
						return;
					} else {
						fetch('/reservation/dineInCustomer', {
							method: 'POST',
							headers: {
								'Content-Type': 'application/x-www-form-urlencoded',
							},
							body: new URLSearchParams({
								people: numberOfPeople,
								date: date,
								time: time,
								note: note
							}),
						})
							.then(response => {
								if (response.ok) {
									return response.text();
								} else {
									throw new Error('用餐人數超過限制，最多只能容納20人。');
								}
							})
							.then(data => {
								alert(data);
								location.reload();
							})
							.catch(error => {
								alert(error.message);
							})
					}
				};

				jQuery('#time').datetimepicker({
					datepicker: false,
					format: 'H:i'
				});

				function updateCheckedInfo() {
					fetch('/reservation/selectAllCheckedCounts')
						.then(response => {
							if (!response.ok) {
								throw new Error('Network response was not ok ' + response.statusText);
							}
							return response.text();
						})
						.then(data => {
							document.getElementById('result').innerHTML = data;
						})
						.catch(error => {
							console.error('There was a problem with the fetch operation:', error);
						});
				}

				window.onload = updateCheckedInfo;


				var options = {
					series: [{
						name: 'Inflation',
						data: [204, 225, 338, 367, 301, 172, 89, 73, 41, 48, 32, 35]
					}],
					chart: {
						height: 350,
						type: 'bar',
					},
					plotOptions: {
						bar: {
							borderRadius: 10,
							dataLabels: {
								position: 'top', // top, center, bottom
							},
						}
					},
					dataLabels: {
						enabled: true,
						formatter: function (val) {
							return val;
						},
						offsetY: -20,
						style: {
							fontSize: '12px',
							colors: ["#304758"]
						}
					},

					xaxis: {
						categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
						position: 'top',
						axisBorder: {
							show: false
						},
						axisTicks: {
							show: false
						},
						crosshairs: {
							fill: {
								type: 'gradient',
								gradient: {
									colorFrom: '#D8E3F0',
									colorTo: '#BED1E6',
									stops: [0, 100],
									opacityFrom: 0.4,
									opacityTo: 0.5,
								}
							}
						},
						tooltip: {
							enabled: true,
						}
					},
					yaxis: {
						axisBorder: {
							show: false
						},
						axisTicks: {
							show: false,
						},
						labels: {
							show: false,
							formatter: function (val) {
								return val + "%";
							}
						}

					},
					title: {
						text: 'Monthly History Reservation in 2024',
						floating: true,
						offsetY: 330,
						align: 'center',
						style: {
							color: '#444'
						}
					}
				};

				var chart = new ApexCharts(document.querySelector("#historyChart"), options);
				chart.render();

			</script>
	</body>

	</html>