<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,com.team6.reservation.model.*" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>訂位人數資料修改</title>
		<link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />
		<link rel="stylesheet" href="/back/css/member/EmpIndexGoToInsertMember.css" />
		<link rel="stylesheet" href="/back/css/styles.min.css" />
		<script src="/back/js/member/EmpIndexGoToInsertMember.js"></script>

		<style>
			table {
				width: 100%;
				border-collapse: collapse;
			}

			thead th,
			tbody td {
				border: 1px solid #ddd;
				padding: 8px;
				text-align: left;
			}

			thead th {
				background-color: #f2f2f2;
			}

			tbody tr:nth-child(even) {
				background-color: #f2f2f2;
			}

			tbody tr:hover {
				background-color: #ddd;
			}

			button {
				padding: 6px 11px;
				border: none;
				background-color: #007bff;
				color: #fff;
				cursor: pointer;
				width: auto;
				border-radius: 5px;
			}

			button:hover {
				background-color: #0056b3;
			}

			input {
				height: 20px;
			}
		</style>
	</head>

	<body>
		<h2>訂位人數資料修改</h2>

		<!-- <a href="/reservation/reservemain.controller"><button><b>回首頁</b></button></a> -->

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
					<h2>訂位人數資料修改</h2>
					<table>
						<thead>
							<tr>
								<th style="width: 50px;">編號</th>
								<th style="width: 100px; text-align: center;">日期</th>
								<th style="width: 100px; text-align: center;">時間</th>
								<th style="width: 50px;">人數</th>
								<th style="width: 100px; text-align: center;">姓名</th>
								<th style="width: 120px; text-align: center;">電話</th>
								<th style="width: auto; text-align: center;">備註</th>
								<th style="width: 120px; text-align: center;">預定狀態</th>
								<th style="width: 120px; text-align: center;">刪除</th>
							</tr>
						</thead>
						<tbody>
							<% List<Reserve> reservations = (ArrayList<Reserve>) request.getAttribute("reservations");
									int index = 1;
									for (Reserve reservation : reservations) {
									%>
									<tr>
										<td style="text-align: center;">
											<%=index++%>
										</td>
										<td>
											<input type="date" value="<%=reservation.getReservationDate()%>"
												id="dateInput<%= reservation.getReservationId() %>"
												onchange="updateDate('<%= reservation.getReservationId() %>')">
										</td>
										<td>
											<input type="time" id="timeInput<%= reservation.getReservationId() %>"
												value="<%=reservation.getReservationTime()%>"
												onchange="updateTime('<%= reservation.getReservationId() %>')">
										</td>
										<td>
											<input type="number" id="peopleInput<%=reservation.getReservationId()%>"
												value="<%=reservation.getNumberOfPeople()%>"
												onchange="updatePeople('<%= reservation.getReservationId() %>')"
												style="width: 40px; text-align: center;" max="20" ,min="1">
										</td>
										<td style="width: 100px; text-align: center;">
											<%=reservation.getReservationName()%>
										</td>
										<td style="width: 120px; text-align: center;">
											<%=reservation.getPhone()%>
										</td>
										<td style="width: auto; text-align: center;">
											<%=reservation.getNote()%>
										</td>
										<td style="width: 120px; text-align: center;">
											<select id="rsInput<%= reservation.getReservationId() %>"
												data-initial-value="<%= reservation.getReservationId() %>"
												onchange="updateRSto3('<%= reservation.getReservationId() %>')">
												<option value="1" <% if (reservation.getReservationStatus()==1) { %>
													selected <% } %>>未確認</option>
												<option value="2" <% if (reservation.getReservationStatus()==2) { %>
													selected <% } %>>不會來</option>
												<option value="3" <% if (reservation.getReservationStatus()==3) { %>
													selected <% } %>>會來</option>
												<option value="0" <% if (reservation.getReservationStatus() !=1 &&
													reservation.getReservationStatus() !=2 &&
													reservation.getReservationStatus() !=3) { %> selected <% } %>>其他狀態
												</option>
											</select>
										</td>
										<td style="width: 120px; text-align: center;"><button type="button"
												onclick="deleteReservation('<%= reservation.getReservationId() %>')">刪除</button>
										</td>
									</tr>
									<% } %>
						</tbody>
					</table>

				</header>
				<!--  Header End -->
			</div>

			<div class="row">
				<div class="col-lg-12 d-flex align-items-stretch">
					<div class="card w-100">
						<div class="card-body p-4">
							<h5 class="card-title fw-semibold mb-4">所有會員</h5>
							<div class="table-responsive">

								123132
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="py-6 px-6 text-center">

		</div>
		</div>
		</div>
		</div>
		</div>
		<script src="/back/libs/jquery/dist/jquery.min.js"></script>
		<script src="/back/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/back/js/sidebarmenu.js"></script>
		<script src="/back/js/app.min.js"></script>
		<script src="/back/libs/apexcharts/dist/apexcharts.min.js"></script>
		<script src="/back/libs/simplebar/dist/simplebar.js"></script>
		<script src="/back/js/dashboard.js"></script>
		<script src="/back/js/member/EmpMemberGetAll.js"></script>


		<script>
			function updatePeople(reservationId) {
				var peopleSelect = document.getElementById('peopleInput' + reservationId);
				var newNumberOfPeople = peopleSelect.value;

				if (newNumberOfPeople !== null && newNumberOfPeople !== '') {
					if (newNumberOfPeople < 20 && newNumberOfPeople > 1) {
						updateNumberOfPeople(reservationId, newNumberOfPeople);
					} else {
						alert("請輸入有效的人數")
						location.reload();
					}
				} else {
					alert("請輸入有效的人數");
				}
			}

			function updateTime(reservationId) {
				var timeSelect = document.getElementById('timeInput' + reservationId);
				var newTime = timeSelect.value;

				if (newTime !== null && newTime !== '') {
					if (confirm("確定要更改時間嗎？")) {
						updateReservationTime(reservationId, newTime);
					}
					else {
						location.reload();
					}
				} else {
					alert("請選擇有效的時間");
				}
			}

			function updateDate(reservationId) {
				var dateSelect = document.getElementById('dateInput' + reservationId);
				var newDate = dateSelect.value;

				if (newDate !== null && newDate !== '') {
					if (confirm("確定要更改日期嗎？")) {
						updateReservationDate(reservationId, newDate);
					} else {
						location.reload();
					}
				} else {
					alert("請輸入有效的日期");
				}
			}

			function updateRSto3(reservationId) {
				var rsSelect = document.getElementById('rsInput' + reservationId);
				var rs = rsSelect.value;
				updateReservationStatusTo3(reservationId, rs)
			}

			function updateNumberOfPeople(reservationId, newNumberOfPeople) {
				fetch('/reservation/updateNumberOfPeople', {
					method: 'PUT',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: new URLSearchParams/*可以透過參數名稱抓到從上面的HTML中帶來的參數*/({
						action: 'updateNumberOfPeople',
						reservationId: reservationId,
						newNumberOfPeople: newNumberOfPeople
					})
				})
					.then(response => {
						if (response.ok) {
							console.log("成功更改人數");
						} else {
							return response.text().then(text => { throw new Error(text) });
						}
					})
					.catch(error => {
						alert("更新失敗！\n" + error.message);
					});
			}

			function updateReservationDate(reservationId, newDate) {
				fetch('/reservation/updateReservationDate', {
					method: 'PUT',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: new URLSearchParams({
						action: 'updateReservationDate',
						reservationId: reservationId,
						newDate: newDate
					})
				})
					.then(response => {
						if (response.ok) {
							location.reload();
						} else {
							console.log("日期更新失敗");
							return;
						}
					})
			}

			function updateReservationTime(reservationId, newTime) {
				fetch('/reservation/updateReservationTime', {
					method: 'PUT',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: new URLSearchParams({
						action: 'updateReservationTime',
						reservationId: reservationId,
						newTime: newTime
					})
				})
					.then(response => {
						if (response.ok) {
							location.reload();
						} else {
							console.log("時間更新失敗");
							return;
						}
					})
			}

			function deleteReservation(reservationId) {
				fetch('/reservation/deleteReservation', {
					method: 'DELETE',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: new URLSearchParams({
						action: 'deleteReservation',
						reservationId: reservationId,
					})
				})
					.then(response => {
						if (response.ok) {
							location.reload();
						} else {
							console.log("刪除失敗");
							return;
						}
					})
			}

			function updateReservationStatusTo3(reservationId, reservationStatus) {
				// 構建查詢字符串
				let params = new URLSearchParams({
					action: 'autoUpdateReservationStatus',
					reservationStatus: reservationStatus,
					reservationId: reservationId
				});

				// 將查詢字符串附加到 URL 中(因為GET不需要body)
				fetch('/reservation/autoUpdateReservationStatus?' + params.toString(), {
					method: 'GET',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					}
				})
					.then(response => {
						if (response.ok) {
							location.reload();
						} else {
							console.log("狀態更新失敗");
							return;
						}
					})
					.catch(error => {
						console.error("請求錯誤: " + error.message);
					});
			}

			//舊版
			/*
			function updateNumberOfPeople(reservationId, newNumberOfPeople) {
				var xhr = new XMLHttpRequest();
				xhr.open('PUT', '/reservation/updateNumberOfPeople', true);
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhr.onreadystatechange = function () {
					if (xhr.readyState === 4 && xhr.status === 200) {

					} else if (xhr.readyState === 4 && xhr.status !== 200) {
						alert("更新失敗！")
					}
				};
				xhr.send('action=updateNumberOfPeople&reservationId=' + encodeURIComponent(reservationId) + '&newNumberOfPeople=' + encodeURIComponent(newNumberOfPeople));
			}
			
			function updateReservationDate(reservationId, newDate) {
				var xhr = new XMLHttpRequest();
				xhr.open('PUT', '/reservation/updateReservationDate', true);
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhr.send('action=updateReservationDate&reservationId=' + encodeURIComponent(reservationId) + '&newDate=' + encodeURIComponent(newDate));
				location.reload();
			}

			function updateReservationTime(reservationId, newTime) {
				var xhr = new XMLHttpRequest();
				xhr.open('PUT', '/reservation/updateReservationTime', true);
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhr.send('action=updateReservationTime&reservationId=' + encodeURIComponent(reservationId) + '&newTime=' + encodeURIComponent(newTime));
				location.reload();
			}

			 function deleteReservation(reservationId) {
				if (confirm("確定要刪除此訂位資訊嗎？")) {
					var xhr = new XMLHttpRequest();
					xhr.open('DELETE', '/reservation/deleteReservation', true);
					xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.send('action=deleteReservation&reservationId=' + encodeURIComponent(reservationId));
					location.reload();
				}
			}

			function updateReservationStatusTo3(reservationId, reservationStatus) {
				if (confirm("確定要修改客人預訂狀態嗎？")) {
					var xhr = new XMLHttpRequest();
					xhr.open('GET', '/reservation/autoUpdateReservationStatus?reservationStatus=' + encodeURIComponent(reservationStatus) + '&reservationId=' + encodeURIComponent(reservationId), true);
					xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.send();
					location.reload();
				}
			}
			*/
		</script>
	</body>

	</html>