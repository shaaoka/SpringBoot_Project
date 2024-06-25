<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>後台系統</title>
    <link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />
    <link rel="stylesheet" href="/back/css/styles.min.css" />

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
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
            <a href="#" class="text-nowrap logo-img">
              <img src="/images/indexImages/DonerPizzaSmall.png" width="180" alt="" />
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
              <li class="sidebar-item"><a class="sidebar-link" href="/product/Product_Test_Main" aria-expanded="false">
                  <span>
                    <i class="ti ti-article"></i>
                  </span> <span class="hide-menu">產品管理功能</span>
                </a></li>
              <li class="nav-small-cap"><i class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
                  class="hide-menu">其他功能列表</span></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/emp/Member.SelectAll/1" aria-expanded="false">
                  <span>
                    <i class="ti ti-layout-dashboard"></i>
                  </span> <span class="hide-menu">會員管理功能</span>
                </a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/order/order.action" aria-expanded="false"> <span>
                    <i class="ti ti-alert-circle"></i>
                  </span> <span class="hide-menu">訂單管理功能</span>
                </a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/reservation/reservemain.controller"
                  aria-expanded="false"> <span> <i class="ti ti-cards"></i>
                  </span> <span class="hide-menu">訂位管理功能</span>
                </a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/delivery/home" aria-expanded="false"> <span> <i
                      class="ti ti-file-description"></i>
                  </span> <span class="hide-menu">外送管理功能</span>
                </a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/promotions/promotionsMain" aria-expanded="false">
                  <span>
                    <i class="ti ti-typography"></i>
                  </span> <span class="hide-menu">活動管理功能</span>
                </a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="/emp/EmpGoBackToEmpIndex" aria-expanded="false">
                  <span>
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
              <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                  <i class="ti ti-menu-2"></i>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                  <i class="ti ti-bell-ringing"></i>
                  <div class="notification bg-primary rounded-circle"></div>
                </a>
              </li>
            </ul>
            <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
              <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                <li class="nav-item dropdown">
                  <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <img src="/member/user.png" alt="" width="35" height="35"
                      class="rounded-circle">${emp.detailBean.empName}
                  </a>
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                    <div class="message-body">
                      <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-user fs-6"></i>
                        <p class="mb-0 fs-3">My Profile</p>
                      </a>
                      <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-mail fs-6"></i>
                        <p class="mb-0 fs-3">My Account</p>
                      </a>
                      <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-list-check fs-6"></i>
                        <p class="mb-0 fs-3">My Task</p>
                      </a>
                      <a href="/emp/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
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
<!--           <div class="row"> -->
<!--             <div class="col-lg-8 d-flex align-items-strech"> -->
<!--               <div class="card w-100"> -->
<!--                 <div class="card-body"> -->
<!--                   <div class="d-sm-flex d-block align-items-center justify-content-between mb-9"> -->
<!--                     <div class="mb-3 mb-sm-0"> -->
<!--                       <h5 class="card-title fw-semibold">銷售概況</h5> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                       <select class="form-select"> -->
<!--                         <option value="1">March 2023</option> -->
<!--                         <option value="2">April 2023</option> -->
<!--                         <option value="3">May 2023</option> -->
<!--                         <option value="4">June 2023</option> -->
<!--                       </select> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div id="chart"></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4"> -->
<!--               <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                   Yearly Breakup -->
<!--                   <div class="card overflow-hidden"> -->
<!--                     <div class="card-body p-4"> -->
<!--                       <h5 class="card-title mb-9 fw-semibold">年度總額</h5> -->
<!--                       <div class="row align-items-center"> -->
<!--                         <div class="col-8"> -->
<!--                           <h4 class="fw-semibold mb-3">$1,786,358</h4> -->
<!--                           <div class="d-flex align-items-center mb-3"> -->
<!--                             <span -->
<!--                               class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center"> -->
<!--                               <i class="ti ti-arrow-up-left text-success"></i> -->
<!--                             </span> -->
<!--                             <p class="text-dark me-1 fs-3 mb-0">+13%</p> -->
<!--                             <p class="fs-3 mb-0">last year</p> -->
<!--                           </div> -->
<!--                           <div class="d-flex align-items-center"> -->
<!--                             <div class="me-4"> -->
<!--                               <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span> -->
<!--                               <span class="fs-2">2023</span> -->
<!--                             </div> -->
<!--                             <div> -->
<!--                               <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span> -->
<!--                               <span class="fs-2">2022</span> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="col-4"> -->
<!--                           <div class="d-flex justify-content-center"> -->
<!--                             <div id="breakup"></div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-12"> -->
<!--                   Monthly Earnings -->
<!--                   <div class="card"> -->
<!--                     <div class="card-body"> -->
<!--                       <div class="row alig n-items-start"> -->
<!--                         <div class="col-8"> -->
<!--                           <h5 class="card-title mb-9 fw-semibold"> 當月營收 </h5> -->
<!--                           <h4 class="fw-semibold mb-3">$126,820</h4> -->
<!--                           <div class="d-flex align-items-center pb-1"> -->
<!--                             <span -->
<!--                               class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center"> -->
<!--                               <i class="ti ti-arrow-down-right text-danger"></i> -->
<!--                             </span> -->
<!--                             <p class="text-dark me-1 fs-3 mb-0">-7%</p> -->
<!--                             <p class="fs-3 mb-0">last month</p> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="col-4"> -->
<!--                           <div class="d-flex justify-content-end"> -->
<!--                             <div -->
<!--                               class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center"> -->
<!--                               <i class="ti ti-currency-dollar fs-6"></i> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div id="earning"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<div class="row">
						<div class="col-lg-8 d-flex align-items-strech">
							<div class="card w-100">
								<div class="card-body">
									<div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
										<div class="mb-3 mb-sm-0">
											<h5 class="card-title fw-semibold">銷售數量</h5>
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
													<h4 class="fw-semibold mb-3">$26,358</h4>
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
													<h4 class="fw-semibold mb-3">$488,820</h4>
													<div class="d-flex align-items-center pb-1">
														<span
															class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
															<i class="ti ti-arrow-down-right text-danger"></i>
														</span>
														<p class="text-dark me-1 fs-3 mb-0">-13%</p>
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
          <!-- DataTable -->
          <div class="row">
            <div class="col-lg-12 d-flex align-items-stretch">
              <div class="card w-100">
                <div class="card-body p-4">
                  <h5 class="card-title fw-semibold mb-4 me-5" style="display : inline-block">所有產品資料</h5>
                  <button type="button" class="btn btn-secondary btn-sm editBtn fs-3 me-3" data-bs-toggle="modal"
                    data-bs-target="#productModal">新增產品</button><!-- modal紐 -->
                  <button type="button" class="btn btn-success btn-sm editBtn fs-3 ms-3"
                    onclick="saveProductsToCSV()">匯出 CSV</button>
                  <div class="table-responsive">
                    <table id="example" class="table table-striped" style="width:100%">
                      <thead>
                        <tr>
                          <th>編號</th>
                          <th>類別</th>
                          <th>名稱</th>
                          <th>介紹</th>
                          <th>圖片</th>
                          <th>價格</th>
                          <th>數量</th>
                          <th>狀態</th>
                          <th>上架時間</th>
                          <th>修改狀態</th>
                          <th>功能區</th>
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
          <!-- DataTable -->
          <!-- modal  -->
          <div class="modal fade" id="productModal" data-bs-backdrop="static" tabindex="-1"
            aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title mt-3" id="productModalLabel"><b>新增產品資料</b>
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form id="editForm">
                    <div class="mb-3">
                      <label for="createcategoryId" class="form-label">產品類別:</label>
                      <select id="createcategoryId" name="categoryId" class="form-select">
                        <option value="1">披薩</option>
                        <option value="2">焗烤</option>
                        <option value="3">炸物</option>
                        <option value="4">甜點</option>
                        <option value="5">飲料</option>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label for="createproductName" class="form-label">產品名稱:</label> <input type="text"
                        id="createproductName" name="productName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                      <label for="createproductDesc" class="form-label">產品介紹:</label> <input type="text"
                        id="createproductDesc" name="productDesc" class="form-control" required>
                    </div>
                    <div class="mb-3">
                      <label for="modal-productImg_url" class="form-label">圖片:</label> <input type="file"
                        id="modal-productImg_url" name="productImg_url" class="form-control"
                        onchange="previewFile('modal')">
                    </div>
                    <div class="mb-3">
                      <img src="" id="modal-previewImage" alt="圖片預覽" style="width: 12vw; height: 12vw;">
                    </div>
                    <div class=" mb-3">
                      <label for="createproductPrice" class="form-label">產品價格:</label> <input type="text"
                        id="createproductPrice" name="productPrice" class="form-control" required>
                    </div>
                    <div class=" mb-3">
                      <label for="createproductQuantity" class="form-label">產品數量:</label> <input type="text"
                        id="createproductQuantity" name="productQuantity" class="form-control" required>
                    </div>
                    <div class="modal-footer mb-3 d-flex justify-content-between">
                      <button type="button" class="btn btn-dark-light " data-bs-dismiss="modal">取消</button>
                      <button type="button" class="btn btn-primary" id="saveCreateBtn" data-bs-dismiss="modal"
                        aria-label="Close" onclick="productDoCreate()">確認新增</button>
                    </div>
                  </form>
                </div>

              </div>
            </div>
          </div>
          <!-- modal -->

          <!-- Offcanvas -->
          <div class="offcanvas offcanvas-end" data-bs-backdrop="static" tabindex="-1" id="offcanvasRight"
            aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
              <h5 class="offcanvas-title mt-3" id="offcanvasRightLabel"><b>修改產品資料</b></h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
              <!-- 放東西 -->

              <form id="editForm">
                <div class="mb-3">
                  <label for="productId" class="form-label">產品編號:</label> <input type="text" id="productId"
                    name="productId" class="form-control" readonly>
                </div>
                <div class="mb-3">
                  <label for="categoryId" class="form-label">產品類別:</label>
                  <select id="categoryId" name="categoryId" class="form-select">
                    <option value="1">披薩</option>
                    <option value="2">焗烤</option>
                    <option value="3">炸物</option>
                    <option value="4">甜點</option>
                    <option value="5">飲料</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="productName" class="form-label">產品名稱:</label> <input type="text" id="productName"
                    name="productName" class="form-control" required>
                </div>
                <div class="mb-3">
                  <label for="productDesc" class="form-label">產品介紹:</label> <input type="text" id="productDesc"
                    name="productDesc" class="form-control" required>
                </div>
                <div class="mb-3">
                  <label for="offcanvas-productImg_url" class="form-label">圖片:</label> <input type="file"
                    id="offcanvas-productImg_url" name="productImg_url" class="form-control"
                    onchange="previewFile('offcanvas')">
                </div>
                <div class="mb-3">
                  <img src="" id="offcanvas-previewImage" alt="圖片預覽" style="width: 12vw; height: 12vw;">
                </div>
                <div class=" mb-3">
                  <label for="productPrice" class="form-label">產品價格:</label> <input type="text" id="productPrice"
                    name="productPrice" class="form-control" required>
                </div>
                <div class=" mb-3">
                  <label for="productQuantity" class="form-label">產品數量:</label> <input type="text" id="productQuantity"
                    name="productQuantity" class="form-control" required>
                </div>
                <div class="mb-3">
                  <label for="productStateId" class="form-label">產品狀態:</label>
                  <select id="productStateId" name="productStateId" class="form-select">
                    <option value="">修改狀態</option>
                    <option value="1">上架中</option>
                    <option value="0">已下架</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="productCreateDate" class="form-label">上架時間:</label> <input type="text"
                    id="productCreateDate" name="productCreateDate" class="form-control" readonly>
                </div>


                <div class="offcanvas-footer mb-3 d-flex justify-content-between">
                  <button type="button" class="btn btn-dark-light " data-bs-dismiss="offcanvas">取消</button>
                  <button type="button" class="btn btn-primary" id="saveChangesBtn" data-bs-dismiss="offcanvas"
                    aria-label="Close" onclick="productDoUpdate()">確認更新</button>
                </div>
              </form>
              <!-- 放東西 -->

            </div>
          </div>
          <!-- Offcanvas -->

          <script src="/back/libs/jquery/dist/jquery.min.js"></script>
          <script src="/back/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
          <script src="/back/js/sidebarmenu.js"></script>
          <script src="/back/js/app.min.js"></script>
          <script src="/back/libs/apexcharts/dist/apexcharts.min.js"></script>
          <script src="/back/libs/simplebar/dist/simplebar.js"></script>
          <script src="/back/js/dashboard.js"></script>
          <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

          <!-- dataTable -->
          <script src="/back/js/product/productDataTable.js"></script>
          <!-- 圖片預覽 -->
          <script src="/back/js/product/productPreviewImage.js"></script>
          <!-- offcanvas -->
          <script src="/back/js/product/productOffcanvas.js"></script>
          <!-- modal -->
          <script src="/back/js/product/productModal.js"></script>

          <script>

            function saveProductsToCSV() {
              $.ajax({
                url: "saveProductsToCSV",
                method: 'GET',
                success: function (response) {
                  alert('匯出成功');
                },
                error: function (xhr, status, error) {
                  console.log(error);
                }

              });
            }

          </script>
	<script>
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