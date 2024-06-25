<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>後台系統</title>
      <link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />
      <link rel="stylesheet" href="/back/css/styles.min.css" />
      <link rel="stylesheet" href="/back/css/member/userPhoto.css" />
      <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
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
                <img src="/images/member/DonerPizzaSmall.png" width="180" alt="" />
              </a>
              <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
              </div>
            </div>
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
              <ul id="sidebarnav">

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
                      <img src="/member/pizzaQ.png" alt="" width="35" height="35"
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
            <div class="row">
              <div class="col-lg-8 d-flex align-items-strech">
                <div class="card w-100">
                  <div class="card-body">
                    <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                      <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">銷售概況</h5>
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
                        <h5 class="card-title mb-9 fw-semibold">年度營業額</h5>
                        <div class="row align-items-center">
                          <div class="col-8">
                            <h4 class="fw-semibold mb-3">$5,265,840</h4>
                            <div class="d-flex align-items-center mb-3">
                              <span
                                class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                                <i class="ti ti-arrow-up-left text-success"></i>
                              </span>
                              <p class="text-dark me-1 fs-3 mb-0">+2.5%</p>
                              <p class="fs-3 mb-0">last year</p>
                            </div>
                            <div class="d-flex align-items-center">
                              <div class="me-4">
                                <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                                <span class="fs-2">2023</span>
                              </div>
                              <div>
                                <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                                <span class="fs-2">2022</span>
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
                            <h5 class="card-title mb-9 fw-semibold"> 當月營業額 </h5>
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
            <div class="row">
              <div class="col-lg-4 d-flex align-items-stretch">
                <div class="card w-100">
                  <div class="card-body p-4">
                    <div class="mb-4">
                      <h5 class="card-title fw-semibold">最近交易</h5>
                    </div>
                    <ul class="timeline-widget mb-0 position-relative mb-n5">
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">09:30am</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">陳小姐交易金額 $1280</div>
                      </li>
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">10:00 am</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-info flex-shrink-0 my-8"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">黃先生交易金額 $56,400 (Line Pay) <a
                            href="javascript:void(0)" class="text-primary d-block fw-normal">編號#L-2960</a>
                        </div>
                      </li>
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">12:00 am</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">李先生交易金額 $39</div>
                      </li>
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">01:30 pm</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-warning flex-shrink-0 my-8"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">黃先生交易金額 $29,640 (Line Pay)  <a
                            href="javascript:void(0)" class="text-primary d-block fw-normal">編號#L-3467</a>
                        </div>
                      </li>
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">03:15 pm</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">高小姐交易金額 $597
                        </div>
                      </li>
                      <li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">05:25 pm</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">舒先生交易金額 $1299</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-lg-8 d-flex align-items-stretch">
                <div class="card w-100">
                  <div class="card-body p-4">
                    <h5 class="card-title fw-semibold mb-4">外送訂單明細</h5>
                    <div class="table-responsive">
                      <!-- table -->
                      <table class="table text-nowrap mb-0 align-middle" id="showmember">
                        <thead class="text-dark fs-4">
                          <tr>
                            <th class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">編號</h6>
                            </th>
                            <th class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">員工姓名</h6>
                            </th>
                            <th class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">外送地址</h6>
                            </th>
                            <th class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">客戶回饋</h6>
                            </th>
                            <th class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">好評數量</h6>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">1</h6>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-1">謝俊逸</h6>
                              <span class="fw-normal">M01</span>
                            </td>
                            <td class="border-bottom-0">
                              <p class="mb-0 fw-normal">桃園市中壢區健行路229號</p>
                            </td>
                            <td class="border-bottom-0">
                              <div class="d-flex align-items-center gap-2">
                                <span class="badge bg-primary rounded-3 fw-semibold">Low</span>
                              </div>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0 fs-4">45</h6>
                            </td>
                          </tr>
                          <tr>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">2</h6>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-1">黃美玲</h6>
                              <span class="fw-normal">M02</span>
                            </td>
                            <td class="border-bottom-0">
                              <p class="mb-0 fw-normal">桃園市中壢區中和路139號</p>
                            </td>
                            <td class="border-bottom-0">
                              <div class="d-flex align-items-center gap-2">
                                <span class="badge bg-secondary rounded-3 fw-semibold">Medium</span>
                              </div>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0 fs-4">37</h6>
                            </td>
                          </tr>
                          <tr>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">3</h6>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-1">蔡政恩</h6>
                              <span class="fw-normal">M03</span>
                            </td>
                            <td class="border-bottom-0">
                              <p class="mb-0 fw-normal">桃園市中壢區中北路200號</p>
                            </td>
                            <td class="border-bottom-0">
                              <div class="d-flex align-items-center gap-2">
                                <span class="badge bg-danger rounded-3 fw-semibold">High</span>
                              </div>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0 fs-4">58</h6>
                            </td>
                          </tr>
                          <tr>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0">4</h6>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-1">林佳蓉</h6>
                              <span class="fw-normal">M04</span>
                            </td>
                            <td class="border-bottom-0">
                              <p class="mb-0 fw-normal">桃園市中壢區中和路139號</p>
                            </td>
                            <td class="border-bottom-0">
                              <div class="d-flex align-items-center gap-2">
                                <span class="badge bg-success rounded-3 fw-semibold">Critical</span>
                              </div>
                            </td>
                            <td class="border-bottom-0">
                              <h6 class="fw-semibold mb-0 fs-4">8</h6>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6 col-xl-3">
                <div class="card overflow-hidden rounded-2">
                  <div class="position-relative">
                    <a href="javascript:void(0)"><img src="/images/indexImages/ppt3.jpg" class="card-img-top rounded-0"
                        alt="..."></a>
                    <a href="javascript:void(0)"
                      class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"
                      data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i
                        class="ti ti-basket fs-4"></i></a>
                  </div>
                  <div class="card-body pt-3 p-4">
                    <h6 class="fw-semibold fs-4">燭光浪漫套餐組</h6>
                    <div class="d-flex align-items-center justify-content-between">
                      <h6 class="fw-semibold fs-4 mb-0">$1520 <span
                          class="ms-2 fw-normal text-muted fs-3"><del>$1699</del></span></h6>
                      <ul class="list-unstyled d-flex align-items-center mb-0">
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star-half text-warning"></i></a></li>
                        
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-xl-3">
                <div class="card overflow-hidden rounded-2">
                  <div class="position-relative">
                    <a href="javascript:void(0)"><img src="/images/indexImages/ppt7.jpg" class="card-img-top rounded-0"
                        alt="..."></a>
                    <a href="javascript:void(0)"
                      class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"
                      data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i
                        class="ti ti-basket fs-4"></i></a>
                  </div>
                  <div class="card-body pt-3 p-4">
                    <h6 class="fw-semibold fs-4">極饗鳳梨披薩</h6>
                    <div class="d-flex align-items-center justify-content-between">
                      <h6 class="fw-semibold fs-4 mb-0">$650 <span
                          class="ms-2 fw-normal text-muted fs-3"><del>$900</del></span></h6>
                      <ul class="list-unstyled d-flex align-items-center mb-0">
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-xl-3">
                <div class="card overflow-hidden rounded-2">
                  <div class="position-relative">
                    <a href="javascript:void(0)"><img src="/images/indexImages/ab30190323562307.jpg" class="card-img-top rounded-0"
                        alt="..."></a>
                    <a href="javascript:void(0)"
                      class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"
                      data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i
                        class="ti ti-basket fs-4"></i></a>
                  </div>
                  <div class="card-body pt-3 p-4">
                    <h6 class="fw-semibold fs-4">海鮮總匯披薩</h6>
                    <div class="d-flex align-items-center justify-content-between">
                      <h6 class="fw-semibold fs-4 mb-0">$280 <span
                          class="ms-2 fw-normal text-muted fs-3"><del>$350</del></span></h6>
                      <ul class="list-unstyled d-flex align-items-center mb-0">
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="" href="javascript:void(0)"><i class="ti ti-star-half text-warning"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-xl-3">
                <div class="card overflow-hidden rounded-2">
                  <div class="position-relative">
                    <a href="javascript:void(0)"><img src="/images/indexImages/f672190323452307.jpg" class="card-img-top rounded-0"
                        alt="..."></a>
                    <a href="javascript:void(0)"
                      class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3"
                      data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i
                        class="ti ti-basket fs-4"></i></a>
                  </div>
                  <div class="card-body pt-3 p-4">
                    <h6 class="fw-semibold fs-4">蕈菇披薩(素食)</h6>
                    <div class="d-flex align-items-center justify-content-between">
                      <h6 class="fw-semibold fs-4 mb-0">$170 <span
                          class="ms-2 fw-normal text-muted fs-3"><del>$345</del></span></h6>
                      <ul class="list-unstyled d-flex align-items-center mb-0">
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                        
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-6 px-6 text-center">
              <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank"
                  class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a
                  href="https://themewagon.com">ThemeWagon</a></p>
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
      <script src="/back/js/member/EmpIndex.js"></script>
      <script>
        $(function () {
          ul(`${emp.empPermissions}`, `${emp.detailBean.deptBean.deptno}`);
        });
       
      </script>
    </body>

    </html>