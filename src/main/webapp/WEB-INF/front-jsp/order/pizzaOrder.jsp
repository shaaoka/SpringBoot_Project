<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Döner Pizza</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="shortcut icon" type="image/png"
	href="/images/member/pizzaQ.png" />

<!-- Favicon -->
<link href="/front/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Playfair+Display:wght@700;900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/front/lib/animate/animate.min.css" rel="stylesheet">
<link href="/front/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/front/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/front/css/style.css" rel="stylesheet">

<!-- Font Awesome-->
<script src="https://kit.fontawesome.com/60e7a8ebe3.js"
	crossorigin="anonymous"></script>

<!--Bootstrap 模態框-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"
			style="width: 3rem; height: 3rem;"></div>
	</div>
	<!-- Spinner End -->


	<!-- Navbar Start -->
	<div class="container-fluid bg-white">
		<div class="container">
			<nav
				class="navbar navbar-expand-lg bg-white navbar-light py-2 py-lg-0">
				<a href="/member/MemberIndex" class="navbar-brand"> <img
					class="img-fluid" src="/images/indexImages/DonerPizzaLogo.png"
					alt="Logo">
				</a>
				<button type="button" class="navbar-toggler ms-auto me-0"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto">
						<a href="/product/product.front" class="nav-item nav-link active">產品</a>
						<a href="/promotions/promotionsFront" class="nav-item nav-link">活動優惠</a>
						<a href="/reservation/customerreservemain.controller"
							class="nav-item nav-link">訂位趣</a> <a href="/delivery"
							class="nav-item nav-link">線上點餐</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">關於</a>
							<div class="dropdown-menu bg-light rounded-0 m-0">
								<a href="#" class="dropdown-item">特色</a> <a href="#"
									class="dropdown-item">部落格</a> <a href="#" class="dropdown-item">公司簡介</a>
								<a href="#" class="dropdown-item">分店資訊</a>
							</div>
						</div>
					</div>
				</div>
				<div class="border-start ps-4 d-none d-lg-block nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#"> <img
						src="${member.detailBean.mPhoto}" alt="" width="35" height="35"
						class="rounded-circle">${member.detailBean.mName}
					</a>
					<div class="dropdown-menu bg-light rounded-0 m-0">
						<a href="/member/MemberAboutMe" class="dropdown-item"> <i
							class="ti ti-user fs-6"></i>
							<p class="mb-0 dropdown-item ">會員中心</p>
						</a> <a href="#" class="dropdown-item"> <i class="ti ti-mail fs-6"></i>
							<p class="mb-0 dropdown-item">訂單查詢</p>
						</a> <a href="#" class="dropdown-item"> <i
							class="ti ti-list-check fs-6"></i>
							<p class="mb-0 dropdown-item">優惠券</p>
						</a> <a href="/member/logout"
							class="btn btn-outline-primary d-block dropdown-item px-4">登出</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-2 text-dark mb-4 animated slideInDown"></h1>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Store Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-4">

				<nav id="navbar-example2"
					class="navbar navbar-light bg-light px-3 sticky-top ">
					<div class="d-flex flex-grow-1">
						<ul class="nav nav-pills flex-grow-1">
							<li class="nav-item"><a class="nav-link fs-3" href="#pizza">披薩</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle fs-3" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">焗烤類</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#bakedNoodles">焗烤麵</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="#bakedFries">焗烤薯條</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link fs-3"
								href="#deepFried">炸物</a></li>
							<li class="nav-item"><a class="nav-link fs-3"
								href="#dessert">甜點</a></li>
							<li class="nav-item"><a class="nav-link fs-3" href="#drink">飲品</a></li>
					</div>
					<li style="list-style-type: none;">
						<button
							class="btn btn-primary btn-lg btn-lg-square rounded-circle cart-toggle position-relative"
							onclick="showCartModal(this)">
							<i class="bi bi-cart"></i> <span id="cartItemCount"
								class="badge rounded-pill bg-danger position-absolute top-0 start-100 translate-middle">0</span>
						</button>
					</li>
					</ul>
				</nav>
				<div class="col-12 justify-content-center">
					<div class="d-flex justify-content-end">
						<i class="fa-solid fa-star">週三店休</i>
					</div>
					<div class="col-10 d-flex justify-content-center">
						<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
							data-bs-offset="0" class="scrollspy-example row" tabindex="0">
							<h2 class="mb-3">Pizza</h2>

							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="pizza">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\夏威夷德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">夏威夷德國披薩</h4>
										<p>Hawaii</p>
										<h4 class="text-primary">$279</h4>
										<input type="hidden" name="productId" value="1">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\海鮮德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">海鮮德國披薩</h4>
										<p>Seafood</p>
										<h4 class="text-primary">$289</h4>
										<input type="hidden" name="productId" value="2">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid"
										src="\images\product\Shrimp_pineapple.png" alt=""
										style="width: 247px; height: 181px;">
									<div class="p-4">
										<h4 class="mb-3">鳳梨蝦仁披薩</h4>
										<p>Shrimp pineapple</p>
										<h4 class="text-primary">$279</h4>
										<input type="hidden" name="productId" value="3"> <input
											type="hidden" name="productId" value="3">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\牛肉K吧德國比薩.jpg"
										alt="">
									<div class="p-4">
										<h4 class="mb-3">牛肉K吧德國披薩</h4>
										<p>Dönerbox(beef)</p>
										<h4 class="text-primary">$259</h4>
										<input type="hidden" name="productId" value="4">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\臘腸意大利比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">臘腸義大利披薩</h4>
										<p>Salami</p>
										<h4 class="text-primary">$269</h4>
										<input type="hidden" name="productId" value="5">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\Chicken_Bacon.jpg"
										alt="" style="width: 247px; height: 181px;">
									<div class="p-4">
										<h4 class="mb-3">雞肉培根披薩</h4>
										<p>Chicken & Bacon</p>
										<h4 class="text-primary">$269</h4>
										<input type="hidden" name="productId" value="6">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\起司意大利比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">起司義大利披薩</h4>
										<p>Cheese</p>
										<h4 class="text-primary">$180</h4>
										<input type="hidden" name="productId" value="7">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\雞肉德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">雞肉德國披薩</h4>
										<p>Chickenw</p>
										<h4 class="text-primary">$190</h4>
										<input type="hidden" name="productId" value="8">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\培根德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">培根德國披薩</h4>
										<p>Bacon</p>
										<h4 class="text-primary">$185</h4>
										<input type="hidden" name="productId" value="9">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\鮪魚德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">鮪魚德國披薩</h4>
										<p>Tuna</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="10">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\瑪格麗塔披薩.jpg" alt=""
										style="width: 247px; height: 181px;">
									<div class="p-4">
										<h4 class="mb-3">瑪格麗塔披薩</h4>
										<p>Margherita</p>
										<h4 class="text-primary">$240</h4>
										<input type="hidden" name="productId" value="12">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\香菇德國比薩.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">洋菇德國披薩</h4>
										<p>mushroom</p>
										<h4 class="text-primary">$145</h4>
										<input type="hidden" name="productId" value="11">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showPizzaOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>

							<h2 class="mb-3">Baked noodles</h2>


							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="bakedNoodles">
								<div class="store-item position-relative text-center">
									<img class="img-fluid"
										src="\images\product\Baked_cheese_fries.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">起司焗烤麵</h4>
										<p>Cheese noodels</p>
										<h4 class="text-primary">$120</h4>
										<input type="hidden" name="productId" value="15">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedNoodlesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\義大利雞肉焗烤麵.jpg"
										alt="" style="width: 247px; height: 185px;">
									<div class="p-4">
										<h4 class="mb-3">義大利雞肉焗烤麵</h4>
										<p>Chicken noodels</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="14">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedNoodlesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\牛肉K吧焗烤麵.jpg" alt=""
										style="width: 247px; height: 185px;">
									<div class="p-4">
										<h4 class="mb-3">義大利牛肉K吧焗烤麵</h4>
										<p>Beef noodels</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="13">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedNoodlesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid"
										src="\images\product\Seafood_noodels.jpg" alt=""
										style="width: 247px; height: 185px;">
									<div class="p-4">
										<h4 class="mb-3">海鮮焗烤麵</h4>
										<p>Seafood noodels</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="16">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedNoodlesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>

							<h2 class="mb-3">baked fries</h2>

							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="bakedFries">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\牛K吧焗烤薯條.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">起司焗烤薯條</h4>
										<p>Baked cheese fries</p>
										<h4 class="text-primary">$160</h4>
										<input type="hidden" name="productId" value="19">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedFriesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\雞肉焗烤薯條.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">雞肉焗烤薯條</h4>
										<p>Chicken cheese fries</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="18">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedFriesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\牛K吧焗烤薯條.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">牛肉K吧焗烤薯條</h4>
										<p>Beef cheese fries</p>
										<h4 class="text-primary">$170</h4>
										<input type="hidden" name="productId" value="20">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedFriesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\鮪魚焗烤薯條.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">鮪魚焗烤薯條</h4>
										<p>Tuna cheese fries</p>
										<h4 class="text-primary">$150</h4>
										<input type="hidden" name="productId" value="17">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showBakedFriesOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>


							<h2 class="mb-3">Deep fried</h2>

							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="deepFried">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\薯條.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">薯條</h4>
										<p>French fries</p>
										<h4 class="text-primary">$79</h4>
										<input type="hidden" name="productId" value="22">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\炸雞塊(6塊).jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">雞塊(6)</h4>
										<p>Chicken nuggets</p>
										<h4 class="text-primary">$89</h4>
										<input type="hidden" name="productId" value="23">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\炸起司條(5條).jpg"
										alt="">
									<div class="p-4">
										<h4 class="mb-3">炸起司條(5)</h4>
										<p>Mozzarella sticks</p>
										<h4 class="text-primary">$89</h4>
										<input type="hidden" name="productId" value="21">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\炸物拼盤.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">炸物拼盤</h4>
										<p>Mixed platter</p>
										<h4 class="text-primary">$129</h4>
										<input type="hidden" name="productId" value="24">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>

							<h2 class="mb-3">Dessert</h2>

							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="dessert">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\蘋果肉桂德國烤餅.jpg"
										alt="">
									<div class="p-4">
										<h4 class="mb-3">蘋果肉桂德國烤餅</h4>
										<p>Apple flammkuchen</p>
										<h4 class="text-primary">$150</h4>
										<input type="hidden" name="productId" value="25">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid"
										src="\images\product\Apple pudding flammkuchen.jpg" alt=""
										style="width: 200px; height: 170px;">
									<div class="p-4">
										<h4 class="mb-3">蘋果布丁烤餅</h4>
										<p>Apple pudding flammkuchen</p>
										<h4 class="text-primary">$140</h4>
										<input type="hidden" name="productId" value="26">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\芝麻德國比烤餅.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">芝麻德國比烤餅</h4>
										<p>Sesame flammkuchen</p>
										<h4 class="text-primary">$120</h4>
										<input type="hidden" name="productId" value="27">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>


							<h2 class="mb-3">Drink</h2>

							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s"
								id="drink">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\可樂.jpg" alt=""
										style="width: auto; height: 232px;">
									<div class="p-4">
										<h4 class="mb-3">可口可樂</h4>
										<p>Coca cola</p>
										<h4 class="text-primary">$39</h4>
										<input type="hidden" name="productId" value="28">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\雪碧.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">雪碧</h4>
										<p>Sprite</p>
										<h4 class="text-primary">$39</h4>
										<input type="hidden" name="productId" value="29">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 wow fadeInUp" data-wow-delay="0.1s">
								<div class="store-item position-relative text-center">
									<img class="img-fluid" src="\images\product\蘋果汁.jpg" alt="">
									<div class="p-4">
										<h4 class="mb-3">蘋果汁</h4>
										<p>Apple juice</p>
										<h4 class="text-primary">$49</h4>
										<input type="hidden" name="productId" value="30">
									</div>
									<div class="store-overlay">
										<button type="button"
											class="btn btn-dark rounded-pill py-2 px-4 m-2"
											onclick="showOrderModal(this)">
											加入餐點 <i class="fa fa-cart-plus ms-2"></i>
										</button>
									</div>
								</div>
							</div>


							<!-- Modal pizzaOrder -->
							<div class="modal fade" id="pizzaOrderModal" tabindex="-1"
								aria-labelledby="orderModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="orderModalLabel">餐點明細</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											醬料 (必選)
											<div class="form-check">

												<input class="form-check-input" type="radio" name="sauce"
													id="whiteSauce" value="白醬"> <label
													class="form-check-label" for="whiteSauce">白醬</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="sauce"
													id="redSauce" value="紅醬"> <label
													class="form-check-label" for="redSauce">紅醬</label>
											</div>
											<br> 配料加選
											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="cheese"
													value="加起司"> <label class="form-check-label"
													for="cheese">加起司 +30</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="mushroom" value="加洋菇"> <label
													class="form-check-label" for="mushroom">加洋菇 +30</label>
											</div>
											<div class="mb-3">
												<label for="quantity" class="form-label">數量：</label> <input
													type="number" class="form-control" id="quantity" value="1"
													min="1" max="10">
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="addPizzaOrder(this)">送出</button>
										</div>
									</div>
								</div>
							</div>

							<!-- Modal bakedNoodlesOrder -->
							<div class="modal fade" id="bakedNoodlesOrderModal" tabindex="-1"
								aria-labelledby="bakedNoodlesOrderModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="bakedNoodlesOrderModalLabel">餐點明細</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											醬料 (必選)
											<div class="form-check">
												<input class="form-check-input" type="radio" name="sauce"
													id="whiteSauceBakedNoodles" value="白醬"> <label
													class="form-check-label" for="whiteSauceBakedNoodles">白醬</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="sauce"
													id="redSauceBakedNoodles" value="紅醬"> <label
													class="form-check-label" for="redSauceBakedNoodles">紅醬</label>
											</div>
											<br> 配料加選
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="mushroomBakedNoodles" value="加洋菇"> <label
													class="form-check-label" for="mushroomBakedNoodles">加洋菇
													+30</label>
											</div>
											<div class="mb-3">
												<label for="quantityBakedNoodles" class="form-label">數量：</label>
												<input type="number" class="form-control"
													id="quantityBakedNoodles" value="1" min="1" max="10">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="addBakedNoodlesOrder(this)">送出</button>
										</div>
									</div>
								</div>
							</div>

							<!--Model bakedFriesOrder-->
							<div class="modal fade" id="bakedFriesOrderModal" tabindex="-1"
								aria-labelledby="bakedFriesOrderModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="bakedFriesOrderModalLabel">餐點明細</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											配料加選
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="mushroomBakedFries" value="加洋菇"> <label
													class="form-check-label" for="mushroomBakedFries">加洋菇
													+30</label>
											</div>
											<div class="mb-3">
												<label for="quantityBakedFries" class="form-label">數量：</label>
												<input type="number" class="form-control"
													id="quantityBakedFries" value="1" min="1" max="10">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="addBakedFriesOrder(this)">送出</button>
										</div>
									</div>
								</div>
							</div>

							<!--Model normal addToCart-->
							<div class="modal fade" id="orderModal" tabindex="-1"
								aria-labelledby="orderModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="orderModalLabel">餐點明細</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<label for="quantity" class="form-label">數量：</label> <input
													type="number" class="form-control" id="addOrderQuantity"
													value="1" min="1" max="10">
											</div>
											<br> 備註：
											<div class="mb-3">
												<textarea class="form-control" id="orderNotes" rows="3"
													style="resize: none;"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="addOrder()">送出</button>
										</div>
									</div>
								</div>
							</div>


							<!-- Payment Modal -->
							<div class="modal fade" id="paymentModal" tabindex="-1"
								aria-labelledby="paymentModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="paymentModalLabel">填寫訂購資料</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<label for="discountCode" class="form-label">折扣碼：</label> <input
													type="text" class="form-control" name="discount"
													id="discount">
											</div>
											<br>
											<p>付款方式:</p>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="paymentMethod" id="cashPayment" value="現金"> <label
													class="form-check-label" for="cashPayment"><i
													class="fa-solid fa-money-check-dollar"></i>現金</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="paymentMethod" id="creditCardPayment" value="LinePay">
												<label class="form-check-label" for="creditCardPayment"><i
													class="fa-regular fa-credit-card"></i>LinePay</label>
											</div>
											<input type="hidden" name="account" id="account"
												value="memberAccount"> <input type="hidden"
												name="discountPrice" id="discountPrice" value=""> <input
												type="hidden" name="payment" id="payment" value="">
											<input type="hidden" name="pickup" id="pickup" value="外帶">
											<input type="hidden" name="orderStatus" id="orderStatus"
												value="">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">關閉</button>
											<button type="button" class="btn btn-primary"
												onclick="applyDiscount()">完成及付款</button>
										</div>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>

				<!--table for detail-->
				<div class="modal fade" id="cartModal" tabindex="-1"
					aria-labelledby="cartModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<div class="modal-content">
							<div class="modal-header"></div>
							<div class="modal-body">
								<table class="table table-responsive" id="cartTable">
									<thead>
										<tr>
											<th scope="col" nowrap>餐點</th>
											<th scope="col" nowrap>備註</th>
											<th scope="col" nowrap>金額</th>
											<th scope="col" nowrap>數量</th>
											<th scope="col" nowrap><i
												class="fa-regular fa-trash-can"></i></th>
										</tr>
									</thead>
									<tbody id="orderDetails">
										<!-- 用js 動態新增訂單 -->
									</tbody>
									<tfoot>
										<tr id="totalRow">
											<td colspan="3"></td>
											<!-- 表格對齊用 -->
											<td nowrap>總金額：</td>
											<td id="totalAmount">$0</td>
											<td></td>
											<!-- 表格對齊用 -->
										</tr>
									</tfoot>
								</table>
								<div class="modal-footer border-o">
									<div class="container mt-5">
										<div class="d-flex justify-content-center">
											<button type="button" class="btn btn-primary"
												id="checkOrderButton">查看付款方式</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>


	</div>


	<!-- Store End -->


	<!-- Footer Start -->
	<div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn"
		data-wow-delay="0.1s">
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
							href="https://www.facebook.com/donerzhongli/"><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-square btn-primary rounded-circle me-2" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4 class="text-primary mb-4">快速連結</h4>
					<a class="btn btn-link" href="">關於我們</a> <a class="btn btn-link"
						href="">聯絡我們</a> <a class="btn btn-link" href="">我們的服務</a> <a
						class="btn btn-link" href="">條款與協議</a> <a class="btn btn-link"
						href="">支援</a>
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
						<input class="form-control bg-transparent w-100 py-3 ps-4 pe-5"
							type="text" placeholder="Your email">
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
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Template Javascript -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

	<script src="../../..//static/front/js/main.js"></script>
	<script src="../../../static/front/js/order/orderModal.js"></script>

	<!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
</body>

</html>