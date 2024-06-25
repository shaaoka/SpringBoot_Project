let wapper = document.querySelector(".wapper");
let textAll = document.querySelectorAll(".wapper .text");
let text = ["10元", "15元", "25元", "20元", "40元", "35元", "30元", "50元"];
for(let i = 0 ; i < textAll.length ; i++){
    textAll[i].innerHTML = text[i];
}
let isFlag = true;
let hasPlayed = false;

document.querySelector(".circle").onclick=function(){
    if(!hasPlayed) {
        if(isFlag){
            let random = parseInt(Math.random()*8)
            switch(random){
                case 0:
                    run(22.5,text[random]);
                    break;
                case 1:
                    run(66.5,text[random]);
                    break;
                case 2:
                    run(112.5,text[random]);
                    break;
                case 3:
                    run(157.5,text[random]);
                    break;
                case 4:
                    run(338.5,text[random]);
                    break;
                case 5:
                    run(294.5,text[random]);
                    break;
                case 6:
                    run(247.5,text[random]);
                    break;
                case 7:
                    run(201.5,text[random]);
                    break;
            }
        }
        hasPlayed = true;
    } else {
        alert("您已经抽過了,不能重複抽獎!");
    }
};

function run(angle, prizeName) {
    isFlag = false;
    let begin = 0;
    let timer = null;
    let basic = 1800;
    timer = setInterval(function() {
        if(begin > (basic+angle)) {
            isFlag = true;
            clearInterval(timer);
            fetchDiscountCode(prizeName);
        }
        wapper.style.transform="rotate("+(begin)+"deg)";
        begin += Math.ceil(basic+angle-begin)*0.1;
    }, 70);
}

function fetchDiscountCode(prizeName) {
    fetch(`/getDiscountCode?promotionsName=${encodeURIComponent(prizeName)}`)
        .then(response => response.text())
        .then(discountCode => {
            const confirmation = confirm(`您抽到了 : ${prizeName}\n是否要複製該折扣碼：${discountCode}`);
            if (confirmation) {
                // 將折扣碼寫入剪貼板
                navigator.clipboard.writeText(discountCode)
                    .then(() => {
                        alert(`折扣碼已複製: ${discountCode}`);
                    })
                    .catch(error => {
                        console.error('複製折扣碼時發生錯誤:', error);
                        alert(`複製折扣碼時發生錯誤，請手動複製：${discountCode}`);
                    });
            }
        })
        .catch(error => {
            console.error('獲取折扣碼時發生錯誤:', error);
            alert(`獲取折扣碼時發生錯誤，請稍後重試`);
        });

}
