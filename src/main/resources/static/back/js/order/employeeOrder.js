//返回主頁
function goToOrderIndex() {
	// 使用 window.location.href 将页面重定向到指定的JSP页面
	window.location.href = '/order/order.action';
}

var productPrice = 0;
var discountPrice = 0;

$(document).ready(function() {

	$.ajax({
		url: '/order/findProduct',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var categorySelect = $('#productCategorySelect');
			categorySelect.empty(); // 清空下拉選單
			categorySelect.append('<option value="">點擊下拉</option>');

			// 填充產品種類到下拉選單中
			$.each(response.categories, function(index, category) {
				categorySelect.append('<option value="' + category.categoryId + '">' + category.categoryName + '</option>');
			});

			// 綁定選擇事件，當選擇產品種類後加載相對應的產品
			categorySelect.change(function() {
				var selectedCategoryName = $(this).find('option:selected').text();
				productPrice = 0;

				if (selectedCategoryName === '披薩') {
					// 啟用相應的選項
					$('input[name="sauce"]').prop('disabled', false);
					$('#cheese').prop('disabled', false);
					$('#mushroom').prop('disabled', false);
				} else if (selectedCategoryName === '焗烤') {
					// 啟用相應的選項
					$('input[name="sauce"]').prop('disabled', false);
					$('#mushroom').prop('disabled', false);
				} else {
					$('input[name="sauce"]').prop('checked', false).prop('disabled', true);
					$('#cheese').prop('checked', false).prop('disabled', true);
					$('#mushroom').prop('checked', false).prop('disabled', true);
				}

				var categoryId = $(this).val();
				var products = response.product.filter(product => product.categoryId == categoryId);
				var orderProductSelect = $('#orderProductSelect');
				orderProductSelect.empty(); // 清空產品下拉選單
				orderProductSelect.append('<option value=""></option)>');
				$.each(products, function(index, product) {
					orderProductSelect.append('<option value="' + product.productId + '">' + product.productName + '</option>');
				});
				orderProductSelect.prop('disabled', false);

				$('#orderProductSelect').change(function() {
					if (response) {
						// 獲取所選產品的價格
						var selectedProductId = $(this).val();
						var selectedProduct = response.product.find(product => product.productId == selectedProductId);
						productPrice = selectedProduct.productPrice;
						console.log(productPrice);
						// 當選擇產品後，更新顯示的價格
						updateDisplayedPrice(productPrice);
					}
				});
				function updateDisplayedPrice(price) {
					// 更新顯示的價格
					$('#displayedPrice').text(price);
				}
			});
		},
		error: function(xhr, status, error) {
			console.error(error);
		}
	});
	$('input[name="sauce"]').change(function() {
		var selectedSauce = $(this).val();
		var note = selectedSauce;
		$('#noteInput').val(note);
	});

	// 當選擇加起司時觸發 change 事件
	$('#cheese').change(function() {
		if ($(this).is(":checked")) {
			$('#noteInput').val($('#noteInput').val() + ' 加起司');
			// 在此處增加 productPrice
			productPrice += 30; // 若選擇加起司，將 productPrice 加 30
			console.log('productPrice:', productPrice);
		} else {
			// 若取消勾選，將相應的價格減去
			productPrice -= 30;
			var noteValue = $('#noteInput').val();

			if (noteValue.includes('加起司')) {
				noteValue = noteValue.replace(' 加起司', '');
				$('#noteInput').val(noteValue);
			}
			console.log('productPrice:', productPrice);
		}
	});

	// 當選擇加洋菇時觸發 change 事件
	$('#mushroom').change(function() {
		if ($(this).is(":checked")) {
			$('#noteInput').val($('#noteInput').val() + ' 加洋菇');
			// 在此處增加 productPrice
			productPrice += 30; // 若選擇加洋菇，將 productPrice 加 30
			console.log('productPrice:', productPrice);
		} else {
			// 若取消勾選，將相應的價格減去
			productPrice -= 30;
			var noteValue = $('#noteInput').val();

			if (noteValue.includes('加洋菇')) {
				noteValue = noteValue.replace(' 加洋菇', '');
				$('#noteInput').val(noteValue);
			}
			console.log('productPrice:', productPrice);
		}
	});




});

