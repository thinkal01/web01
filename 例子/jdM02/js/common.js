/*定义一个全局变量*/
window.itcast = {};
/*动画结束事件*/
itcast.transitionEnd = function (dom, callback) {
    /*过渡结束事件的绑定*/
    if (dom && typeof dom === 'object') {
        dom.addEventListener('webkitTransitionEnd', function () {
            callback && callback();
        });
        dom.addEventListener('transitionEnd', function () {
            callback && callback();
        });
    }
};
/*封装tap(移动端click)事件*/
itcast.tap = function (dom, callback) {
    if (dom && typeof dom === 'object') {
        /*记录是否滑动过*/
        var isMove = false;
        var startTime = 0;
        dom.addEventListener('touchstart', function (e) {
            /*new Date().getTime();获取时间戳*/
            startTime = Date.now();
        });
        /*触摸滑动事件*/
        dom.addEventListener('touchmove', function (e) {
            // 在屏幕上滑动过
            isMove = true;
        });
        /*触摸结束事件*/
        dom.addEventListener('touchend', function (e) {
            /*
             1.响应速度要比click快 click 300ms tap 150ms
             2.不能在屏幕上滑动过
             * */
            if ((Date.now() - startTime) < 150 && !isMove) {
                /*在end事件的时候才执行click需要执行的操作*/
                callback && callback(e);
            }

            /*重置*/
            isMove = false;
            startTime = 0;
        })
    }
};