window.onload = function () {
    leftSwipe();
    itcast.iScroll({
        swipeDom: document.querySelector('.jd_category_right'),
        swipeType: 'y',
        swipeDistance: 100
    });
};

/*左侧的滑动效果*/
function leftSwipe() {
    /*获取dom元素*/
    /*父盒子*/
    var parentBox = document.querySelector('.jd_category_left');
    /*子盒子*/
    var childBox = parentBox.querySelector('ul');

    var parentHeight = parentBox.offsetHeight;
    var childHeight = childBox.offsetHeight;

    /*定位区间*/
    var maxPosition = 0;//最大的定位区间
    var minPosition = parentHeight - childHeight;//最小的定位区间

    /*缓冲的距离*/
    var distance = 150;

    /*滑动区间*/
    var maxSwipe = maxPosition + 150; // 最大滑动区间
    var minSwipe = minPosition - 150; // 最小滑动区间

    /*添加过渡*/
    var addTransition = function () {
        childBox.style.webkitTransition = "all .2s";
        /*兼容*/
        childBox.style.transition = "all .2s";
    };
    /*删除过渡*/
    var removeTransition = function () {
        childBox.style.webkitTransition = "none";
        /*兼容*/
        childBox.style.transition = "none";
    };
    /*改变位置*/
    var setTranslateY = function (translateY) {
        childBox.style.webkitTransform = "translateY(" + translateY + "px)";
        childBox.style.transform = "translateY(" + translateY + "px)";
    };

    /*1.滑动  touch*/
    /*参数*/
    var startY = 0;
    var moveY = 0;
    var distanceY = 0;

    /*记录当前定位*/
    var currY = 0;

    childBox.addEventListener('touchstart', function (e) {
        startY = e.touches[0].clientY;
    });
    childBox.addEventListener('touchmove', function (e) {
        moveY = e.touches[0].clientY;
        distanceY = moveY - startY;

        /*2.在一定的区间范围内滑动*/
        if ((currY + distanceY) < maxSwipe && (currY + distanceY) > minSwipe) {
            /*做定位*/
            setTranslateY(currY + distanceY);
        }
    });

    /*避免模拟器上的bug问题  事件冒泡机制*/
    window.addEventListener('touchend', function (e) {
        /*将要定位的位置 大于 最大定位的时候*/
        if ((currY + distanceY) > maxPosition) {
            currY = maxPosition;
            /*加过渡*/
            addTransition();
            setTranslateY(currY);
        }
        /*将要定位的位置 小于 最小定位的时候*/
        else if ((currY + distanceY) < minPosition) {
            currY = minPosition;
            /*加过渡*/
            addTransition();
            setTranslateY(currY);
        }
        /*正常*/
        else {
            /*设置当前的定位*/
            currY = currY + distanceY;
        }

        /*重置参数*/
        /*startY = 0;
        moveY = 0;
        distanceY = 0;*/

        /*删除过渡*/
        removeTransition();
    });

    /*4.点击 滑动到顶部  改变当前的样式  当滑动到底部的时候不需要做定位 tap*/
    var lis = childBox.querySelectorAll('li');
    itcast.tap(childBox, function (e) {
        /*清除所有li当前样式*/
        for (var i = 0; i < lis.length; i++) {
            lis[i].className = '';
            lis[i].dataset['index'] = i;
        }
        /*当前点击的li*/
        var li = e.target.parentNode;
        li.className = 'now';

        /*向上滑动*/
        var translateY = -li.dataset['index'] * 50;

        if (translateY > minPosition) {
            currY = translateY;
        } else {
            /*当超过了最小定位区间*/
            currY = minPosition;
        }
        /*加过渡*/
        addTransition();
        /*去做定位*/
        setTranslateY(currY);
    });
}