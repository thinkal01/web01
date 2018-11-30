﻿window.onload = function () {
    /*
    * 1.显示弹出层
    * 2.做动画
    * 3.删除盒子需要做
    * 4.点击取消按钮  关闭  弹出层
    * */

    /*获取弹出层*/
    var jdWin = document.querySelector('.jd_win');
    /*获取框*/
    var jdWinBox = jdWin.querySelector('.jd_win_box');
    /*获取所有的删除按钮*/
    var deleteList = document.querySelectorAll('.deleteBox');

    /*记录当前点击的是按个按钮*/
    var deleteBtn = null;

    for (var i = 0; i < deleteList.length; i++) {
        deleteList[i].onclick = function () {
            /*1.显示弹出层*/
            jdWin.style.display = "block";
            /*2.做动画*/
            jdWinBox.classList.add('bounceInDown');
            /*删除盒子需要做*/
            console.log(this);

            deleteBtn = this;
            var up = deleteBtn.querySelector('.up');
            console.log(up);
            /*加过渡*/
            up.style.webkitTransition = "all 1s";
            up.style.transition = "all 1s";
            /*定义旋转原点*/
            up.style.webkitTransformOrigin = "0 5px";
            up.style.transformOrigin = "0 5px";
            /*加改变*/
            up.style.webkitTransform = "rotate(-30deg) translateY(2px)";
            up.style.transform = "rotate(-30deg) translateY(2px)";
        }
    }

    /*4.点击取消按钮关闭弹出层*/
    jdWinBox.querySelector('.cancel').onclick = function () {
        jdWin.style.display = "none";
        jdWinBox.classList.remove('bounceInDown');

        /*当前点击过*/
        if (deleteBtn) {
            var up = deleteBtn.querySelector('.up');
            up.style.webkitTransform = "none";
            up.style.transform = "none";
        }
    }
};
