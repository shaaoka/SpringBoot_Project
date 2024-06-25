// 圖片預覽
function previewFile(pre) {

    const fileInput = document.querySelector(`#` + pre + `-productImg_url`);
    const previewImage = document.querySelector(`#` + pre + `-previewImage`);

    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();
        reader.onload = function (event) {
            previewImage.src = event.target.result;
        }
        reader.readAsDataURL(file);
    } else {
        previewImage.src = '';
    }

}