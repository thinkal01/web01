'use strict';

$(function () {
    /**
     * 根据屏幕宽度的变化决定轮播图片应该展示什么
     */
    function resize() {
        // 屏幕宽度
        var windowWidth = $(window).width();
        // 是否为小于768的屏幕
        var smallScreen = windowWidth < 768;
        // 轮播图板块适应
        $('#home_slide .item-image').each(function (i, item) {
            var $item = $(item);
            var imgSrc = $item.data(smallScreen ? 'image-small' : 'image-large');
            var imgAlt = $item.data('image-alt');
            $item.html('<img src="' + imgSrc + '" alt="' + imgAlt + '"/>');
            $item.css('backgroundImage', 'url(' + imgSrc + ')');
            /*if (smallScreen) {
                $item.html('<img src="' + imgSrc + '" alt="' + imgAlt + '"/>');
            } else {
                $item.empty();
            }*/
        });

        // tab栏宽度适应
        var $tabs = $('.nav-tabs');
        $tabs.each(function (i, item) {
            var $tab = $(this);
            // 获取所有子元素的宽度和
            // 因为原本ul上有padding-left
            var width = 20;
            // 遍历子元素
            $tab.children().each(function (ci, citem) {
                width += $(citem).width();
            });
            // 此时width等于所有LI的宽度总和
            // 判断当前UL的宽度是否超出屏幕，如果超出就显示横向滚动条
            // if (width > $(window).width()) {
            if (width > $tab.parent().width()) {
                $tab.css('width', width);
                $tabs.parent().css('overflow-x', 'scroll');
            } else {
                $tab.css('width', 'auto');
                $tabs.parent().css('overflow-x', 'hidden');
            }
        });
    }

    $(window).on('resize', resize).trigger('resize');

    /*var OFFSET = 50;
    $('.carousel').each(function (i, item) {
        var startX, endX;
        item.addEventListener('touchstart', function (e) {
            startX = e.touches[0].clientX;
            e.preventDefault();
        });
        item.addEventListener('touchmove', function (e) {
            endX = e.touches[0].clientX;
            e.preventDefault();
        });
        item.addEventListener('touchend', function (e) {
            var offsetX = endX - startX;
            if (offsetX > OFFSET) {
                // 上一张
                $(this).carousel('prev');
            } else if (offsetX < -OFFSET) {
                // 上一张
                $(this).carousel('next');
            }
            e.preventDefault();
        });
    });*/

    // 轮播图触摸
    // 获取界面上的轮播图容器
    var $carousels = $('.carousel');
    var startX, endX;
    var OFFSET = 50;
    // 注册滑动事件
    $carousels.on('touchstart', function (e) {
        // 手指触摸开始时记录一下手指所在的坐标X
        startX = e.originalEvent.touches[0].clientX;
    });
    // 滑动
    $carousels.on('touchmove', function (e) {
        endX = e.originalEvent.touches[0].clientX;
    });
    // 滑动结束
    $carousels.on('touchend', function (e) {
        // 结束触摸一瞬间记录最后的手指所在坐标X
        // 获取每次运动的距离，当距离大于一定值时认为是有方向变化
        var distance = Math.abs(startX - endX);
        if (distance > OFFSET) {
            // 2. 根据获得到的方向选择上一张或者下一张
            // - 原生的carousel方法实现 http://v3.bootcss.com/javascript/#carousel-methods
            $(this).carousel(startX > endX ? 'next' : 'prev');
        }
    });

    // 提示框效果
    $('[data-toggle="tooltip"]').tooltip();

    // 新闻点击切换
    $('.news-nav a').on('click', function (e) {
        // e.preventDefault();
        // e.stopPropagation();
        // 不要阻止默認事件
        $('.news-title').text($(this).data('title'));
    });
});
