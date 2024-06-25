//update details ajax
//update quantity
$(document).on('click', '.quantity-input', function() {
	var detailsId = $(this).closest('tr').find('.details-id-input').val();
	var orderId = $(this).prev('.order-id-input').val();
	var quantity = $(this).val();

	$.ajax({
		url: '/order/updateQuantity',
		type: 'PUT',
		data: {
			detailsId: detailsId,
			quantity: quantity
		},
		success: function(response) {
			loadOrderDetails(orderId);
			console.log(response.message);
		},
		error: function(xhr, status, error) {
			console.error(error);
		}
	});
});


//update note
$(document).on('click', '.updateNote-btn', function() {
	var detailsId = $(this).prev('.details-id-input').val();
	var orderId = $(this).closest('tr').find('.order-id-input').val();
	console.log(detailsId);
	console.log(orderId);


	var userInput = prompt("請輸入餐點備註：");

	if (userInput !== null) {

		$.ajax({
			url: '/order/updateDetailsNote',
			type: 'PUT',
			data: {
				detailsId: detailsId,
				note: userInput
			},
			success: function(response) {
				loadOrderDetails(orderId);
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	} else {
		console.log("取消操作");
	}
});


//insert details
$(document).ready(function() {
	var productPrice = 0;

	$('#showAddDetailsModal').click(function() {
		$('#addDetailsModal').modal('show');
		var orderId = $('#orderIdInput').val();
		console.log(orderId);
		// 發送請求獲取產品種類及產品資料
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

	//確定insertDetails
	$('#addDetailsBtn').click(function() {

		var orderId = $('#orderIdInput').val();
		var productId = $('#orderProductSelect').val();
		var productName = $('#orderProductSelect option:selected').text();
		var Price = productPrice;
		var quantity = $('#quantityInput').val();
		var note = $('#noteInput').val();


		var formData = {
			"orderId": orderId,
			"productId": productId,
			"product": productName,
			"unitPrice": Price,
			"quantity": quantity,
			"note": note
		};
		
		if($('#orderProductSelect option:selected').text() == ''){
			Swal.fire('請選擇產品！');
		}
		if(quantity<=0 || quantity>10){
			Swal.fire('數量限 1 ~ 10 之間！');
		}
		
		// 發送 AJAX 請求
		$.ajax({
			type: 'POST',
			url: '/order/addDetail', // 請替換為你的控制器的 URL
			data: JSON.stringify(formData), // 將數據轉換為 JSON 字符串
			contentType: 'application/json',
			success: function(response) {
				// 請求成功後的處理邏輯
				$('#productCategorySelect').val('');
				$('#orderProductSelect').val('').prop('disabled', true);
				$('#quantityInput').val('');
				$('#noteInput').val('');
				$('input[name="sauce"]').prop('checked', false).prop('disabled', true);
				$('#cheese').prop('checked', false).prop('disabled', true);
				$('#mushroom').prop('checked', false).prop('disabled', true);

				$('#addDetailsModal').modal('hide');
				loadOrderDetails(orderId);
				console.log(response);
			},
			error: function(xhr, status, error) {
				// 請求失敗時的處理邏輯
				console.error(error);
			}
		});
	});
});



//關閉insertDetails modal
$('.closeInsertDetails').click(function() {
	$('#productCategorySelect').val('');
	$('#orderProductSelect').val('').prop('disabled', true);
	$('#quantityInput').val('');
	$('#noteInput').val('');
	$('input[name="sauce"]').prop('checked', false).prop('disabled', true);
	$('#cheese').prop('checked', false).prop('disabled', true);
	$('#mushroom').prop('checked', false).prop('disabled', true);

	$('#addDetailsModal').modal('hide');

});

//insert 員工點餐







//loading update details list
function loadOrderDetails(orderId) {
	fetch('detailsSelectByID?orderId=' + orderId)
		.then(response => {
			if (response.status === 404) {
				// 如果未找到訂單詳情數據，則直接關閉模態框並顯示提示
				$('#orderDetailsModal').modal('hide');
				var page = currentPage;
				fetchOrders(page);
				Swal.fire('已無餐點明細');
				//加入update 將折扣碼金額變為0 金額才不會變負的
				updateDiscount(orderId)
				return; // 终止執行後續代碼
			}
			if (!response.ok) {
				throw new Error('請求失敗');
			}
			return response.json();
		})
		.then(response => {
			// 清空表格内容
			$('#orderDetailsTableBody').empty();

			// 遍歷返回的订单详情數據並將每一行添加到表格中
			response.forEach(detail => {
				var noteContent = detail.note;
				if (noteContent == '') {
					noteContent = '<input type="hidden" class="details-id-input" value="' + detail.detailsId + '">' + '<a href="javascript:void(0);" class="updateNote-btn" style="text-decoration: none; color:black;">' + '新增備註' + '</a>';
				} else {
					noteContent = '<input type="hidden" class="details-id-input" value="' + detail.detailsId + '">' + '<a href="javascript:void(0);" class="updateNote-btn" style="text-decoration: none; color:black;">' + noteContent + '</a>';
				}

				var quantityInput = '<input type="hidden" class="details-id-input" value="' + detail.detailsId + '">' +
					'<input type="hidden" class="order-id-input" value="' + detail.orderId + '">' +
					'<input type="number" class="quantity-input" style="position: relative; font-family: Arial; padding: 2px 8px 2px 8px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" value="' + detail.quantity + '">';


				var row = '<tr>' +
					'<td class="text-nowrap">' + detail.product + '</td>' +
					'<td class="text-nowrap">' + detail.unitPrice + '</td>' +
					'<td class="text-nowrap">' + quantityInput + '</td>' +
					'<td class="text-nowrap">' + detail.subtotal + '</td>' +
					'<td>' + noteContent + '</td>' +
					'<td>' +
					'<input type="hidden" class="order-id-input" value="' + detail.orderId + '">' + // 添加隐藏字段存储 orderId
					'<button class="btn btn-light border delete-btn" data-detail-id="' + detail.detailsId + '">刪除</button>' +
					'</td>' +
					'</tr>';
				$('#orderDetailsTableBody').append(row);
			});

			$('#orderDetailsModalLabel').text('Order Datail - ' + orderId);

			// 顯示模態框
			$('#orderDetailsModal').modal('show');
		})
		.catch(error => {
			console.error(error);
			// 在這裡處理请求失敗的情况
		});
}

