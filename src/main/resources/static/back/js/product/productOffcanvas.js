// offcanvas
$('#offcanvasRight').on('show.bs.offcanvas', function (event) {
    $('.offcanvas-body').scrollTop(0);
    const button = $(event.relatedTarget);
    const productData = button.data('product-data');

    // console.log(productData);
    // 填充表單欄位
    $('#productId').val(productData.productId);
    $('#categoryId').val(productData.categoryId);
    $('#productName').val(productData.productName);
    $('#productDesc').val(productData.productDesc);
    $('#offcanvas-productImg_url').val('');
    $('#productPrice').val(productData.productPrice);
    $('#productQuantity').val(productData.productQuantity);
    $('#productStateId').val(productData.stateId);
    $('#productCreateDate').val(productData.productCreateDate);

    // 如果有圖片網址，顯示圖片預覽
    if (productData.productImg_url) {
        $('#offcanvas-previewImage').attr('src', productData.productImg_url);
    } else {
        $('#offcanvas-previewImage').attr('src', '');
    }
});