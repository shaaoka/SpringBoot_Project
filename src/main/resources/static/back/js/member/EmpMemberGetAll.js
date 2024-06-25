var indexPage = 1;
$(function() {

	showByName('none');
	loadPage(indexPage);

	$('#select').on('input', function() {
		var keyword = $(this).val().trim().toLowerCase();

		if (keyword === "") {
			loadPage(indexPage);
			showAll('block');
			showByName('none');

		} else {
			loadByNamePage(keyword);
			showAll('none');
			showByName('block');
		}
	});


	$('.close').click(function() {
		$('#memberInsertModal').modal('hide');
		$('#memberDetailsModal').modal('hide');
		$('#memberUpdateDetailsModal').modal('hide');
		$('#memberDownloadModal').modal('hide');
	});


	// 將點擊事件綁定到每個 member-id-link 元素
	// 單筆查詢模板
	$(document).on('click', '.member-id-link', function(event) {

		event.preventDefault(); // 阻止默認行為，這樣不會跳轉到超連結的目標

		var maid = $(this).data('member-id');

		// 發送Ajax請求到controller
		$.ajax({
			url: '/emp/Member.SelectOneByID',
			type: 'GET',
			dataType: 'json',
			data: { id: maid },
			success: function(response) {
				// 清空表格內容
				$('#memberDetailsTableBody').empty();
				console.log(response.detailBean);
				var row =
					'<tr><td class="text-nowrap">會員頭像</td>' + '<td class="text-nowrap"><img src="' + response.detailBean.mPhoto + '" class="userphoto"></td></tr>' +
					'<tr><td class="text-nowrap">會員名稱</td>' + '<td class="text-nowrap">' + response.detailBean.mName + '</td></tr>' +
					'<tr><td class="text-nowrap">會員帳號</td>' + '<td class="text-nowrap">' + response.mAccount + '</td></tr>' +
					'<tr><td class="text-nowrap">會員密碼</td>' + '<td class="text-nowrap">' + response.mPassword + '</td></tr>' +
					'<tr><td class="text-nowrap">電子信箱</td>' + '<td class="text-nowrap">' + response.detailBean.mEmail + '</td></tr>' +
					'<tr><td class="text-nowrap">手機號碼</td>' + '<td class="text-nowrap">' + response.detailBean.mPhone + '</td></tr>' +
					'<tr><td class="text-nowrap">會員生日</td>' + '<td class="text-nowrap">' + response.detailBean.mbirthday + '</td></tr>' +
					'<tr><td class="text-nowrap">註冊日期</td>' + '<td class="text-nowrap">' + response.detailBean.registrationDate + '</td></tr>';

				if (response.hidden === 0) {
					row += '<tr><td class="text-nowrap">帳號狀態</td>' + '<td class="text-nowrap" style="color:red;">已被封鎖並刪除</td></tr>';
				} else {
					if (response.permissions === 0) {
						row += '<tr><td class="text-nowrap">帳號狀態</td>' + '<td class="text-nowrap" style="color:red;">已封鎖</td></tr>';
					} else {
						row += '<tr><td class="text-nowrap">帳號狀態</td>' + '<td class="text-nowrap" style="color:green;">已啟用</td></tr>';
					}
				}

				$('#memberDetailsTableBody').append(row);

				$('#memberDetailsModalLabel').text('會員 ID - ' + maid);

				$('#goToUpdateDetailsModal').val(maid);

				$('#updateMaid').val(maid);


				// 顯示模態框
				$('#memberDetailsModal').modal('show');
			},
			error: function(xhr, status, error) {
				if (xhr.status === 404) {
					// 如果返回404，则显示警告提示
					alert('已無此訊息');
				} else {
					console.error(error);
					// 在這裡處理請求失敗的情況
				}
			}
		});
	});


	$('#goToUpdateDetailsModal').click(function() {
		$('#memberDetailsModal').modal('hide');
		let maid = $(this).val();
		openMemberUpdateModal(maid);
	});

});

function showByName(type) {
	var table = document.getElementById('showmemberByName');
	var tablePage = document.getElementById('showpageByName');
	if (type === 'none') {
		console.log('no');
		table.style.display = 'none';
		tablePage.style.display = 'none';
	} else {
		console.log('show');
		table.style.display = null;
		tablePage.style.display = null;
	}
}

function showAll(type) {
	var table = document.getElementById('showmember');
	var tablePage = document.getElementById('showpage');
	if (type === 'none') {
		console.log('all no');
		table.style.display = 'none';
		tablePage.style.display = 'none';
	} else {
		console.log('all show');
		table.style.display = null;
		tablePage.style.display = null;

	}
}

