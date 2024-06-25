$(document).ready(function () {

    var pageSize = 6; // 顯示的筆數
    var currentPage = 0; // 目前頁碼

    $('.categoryFilter').on('click', categoryChange);
    $('#allProducts').trigger('click');


    function categoryChange(event, page) {



        currentPage = page;
        console.log("目前頁碼: " + (currentPage + 1));

        const categoryId = $(event.target).val();
        console.log('選中的分類值為:', categoryId);

        $.ajax({
            url: "product.selectWithState/" + categoryId,
            type: 'GET',
            dataType: 'json',
            data: { page: currentPage }, // 分頁參數
            success: function (response) { // 請求成功時執行的function
                // console.log(response);

                $('#paginationInfo').val(response.totalPages);

                $('#products').empty();
                $.each(response.content, function (index, product) {
                    var row = `<div class="col-sm-12 col-md-6 col-lg-6 col-xl-4" id="product-` + product.productId + `">` +
                        '<div class="rounded position-relative">' +
                        '<div class="product-img">' +
                        `<img src="` + product.productImg_url + `" class="w-100 rounded-top"
                                            alt="暫無圖片">` +
                        '</div>' +
                        `<div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; left: 10px;" data-categoryId="` + product.categoryId + `">` + product.categoryName + '</div>' +
                        '<div ' +
                        'class="p-4 border border-secondary border-top-0 rounded-bottom">' +
                        `<h4>` + product.productName + '</h4>' +
                        `<p style="height: 100px;">` + product.productDesc + '</p>' +
                        '<div class="d-flex justify-content-between flex-lg-wrap">' +
//                        `<p class="text-dark fs-5 fw-bold mb-0">數量: ` + product.productQuantity + '</p>' +
                        `<p class="text-dark fs-5 fw-bold mb-0">金額: ` + product.productPrice + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';

                    $('#products').append(row);

                });
                // 更新分頁按鈕        
                updatePaginationButtons(response);

            },
            error: function (xhr, status, error) {
                console.error(error);
            }

        });
    }
    // 更新分頁按鈕 
    function updatePaginationButtons(response) {

        let totalPages = response.totalPages;
        let totalElements = response.totalElements;
        let currentPageNumber = response.number + 1;
        // 全域變數改為當前頁數
        currentPage = response.number;

        // 清除所有分頁按鈕的 active 類別
        $('.pagination li').removeClass('active');

        // 更新當前分頁按鈕的 active 類別
        $('#pageNumber' + currentPageNumber).addClass('active');

        // 更新分頁按鈕狀態
        if (response.first) {
            $('#firstPage, #prevPage').addClass('disabled');
        } else {
            $('#firstPage, #prevPage').removeClass('disabled');
        }
        if (response.last) {
            $('#lastPage, #nextPage').addClass('disabled');
        } else {
            $('#lastPage, #nextPage').removeClass('disabled');
        }

        // 更新分頁按鈕的可見性和文字內容
        var startPage = Math.max(1, response.number - 3);
        var endPage = Math.min(totalPages, startPage + 4);

        for (var i = 1; i <= 5; i++) {
            var pageNum = startPage + i - 1;
            var pageItem = $('#pageNumber' + i);

            if (pageNum <= endPage) {
                pageItem.removeClass('d-none');
                pageItem.find('a').text(pageNum);
            } else {
                pageItem.addClass('d-none');
            }
        }

    }

    // 分頁按鈕點擊事件
    $('.pagination li a').click(function (e) {
        e.preventDefault();
        window.scrollTo({ top: $('#ourProducts').offset().top, behavior: 'smooth' });

        var target = $(this);
        var categoryId = $('.categoryFilter:checked').val(); // 獲取當前選中的類別ID

        if (target.parent().is('#firstPage')) {
            currentPage = 0;
        } else if (target.parent().is('#prevPage')) {
            currentPage--;
        } else if (target.parent().is('#nextPage')) {
            currentPage++;
        } else if (target.parent().is('#lastPage')) {
            currentPage = $('#paginationInfo').val() - 1;
        } else {
            currentPage = parseInt(target.text()) - 1;
        }

        // 觸發 categoryChange 事件並傳遞當前頁碼
        $('.categoryFilter[value="' + categoryId + '"]').trigger('click', [currentPage]);
    });


    // 查詢事件
    $('#searchBtn').click(function () {
        let searchContent = $('#search').val();
        if (searchContent == '' && searchContent == 0) {
            return;
        }
        console.log("e04" + searchContent);

        $.ajax({
            url: "product.selectNameWithState",
            type: 'GET',
            dataType: 'json',
            data: { productName: searchContent },
            success: function (response) {
                console.log(response);
                $('#products').empty();
                $.each(response, function (index, product) {
                    var row = `<div class="col-sm-12 col-md-6 col-lg-6 col-xl-4" id="product-` + product.productId + `">` +
                        '<div class="rounded position-relative">' +
                        '<div class="product-img">' +
                        `<img src="` + product.productImg_url + `" class="w-100 rounded-top"
                                            alt="暫無圖片">` +
                        '</div>' +
                        `<div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; left: 10px;" data-categoryId="` + product.categoryId + `">` + product.categoryName + '</div>' +
                        '<div ' +
                        'class="p-4 border border-secondary border-top-0 rounded-bottom">' +
                        `<h4>` + product.productName + '</h4>' +
                        `<p style="height: 100px;">` + product.productDesc + '</p>' +
                        '<div class="d-flex justify-content-between flex-lg-wrap">' +
                        `<p class="text-dark fs-5 fw-bold mb-0">數量: ` + product.productQuantity + '</p>' +
                        `<p class="text-dark fs-5 fw-bold mb-0">金額: ` + product.productPrice + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';

                    $('#products').append(row);

                });

            }
        })


    })


});