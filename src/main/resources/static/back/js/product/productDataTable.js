
// dataTable
$(document).ready(function () {
    $('#example').DataTable({
        "order": [[8, "desc"], [0, "desc"]], // 先按上架日期遞減排序,再按產品ID遞增排序
        language: {
            "lengthMenu": "顯示 _MENU_ 筆資料",
            "sProcessing": "處理中...",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "目前有 _MAX_ 筆資料",
            "sInfoEmpty": "目前共有 0 筆紀錄",
            "sInfoFiltered": " ",
            "sInfoPostFix": "",
            "sSearch": "搜尋:",
            "sUrl": "",
            "sEmptyTable": "尚未有資料紀錄存在",
            "sLoadingRecords": "載入資料中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首頁",
                "sPrevious": "上一頁",
                "sNext": "下一頁",
                "sLast": "末頁"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },
        "ajax": {
            "url": "Product_Test_SelectAll",
            "method": "GET",
            "dataSrc": ""
        },
        "columns": [
            { "data": "productId" },
            { "data": "categoryName" },
            { "data": "productName" },
            { "data": "productDesc" },
            {
                "data": "productImg_url",
                "render": function (data, type, row) {
                    return '<div style="width: 12vw; height: 12vw; overflow: hidden;">' +
                        '<img src="' + data + '" alt="沒有頭貼" style="width: 100%; height: 100%; object-fit: cover; object-position: center;">' +
                        '</div>';
                }
            },
            { "data": "productPrice" },
            { "data": "productQuantity" },
            { "data": "stateName" },
            { "data": "productCreateDate" },
            {
                "data": "productState",
                "render": function (data, type, row) {
                    let productId = row.productId;
                    let changeState = `<select onchange="change(` + productId + `, this.value)">
                        <option value="">修改狀態</option>
                        <option value="1">上架中</option>
                        <option value="0">已下架</option>
                       </select>`;
                    return changeState;
                }
            },
            {
                "data": null,
                "render": function (data, type, row) {
                    // return '<button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">修改</button>';
                    return '<button class="btn btn-warning btn-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" data-product-data=\'' + JSON.stringify(row) + '\'>修改</button>'
                        + `<button type="button" class="btn btn-danger btn-sm mt-5" onclick="productDoDelete(` + row.productId + `)">刪除</button>`;
                }
            }
        ], // 設定表頭元素定義
        headerCallback: function (thead, data, start, end, display) {
            $(thead).find('th').addClass('text-center')
        },
        columnDefs: [
            {
                targets: [0, 1, 7],
                width: '6%'
            },
            {
                targets: [2, 6],
                width: '10%'
            },
            {
                targets: '_all',
                className: 'text-center'
            }
        ]
    });
});

// 改產品狀態的方法
function change(productId, productStateId) {

    $.ajax({
        url: "Product_ChangeState",
        method: 'PUT',
        data: { "productId": productId, "productStateId": productStateId },
        success: function (response) {
            console.log(response);
            // 後臺回應的新狀態名稱更新對應的productState.productStateName欄位
            let table = $('#example').DataTable();
            let row = table.row(function (index, data, node) {
                return data.productId === productId;
            });
            if (row.length) {
                row.data().stateId = response.productStateId;
                row.data().stateName = response.productStateName;
                row.invalidate().draw(); // 重新渲染
            }
        },
        error: (xhr, status, error) => console.log(error)
    });
}

// 整個產品更新的方法 
function productDoUpdate() {
    console.log('進入productDoUpdate');
    // A.先取到Offcanvas內所有欄位的資料,這邊用formData因為我要傳檔案QAQ
    let formData = new FormData();
    formData.append('productId', $('#productId').val());
    formData.append('categoryId', $('#categoryId').val());
    formData.append('productName', $('#productName').val());
    formData.append('productDesc', $('#productDesc').val());
    formData.append('productImg_url', $('#offcanvas-productImg_url')[0].files[0]);
    formData.append('productPrice', $('#productPrice').val());
    formData.append('productQuantity', $('#productQuantity').val());
    formData.append('productStateId', $('#productStateId').val());

    // B.把productData傳到後臺處理
    $.ajax({
        url: "product_Test_DoUpdate",
        method: 'PUT',
        contentType: false, // 必須設為false,才能上傳檔案
        processData: false,  // 必須設為false,才能上傳檔案
        data: formData,
        success: function (response) {
            console.log("response:");
            console.log(response);
            let table = $('#example').DataTable();
            let row = table.row(function (index, data, node) {
                return data.productId === response.productId;
            });
            if (row.length) {
                row.data().productId = response.productId;
                row.data().categoryName = response.categoryName;
                row.data().productName = response.productName;
                row.data().productDesc = response.productDesc;
                row.data().productImg_url = response.productImg_url;
                row.data().productPrice = response.productPrice;
                row.data().productQuantity = response.productQuantity;
                row.data().stateId = response.stateId;
                row.data().stateName = response.stateName;
                row.data().productCreateDate = response.productCreateDate;
                row.invalidate().draw(); // 重新渲染
            }
        }
    })
};

// 新增產品的方法
function productDoCreate() {

    console.log('進入productDoCreate');
    // A.先取到modal內所有欄位的資料,這邊用formData因為我要傳檔案QAQ
    let formData = new FormData();
    formData.append('categoryId', $('#createcategoryId').val());
    formData.append('productName', $('#createproductName').val());
    formData.append('productDesc', $('#createproductDesc').val());
    formData.append('productImg_url', $('#modal-productImg_url')[0].files[0]);
    formData.append('productPrice', $('#createproductPrice').val());
    formData.append('productQuantity', $('#createproductQuantity').val());

    // B.把productData傳到後臺處理
    $.ajax({
        url: "product_Test_Create",
        method: 'Post',
        contentType: false, // 必須設為false,才能上傳檔案
        processData: false,  // 必須設為false,才能上傳檔案
        data: formData,
        success: function (response) {
            console.log("response:");
            console.log(response);
            let table = $('#example').DataTable();

            table.row.add(response).draw();

        }
    })
};

// 刪除產品的方法
function productDoDelete(productId) {

    console.log('productId: ' + productId);
    if (confirm('確定要刪除該筆資料嗎?')) {
        if (confirm('確定真的要刪除該筆資料嗎?')) {

            $.ajax({
                url: "Product_Test_Delete",
                method: 'DELETE',
                data: { "productId": productId },
                success: function (response) {
                    console.log('response: ' + response);
                    let table = $('#example').DataTable();
                    let rowIndex = table.row(function (idx, data, node) {
                        return data.productId === response;
                    }).index();
                    table.row(rowIndex).remove().draw();
                },
                error: (xhr, status, error) => console.log(error)
            });

        }
    }
}


