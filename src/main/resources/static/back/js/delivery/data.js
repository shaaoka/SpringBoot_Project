$('#json').click(function() {
    Swal.fire({
        title: '確定要匯出 JSON 嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('/delivery/json')
                .done(function() {
                    Swal.fire({
                        icon: 'success',
                        title: '成功',
                        text: 'JSON 匯出成功，位置 C:/Users/User/Downloads',
                    });
                })
                .fail(function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: '錯誤',
                        text: 'JSON 匯出失敗。',
                    });
                });
        }
    });
});
// 下載json
$('#download-json').click(function() {
    Swal.fire({
        title: '確定要下載 JSON 嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            // 在按鈕點擊時發起 AJAX 請求獲取數據
            $.ajax({
                url: '/delivery/download',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // 成功回調中儲存數據並進行排序和下載
                    delivery = data;
                    const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(delivery, null, 2));
                    const downloadAnchorNode = document.createElement('a');
                    downloadAnchorNode.setAttribute("href", dataStr);
                    downloadAnchorNode.setAttribute("download", "外送單資料.json");
                    document.body.appendChild(downloadAnchorNode);
                    downloadAnchorNode.click();
                    downloadAnchorNode.remove();
                },
                error: function(xhr, status, error) {
                    // 處理錯誤情況
                    console.error("AJAX request failed:", status, error);
                    Swal.fire({
                        title: '錯誤',
                        text: '下載 JSON 時出現錯誤',
                        icon: 'error',
                        confirmButtonText: '關閉'
                    });
                }
            });
        }
    });
});
$('#xml').click(function() {
    Swal.fire({
        title: '確定要匯出 xml 嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('/delivery/xml')
                .done(function() {
                    Swal.fire({
                        icon: 'success',
                        title: '成功',
                        text: 'XML 匯出成功，位置 C:/Users/User/Downloads',
                    });
                })
                .fail(function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: '錯誤',
                        text: 'XML 匯出失敗。',
                    });
                });
        }
    });
});
// 下載XML
$('#download-xml').click(function() {
    Swal.fire({
      title: '確定要下載 xml 嗎？',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: '確定',
      cancelButtonText: '取消'
  }).then((result) => {
      if (result.isConfirmed) {
    // 在按鈕點擊時發起 AJAX 請求獲取數據
    $.ajax({
        url: '/delivery/download',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // 成功回調中儲存數據並進行排序和下載
            delivery = data;

            
            // 將 JSON 資料轉換為 XML 字串
            let xmlStr = '<?xml version="1.0" encoding="UTF-8"?>\n<deliveries>\n';
            delivery.forEach(function(item) {
                xmlStr += '  <delivery>\n';
                xmlStr += '    <id>' + item.id + '</id>\n';
                xmlStr += '    <orderid>' + item.orderid + '</orderid>\n';
                xmlStr += '    <date>' + item.date + '</date>\n';
                xmlStr += '    <address>' + item.address + '</address>\n';
                xmlStr += '    <status>' + item.status + '</status>\n';
                xmlStr += '    <ename>' + item.ename + '</ename>\n';
                xmlStr += '    <starttime>' + item.starttime + '</starttime>\n';
                xmlStr += '    <endtime>' + item.endtime + '</endtime>\n';
                // 添加更多屬性...
                xmlStr += '  </delivery>\n';
            });
            xmlStr += '</deliveries>';
            
            // 創建下載鏈接
            const dataStr = "data:text/xml;charset=utf-8," + encodeURIComponent(xmlStr);
            const downloadAnchorNode = document.createElement('a');
            downloadAnchorNode.setAttribute("href", dataStr);
            downloadAnchorNode.setAttribute("download", "外送單資料.xml");
            document.body.appendChild(downloadAnchorNode); 
            downloadAnchorNode.click();
            downloadAnchorNode.remove();
        },
        error: function(xhr, status, error) {
                // 處理錯誤情況
                console.error("AJAX request failed:", status, error);
                Swal.fire({
                    title: '錯誤',
                    text: '下載 XML 時出現錯誤',
                    icon: 'error',
                    confirmButtonText: '關閉'
                });
            }
        });
    }
});
});


$('#excel').click(function() {
    Swal.fire({
        title: '確定要匯出 Excel 嗎？',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('/delivery/excel')
                .done(function() {
                    Swal.fire({
                        icon: 'success',
                        title: '成功',
                        text: 'Excel 匯出成功，位置 C:/Users/User/Downloads',
                    });
                })
                .fail(function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: '錯誤',
                        text: 'Excel 匯出失敗。',
                    });
                });
        }
    });
});

    // 下載excel
    $('#download-excel').click(function() {
        Swal.fire({
            title: '確定要下載 Excel 嗎？',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '確定',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
          // 在按鈕點擊時發起 AJAX 請求獲取數據
          $.ajax({
              url: '/delivery/download',
              method: 'GET',
              dataType: 'json',
              success: function(data) {
                  // 成功回調中儲存數據
                  delivery = data;
  
                  // 創建 workbook
                  let wb = XLSX.utils.book_new();
                  // 創建 worksheet
                  let ws = XLSX.utils.json_to_sheet(delivery);
                  // 添加 worksheet 到 workbook
                  XLSX.utils.book_append_sheet(wb, ws, "外送單資料");
                  // 將 workbook 轉換為二進位格式
                  let wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });
  
                  // 創建下載鏈接
                  const dataBlob = new Blob([s2ab(wbout)], { type: 'application/octet-stream' });  
                  const downloadAnchorNode = document.createElement('a');
                  const url = URL.createObjectURL(dataBlob);
                  downloadAnchorNode.setAttribute("href", url);
                  downloadAnchorNode.setAttribute("download", "外送單資料.xlsx");
                  document.body.appendChild(downloadAnchorNode);
                  downloadAnchorNode.click();
                  setTimeout(function () {
                      document.body.removeChild(downloadAnchorNode);
                      window.URL.revokeObjectURL(url);
                  }, 0);
              },
              error: function(xhr, status, error) {
                      // 處理錯誤情況
                      console.error("AJAX request failed:", status, error);
                      Swal.fire({
                          title: '錯誤',
                          text: '下載 Excel 時出現錯誤',
                          icon: 'error',
                          confirmButtonText: '關閉'
                      });
                  }
              });
          }
      });
  });
  
    //   將二進位字串轉換為 array buffer
      function s2ab(s) {
          const buf = new ArrayBuffer(s.length);
          const view = new Uint8Array(buf);
          for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
          return buf;
      }
