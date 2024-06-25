// 計算總金額
var totalAmount = 0;

// 顯示Pizza訂單模型
function showPizzaOrderModal(button) {
	var myModal = new bootstrap.Modal(document.getElementById('pizzaOrderModal'));
	myModal.show();
	// 將按鈕元素存儲在全局變量中，以便在後續操作中使用
	window.currentButton = button;
	resetPizzaForm();
}

// 顯示烤麵條訂單模型
function showBakedNoodlesOrderModal(button) {
	var myModal = new bootstrap.Modal(document.getElementById('bakedNoodlesOrderModal'));
	myModal.show();
	// 將按鈕元素存儲在全局變量中，以便在後續操作中使用
	window.currentButton = button;
	resetBakedNoodlesForm();
}
// 顯示烤薯條訂單模型
function showBakedFriesOrderModal(button) {
	var myModal = new bootstrap.Modal(document.getElementById('bakedFriesOrderModal'));
	myModal.show();
	// 將按鈕元素存儲在全局變量中，以便在後續操作中使用
	window.currentButton = button;
	resetBakedFriesForm();
}

//顯示一般商品訂單模型
function showOrderModal(button) {
	var myModal = new bootstrap.Modal(document.getElementById('orderModal'));
	myModal.show();
	// 將按鈕元素存儲在全局變量中，以便在後續操作中使用
	window.currentButton = button;
	resetForm();
}


// 當Pizza訂單模型中新增訂單時
function addPizzaOrder() {
	var button = window.currentButton;
	var itemContainer = button.closest('.store-item');

	var productId = itemContainer.querySelector('input[name="productId"]').value;
	var product = itemContainer.querySelector('.mb-3').innerHTML;
	var priceText = itemContainer.querySelector('.text-primary').innerHTML;
	var price = parseFloat(priceText.replace('$', ''));

	var sauce = document.querySelector('input[name="sauce"]:checked');
	var cheese = document.getElementById('cheese').checked ? "加起司" : "";
	var mushroom = document.getElementById('mushroom').checked ? "加洋菇" : "";
	var quantity = document.getElementById('quantity').value;

	if (!sauce) {
		var alertDiv = document.createElement("div");
		alertDiv.classList.add("alert", "alert-danger", "alert-dismissible", "fade", "show");
		alertDiv.innerHTML = `
	            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	            請選擇醬料。
	        `;
		document.getElementById("pizzaOrderModal").querySelector(".modal-body").prepend(alertDiv);
		return;
	}
	sauce = sauce.value;

	var extraCost = 0;
	if (cheese !== "") {
		extraCost += 30;
	}
	if (mushroom !== "") {
		extraCost += 30;
	}

	var totalPrice = price + extraCost;

	var note = sauce + " " + cheese + " " + mushroom;


	var newRow = document.createElement("tr");
	newRow.innerHTML = "<input type='hidden' name='productId' value='" + productId + "'>" +
		"<td nowrap>" + product + "</td>" +
		"<td>" + note + "</td>" +
		"<td>" + totalPrice + "</td>" +
		"<td><input type='number' value='" + quantity + "' min='1' max='10' oninput='validity.valid||(value=1);' onchange='updateItemTotal(this, " + price + ", " + extraCost + "); updateTotalAmount();'></td>" +
		'<td scope="col" class="remove-item"><i class="fa-regular fa-trash-can" onclick="removeOrderItem(event, this)" style="cursor: pointer" onmouseover="this.style.color=\'blue\'" onmouseout="this.style.color=\'black\'"></i></td>';


	document.getElementById("orderDetails").appendChild(newRow);

	updateTotalAmount();

	updateCartItemCount(1);

	var modal = bootstrap.Modal.getInstance(document.getElementById('pizzaOrderModal'));
	modal.hide();
}

