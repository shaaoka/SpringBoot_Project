$(document).ready(function() {
    // 當點擊 "歷史訂單" 按鈕時
    $('#OrderTab').on('click', function() {
        // 發送 AJAX 請求來獲取訂單資料
        $.ajax({
            url: '/order/searchOrderByAccount', // 您的控制器方法的 URL
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                if (data && data.length > 0) {
                    var tableBody = $('#OrderTable tbody');
                    // 清空先前的資料
                    tableBody.empty();
                    // 遍歷資料並創建表格行
                    data.forEach(function(order) {
                        var formattedOrderTime = order.orderTime.split('.')[0];
                        var row = '<tr>' +
                            '<td class="order-id" data-order-id="' + order.orderId + '">' + order.orderId + '</td>' +
                            '<td>' + formattedOrderTime + '</td>' +
                            '<td>' + '$' + order.paidAmount + '</td>' +
                            '<td>' + order.payment + '</td>' +
                            '<td>' + order.pickup + '</td>' +
                            '<td>' + order.orderStatus + '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    });

                    // 為訂單編號單元格添加點擊事件
                    $('#OrderTable').on('click', '.order-id', function() {
                        var orderId = $(this).data('order-id');
                        // 隱藏訂單表格並顯示訂單明細表格
                        $('#orderTableContainer').addClass('hidden');
                        $('#orderDetailsContainer').removeClass('hidden');

                        // 發送 AJAX 請求來獲取訂單明細
                        $.ajax({
                            url: '/order/memberSelectDetails',
                            method: 'GET',
                            data: { orderId: orderId },
                            dataType: 'json',
                            success: function(details) {
                                if (details && details.length > 0) {
                                    var detailsBody = $('#orderDetailsTable tbody');
                                    detailsBody.empty(); // 清空先前的明細資料
                                    details.forEach(function(detail) {
                                        var detailRow = '<tr>' +
                                            '<td>' + detail.product + '</td>' +
                                            '<td>' + detail.quantity + '</td>' +
                                            '<td>' + detail.unitPrice + '</td>' +
                                            '</tr>';
                                        detailsBody.append(detailRow); // 將明細資料添加到表格中
                                    });
                                } else {
                                    console.log("No details found for the order.");
                                }
                            },
                            error: function(xhr, status, error) {
                                console.error("Error fetching order details: ", error);
                            }
                        });
                    });

                    // 初始化 DataTable
                    $('#OrderTable').DataTable();
                } else {
                    console.log("No data found for the account.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching order data: ", error);
            }
        });
    });

    // 為返回按鈕添加點擊事件
    $('#backToOrdersBtn').on('click', function() {
        $('#orderTableContainer').removeClass('hidden');
        $('#orderDetailsContainer').addClass('hidden');
    });
});
