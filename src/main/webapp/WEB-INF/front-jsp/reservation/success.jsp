<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>修改成功</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="shortcut icon" type="image/png" href="/images/member/pizzaQ.png" />

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

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
										class="dropdown-item">部落格</a> <a href="#"
										class="dropdown-item">公司簡介</a> <a href="#" class="dropdown-item">分店資訊</a>
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
                                </a> <a href="/member/logout"
                                    class="btn btn-outline-primary d-block dropdown-item px-4">登出</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-2 text-dark mb-4 animated slideInDown">修改成功</h1>
                <!-- <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Reserve</a></li>
                        <li class="breadcrumb-item text-dark" aria-current="page">ReserveSuccess</li>
                    </ol>
                </nav> -->
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Contact Start -->
        <div class="container-xxl contact py-20" style="font-size: 100px; text-align: center; color: rgb(0, 0, 0);">
            <div class="container">
                <h5>感謝您的確認，即將為您導向首頁</h5>
            </div>
        </div>
        <!-- Contact End -->


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
                        <a class="fw-medium" href="/member/emplogin">Döner Pizza德氏披薩</a>, All Right
                        Reserved.
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/front/lib/wow/wow.min.js"></script>
        <script src="/front/lib/easing/easing.min.js"></script>
        <script src="/front/lib/waypoints/waypoints.min.js"></script>
        <script src="/front/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="/front/js/main.js"></script>
        <script>
            setTimeout(function () {
                window.location.href = "/member/MemberIndex";
            }, 3000);
        </script>
    </body>

    </html>