// 當烤麵條訂單模型中新增訂單時
function addBakedNoodlesOrder(button) {
	var button = window.currentButton;
	var itemContainer = button.closest('.store-item');

	var productId = itemContainer.querySelector('input[name="productId"]').value;
	var product = itemContainer.querySelector('.mb-3').innerHTML;
	var priceText = itemContainer.querySelector('.text-primary').innerHTML;
	var price = parseFloat(priceText.replace('$', ''));

	var sauce = document.querySelector('input[name="sauce"]:checked');
	var mushroom = document.getElementById('mushroomBakedNoodles').checked ? "加洋菇" : "";
	var quantity = document.getElementById('quantityBakedNoodles').value;

	if (!sauce) {
		var alertDiv = document.createElement("div");
		alertDiv.classList.add("alert", "alert-danger", "alert-dismissible", "fade", "show");
		alertDiv.innerHTML = `
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            請選擇醬料。
        `;
		document.getElementById("pizzaOrderModal").querySelector(".modal-body").prepend(alertDiv);
		return;
	}
	sauce = sauce.value;

	var extraCost = 0;
	if (mushroom !== "") {
		extraCost += 30;
	}

	var note = sauce + " " + mushroom;

	var totalPrice = price + extraCost;

	var newRow = document.createElement("tr");
	newRow.innerHTML = "<input type='hidden' name='productId' value='" + productId + "'>" +
		"<td nowrap>" + product + "</td>" +
		"<td>" + note + "</td>" +
		"<td>" + totalPrice + "</td>" +
		"<td><input type='number' value='" + quantity + "' min='1' max='10' oninput='validity.valid||(value=1);' onchange='updateItemTotal(this, " + price + ", " + extraCost + "); updateTotalAmount();'></td>" +
		'<td scope="col" class="remove-item"><i class="fa-regular fa-trash-can" onclick="removeOrderItem(event, this)" style="cursor: pointer" onmouseover="this.style.color=\'blue\'" onmouseout="this.style.color=\'black\'"></i></td>';


	document.getElementById("orderDetails").appendChild(newRow);


	updateTotalAmount();

	updateCartItemCount(1);

	var modal = bootstrap.Modal.getInstance(document.getElementById('bakedNoodlesOrderModal'));
	modal.hide();
}

// 當焗烤薯條訂單模型中新增訂單時
function addBakedFriesOrder(button) {
	var button = window.currentButton;
	var itemContainer = button.closest('.store-item');

	var productId = itemContainer.querySelector('input[name="productId"]').value;
	var product = itemContainer.querySelector('.mb-3').innerHTML;
	var priceText = itemContainer.querySelector('.text-primary').innerHTML;
	var price = parseFloat(priceText.replace('$', ''));

	var mushroom = document.getElementById('mushroomBakedNoodles').checked ? "加洋菇" : "";
	var quantity = document.getElementById('quantityBakedFries').value;

	var extraCost = 0;
	if (mushroom !== "") {
		extraCost += 30;
	}

	var note = mushroom;

	var totalPrice = price + extraCost;

	var newRow = document.createElement("tr");
	newRow.innerHTML = "<input type='hidden' name='productId' value='" + productId + "'>" +
		"<td nowrap>" + product + "</td>" +
		"<td>" + note + "</td>" +
		"<td>" + totalPrice + "</td>" +
		"<td><input type='number' value='" + quantity + "' min='1' max='10' oninput='validity.valid||(value=1);' onchange='updateItemTotal(this, " + price + ", " + extraCost + "); updateTotalAmount();'></td>" +
		'<td scope="col" class="remove-item"><i class="fa-regular fa-trash-can" onclick="removeOrderItem(event, this)" style="cursor: pointer" onmouseover="this.style.color=\'blue\'" onmouseout="this.style.color=\'black\'"></i></td>';


	document.getElementById("orderDetails").appendChild(newRow);

	updateTotalAmount();

	updateCartItemCount(1);

	var modal = bootstrap.Modal.getInstance(document.getElementById('bakedFriesOrderModal'));
	modal.hide();
}

