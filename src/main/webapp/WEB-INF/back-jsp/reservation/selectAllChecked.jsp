<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*,com.team6.reservation.model.*" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>目前用餐客人資訊</title>
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
        <h2>目前用餐客人資訊</h2>

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
                    <h2>目前用餐客人資訊</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>用餐顧客姓名</th>
                                <th>用餐日期</th>
                                <th>用餐時間</th>
                                <th>用餐人數</th>
                                <th>電話號碼</th>
                                <th>備註</th>
                                <th>刪除</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Reserve> selectAllChecked = (ArrayList<Reserve>)
                                    request.getAttribute("selectAllChecked");
                                    for (Reserve selectAllCheckeds : selectAllChecked) {
                                    %>
                                    <td>
                                        <%= selectAllCheckeds.getReservationName() %>
                                    </td>
                                    <td>
                                        <%= selectAllCheckeds.getReservationDate() %>
                                    </td>
                                    <td>
                                        <%= selectAllCheckeds.getReservationTime() %>
                                    </td>
                                    <td>
                                        <%= selectAllCheckeds.getNumberOfPeople() %>
                                    </td>
                                    <td>
                                        <%= selectAllCheckeds.getPhone() %>
                                    </td>
                                    <td>
                                        <%= selectAllCheckeds.getNote() %>
                                    </td>
                                    <td><button type="button"
                                            onclick="confirmDelete('<%= selectAllCheckeds.getReservationId()%>')">已離開</button>
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
            function confirmDelete(reservationId) {
                if (confirm("客人是否已離場？")) {
                    deleteCheckIn(reservationId);
                }
            }

            function deleteCheckIn(reservationId) {
                var xhr = new XMLHttpRequest();
                xhr.open('PUT', '/reservation/deleteCheckInStatusTo2', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        location.reload();
                    }
                };
                xhr.send('action=deleteCheckIn&reservationId=' + encodeURIComponent(reservationId));
            }

        </script>
    </body>

    </html>