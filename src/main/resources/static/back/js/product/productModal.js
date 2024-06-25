// modal
$('#productModal').on('show.bs.modal', function (event) {
    // 預設值,等於一鍵輸入
    $('#createproductName').val('巧克力披薩');
    $('#createproductDesc').val('這是一款美味的巧克力披薩，將濃郁的巧克力醬均勻地塗抹在酥脆的披薩餅底上，搭配上香甜的烤棉花糖，給你帶來甜蜜和滿足的雙重享受。');
    $('#modal-productImg_url').val('');
    $('#createproductPrice').val('125');
    $('#createproductQuantity').val('25');
});