function loadPage(indexPage) {
	$.ajax({
		type: 'get',
		url: '/emp/MemberGetAll/' + indexPage,
		contentType: 'application/json',
		success: function(response) {
			$('#showmember').empty("");
			if (response == null) {
				$('table').prepend('<tr><td class="border-bottom-0">no result</td></tr>');
			} else {
				var table = $('#showmember');
				table.append(`<thead class="text-dark fs-4"><tr>`
					+ `<th class="border-bottom-0">會員ID</th>`
					+ `<th class="border-bottom-0">會員帳號</th>`
					+ `<th class="border-bottom-0">會員名稱</th>`
					+ `<th class="border-bottom-0">會員頭貼</th>`
					+ `<th class="border-bottom-0">帳號權限</th>`
					+ `<th class="border-bottom-0">修改</th>`
					+ `<th class="border-bottom-0">刪除</th></tr></thead><tbody>`);

				$.each(response, function(i, n) {
					console.log(response);
					var tr = `<tr><td class="border-bottom-0">` + n.maid + `</td>`
						+ `<td class="border-bottom-0">` + n.mAccount + `</td>`
						+ `<td class="border-bottom-0"><a href='#' class='member-id-link' data-member-id='` + n.maid + "'>" + n.detailBean.mName + `</a></td>`;
					if (n.detailBean.mPhoto == null) {
						tr += `<td class="border-bottom-0"><img src="/images/member/user.png" class="userphoto"></td>`;
					} else {
						tr += `<td class="border-bottom-0">` + `<img src="` + n.detailBean.mPhoto + `" class="userphoto"></td>`;
					}
					if (n.hidden == 0) {

						tr += `<td> <label> 已封鎖並刪除　　　</label>`;

					}
					else if (n.hidden == 1) {
						if (n.permissions == 0 && n.hidden == 1) {
							tr += `<td> <label> <input type="radio" name="permissions` + i + `" value="0" onchange="change('` + n.mAccount + `', this.value)" checked>已封鎖　　　</label>`
								+ `<label> <input type="radio" name="permissions` + i + `" value="1" required onchange="change('` + n.mAccount + `', this.value)">已啟用</label></td > `;
						} else if (n.permissions == 1 && n.hidden == 1) {
							tr += `<td> <input type="radio" name="permissions` + i + `" value="0" onchange="change('` + n.mAccount + `', this.value)">已封鎖　　　`
								+ `<input type="radio" name="permissions` + i + `" value="1" required onchange="change('` + n.mAccount + `', this.value)" checked>已啟用</td > `;
						}
					}

					// tr += `</form > `;
					if (n.hidden == 0) {
						tr += `<td class="border-bottom-0">　　　</td>`;
						tr += `<td class="border-bottom-0"><button class="btn btn-danger" type="submit" onclick="rebackAccount('` + n.mAccount + `')">復原</button></td >`;
					} else if (n.hidden == 1) {
						tr += `<td class="border-bottom-0"><button class="btn btn-dark" type='submit'  onclick="openMemberUpdateModal(` + n.maid + `)">更新</button></td>`;
						tr += `<td class="border-bottom-0"><button class="btn btn-dark" type="submit" onclick="deleteAccount('` + n.mAccount + `')">刪除</button></td >`;
					}
					tr += "</tr>";
					table.append(tr);
				})
				table.append("</tbody>");
			}
		}
	});
}