function addOrder() {
	var productId = $('#orderProductSelect').val();
	var productName = $('#orderProductSelect option:selected').text();
	var quantity = $('#quantityInput').val();
	var unitPrice = productPrice;
	var note = $('#noteInput').val();

	if (productName == '') {
		Swal.fire('請選擇產品！');
	}
	if (quantity <= 0 || quantity > 10) {
		Swal.fire('數量限 1 ~ 10 之間！');
	}

	var sauceSelected = false;
	$('input[name="sauce"]').each(function() {
		if ($(this).is(":checked")) {
			sauceSelected = true;
			return false; // 中止循環
		}
	});



	if (!$('input[name="sauce"]').prop('disabled') && !sauceSelected) {
		Swal.fire('請選擇一種醬料！');
		return; // 中止函數執行
	}

	if (productName !== '' && quantity >= 1 && quantity <= 10) {

		// 創建新的訂單明細行
		var newRow = $('<tr>');
		newRow.append('<input type="hidden" name="productId[]" value="' + productId + '">'); // 添加 productId
		newRow.append('<td><input type="hidden" name="productName[]" value="' + productName + '">' + productName + '</td>');
		newRow.append('<td><input type="hidden" name="quantity[]" value="' + quantity + '">' + quantity + '</td>');
		newRow.append('<td><input type="hidden" name="unitPrice[]" value="' + unitPrice + '">' + unitPrice + '</td>');
		newRow.append('<td><input type="hidden" name="note[]" value="' + note + '">' + note + '</td>');
		newRow.append('<td><button type="button" class="btn btn-light border delete-row fw-semibold mb-0">刪除</button></td>');
		// 添加新行到表格中
		$('#orderDetailsTable').append(newRow);

		// 綁定刪除按鈕的點擊事件
		bindDeleteButton();

		// 清空div內的資料
		$('#quantityInput').val('');
		$('#noteInput').val('');
		$('input[name="sauce"]').prop('checked', false);
		$('#productCategorySelect').val('');
		$('#orderProductSelect').empty().prop('disabled', true);
		$('#cheese').prop('checked', false);
		$('#mushroom').prop('checked', false);


	}

}

function bindDeleteButton() {
	$('.delete-row').unbind('click').click(function() {
		$(this).closest('tr').remove(); // 刪除所在行
	});
}


function fillDiscountOptions(data) {
	var select = $('select[name="discount"]');
	var discountInput = $('input[name="discountAmount"]');

	// 清空现有的选项
	select.empty();

	// 添加默认选项
	select.append($('<option>', {
		value: '',
		text: ''
	}));

	// 将获取到的数据填充到选项中
	data.forEach(function(promotion) {
		select.append($('<option>', {
			value: promotion.promotions_discountcode, // 使用折扣码的编码作为值
			text: promotion.promotions_name // 使用折扣码的名称作为文本
		}));
	});

	// 当选择了折扣码时，设置隐藏的 input 的值为选中折扣码的金额
	select.change(function() {
		var selectedDiscountCode = $(this).val();
		var selectedDiscount = data.find(function(promotion) {
			return promotion.promotions_discountcode === selectedDiscountCode;
		});
		if (selectedDiscount) {
			discountInput.val(selectedDiscount.promotions_discount); // 将折扣金额填充到隐藏的 input 中

		} else {
			discountInput.val('');
		}
	});
}


function fetchDiscountList() {
	$.ajax({
		url: 'getDiscountList',
		type: 'GET',
		success: function(data) {
			fillDiscountOptions(data);
		},
		error: function(xhr, status, error) {
			console.error(error);
		}
	});
}

// 在页面加载完成后调用 fetchDiscountList()，以便加载折扣码列表
$(document).ready(function() {
	fetchDiscountList();
});


