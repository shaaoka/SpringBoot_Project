<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<title>Döner Pizza - 會員資料</title>
			<meta content="width=device-width, initial-scale=1.0" name="viewport">
			<meta content="" name="keywords">
			<meta content="" name="description">
			<link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />

			<!-- Favicon -->
			<link href="/front/img/favicon.ico" rel="icon">

			<!-- Google Web Fonts -->
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link
				href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Playfair+Display:wght@700;900&display=swap"
				rel="stylesheet">

			<!-- Icon Font Stylesheet -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

			<!-- Libraries Stylesheet -->
			<link href="/front/lib/animate/animate.min.css" rel="stylesheet">
			<link href="/front/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

			<!-- Customized Bootstrap Stylesheet -->
			<link href="/front/css/bootstrap.min.css" rel="stylesheet">

			<!-- Template Stylesheet -->
			<link href="/front/css/style.css" rel="stylesheet">

			<!-- historyorder css -->
			<link href="/front/css/order/historyOrder.css" rel="stylesheet">
			<!-- Datatable -->
			<link href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" rel="stylesheet">
		</head>

		<body>
			<!-- Spinner Start -->
			<div id="spinner"
				class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
				<div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
			</div>
			<!-- Spinner End -->


			<!-- Navbar Start -->
			<div class="container-fluid bg-white sticky-top">
				<div class="container">
					<nav class="navbar navbar-expand-lg bg-white navbar-light py-2 py-lg-0">
						<a href="/member/MemberIndex" class="navbar-brand"> <img class="img-fluid"
								src="/images/indexImages/DonerPizzaLogo.png" alt="Logo">
						</a>
						<button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
							data-bs-target="#navbarCollapse">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarCollapse">
							<div class="navbar-nav ms-auto">
								<a href="/product/product.front" class="nav-item nav-link active">產品</a>
								<a href="/promotions/promotionsFront" class="nav-item nav-link">活動優惠</a>
								<a href="/reservation/customerreservemain.controller" class="nav-item nav-link">訂位趣</a>
								<a href="/delivery" class="nav-item nav-link">線上點餐</a>
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">關於</a>
									<div class="dropdown-menu bg-light rounded-0 m-0">
										<a href="#" class="dropdown-item">特色</a> <a href="#"
											class="dropdown-item">部落格</a> <a href="#" class="dropdown-item">公司簡介</a>
										<a href="#" class="dropdown-item">分店資訊</a>
									</div>
								</div>
							</div>
						</div>
						<div class="border-start ps-4 d-none d-lg-block nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#"> <img src="${member.detailBean.mPhoto}" alt=""
									width="35" height="35" class="rounded-circle">${member.detailBean.mName}
							</a>
							<div class="dropdown-menu bg-light rounded-0 m-0">
								<a href="/member/MemberAboutMe" class="dropdown-item"> <i class="ti ti-user fs-6"></i>
									<p class="mb-0 dropdown-item ">會員中心</p>
								</a> <a href="#" class="dropdown-item"> <i class="ti ti-mail fs-6"></i>
									<p class="mb-0 dropdown-item">訂單查詢</p>
								</a> <a href="#" class="dropdown-item"> <i class="ti ti-list-check fs-6"></i>
									<p class="mb-0 dropdown-item">優惠券</p>
								</a>
								<hr>
								<a href="/member/logout"
									class="btn btn-outline-primary d-block dropdown-item px-4">登出</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<!-- Navbar End -->


			<!-- Page Header Start -->
			<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
				<div class="container text-center py-5">
					<h1 class="display-2 text-dark mb-4 animated slideInDown">會員中心</h1>
					<nav aria-label="breadcrumb animated slideInDown">
						<ol class="breadcrumb justify-content-center mb-0">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item"><a href="#">會員</a></li>
							<li class="breadcrumb-item text-dark" aria-current="page">會員中心</li>
						</ol>
					</nav>
				</div>
			</div>
			<!-- Page Header End -->


			<!-- Article Start -->
			<div class="container-xxl py-5 justify-content-center">
				<div class="container justify-content-center">
					<div class="row">
						<div class="col-lg-4 d-flex align-items-stretch h-100">
							<div class="card w-100">
								<div class="card-body p-4">
									<h4 class="card-title fw-semibold mb-4">會員中心</h4>
									<ul class="nav flex-column" role="tablist">
										<li class="nav-item" role="presentation">
											<button class="nav-link active btn" id="aboutmeTab" data-bs-toggle="tab"
												data-bs-target="#aboutme" type="button" role="tab"
												aria-controls="aboutme" aria-selected="true">
												個人資訊</button>
										</li>

										<li class="nav-item" role="presentation">
											<button class="nav-link btn" id="updatepwdTab" data-bs-toggle="tab"
												data-bs-target="#updatepwd" type="button" role="tab"
												aria-controls="updatepwd" aria-selected="false"
												onclick="closeAbout()">修改密碼</button>

										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link btn" id="OrderTab" data-bs-toggle="tab"
												data-bs-target="#Order" type="button" role="tab" aria-controls="Order"
												aria-selected="false" onclick="closeAbout()">歷史訂單</button>
										</li>
										<li class="nav-item">
											<button class="nav-link btn" id="MyRTab" data-bs-toggle="tab"
												data-bs-target="#MyR" type="button" role="tab" aria-controls="MyR"
												aria-selected="false"
												onclick="closeAbout(),historyReservation()">我的訂位</button>
										</li>
										<li class="nav-item">
											<button class="nav-link btn" id="updatemeTab" data-bs-toggle="tab"
												data-bs-target="#updateme" type="button" role="tab"
												aria-controls="updateme" aria-selected="false"
												onclick="closeAbout()">我的優惠券</button>

										</li>
									</ul>

								</div>
							</div>
						</div>
						<div class="col-lg-8 d-flex align-items-stretch">
							<div class="card w-100">
								<div class="card-body p-5">
									<div class="row tab-content" id="changeIndex">
										<div class="col-50 fade tab-pane show active" id="aboutme" role="tabpanel"
											aria-labelledby="aboutmeTab" tabindex="0">
											<h3 class="card-title fw-semibold mb-4">個人資訊</h3>
											<div class="table-responsive">
												<table class="table text-nowrap mb-0 align-middle">
													<tr>
														<td><label for="mPhoto"><i class="fa fa-user"></i>
																會員頭貼</label></td>
														<td id="showPhoto"><img src="${member.detailBean.mPhoto}" alt=""
																width="35" height="35" class="rounded-circle"></td>
													</tr>
													<tr>
														<td><label for="mName"><i class="fa fa-user"></i>
																會員名稱</label></td>
														<td><input class="form-control" type="text" id="mName"
																name="mName" value="${member.detailBean.mName}"
																readonly></td>
													</tr>
													<tr>
														<td><label for="mEmail"><i
																	class="fa fa-envelope"></i>電子信箱</label></td>
														<td><input class="form-control" type="text" id="mEmail"
																name="mEmail" required
																value="${member.detailBean.mEmail}" readonly></td>
													</tr>
													<tr>
														<td><label for="mPhone"><i class="fa fa-address-card-o"></i>
																行動電話</label></td>
														<td><input class="form-control" type="text" id="mPhone"
																name="mPhone" pattern="[0]{1}[9]{1}\d{8}" maxlength="10"
																value="${member.detailBean.mPhone}" readonly></td>
													</tr>
													<tr>
														<td><label for="mbirthday"><i class="fa fa-institution"></i>
																生日</label></td>
														<td><input class="form-control" type="date" id="mbirthday"
																name="mbirthday" value="${member.detailBean.mbirthday}"
																readonly></td>
													</tr>
												</table>
												<br>
												<table class="table text-nowrap mb-0 align-middle">
													<tbody>
														<tr>
															<td class="border-bottom-0 text-center">
																<button class="btn btn-danger"
																	onclick="updateIndex()">修改資料</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="col-50" id="updateme" style="display: none;">
											<h3 class="card-title fw-semibold mb-4">修改個人資訊</h3>
											<p class="text-center">請填寫下列資訊</p>
											<form method="post" action="Member.UpdateDetail"></form>
											<div class="table-responsive">
												<table class="table text-nowrap mb-0 align-middle">
													<tr>
														<td><img id="changePhoto" src="${member.detailBean.mPhoto}"
																alt="" width="35" height="35" class="rounded-circle">
														</td>
														<td><input class="form-control" type="file" id="UpmPhoto"
																name="mPhoto" onchange="previewUserFile()">
														</td>
													</tr>
													<tr>
														<td>會員帳號</td>
														<td><input class="form-control" type="text" id="Upaccount"
																name="account" value="${member.mAccount}" readonly></td>
													</tr>
													<tr>
														<td><label for="mName"><i class="fa fa-user"></i>
																會員名稱</label></td>
														<td><input class="form-control" type="text" id="UpmName"
																name="mName" placeholder="John M. Doe"
																value="${member.detailBean.mName}"></td>
													</tr>
													<tr>
														<td><label for="mEmail"><i
																	class="fa fa-envelope"></i>電子信箱</label></td>
														<td><input class="form-control" type="text" id="UpmEmail"
																name="mEmail" placeholder="john@example.com" required
																value="${member.detailBean.mEmail}"></td>
													</tr>
													<tr>
														<td><label for="mPhone"><i class="fa fa-address-card-o"></i>
																行動電話</label></td>
														<td><input class="form-control" type="text" id="UpmPhone"
																name="mPhone" placeholder="0987654321"
																pattern="[0]{1}[9]{1}\d{8}" maxlength="10"
																value="${member.detailBean.mPhone}"></td>
													</tr>
													<tr>
														<td><label for="mbirthday"><i class="fa fa-institution"></i>
																生日</label></td>
														<td><input class="form-control" type="date" id="Upmbirthday"
																name="mbirthday" value="${member.detailBean.mbirthday}">
															<span onclick="oneDetailClick()"
																style="color: rgb(204, 63, 63);">點我輸入</span>
														</td>
													</tr>

												</table>
												<br>
												<table class="table text-nowrap mb-0 align-middle">
													<tbody>
														<tr>
															<td class="border-bottom-0 text-center"><button
																	class="btn btn-danger" type="reset"
																	onclick="off()">取消</button>
																<span> </span>
																<button class="btn btn-primary"
																	onclick="updateMe(`'${member.mAccount}'`)">確定</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<script>
											function oneDetailClick() {
												$('#UpmName').val('cathycat');
												$('#UpmPhone').val('0919592671');
												$('#Upmbirthday').val('2001-05-21');
											}

											function onePwdClick() {
												$('#beforePwd').val('123456');
												$('#afterPwd').val('000000');
												$('#againPwd').val('000000');
											}

											function checkpwd() {
												var x = document.getElementById("beforePwd");
												var y = document.getElementById("afterPwd");
												var z = document.getElementById("againPwd");
												if (x.type === "password" || y.type === "password" || z.type === "password") {
													x.type = "text";
													y.type = "text";
													z.type = "text";
												} else {
													x.type = "password";
													y.type = "password";
													z.type = "password";
												}
											}
										</script>
										<div class="col-50 fade tab-pane" id="updatepwd" role="tabpanel"
											aria-labelledby="updatepwdTab" tabindex="0">
											<h3 class="card-title fw-semibold mb-4">修改密碼</h3>
											<form method="post" action="Member.UpdatePwd"></form>
											<div class="table-responsive">
												<table class="table text-nowrap mb-0 align-middle">
													<tr>
														<td><label for="beforePwd"><i class="fa fa-user"></i>
																舊的密碼</label></td>
														<td><input type="password" class="form-control" id="beforePwd"
																aria-describedby="emailHelp" name="beforePwd" required>
														</td>
													</tr>
													<tr>
														<td><label for="afterPwd"><i class="fa fa-user"></i>
																新的密碼</label></td>
														<td><input type="password" class="form-control" id="afterPwd"
																aria-describedby="emailHelp" name="afterPwd" required>
														</td>
													</tr>
													<tr>
														<td><label for="againPwd"><i class="fa fa-user"></i>
																再次輸入新的密碼</label></td>
														<td><input type="password" class="form-control" id="againPwd"
																aria-describedby="emailHelp" name="againPwd" required>
															<div id="err" style="color: red;"></div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="form-check">
																<input class="form-check-input primary" type="checkbox"
																	onclick="checkpwd()" id="checkpwdbox"> <label
																	class="form-check-label text-dark"
																	for="checkpwdbox">
																	顯示密碼 </label>
															</div>
														</td>
														<td>
															<span onclick="onePwdClick()"
																style="color: rgb(204, 63, 63);">點我輸入</span>
														</td>
													</tr>
												</table>
												<br>
												<table class="table text-nowrap mb-0 align-middle">
													<tbody>
														<tr>
															<td class="border-bottom-0 text-center">
																<button class="btn btn-primary"
																	onclick="updatePwd()">確定</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="col-50 fade tab-pane" id="Order" role="tabpanel"
											aria-labelledby="OrderTab" tabindex="0">
											<h3 class="card-title fw-semibold mb-4">訂單查詢</h3>
											<form method="post" action=""></form>
											<div id="orderTableContainer" class="table-responsive">
												<table class="table text-nowrap mb-0 align-middle" id="OrderTable">
													<thead>
														<tr>
															<th>訂單編號</th>
															<th>訂購時間</th>
															<th>付款金額</th>
															<th>付款方式</th>
															<th>取餐方式</th>
															<th>訂單狀態</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
														<!-- Data will be appended here by JavaScript -->
													</tbody>
													<tfoot>
														<tr>
															<th>訂單編號</th>
															<th>訂購時間</th>
															<th>付款金額</th>
															<th>付款方式</th>
															<th>取餐方式</th>
															<th>訂單狀態</th>
														</tr>
													</tfoot>
												</table>
												<br>
											</div>

											<div id="orderDetailsContainer" class="card w-100 hidden">
												<div class="card-body p-5">
													<div class="row tab-content" id="changeIndex">
														<h2>訂單明細</h2>
														<hr>
														<button id="backToOrdersBtn"
															class="btn btn-primary col-2">回到上頁</button>
														<table id="orderDetailsTable"
															class="table table-striped table-bordered"
															style="width: 100%">
															<thead class="thead-dark">
																<tr>
																	<th>商品名稱</th>
																	<th>數量</th>
																	<th>單價</th>
																</tr>
															</thead>
															<tbody>
																<!-- Details data will be appended here by JavaScript -->
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>



										<div class="col-50 fade tab-pane" id="MyR" role="tabpanel"
											aria-labelledby="MyRTab" tabindex="0">
											<h3 class="card-title fw-semibold mb-4">歷史訂位紀錄</h3>
											<div class="table-responsive">
												<table class="table text-nowrap mb-0 align-middle" id="MyRTable">
													<thead>
														<tr>
															<th>編號</th>
															<th>預約名稱</th>
															<th>電話</th>
															<th>人數</th>
															<th>預約日期</th>
															<th>預約時間</th>
															<th>狀態</th>
															<th>備註</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- Article End -->


			<!-- Footer Start -->
			<div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
				<div class="container py-5">
					<div class="row g-5">
						<div class="col-lg-3 col-md-6">
							<h4 class="text-primary mb-4">聯絡資訊</h4>
							<p class="mb-2">
								<i class="fa fa-map-marker-alt text-primary me-3"></i>320桃園市中壢區大仁街51號1F
							</p>
							<p class="mb-2">
								<i class="fa fa-phone-alt text-primary me-3"></i>0966 464 603
							</p>
							<p class="mb-2">
								<i class="fa fa-envelope text-primary me-3"></i>kebabtaiwan@gmail.com
							</p>
							<div class="d-flex pt-3">
								<a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
										class="fab fa-twitter"></i></a> <a
									class="btn btn-square btn-primary rounded-circle me-2"
									href="https://www.facebook.com/donerzhongli/"><i class="fab fa-facebook-f"></i></a>
								<a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
										class="fab fa-youtube"></i></a> <a
									class="btn btn-square btn-primary rounded-circle me-2" href=""><i
										class="fab fa-linkedin-in"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<h4 class="text-primary mb-4">快速連結</h4>
							<a class="btn btn-link" href="">關於我們</a> <a class="btn btn-link" href="">聯絡我們</a> <a
								class="btn btn-link" href="">我們的服務</a> <a class="btn btn-link" href="">條款與協議</a> <a
								class="btn btn-link" href="">支援</a>
						</div>
						<div class="col-lg-3 col-md-6">
							<h4 class="text-primary mb-4">營業 時間</h4>
							<p class="mb-1">禮拜一 到 禮拜五</p>
							<h6 class="text-light">11:00 am - 9:00 pm</h6>
							<p class="mb-1">禮拜六 禮拜日</p>
							<h6 class="text-light">11:00 am - 9:00 pm</h6>
							<p class="mb-1">禮拜三</p>
							<h6 class="text-light">休息</h6>
						</div>
						<div class="col-lg-3 col-md-6">
							<h4 class="text-primary mb-4">Newsletter</h4>
							<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
							<div class="position-relative w-100">
								<input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
									placeholder="Your email">
								<button type="button"
									class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End -->


			<!-- Copyright Start -->
			<div class="container-fluid copyright py-4">
				<div class="container">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="fw-medium" href="https://www.ispan.com.tw/">資展國際股份有限公司</a>,
							<a class="fw-medium" href="/member/emplogin">Döner Pizza德氏披薩</a>,
							All Right Reserved.
						</div>
						<div class="col-md-6 text-center text-md-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							設計由 <a class="fw-medium" href="https://htmlcodex.com">HTML
								Codex</a> 發行由 <a class="fw-medium" href="https://themewagon.com">ThemeWagon</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Copyright End -->


			<!-- Back to Top -->
			<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
					class="bi bi-arrow-up"></i></a>


			<!-- JavaScript Libraries -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
			<script src="/front/lib/wow/wow.min.js"></script>
			<script src="/front/lib/easing/easing.min.js"></script>
			<script src="/front/lib/waypoints/waypoints.min.js"></script>
			<script src="/front/lib/owlcarousel/owl.carousel.min.js"></script>

			<!-- Datatable -->
			<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>

			<!-- Template Javascript -->
			<script src="/front/js/main.js"></script>
			<script src="/front/js/member/MemberAboutMe.js"></script>
			<script src="/front/js/order/historyOrder.js"></script>

			<script>
				$(document).ready(function () {
					$('#MyRTable').DataTable({
						"info": false,
						"searching": false,
						"paging": false,
					});
				});

				function historyReservation() {
					let table = $('#MyRTable tbody');
					table.empty();
					$
						.ajax({
							type: 'get',
							url: '/reservation/selectHistoryReservationByCustomer',
							contentType: 'application/json',
							success: function (data) {
								if (data == null || data.length === 0) {
									let tr = `<tr><td colspan="8">查無資料</td></tr>`;
									table.append(tr);
								} else {
									$
										.each(
											data,
											function (index, n) {
												var statusText = getStatusText(n.reservationStatus);
												var tr = "<tr><td>"
													+ (index + 1)
													+ "</td><td>"
													+ n.reservationName
													+ "</td><td>"
													+ n.phone
													+ "</td><td>"
													+ n.numberOfPeople
													+ "</td><td>"
													+ n.reservationDate
													+ "</td><td>"
													+ n.reservationTime
													+ "</td><td>"
													+ statusText
													+ "</td><td>"
													+ (n.note ? n.note
														: "")
													+ "</td></tr>";
												table.append(tr);
											});
								}
							},
							error: function (xhr, status, error) {
								if (xhr.status === 401) {
									alert("您已登出");
									event.defaultPrevented;
								} else {
									let tr = `<tr><td colspan="8">發生錯誤，請稍後再試。</td></tr>`;
									table.append(tr);
								}
							}
						});
				}

				function getStatusText(status) {
					switch (status) {
						case 0:
							return "店家未確認";
						case 1:
							return "店家已確認";
						case 2:
							return "您已取消";
						case 3:
							return "您已確認";
						case 4:
							return "現場客";
						default:
							return "未知狀態";
					}
				}
			</script>
		</body>

		</html>