function loadByNamePage(name) {
	$.ajax({
		type: 'get',
		url: '/emp/MemberSelectByName',
		contentType: 'application/json',
		data: {
			mName: name
		},
		success: function(response) {
			var table = $('#showmemberByName');
			var tablePage = $('#showpageByName');
			table.empty("");
			tablePage.empty("");
			if (response == null) {
				table.prepend('<tr><td class="border-bottom-0">no result</td></tr>');
				tablePage.prepend('<tr><td class="border-bottom-0"></td></tr>');
			} else {
				let size = response.length;
				table.append(`<thead class="text-dark fs-4"><tr>`
					+ `<th class="border-bottom-0">會員ID</th>`
					+ `<th class="border-bottom-0">會員帳號</th>`
					+ `<th class="border-bottom-0">會員名稱</th>`
					+ `<th class="border-bottom-0">會員頭貼</th>`
					+ `<th class="border-bottom-0">帳號權限</th>`
					+ `<th class="border-bottom-0">修改</th>`
					+ `<th class="border-bottom-0">刪除</th></tr></thead><tbody>`);

				tablePage.append(`<tr><td class="border-bottom-0">總共有 ` + size + ` 筆資料</td></tr>`)

				$.each(response, function(i, n) {
					console.log(response);
					var tr = `<tr><td class="border-bottom-0">` + n.maid + `</td>`
						+ `<td class="border-bottom-0">` + n.mAccount + `</td>`
						+ `<td class="border-bottom-0"><a href='#' class='member-id-link' data-member-id='` + n.maid + "'>" + n.detailBean.mName + `</a></td>`;
					if (n.detailBean.mPhoto == null) {
						tr += `<td class="border-bottom-0"><img src="/images/member/user.png" class="userphoto"></td>`;
					} else {
						tr += `<td class="border-bottom-0">` + `<img src="` + n.detailBean.mPhoto + `" class="userphoto"></td>`;
					}
					if (n.hidden == 0) {

						tr += `<td> <label> 已封鎖並刪除　　　</label>`;

					}
					else if (n.hidden == 1) {
						if (n.permissions == 0 && n.hidden == 1) {
							tr += `<td> <label> <input type="radio" name="permissions` + i + `" value="0" onchange="change('` + n.mAccount + `', this.value)" checked>已封鎖　　　</label>`
								+ `<label> <input type="radio" name="permissions` + i + `" value="1" required onchange="change('` + n.mAccount + `', this.value)">已啟用</label></td > `;
						} else if (n.permissions == 1 && n.hidden == 1) {
							tr += `<td> <input type="radio" name="permissions` + i + `" value="0" onchange="change('` + n.mAccount + `', this.value)">已封鎖　　　`
								+ `<input type="radio" name="permissions` + i + `" value="1" required onchange="change('` + n.mAccount + `', this.value)" checked>已啟用</td > `;
						}
					}

					// tr += `</form > `;
					if (n.hidden == 0) {
						tr += `<td class="border-bottom-0">　　　</td>`;
						tr += `<td class="border-bottom-0"><button class="btn btn-danger" type="submit" onclick="rebackAccount('` + n.mAccount + `')">復原</button></td >`;
					} else if (n.hidden == 1) {
						tr += `<td class="border-bottom-0"><button class="btn btn-dark" type='submit'  data-member-id='` + n.maid + `' onclick="openMemberUpdateModal()">更新</button></td>`;
						tr += `<td class="border-bottom-0"><button class="btn btn-dark" type="submit" onclick="deleteAccount('` + n.mAccount + `')">刪除</button></td >`;
					}
					tr += "</tr>";
					table.append(tr);
				})
				table.append("</tbody>");
			}
		}
	});
}


function page(page) {
	indexPage = page;
	loadPage(indexPage);
}

function pageByName(page) {
	indexPage = page;
	loadByNamePage(indexPage);
}

// 新增會員模板
function openMemberInsertModal() {
	$('#memberInsertModal').modal('show');
}

function memberInsert() {
	let UserAccount = $('#InsertAccount').val();
	let UserEmail = $('#InsertEmail').val();
	let UserPassword = $('#InsertPassword').val();

	$.ajax({
		type: 'post',
		url: '/emp/Member.Insert',
		data: {
			account: UserAccount,
			password: UserPassword,
			mEmail: UserEmail
		},
		success: function() {
			$('#memberInsertModal').modal('hide');
			window.location.href = "/emp/Member.SelectAll/1";
		}
	});
}

