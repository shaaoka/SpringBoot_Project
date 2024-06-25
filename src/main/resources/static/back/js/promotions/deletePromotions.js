function deletePromotions(element) {
    var promotionsName = element.getAttribute('data-promotions-name');
    var promotionsId = element.getAttribute('data-promotions-id');

    var confirmDelete = confirm("確定要刪除活動 '" + promotionsName + "' 嗎？");
    if (confirmDelete) {
        $.ajax({
            url: "/promotions/promotions/delete/" + promotionsId,
            type: "DELETE",
            success: function (response) {
                window.location.href = "/promotions/promotionsMain";
                alert("活動已成功刪除！");
            },
            error: function (xhr, status, error) {
                alert("刪除活動失敗：");
            }
        });
    }
}

