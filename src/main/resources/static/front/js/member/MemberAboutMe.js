// 切換 修改會員資訊 跟 關於我畫面 的方法
function closeAbout() {
	$('#updateme').css('display', 'none');
	$('#aboutme').removeAttr("style");
}
function updateIndex() {
	$('#updateme').css('display', 'block');
	$('#aboutme').css('display', 'none');
}

function off() {
	$('#updateme').css('display', 'none');
	$('#aboutme').removeAttr("style");
}



// (登入後)會員更改密碼
function updatePwd(account) {
	let beforePwd = $('#beforePwd').val();
	let afterPwd = $('#afterPwd').val();
	let againPwd = $('#againPwd').val();
	if (afterPwd === againPwd) {

		$.ajax({
			type: 'post',
			url: '/member/Member.UpdatePwd',
			data: {
				"account": account,
				"beforePwd": beforePwd,
				"afterPwd": afterPwd
				
			},
			success: function () {
				alert("修改成功!");
				window.location.href = "/member/MemberAboutMe";
			},
			error: function () {
				alert("已取消修改密碼!");
				window.location.href = "/member/MemberAboutMe";
			}
		});
	} else {
		$('#err').append('再次確認密碼有誤!')
	}
}



// 預覽圖片
function previewUserFile() {

	const fileInput = document.querySelector('#UpmPhoto');
	const previewImage = document.querySelector(`#changePhoto`);

	const file = fileInput.files[0];

	if (file) {
		const reader = new FileReader();
		reader.onload = function (event) {
			previewImage.src = event.target.result;
		}
		reader.readAsDataURL(file);
	} else {
		previewImage.src = '/images/member/user.png';
	}
}



// 更新會員資訊
function updateMe() {
	// A.先取到Offcanvas內所有欄位的資料,這邊用formData因為我要傳檔案QAQ
	let formData = new FormData();
	formData.append('account', $('#Upaccount').val());
	formData.append('mName', $('#UpmName').val());
	formData.append('mEmail', $('#UpmEmail').val());
	formData.append('mPhone', $('#UpmPhone').val());
	formData.append('mPhoto', $('#UpmPhoto')[0].files[0]);
	formData.append('mbirthday', $('#Upmbirthday').val());

	// B.把productData傳到後臺處理
	$.ajax({
		url: "/member/Member.UpdateDetail",
		method: 'post',
		contentType: false, // 必須設為false,才能上傳檔案
		processData: false,  // 必須設為false,才能上傳檔案
		data: formData,
		success: function (response) {
			alert("修改成功!");
			window.location.href = "/member/MemberAboutMe";
			// let table = $('#example').DataTable();
			// let row = table.row(function (index, data, node) {
			// 	return data.productId === response.productId;
			// });
			// if (row.length) {
			// 	row.data().productId = response.productId;
			// 	row.data().categoryName = response.categoryName;
			// 	row.data().productName = response.productName;
			// 	row.data().productDesc = response.productDesc;
			// 	row.data().productImg_url = response.productImg_url;
			// 	row.data().productPrice = response.productPrice;
			// 	row.data().productQuantity = response.productQuantity;
			// 	row.data().stateId = response.stateId;
			// 	row.data().stateName = response.stateName;
			// 	row.data().productCreateDate = response.productCreateDate;
			// 	row.invalidate().draw(); // 重新渲染
			// }
		}
	})
}
