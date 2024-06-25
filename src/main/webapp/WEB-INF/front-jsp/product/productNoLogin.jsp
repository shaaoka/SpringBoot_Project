<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>Döner Pizza 德氏披薩</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <style>
            .form-check-input:checked+.form-check-label {
                color: darkturquoise;
            }

            .product-img {
                /* 設定圖片高度 */
                height: 250px;
                /* 超出圖片剪掉 */
                overflow: hidden;
            }

            .product-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                /* 縮放圖片以填滿容器 */
            }
        </style>
        <!-- Favicon -->
        <link href="/images/member/pizzaQ.png" rel="icon">

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
                    <a href="/member/index" class="navbar-brand">
                        <img class="img-fluid" src="/images/indexImages/DonerPizzaLogo.png" alt="Logo">
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
                        <div class="border-start ps-4 d-none d-lg-block">
                            <a href="/member/login"><button type="button"
                                    class="btn btn-sm p-0 btn-primary py-2 px-2">會員登入</button></a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5">
            <div class="container text-center py-5">
                <h3 class="display-2 text-dark mb-4 animated zoomIn fw-medium fst-italic fs-1" id="ourProducts">我們的產品
                </h3>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Products Start -->
        <div class="container-fluid product py-1">
            <div class="container py-3">
                <div id="products-header" class="section-title text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
                    style="max-width: 700px;">
                </div>
            </div>
            <!-- 分頁 -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <nav aria-label="Page navigation">
                        <span id="paginationInfo" hidden></span>
                        <ul class="pagination justify-content-center">
                            <li class="page-item" id="firstPage">
                                <a class="page-link" href="#" aria-label="首頁">
                                    第 1 頁
                                </a>
                            </li>
                            <li class="page-item" id="prevPage">
                                <a class="page-link" href="#" aria-label="上一頁">
                                    上 1 頁
                                </a>
                            </li>
                            <li class="page-item active" id="pageNumber1"><a class="page-link" href="#">1</a></li>
                            <li class="page-item d-none" id="pageNumber2"><a class="page-link" href="#">2</a></li>
                            <li class="page-item d-none" id="pageNumber3"><a class="page-link" href="#">3</a></li>
                            <li class="page-item d-none" id="pageNumber4"><a class="page-link" href="#">4</a></li>
                            <li class="page-item d-none" id="pageNumber5"><a class="page-link" href="#">5</a></li>
                            <li class="page-item" id="nextPage">
                                <a class="page-link" href="#" aria-label="下一頁">
                                    下 1 頁
                                </a>
                            </li>
                            <li class="page-item" id="lastPage">
                                <a class="page-link" href="#" aria-label="末頁">
                                    最後 1 頁
                                </a>
                            </li>

                        </ul>
                    </nav>
                </div>
            </div>

            <!-- 分頁 end -->
            <div class="container-fluid py-3">
                <div class="row">
                    <div class="col-md-3 g-4">

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="search"><b>品名:</b></label>
                            <input type="text" class="form-control" id="search" placeholder="請輸入產品名稱" name="productName"
                                oninput="value=value.replace(/[^\u3105-\u3129\u4E00-\u9FA5]/g,'')">
                            <button class="btn btn-primary" id="searchBtn" type="button"><b>查詢</b></button>
                        </div>

                        <div class="bg-light rounded p-4">
                            <h4 class="mb-4">產品分類</h4>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter" type="radio" name="categoryFilter"
                                    id="allProducts" checked value="0">
                                <label class="fs-5 form-check-label fw-bold" for="allProducts">所有產品</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter" type="radio" name="categoryFilter"
                                    id="pizza" value="1">
                                <label class="fs-5 form-check-label fw-bold" for="pizza">披薩</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter" type="radio" name="categoryFilter"
                                    id="baked" value="2">
                                <label class="fs-5 form-check-label fw-bold" for="baked">焗烤</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter   " type="radio" name="categoryFilter"
                                    id="fried" value="3">
                                <label class="fs-5 form-check-label fw-bold" for="fried">炸物</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter   " type="radio" name="categoryFilter"
                                    id="dessert" value="4">
                                <label class="fs-5 form-check-label fw-bold" for="dessert">甜點</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input categoryFilter   " type="radio" name="categoryFilter"
                                    id="drinks" value="5">
                                <label class="fs-5 form-check-label fw-bold" for="drinks">飲料</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane fade p-0 active show">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="row g-4" id="products">

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
        <!-- Products End -->






        <!-- Footer Start -->
        <div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-primary mb-4">聯絡資訊</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>320桃園市中壢區大仁街51號1F
                        </p>
                        <p class="mb-2"><i class="fa fa-phone-alt text-primary me-3"></i>0966 464 603</p>
                        <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>kebabtaiwan@gmail.com</p>
                        <div class="d-flex pt-3">
                            <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-square btn-primary rounded-circle me-2"
                                href="https://www.facebook.com/donerzhongli/"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                    class="fab fa-youtube"></i></a>
                            <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-primary mb-4">快速連結</h4>
                        <a class="btn btn-link" href="">關於我們</a>
                        <a class="btn btn-link" href="">聯絡我們</a>
                        <a class="btn btn-link" href="">我們的服務</a>
                        <a class="btn btn-link" href="">條款與協議</a>
                        <a class="btn btn-link" href="">支援</a>
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
                        &copy; <a class="fw-medium" href="https://www.ispan.com.tw/">資展國際股份有限公司</a>, <a
                            class="fw-medium" href="/member/emplogin">Döner Pizza德氏披薩</a>, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        設計由 <a class="fw-medium" href="https://htmlcodex.com">HTML Codex</a> 發行由 <a class="fw-medium"
                            href="https://themewagon.com">ThemeWagon</a>
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

        <!-- Template Javascript -->
        <script src="/front/js/product/productmain.js"></script>

        <!-- 加入產品的相關js -->
        <script src="/front/js/product/frontProduct.js"></script>




    </body>

    </html>