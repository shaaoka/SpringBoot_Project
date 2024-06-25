$('#Attraction1').change(function(){ 
    var selectedValue = $(this).val();
    // 隐藏所有的 iframe
    $('#iframe1, #iframe2, #iframe3, #iframe4, #iframe5, #iframe6, #iframe7').hide();

    // 根据选项值显示对应的 iframe
    switch (selectedValue) {
        case '桃園市中壢區中北路200號':
            $('#iframe1').show();
            break;
        case '桃園市中壢區健行路229號':
            $('#iframe2').show();
            break;
        case '桃園市中壢區中和路139號':
            $('#iframe3').show();
            break;
        case '桃園市中壢區中華路一段267號':
            $('#iframe4').show();
            break;
        case '桃園市中壢區中山東路二段510號':
            $('#iframe5').show();
            break;
        case '桃園市中壢區中華路一段450號': // 请确认这个选项是否重复
            $('#iframe6').show();
            break;
        case '桃園市中壢區遠東路135號':
            $('#iframe7').show();
            break;
        default:
            // 默认情况下隐藏所有 iframe
            $('#iframe1, #iframe2, #iframe3, #iframe4, #iframe5, #iframe6, #iframe7').hide();
            break;
    }
});