// 更新資料模板
function openMemberUpdateModal(id) {

	$.ajax({
		url: '/emp/Member.SelectOneByID',
		type: 'GET',
		dataType: 'json',
		data: { id: id },
		success: function(response) {
			// 清空表格內容
			$('#memberUpdateDetailTableBody').empty();
			var row =
				'<tr><td class="text-nowrap">會員ID</td>' + '<td class="text-nowrap"><input type="text" id="updateID" value="' + response.maid + '" readonly></td></tr>' +
				'<tr><td class="text-nowrap">會員頭像</td>' + '<td class="text-nowrap"><img src="' + response.detailBean.mPhoto + '" id="changePhoto" class="userphoto" ></td></tr>' +
				'<tr><td class="text-nowrap"></td>' + '<td class="text-nowrap"><input type="file" id="updateFile" onchange="previewUserFile()"></td></tr>' +
				'<tr><td class="text-nowrap">會員名稱</td>' + '<td class="text-nowrap"><input type="text" id="updateName" value="' + response.detailBean.mName + '"><spen style="color:red;">　*　</spen></td></tr>' +
				'<tr><td class="text-nowrap">會員帳號</td>' + '<td class="text-nowrap"><input type="text" id="updateAccount" value="' + response.mAccount + '" readonly></td></tr>' +
				'<tr><td class="text-nowrap">會員密碼</td>' + '<td class="text-nowrap"><input type="password" id="updatePassword" value="' + response.mPassword + '"><spen style="color:red;">　*　</spen></td></tr>' +
				'<tr><td class="text-nowrap">電子信箱</td>' + '<td class="text-nowrap"><input type="email" id="updateEmail" value="' + response.detailBean.mEmail + '" readonly></td></tr>' +
				'<tr><td class="text-nowrap">手機號碼</td>' + '<td class="text-nowrap"><input type="text" id="updatePhone" pattern="[0]{1}[9]{1}\d{8}" maxlength="10" value="' + response.detailBean.mPhone + '"><spen style="color:red;">　*　</spen></td></tr>' +
				'<tr><td class="text-nowrap">會員生日</td>' + '<td class="text-nowrap"><input type="date" id="updateBirthday" value="' + response.detailBean.mbirthday + '"><spen style="color:red;">　*　</spen></td></tr>';

			$('#memberUpdateDetailTableBody').append(row);

			$('#memberUpdateDetailsModalLabel').text('修改資料：會員 ID - ' + id);

			// 顯示模態框
			$('#memberUpdateDetailsModal').modal('show');
		},
		error: function(xhr, status, error) {
			if (xhr.status === 404) {
				// 如果返回404，则显示警告提示
				alert('已無此訊息');
			} else {
				console.error(error);
				// 在這裡處理請求失敗的情況
			}
		}
	});
}

function updateMemberDetail() {
	// A.先取到Offcanvas內所有欄位的資料,這邊用formData因為我要傳檔案QAQ
	let formData = new FormData();
	formData.append('maid', $('#updateID').val());
	formData.append('account', $('#updateAccount').val());
	formData.append('password', $('#updatePassword').val());
	formData.append('mName', $('#updateName').val());
	formData.append('mEmail', $('#updateEmail').val());
	formData.append('mPhone', $('#updatePhone').val());
	formData.append('mPhoto', $('#updateFile')[0].files[0]);
	formData.append('mbirthday', $('#updateBirthday').val());

	$.ajax({
		url: "/emp/Member.UpdateDetail",
		method: 'post',
		contentType: false, // 必須設為false,才能上傳檔案
		processData: false,  // 必須設為false,才能上傳檔案
		data: formData,
		success: function(response) {
			$('#memberUpdateDetailsModal').modal('hide');
			window.location.href = "/emp/Member.SelectAll/1";
		}
	});
}


// 下載資料模板
function openMemberDownloadModal() {
	$('#memberDownloadModal').modal('show');
}

function download(type) {
	$.ajax({
		type: 'get',
		url: '/emp/Member.Save',
		data: { type: type },
		success: function() {
			alert("下載完畢!");
		}
	});
}

// 預覽圖片
function previewUserFile() {

	const fileInput = document.querySelector('#updateFile');
	const previewImage = document.querySelector(`#changePhoto`);

	const file = fileInput.files[0];

	if (file) {
		const reader = new FileReader();
		reader.onload = function(event) {
			previewImage.src = event.target.result;
		}
		reader.readAsDataURL(file);
	} else {
		previewImage.src = "/images/member/user.png";
	}
}

function deleteAccount(account) {
	let confirmDelete = confirm("確定要 刪除 嗎？");
	if (confirmDelete) {
		$.ajax({
			type: 'delete',
			url: '/emp/Member.Delete',
			data: { "account": account },
			success: function() {
				alert("已刪除!");
				window.location.href = "/emp/Member.SelectAll/1";
			},
			error: function() {
				alert("已取消刪除!");
			}
		});
	}
}

function rebackAccount(account) {
	let confirmDelete = confirm("確定要 復原 嗎？");
	if (confirmDelete) {
		$.ajax({
			type: 'PUT',
			url: '/emp/Member.Reback',
			data: { "account": account },
			success: function() {
				alert("已復原!");
				window.location.href = "/emp/Member.SelectAll/1";
			},
			error: function() {
				alert("已取消復原!");
			}
		});
	}
}

function change(account, permissions) {
	$.ajax({
		type: 'PUT',
		url: '/emp/Member.UpdatePermissions',
		data: {
			"account": account,
			"permissions": permissions,
			"empPermissions": 0
		},
		success: function(respone) {
			console.log(respone);
			if (respone != "") {
				alert("已更改權限成功!")
			}

			//window.location.href = "/MemberGetAll/1";
		}

	});
}