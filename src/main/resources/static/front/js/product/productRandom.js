$(document).ready(function () {

    $.ajax({
        url: "/product/product.selectRandomProducts",
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            console.log(response);
            $('.product-carousel').empty();
            $.each(response, function (index, product) {

                var row = '<a href="/product/product.front" class="d-block product-item rounded">' +
                    '<div class="product-img" style="height: 280px; overflow: hidden;">' +
                    `<img class="w-100 rounded-top" src="` + product.productImg_url + '" alt="暫無圖片" style="width: 100%; height: 100%; object-fit: cover;">' +
                    '</div>' +
                    '<div class="text-white bg-secondary px-3 py-1 rounded position-absolute"' +
                    `style="top: 10px; left: 10px;" data-categoryId="` + product.categoryId + `">` + product.categoryName + '</div>' +

                    '<div class="bg-white shadow-sm text-center p-4 position-relative mt-n5 mx-4">' +
                    `<h4 class="text-primary">` + product.productName + '</h4>' +
                    `<span class="text-body">` + product.productDesc + '</span>' +
                    '</div>' +
                    '</a>';

                $('.product-carousel').append(row);
            })
            // 重新設定輪播
            $('.product-carousel').owlCarousel('destroy').owlCarousel({
                autoplay: true,
                smartSpeed: 1000,
                margin: 25,
                loop: true,
                center: true,
                dots: false,
                nav: true,
                navText: [
                    '<i class="bi bi-chevron-left"></i>',
                    '<i class="bi bi-chevron-right"></i>'
                ],
                responsive: {
                    0: {
                        items: 1
                    },
                    576: {
                        items: 1
                    },
                    768: {
                        items: 2
                    },
                    992: {
                        items: 3
                    }
                }
            });
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    })

});