function sendOrder() {

	// 收集页面数据
	var account = $('select[name="customerName"]').val();
	var discount = $('select[name="discount"]').val();
	var discountPrice = parseFloat($('#discountAmount').val());
	var payment = $('select[name="payment"]').val();
	var pickup = $('select[name="pickup"]').val();
	var orderStatus = $('input[name="orderStatus"]').val();

	var productIds = [];
	var products = [];
	var unitPrices = [];
	var quantities = [];
	var notes = [];

	$('#orderDetailsTable tr').each(function() {
		var productId = $(this).find('input[name="productId[]"]').val();
		var productName = $(this).find('input[name="productName[]"]').val();
		var unitPrice = ($(this).find('input[name="unitPrice[]"]').val());
		var quantity = ($(this).find('input[name="quantity[]"]').val());
		var note = $(this).find('input[name="note[]"]').val();


		productIds.push(productId);
		products.push(productName);
		unitPrices.push(unitPrice);
		quantities.push(quantity);
		notes.push(note);
	});

	var orderDetailsList = [];
	for (var i = 0; i < productIds.length; i++) {
		var detailData = {
			productId: productIds[i],
			productName: products[i],
			unitPrice: unitPrices[i],
			quantity: quantities[i],
			note: notes[i]
		};
		orderDetailsList.push(detailData);
	}

	console.log("Order details list length: " + orderDetailsList.length);
	console.log("productId: " + productIds);


	// 訂單數據
	var orderData = {
		account: account,
		discount: discount,
		discountPrice: discountPrice,
		payment: payment,
		pickup: pickup,
		orderStatus: orderStatus,
		orderDetails: orderDetailsList
	};


	$.ajax({
		url: '/order/employeeOrder',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(orderData),
		success: function(response) {
			console.log(response);
			displayOrderDetails(orderData);
		},
		error: function(xhr, status, error) {
			console.error(error);
		}
	});
}

// 在订单插入成功后调用该函数显示订单详情
function displayOrderDetails(orderData) {
	// 獲取訂單總金額
	var totalAmount = 0;
	var orderDetails = orderData.orderDetails;


	// 創建表格元素
	var table = $('<table>').attr('width', '100%').attr('cellspacing', '0').attr('cellpadding', '5').css('border-collapse', 'collapse');



	// 遍歷訂單詳細並創建表格行
	orderDetails.forEach(function(detail) {
		var row = $('<tr>').appendTo(table);
		$('<td>').css('text-align', 'left').attr('border', '1').text(detail.productName).appendTo(row); // 修改這裡以反映訂單詳細的產品名稱
		$('<td>').css('text-align', 'left').attr('border', '1').text(detail.quantity + '份').appendTo(row); // 顯示數量
		$('<td>').css('text-align', 'left').attr('border', '1').text('$' + (parseFloat(detail.unitPrice) * parseInt(detail.quantity)).toFixed(2)).appendTo(row); // 修改這裡以計算產品的總價格
		$('<td>').css('text-align', 'center').attr('border', '1').text(detail.note).appendTo(row); // 顯示備註
		$('<tr>').appendTo(table);
		totalAmount += parseFloat(detail.unitPrice) * parseInt(detail.quantity); // 累加總金額
	});

	$('br').appendTo(table);

	// 創建總金額行
	var subtotalRow = $('<tr>').appendTo(table);
	$('<td>').css('text-align', 'left').text('總金額').attr('colspan', '2').appendTo(subtotalRow);
	$('<td>').css('text-align', 'left').text('$' + totalAmount.toFixed(2)).appendTo(subtotalRow); // 顯示總金額
	$('<td>').css('text-align', 'left').text('').appendTo(subtotalRow); // 小計行不顯示備註



	// 在頁面中顯示表格
	$('#orderDetailsModal .modal-body').empty().append(table);

	// 顯示模態框
	$('#orderDetailsModal').modal('show');
}

$('.EmployeeOrder-close').on('click', function() {
    $('#orderDetailsModal').modal('hide');
    window.location.href = '/order/orderByEmployee';
});

// 假设你有一个按钮或其他元素来触发发送订单的操作
$('.employeeOrder-btn').click(function() {
	if(productPrice > 0){
	sendOrder();		
	}else {
		Swal.fire('尚未點餐！');
	}
});
