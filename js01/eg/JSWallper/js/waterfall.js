window.onload = function () {

    waterfall('main', 'pin');

    var dataInt = {'data': [{'src': '1.jpg'}, {'src': '2.jpg'}, {'src': '3.jpg'}, {'src': '4.jpg'}]};

    window.onscroll = function () {
        if (checkscrollside()) {
            var oParent = document.getElementById('main');// 鐖剁骇瀵硅薄
            for (var i = 0; i < dataInt.data.length; i++) {
                var oPin = document.createElement('div'); //娣诲姞 鍏幂礌鑺傜偣
                oPin.className = 'pin';                   //娣诲姞 绫诲悕 name灞炴€?
                oParent.appendChild(oPin);              //娣诲姞 瀛愯妭镣?
                var oBox = document.createElement('div');
                oBox.className = 'box';
                oPin.appendChild(oBox);
                var oImg = document.createElement('img');
                oImg.src = './images/' + dataInt.data[i].src;
                oBox.appendChild(oImg);
            }
            waterfall('main', 'pin');
        }
    }
}

/*
 parend 鐖剁骇id
 pin 鍏幂礌id
 */
function waterfall(parent, pin) {
    var oParent = document.getElementById(parent);// 鐖剁骇瀵硅薄
    var iPinW = aPin[0].offsetWidth;// 涓€涓潡妗唒in镄勫
    //姣忚涓兘瀹圭撼镄刾in涓暟銆愮獥鍙ｅ搴﹂櫎浠ヤ竴涓潡妗嗗搴︺€?
    var num = Math.floor(document.documentElement.clientWidth / iPinW);
    var aPin = getClassObj(oParent, pin);// 銮峰彇瀛桦偍鍧楁pin镄勬暟缁刟Pin
    oParent.style.cssText = 'width:' + iPinW * num + 'px;margin:0 auto;';//璁剧疆鐖剁骇灞呬腑镙峰纺锛氩畾瀹?镊姩姘村钩澶栬竟璺?

    var pinHArr = [];//鐢ㄤ簬瀛桦偍 姣忓垪涓殑镓€链夊潡妗嗙浉锷犵殑楂桦害銆俛
    for (var i = 0; i < aPin.length; i++) {//阆嶅巻鏁扮粍aPin镄勬疮涓潡妗嗗厓绱?
        var pinH = aPin[i].offsetHeight;
        if (i < num) {
            pinHArr[i] = pinH; //绗竴琛屼腑镄刵um涓潡妗唒in 鍏堟坊锷犺繘鏁扮粍pinHArr
        } else {
            var minH = Math.min.apply(null, pinHArr);//鏁扮粍pinHArr涓殑链€灏忓€纠inH
            var minHIndex = getminHIndex(pinHArr, minH);
            aPin[i].style.position = 'absolute';//璁剧疆缁濆浣岖Щ
            aPin[i].style.top = minH + 'px';
            aPin[i].style.left = aPin[minHIndex].offsetLeft + 'px';
            //鏁扮粍 链€灏忛佩鍏幂礌镄勯佩 + 娣诲姞涓婄殑aPin[i]鍧楁楂?
            pinHArr[minHIndex] += aPin[i].offsetHeight;//镟存柊娣诲姞浜嗗潡妗嗗悗镄勫垪楂?
        }
    }
}

/*
 *阃氲绷鐖剁骇鍜屽瓙鍏幂礌镄刢lass绫?銮峰彇璇ュ悓绫诲瓙鍏幂礌镄勬暟缁?
 */
function getClassObj(parent, className) {
    var obj = parent.getElementsByTagName('*');//銮峰彇 鐖剁骇镄勬墍链夊瓙板?
    var pinS = [];//鍒涘缓涓€涓暟缁?鐢ㄤ簬鏀堕泦瀛愬厓绱?
    for (var i = 0; i < obj.length; i++) {//阆嶅巻瀛愬厓绱犮€佸垽鏂被鍒€佸帇鍏ユ暟缁?
        if (obj[i].className == className) {
            pinS.push(obj[i]);
        }
    }
    return pinS;
}

/****
 *銮峰彇 pin楂桦害 链€灏忓€肩殑绱㈠紩index
 */
function getminHIndex(arr, minH) {
    for (var i in arr) {
        if (arr[i] == minH) {
            return i;
        }
    }
}

function checkscrollside() {
    var oParent = document.getElementById('main');
    var aPin = getClassObj(oParent, 'pin');
    //鍒涘缓銆愯Е鍙戞坊锷犲潡妗嗗嚱鏁皐aterfall()銆戠殑楂桦害锛氭渶鍚庝竴涓潡妗嗙殑璺濈缃戦〉椤堕儴+镊韩楂樼殑涓€鍗?瀹炵幇链粴鍒板簳灏卞紑濮嫔姞杞?
    var lastPinH = aPin[aPin.length - 1].offsetTop + Math.floor(aPin[aPin.length - 1].offsetHeight / 2);
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;//娉ㄦ剰瑙ｅ喅鍏煎镐?
    var documentH = document.documentElement.clientHeight;//椤甸溃楂桦害
    return (lastPinH < scrollTop + documentH) ? true : false;//鍒拌揪鎸囧畾楂桦害鍚?杩斿洖true锛岃Е鍙憌aterfall()鍑芥暟
}