// 發送接受外送請求 ok
function accept(deliveryId) {
    Swal.fire({
        title: '確定要接受這筆訂單嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'PUT',
                url: '/delivery/accept/'+ deliveryId,
                success: function(result) {
                    Swal.fire({
                        icon: 'success',
                        title: '開始外送',
                        text: '請選擇員工',
                    }).then(() => {
                        location.href = '/delivery/state/accept';
                    });
                },
                error: function(xhr, status, error) {
                    console.error('接受失敗:', error);
                    Swal.fire({
                        icon: 'error',
                        title: '接受訂單失敗',
                        text: '接受訂外送單失敗，請稍後再試。',
                        confirmButtonText: '確定'
                    });
                }
            });
        }
    });
}
// 發送刪除請求 ok
function Delete(deliveryId) {
    Swal.fire({
        title: '確定要刪除這筆訂單嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'DELETE',
                url: '/delivery/delete/' + deliveryId,
                success: function(result) {
                    Swal.fire({
                        icon: 'success',
                        title: '刪除成功',
                        text: '訂單已成功刪除',
                    }).then(() => {
                        window.location.href = '/delivery/home';
                    });
                },
                error: function(xhr, status, error) {
                    console.error('刪除失敗:', error);
                    Swal.fire({
                        icon: 'error',
                        title: '刪除失敗',
                        text: '刪除訂單失敗，請稍後再試。',
                    });
                }
            });
        }
    });
}
//發送更新請求 ok
function update() {
    let id = $('#id').val();
    let orderid = $('#orderid').val();
    let date = $('#date').val();
    let address = $('#address').val();
    let status = $('#status').val();
    let ename = $('#ename').val();

  // 建立 JSON 物件
  let Data = {
      id: id,
      orderid: orderid,
      date: date,
      address: address,
      status: status,
      ename: ename
  };

  Swal.fire({
      title: '確定要修改這筆訂單嗎？',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: '確定',
      cancelButtonText: '取消'
  }).then((result) => {
      if (result.isConfirmed) {
          $.ajax({
              type: 'PUT',
              url: '/delivery/update',
              contentType: 'application/json',
              data: JSON.stringify(Data),
              success: function(response) {
                  Swal.fire({
                      icon: 'success',
                      title: '更新成功',
                      text: '訂單已成功更新'
                  }).then(() => {
                      window.location.href = "/delivery/home";
                  });
              },
              error: function(xhr, status, error) {
                  console.error('更新失敗:', error);
                  Swal.fire({
                      icon: 'error',
                      title: '更新失敗',
                      text: '更新訂單失敗，請稍後再試。'
                  });
              }
          });
      }
  });
}
// 發送取消請求 ok
function Cancel(deliveryId) {
    Swal.fire({
        title: '確定要取消這筆訂單嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'PUT',
                url: '/delivery/delete/soft/' + deliveryId,
                success: function(result) {
                    Swal.fire({
                        title: '取消成功',
                        icon: 'success',
                        confirmButtonText: '確定'
                    }).then(() => {
                        window.location.href = '/delivery/home';
                    });
                },
                error: function(xhr, status, error) {
                    console.error('取消失敗:', error);
                    Swal.fire({
                        title: '取消訂單失敗，請稍後再試。',
                        icon: 'error',
                        confirmButtonText: '確定'
                    });
                }
            });
        }
    });
}

// 發送復原請求 ok
 function Rollback(deliveryId) {
    Swal.fire({
        title: '確定要復原這筆訂單嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
      if (result.isConfirmed) {
          $.ajax({
              type: 'PUT',
              url: '/delivery/rollback/' + deliveryId,
              success: function(result) {
                  Swal.fire({
                      title: '復原成功',
                      icon: 'success',
                      confirmButtonText: '確定'
                  }).then(() => {
                    //   window.location.load = '/delivery/home';
                      window.location.reload();
                  });
              },
              error: function(xhr, status, error) {
                  console.error('復原失敗:', error);
                  Swal.fire({
                      title: '復原訂單失敗，請稍後再試。',
                      icon: 'error',
                      confirmButtonText: '確定'
                  });
              }
          });
      }
  });
}


function Start(deliveryId) {
    Swal.fire({
        title: '確定要開始外送這筆訂單嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            let ename = $('#ename').val();

            let Data = {
                id: deliveryId,
                ename: ename,
            };  

            $.ajax({
                type: 'PUT',
                url: '/delivery/update/ename/' + deliveryId,
                contentType: 'application/json',
                data: JSON.stringify(Data),
                success: function(result) {
                    Swal.fire({
                        title: '開始外送',
                        icon: 'success',
                        timer: 1500,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.href = '/delivery/state/now';
                    });
                },
                error: function(xhr, status, error) {
                    console.error('接受失敗:', error);
                    Swal.fire({
                        title: '接受訂單失敗，請稍後再試。',
                        icon: 'error'
                    });
                }
            });
        }
    });
}