// 一般產品新增訂單時
function addOrder(button) {
	var button = window.currentButton;
	var itemContainer = button.closest('.store-item');

	var productId = itemContainer.querySelector('input[name="productId"]').value;
	var product = itemContainer.querySelector('.mb-3').innerHTML;
	var priceText = itemContainer.querySelector('.text-primary').innerHTML;
	var price = parseFloat(priceText.replace('$', ''));


	var quantity = document.getElementById('addOrderQuantity').value;
	var note = document.getElementById('orderNotes').value;

	var totalPrice = price;
	var extraCost = 0;

	var newRow = document.createElement("tr");
	newRow.innerHTML = "<input type='hidden' name='productId' value='" + productId + "'>" +
		"<td nowrap>" + product + "</td>" +
		"<td>" + note + "</td>" +
		"<td>" + totalPrice + "</td>" +
		"<td><input type='number' value='" + quantity + "' min='1' max='10' oninput='validity.valid||(value=1);' onchange='updateItemTotal(this, " + price + ", " + extraCost + "); updateTotalAmount();'></td>" +
		'<td scope="col" class="remove-item"><i class="fa-regular fa-trash-can" onclick="removeOrderItem(event, this)" style="cursor: pointer" onmouseover="this.style.color=\'blue\'" onmouseout="this.style.color=\'black\'"></i></td>';


	document.getElementById("orderDetails").appendChild(newRow);

	updateTotalAmount();

	updateCartItemCount(1);

	var modal = bootstrap.Modal.getInstance(document.getElementById('orderModal'));
	modal.hide();
}


// 更新單個商品的小計
function updateItemTotal(input, price, extraCost) {
	var row = input.parentNode.parentNode;
	//var quantity = parseInt(input.value);
	var totalPrice = price + extraCost;
	row.cells[2].innerText = totalPrice;
}

// 更新總金額
function updateTotalAmount() {
    var totalAmountElement = document.getElementById('totalAmount');
    var rows = document.getElementById("orderDetails").rows;
    var totalAmount = 0;
    
    for (var i = 0; i < rows.length; i++) {
        var price = parseFloat(rows[i].cells[2].innerText);
        var quantity = parseInt(rows[i].cells[3].querySelector('input').value);
        var totalPrice = price * quantity;
        totalAmount += totalPrice;
    }
    
    totalAmountElement.innerText = '$' + totalAmount;
}

// 檢查input裡面數字的範圍
function checkInputRange(input) {
	var value = parseInt(input.value);
	if (isNaN(value) || value < 1) {
		input.value = 1;
	} else if (value > 10) {
		input.value = 10;
		Swal.fire("請輸入1到10之間的數字。");
	}
}

// 刪除訂單項目
function removeOrderItem(event, item) {
	var row = item.parentNode.parentNode;
	row.parentNode.removeChild(row);
	updateTotalAmount();
	updateCartItemCount(-1);
	event.preventDefault();
}

// 重置Pizza訂單表單
function resetPizzaForm() {
	// 重置選擇框的值為預設值
	var sauceOptions = document.querySelectorAll('#pizzaOrderModal input[name="sauce"]');
	sauceOptions.forEach(option => {
		option.checked = false;
	});
	document.getElementById('cheese').checked = false;
	document.getElementById('mushroom').checked = false;
	document.getElementById('quantity').value = 1;
}

// 重置BakedNoodles訂單表單
function resetBakedNoodlesForm() {
	// 重置選擇框的值為預設值
	var sauceOptions = document.querySelectorAll('#bakedNoodlesOrderModal input[name="sauce"]');
	sauceOptions.forEach(option => {
		option.checked = false;
	});
	document.getElementById('mushroomBakedNoodles').checked = false;
	document.getElementById('quantityBakedNoodles').value = 1;
}

// 重置BakedFries訂單表單
function resetBakedFriesForm() {
	// 重置選擇框的值為預設值
	document.getElementById('mushroomBakedFries').checked = false;
	document.getElementById('quantityBakedFries').value = 1;
}

