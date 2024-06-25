$(document).ready(function() {
	var pageSize = 10; // 顯示的筆數
	var currentPage = 0; // 目前頁碼

	// 初始化頁面 獲得第0頁的數據
	fetchOrders(currentPage);

	function fetchOrders(page) {
		$.ajax({
			url: 'orderSelectAll',
			type: 'GET',
			dataType: 'json',
			data: { page: page, size: pageSize }, // 分頁參數
			success: function(response) { // 請求成功時執行的function
				// 清空表格内容
				$('#orderTableBody').empty();
				// 遍歷返回的數據並將每一行添加到表格中
				$.each(response.content, function(index, order) {
					var discountContent = order.discount;
					if (discountContent == '') {
						discountContent = '<input type="hidden" class="order-id-input" value="' + order.orderId + '">' + '<button class="btn btn-white updateDiscount-btn">' + '新增優惠' + '</button>';
					} else {
						discountContent = '<input type="hidden" class="order-id-input" value="' + order.orderId + '">' +
							'<input type="hidden" class="paidAmount-id-input" value="' + order.paidAmount + '">' +
							'<a href="#" class="btn btn-white updateDiscount-btn" style="color: black;">' + discountContent + '</a>';
					}
					// 如果折扣包含 '已失效',文字變紅色
					if (discountContent.includes('已失效')) {
						discountContent = discountContent.replace('style="color: black;"', 'style="color: red;"'); // 将按钮的颜色样式替换为红色
					}

					var cancelNoteContent = order.cancelNote;
					var orderIdContent = order.orderId;
					if (cancelNoteContent !== '') {
						// 使用data-*屬性保存訂單ID
						cancelNoteContent = '<input type="hidden" class="order-id-input" value="' + orderIdContent + '">' + '<a href="#" class="updateCancelNote-btn" style="text-decoration: none; color:red;">' + cancelNoteContent + '</a>';
					}

					var row = '<tr>' +
						'<td><a href="#" class="order-id-link" data-order-id="' + order.orderId + '">' + order.orderId + '</a></td>' +
						'<td>' + order.account + '</td>' +
						'<td>' + order.oriAmount + '</td>' +
						'<td>' + discountContent + '</td>' +
						'<td>' + order.discountPrice + '</td>' +
						'<td>' + order.paidAmount + '</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial; padding: 2px 8px 2px 8px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="payment-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option value="現金">現金</option>' +
						'<option value="LinePay">LinePay</option>' +
						'</select>' +
						'</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial;  padding: 2px 8px 2px 8px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="pickup-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option  value="內用">內用</option>' +
						'<option value="外帶">外帶</option>' +
						'<option value="外送">外送</option>' +
						'</select>' +
						'</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial; padding: 2px 1px 2px 1px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="order-status-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option value="訂單待處理(未付款)">訂單待處理(未付款)</option>' +
						'<option value="訂單待處理(已付款)">訂單待處理(已付款)</option>' +
						'<option value="餐點製作中">餐點製作中</option>' +
						'<option value="餐點完成">餐點完成</option>' +
						'<option value="待取餐">待取餐</option>' +
						'<option value="外送中">外送中</option>' +
						'<option value="訂單完成">訂單完成</option>' +
						'<option value="訂單取消">訂單取消</option>' +
						'</select>' +
						'</td>' +
						'<td>' + cancelNoteContent + '</td>' +
						'</tr>';
					$('#orderTableBody').append(row);
				});

				// 更新分頁狀態
				updatePagination(response);

				// 更新下拉式選單的值
				$.each(response.content, function(index, order) {
					$('.payment-dropdown[data-order-id="' + order.orderId + '"]').val(order.payment);
					$('.pickup-dropdown[data-order-id="' + order.orderId + '"]').val(order.pickup);
					$('.order-status-dropdown[data-order-id="' + order.orderId + '"]').val(order.orderStatus);
				});
			},
			error: function(xhr, status, error) { // 请求失敗時執行的function
				console.error(error);
			}
		});

		//點選文字更新取消原因
		$(document).on('click', '.updateCancelNote-btn', function(e) {
			console.log("Clicked updateCancelNote-btn");

			e.preventDefault(); // 阻止默認行為，這樣不會跳轉到超連結的目標
			$('#cancelNoteModal').modal('show');
			console.log($('#cancelNoteModal'));

			var orderId = $(this).closest('tr').find('.order-id-input').val(); // 獲取訂單 ID

			console.log("Order ID:", orderId);

			$('#confirmCancelNoteBtn').off('click').on('click', function() {
				var cancelNote = $('#cancelNoteInput').val().trim();
				var inputText = $(this).val();

				if (cancelNote !== null && inputText.length <= 30) {
					updateCancelNoteRequest(orderId, cancelNote);
					$('#cancelNoteInput').val('');
					$('#cancelNoteModal').modal('hide');
					fetchOrders(currentPage);
				} else {
					Swal.fire("請輸入正確格式的取消原因");
				}
			});
		});

	}


	// 更新分頁狀態和顯示信息
	function updatePagination(response) {
		var totalPages = response.totalPages;
		var totalElements = response.totalElements;
		var currentPageNumber = response.number + 1;

		// 更新分頁信息顯示
		$('#paginationInfo').text('Total Records: ' + totalElements + ', Page: ' + currentPageNumber + ' / ' + totalPages);

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

		// 更新页码按钮
		updatePageButtons(currentPageNumber, totalPages);

	}

	// 上一頁按鈕點擊事件
	$('#prevPage').click(function() {
		if (!$(this).hasClass('disabled')) {
			currentPage--;
			fetchOrders(currentPage);
		}
	});

	// 下一頁按鈕點擊事件
	$('#nextPage').click(function() {
		if (!$(this).hasClass('disabled')) {
			currentPage++;
			fetchOrders(currentPage);
		}
	});

	// 第一頁按鈕點擊事件
	$('#firstPage').click(function() {
		if (!$(this).hasClass('disabled')) {
			currentPage = 0;
			fetchOrders(currentPage);
		}
	});

	// 最后一頁按鈕點擊事件
	$('#lastPage').click(function() {
		if (!$(this).hasClass('disabled')) {
			var totalPages = parseInt($('#paginationInfo').text().split('/')[1].trim());
			currentPage = totalPages - 1;
			fetchOrders(currentPage);
		}
	});

	// 更新页码按钮
	function updatePageButtons(currentPageNumber, totalPages) {
		// 更新页码按钮的显示内容
		$('#page1 a').text(currentPageNumber > 1 ? currentPageNumber - 1 : 1);
		$('#page2 a').text(currentPageNumber);
		$('#page3 a').text(currentPageNumber < totalPages ? currentPageNumber + 1 : totalPages);

		// 根据需要添加或删除页码按钮
		if (currentPageNumber === 1) {
			$('#page1').hide();
		} else {
			$('#page1').show();
		}

		if (currentPageNumber === totalPages || totalPages === 0) {
			$('#page3').hide();
		} else {
			$('#page3').show();
		}
	}

	// 新增的页码按钮点击事件
	$('.pagination-container').on('click', '#page1, #page2, #page3', function() {
		var page = parseInt($(this).text()) - 1;
		fetchOrders(page);

		// 更新當前頁碼
		currentPage = page;
	});

	$('#goToPageBtn').click(function() {
		var pageNumber = parseInt($('#pageNumberInput').val());
		var totalPages = parseInt($('#paginationInfo').text().split('/')[1].trim());

		// 檢查輸入的頁碼是否合法
		if (pageNumber >= 1 && pageNumber <= totalPages) {
			var page = pageNumber - 1;
			fetchOrders(page);
			currentPage = page;

			// 移除所有頁面項上的 active 類
			$('.pagination-container .page-item').removeClass('active');

			// 添加 active 類到指定的頁面項
			$('#page' + pageNumber).addClass('active');
		} else {
			// 提示用户輸入的頁碼無效
			Swal.fire({
				icon: "error",
				title: '請輸入有效頁碼 1 到 ' + totalPages + ' 頁！',
			});
		}
	});


	// 模糊查詢訂單
	function searchOrders(keyword) {
		$.ajax({
			url: 'orderSelectLIKE',
			type: 'GET',
			dataType: 'json',
			data: { keyword: keyword },
			success: function(response) {
				// 清空表格内容
				$('#orderTableBody').empty();

				var totalDataCount = response.length; // 獲取總共抓取到的數據筆數

				// 在表格之前添加一個元素來顯示總數
				$('#totalDataCount').text('查詢到 ' + totalDataCount + '筆資料');


				// 遍历返回的数据并将每一行添加到表格中
				$.each(response, function(index, order) {
					var discountContent = order.discount;
					if (discountContent == '') {
						discountContent = '<input type="hidden" class="order-id-input" value="' + order.orderId + '">' + '<button class="btn btn-white updateDiscount-btn">' + '新增優惠' + '</button>';
					} else {
						discountContent = '<input type="hidden" class="order-id-input" value="' + order.orderId + '">' +
							'<input type="hidden" class="paidAmount-id-input" value="' + order.paidAmount + '">' +
							'<a href="#" class="btn btn-white updateDiscount-btn" style="color: black;">' + discountContent + '</a>';
					}
					// 如果折扣包含 '已失效',文字變紅色
					if (discountContent.includes('已失效')) {
						discountContent = discountContent.replace('style="color: black;"', 'style="color: red;"'); // 将按钮的颜色样式替换为红色
					}

					var cancelNoteContent = order.cancelNote;
					var orderIdContent = order.orderId;
					if (cancelNoteContent !== '') {
						// 使用data-*屬性保存訂單ID
						cancelNoteContent = '<input type="hidden" class="order-id-input" value="' + orderIdContent + '">' + '<a href="#" class="updateCancelNote-btn" style="text-decoration: none; color:red;">' + cancelNoteContent + '</a>';
					}

					var row =
						'<tr>' +
						'<td><a href="#" class="order-id-link" data-order-id="' + order.orderId + '">' + order.orderId + '</a></td>' +
						'<td>' + order.account + '</td>' +
						'<td>' + order.oriAmount + '</td>' +
						'<td>' + discountContent + '</td>' +
						'<td>' + order.discountPrice + '</td>' +
						'<td>' + order.paidAmount + '</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial; padding: 2px 8px 2px 8px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="payment-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option value="現金">現金</option>' +
						'<option value="LinePay">LinePay</option>' +
						'</select>' +
						'</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial;  padding: 2px 8px 2px 8px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="pickup-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option value="內用">內用</option>' +
						'<option value="外帶">外帶</option>' +
						'<option value="外送">外送</option>' +
						'</select>' +
						'</td>' +
						'<td>' +
						'<select style="position: relative; font-family: Arial; padding: 2px 1px 2px 1px; border: 1px solid #ced4da; border-radius: 4px; background-color: #fff; color: #495057; appearance: none; -webkit-appearance: none; -moz-appearance: none;" class="order-status-dropdown custom-select" data-order-id="' + order.orderId + '">' +
						'<option value="訂單待處理(未付款)">訂單待處理(未付款)</option>' +
						'<option value="訂單待處理(已付款)">訂單待處理(已付款)</option>' +
						'<option value="餐點製作中">餐點製作中</option>' +
						'<option value="餐點完成">餐點完成</option>' +
						'<option value="待取餐">待取餐</option>' +
						'<option value="外送中">外送中</option>' +
						'<option value="訂單完成">訂單完成</option>' +
						'<option value="訂單取消">訂單取消</option>' +
						'</select>' +
						'</td>' +
						'<td>' + cancelNoteContent + '</td>' +
						'</tr>';

					$('#orderTableBody').append(row);

					// 更新下拉式選單的值
					$('.payment-dropdown[data-order-id="' + order.orderId + '"]').val(order.payment);
					$('.pickup-dropdown[data-order-id="' + order.orderId + '"]').val(order.pickup);
					$('.order-status-dropdown[data-order-id="' + order.orderId + '"]').val(order.orderStatus);
				});
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});

		//點選文字更新取消原因
		$(document).on('click', '.updateCancelNote-btn', function(e) {
			console.log("Clicked updateCancelNote-btn");

			e.preventDefault(); // 阻止默認行為，這樣不會跳轉到超連結的目標
			$('#cancelNoteModal').modal('show');
			console.log($('#cancelNoteModal'));

			var orderId = $(this).closest('tr').find('.order-id-input').val(); // 獲取訂單 ID

			console.log("Order ID:", orderId);

			$('#confirmCancelNoteBtn').off('click').on('click', function() {
				var cancelNote = $('#cancelNoteInput').val().trim();
				var inputText = $(this).val();

				if (cancelNote !== null && inputText.length <= 30) {
					updateCancelNoteRequest(orderId, cancelNote);
					$('#cancelNoteInput').val('');
					$('#cancelNoteModal').modal('hide');
					fetchOrders(currentPage);
				} else {
					Swal.fire("請輸入正確格式的取消原因");
				}
			});
		});
	}

	// 監聽 input 事件，執行模糊查詢
	$('#searchInput').on('input', function() {
		var keyword = $(this).val().trim().toLowerCase();

		if (keyword === '') {
			// 如果關鍵字為空值，自動整理畫面為 /orderSelectAll

			fetchOrders(currentPage);
			$('#totalDataCount').hide();
		} else {
			searchOrders(keyword);
			$('#totalDataCount').show();
		}
	});



	// 將點擊事件綁定到每個 order-id-link 元素
	$(document).on('click', '.order-id-link', function(event) {

		event.preventDefault();

		var orderId = $(this).data('order-id');

		// 發送Ajax請求到controller
		$.ajax({
			url: 'detailsSelectByID',
			type: 'GET',
			dataType: 'json',
			data: { orderId: orderId },
			success: function(response) {
				// 清空表格內容
				$('#orderDetailsTableBody').empty();

				// 遍歷返回的訂單詳情數據並將每一行添加到表格中
				$.each(response, function(index, detail) {
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
					console.log('detail.orderId:', detail.orderId);

					$('#orderDetailsTableBody').append(row);
				});

				$('#orderDetailsModalLabel').text('Order Datail - ' + orderId);

				$('#orderIdInput').val(orderId);


				// 顯示模態框
				$('#orderDetailsModal').modal('show');
			},
			error: function(xhr, status, error) {
				if (xhr.status === 404) {
					// 如果返回404，则显示警告提示
					Swal.fire('已無餐點明細');
				} else {
					console.error(error);
					// 在這裡處理請求失敗的情況
				}
			}
		});
	});

	$('.close').click(function() {
		$('#orderDetailsModal').modal('hide');
		$('#discountSelect').empty();
		$('.discountPrice').text('');
		$('#updateDiscountModal').modal('hide');
		$('#cancelNoteInput').val('');
		$('#cancelNoteModal').modal('hide');
		var page = currentPage;
		fetchOrders(page);
	});

	//delete ajax
	$(document).on('click', '.delete-btn', function() {

		if (!confirm('確定要刪除嗎？')) {
			return;
		}

		var detailsId = $(this).data('detail-id');
		var orderId = $(this).closest('tr').find('.order-id-input').val();
		console.log('orderrrr' + orderId);

		fetch('orderDetails/' + detailsId, {
			method: 'DELETE'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('删除失敗');
				}
				return response.json();
			})
			.then(data => {
				console.log('删除成功:', data);
				// 調用刪除後重新加載訂單明細
				loadOrderDetails(orderId);
			})
			.catch(error => {
				console.error('删除失敗:', error);
			});
	});

	// 加載訂單明细數據
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

	//update order ajax
	//1.update discountPrice after delete all details
	function updateDiscount(orderId) {
		$.ajax({
			url: 'clearDiscount',
			type: 'PUT',
			data: {
				orderId: orderId,
			},
			success: function() {
				// 处理成功响应的逻辑
				console.log("Discount updated successfully!");
				fetchOrders(currentPage);
			},
			error: function(xhr, status, error) {
				// 处理错误响应的逻辑
				console.error(error);
			}
		});
	}

	//2.update discount (search -> show all discount)
	$(document).on('click', '.updateDiscount-btn', function() {
		//新增判斷 如果總金額為0 不能增加折扣碼
		var paidAmount = parseFloat($(this).closest('tr').find('.paidAmount-id-input').val());
		console.log('paidAmount::' + paidAmount);
		if (paidAmount === 0) {
			Swal.fire('總金額為0，無法進行優惠設定！');
		} else {

			$('#updateDiscountModal').modal('show');

			orderId = $(this).closest('tr').find('.order-id-input').val();
			fetchDiscountList();
		}

	});

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

	//將選項顯示在option裡
	function fillDiscountOptions(discountList) {
		var selectOptions = '<option value="點擊下拉">點擊下拉</option>';
		discountList.forEach(function(promotion) {
			selectOptions += '<option value="' + promotion.promotions_discountcode + '">' + promotion.promotions_discountcode + '</option>';
		});
		//選擇折扣 自動調整金額
		$('#discountSelect').change(function() {
			var selectedDiscountCode = $(this).val();
			var selectedPromotion = discountList.find(function(promotion) {
				return promotion.promotions_discountcode === selectedDiscountCode;
			});
			if (selectedPromotion) {
				$('#discountPrice').show().find('.float-right').text('折扣金額: ' + selectedPromotion.promotions_discount);
			} else {
				$('#discountPrice').hide();
			}
		});

		$('#discountSelect').html(selectOptions);


		//按下確定後 更新折扣碼及價格
		$(document).on('click', '#confirmDiscountBtn', function() {
			var discountCode = $('#discountSelect').val();
			var alertShown = false;

			if (!alertShown && discountCode === '點擊下拉') {
				Swal.fire("尚未選擇優惠折扣碼");
				alertShown = true;
				return;
			}

			var selectedPromotion = discountList.find(function(promotion) {
				return promotion.promotions_discountcode === discountCode;
			});
			var discountPrice = selectedPromotion ? selectedPromotion.promotions_discount : '';
			// 發送PUT请求

			$.ajax({
				url: '/order/updateDiscount',
				type: 'PUT',
				data: {
					orderId: orderId,
					discount: discountCode,
					discountPrice: discountPrice
				},
				success: function(response) {
					console.log("Discount updated successfully!");
					$('#updateDiscountModal').modal('hide');
					fetchOrders(currentPage);

				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	}

	// 3.update payment,pickup,orderStatus,cancelNote
	$(document).on('change', '.payment-dropdown, .pickup-dropdown, .order-status-dropdown', function() {
		var orderId = $(this).data('order-id');
		var className = $(this).attr('class');
		if (className.includes('payment-dropdown')) {
			var field = 'payment';
		} else if (className.includes('pickup-dropdown')) {
			var field = 'pickup';
		} else if (className.includes('order-status-dropdown')) {
			var field = 'orderStatus';
		}
		var value = $(this).val();

		//if cancel order,update cancelNote
		if (field !== 'orderStatus' && value !== '訂單取消') {
			sendUpdateRequest(orderId, field, value);
		} else if (field === 'orderStatus' && value !== '訂單取消') {
			var cancelNote = '  ';
			updateCancelNoteRequest(orderId, cancelNote);
			sendUpdateRequest(orderId, field, value);
			fetchOrders(currentPage);
		} else {
			$('#cancelNoteModal').modal('show');

			$('#confirmCancelNoteBtn').off('click').on('click', function() {
				var cancelNote = $('#cancelNoteInput').val().trim();
				var inputText = $(this).val();

				if (cancelNote !== null && inputText.length <= 30) {
					sendUpdateRequest(orderId, field, value);
					updateCancelNoteRequest(orderId, cancelNote);
					$('#cancelNoteInput').val('');
					$('#cancelNoteModal').modal('hide');
					fetchOrders(currentPage);
				} else {
					Swal.fire("請輸入正確格式的取消原因");
				}
			});
		}
	});

	// 更新取消原因
	function updateCancelNoteRequest(orderId, cancelNote) {
		$.ajax({
			url: '/order/updateCancelNote',
			type: 'PUT',
			data: {
				orderId: orderId,
				cancelNote: cancelNote
			},
			success: function(response) {
				console.log("Cancel note updated successfully!");
				fetchOrders(currentPage);
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}



	//更新PPO的function
	function sendUpdateRequest(orderId, field, value) {
		$.ajax({
			url: '/order/updatePPO',
			type: 'PUT',
			data: {
				orderId: orderId,
				[field]: value
			},
			success: function(response) {
				console.log("Update successful!");
				fetchOrders(currentPage);
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}


	//更新取消原因
	function updateCancelNoteRequest(orderId, cancelNote) {
		$.ajax({
			url: '/order/updateCancelNote',
			type: 'PUT',
			data: {
				orderId: orderId,
				cancelNote: cancelNote
			},
			success: function(response) {
				console.log("Cancel note updated successfully!");
				fetchOrders(currentPage);
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}

	//exportCSV,EXCEL
	//點擊之後,選擇格式
	$('.export-btn').click(function() {
		$('#exportModal').modal('show');
	});

	// 点击导出格式按钮触发相应操作
	$('.export-format-btn').click(function() {
		var format = $(this).data('format');
		var keyword = $('#searchInput').val().trim();
		if (keyword != '') {
			if (format === 'excel') {
				exportExcel();
			} else if (format === 'json') {
				exportJson();
			} else {
				exportXml();
			}

		} else {
			Swal.fire('請先 "查詢" 想要匯出的資料！');
		}

		console.log('匯出格式：' + format);

		$('#exportModal').modal('hide');
	});


	function exportExcel() {
		var keyword = $('#searchInput').val().trim();
		$.ajax({
			url: '/order/exportExcel',
			type: 'POST',
			data: {
				keyword: keyword
			},
			success: function(response) {
				console.log(response);
				Swal.fire({
					title: "匯出成功！!",
					icon: "success"
				});
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}

	function exportJson() {
		var keyword = $('#searchInput').val().trim();
		$.ajax({
			url: '/order/exportJson',
			type: 'POST',
			data: {
				keyword: keyword
			},
			success: function(response) {
				console.log(response);
				Swal.fire({
					title: "匯出成功！!",
					icon: "success"
				});
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}

	function exportXml() {
		var keyword = $('#searchInput').val().trim();
		$.ajax({
			url: '/order/exportXml',
			type: 'POST',
			data: {
				keyword: keyword,
			},
			success: function(response) {
				console.log(response);
				Swal.fire({
					title: "匯出成功！!",
					icon: "success"
				});
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	}


	$('.closeExport').click(function() {
		$('#exportModal').modal('hide');
	});





});

function goToOrderByEmployee() {
	// 使用 window.location.href 将页面重定向到指定的JSP页面
	window.location.href = '/order/orderByEmployee';
}