// 重置一般訂單表單
function resetForm() {
	// 重置表單的值為預設值
	document.getElementById('addOrderQuantity').value = 1;
	document.getElementById('orderNotes').value = '';
}


//cart相關
function showCartModal(button) {
	var myModal = new bootstrap.Modal(document.getElementById('cartModal'));
	myModal.show();
	// 將按鈕元素存儲在全局變量中，以便在後續操作中使用
	window.currentButton = button;
	resetPizzaForm();
}


// 更新购物车图标上的数量
function updateCartItemCount(change) {
	var cartItemCountSpan = document.getElementById("cartItemCount");
	var currentCount = parseInt(cartItemCountSpan.textContent);
	var newCount = currentCount + change;
	cartItemCountSpan.textContent = newCount > 0 ? newCount : 0;
}

//監聽事件 有餐點明細才可以查詢付款方式
document.getElementById('checkOrderButton').addEventListener('click', function() {
	var orderDetails = document.getElementById('orderDetails');
	var rows = orderDetails.getElementsByTagName('tr');

	if (rows.length > 0) {
		var cartModal = bootstrap.Modal.getInstance(document.getElementById('cartModal'));
		cartModal.hide();

		var paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
		paymentModal.show();
	} else {
		Swal.fire('請先選擇餐點！');
	}
});

function applyDiscount() {
	var paymentMethods = document.getElementsByName('paymentMethod');
	var selectedPaymentMethod = null;
	var discount = document.getElementById('discount').value.trim();
	var account = document.getElementById('account').value;
	var discountPrice = document.getElementById('discountPrice').value.trim();
	var pickup = document.getElementById('pickup').value;
	var orderStatus = document.getElementById('orderStatus').value;

	// 獲取選中的付款方式
	for (var i = 0; i < paymentMethods.length; i++) {
		if (paymentMethods[i].checked) {
			selectedPaymentMethod = paymentMethods[i].value;
			break;
		}
	}

	if (!selectedPaymentMethod) {
		Swal.fire('請選擇付款方式');
		return;
	}


	// 獲取表單數據
	const orderDetails = [];
	const orderRows = document.getElementById('orderDetails').getElementsByTagName('tr');
	for (let i = 0; i < orderRows.length; i++) {
		const cells = orderRows[i].cells;
		const inputs = orderRows[i].querySelectorAll('input[type="hidden"]');
		let productId, product, note, totalPrice, quantity;
		for (let j = 0; j < inputs.length; j++) {
			const input = inputs[j];
			switch (input.name) {
				case 'productId':
					productId = input.value.trim();
					break;
			}
		}
		for (let j = 0; j < cells.length; j++) {
			const cell = cells[j];
			if (j === 0) {
				product = cell.textContent;
			} else if (j === 1) {
				note = cell.textContent;
			} else if (j === 2) {
				totalPrice = cell.textContent;
			} else if (cell.querySelector('input[type="number"]')) {
				quantity = cell.querySelector('input[type="number"]').value;
			}
		}
		orderDetails.push({ productId, product, note, totalPrice, quantity });
	}

	// 構建POST數據
	const postData = {
		discount: discount,
		payment: selectedPaymentMethod,
		account: account,
		discountPrice: discountPrice,
		pickup: pickup,
		orderStatus: orderStatus,
		orderDetails: orderDetails
	};

	fetch('/order/createPizzaOrder', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(postData)
	})
		.then(response => response.json())
		.then(data => {
			if (data.message === "Order inserted successfully.") {
				console.log('訂單插入成功');
				if (selectedPaymentMethod === '現金') {
					window.location.href = '/order/historyOrder';
				}

				// 直接重定向到 LinePay 的支付頁面
				if (selectedPaymentMethod === 'LinePay') {
					window.location.href = '/order/linepayOrder';
				}
			} else {
				throw new Error('Order creation failed');
			}
		})
		.catch(error => {
			console.error('錯誤:', error);
		});
}