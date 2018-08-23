﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>artDialog v3 demo</title>
    <meta name="keywords" content="artDialog,javascript,dialog,jQuery" />
    <meta name="description" content="artDialog是一个精巧的web对话框组件，压缩后只有十多KB，并且不依赖其他框架。" />
    <!-- artDialog -->

    <script type="text/javascript" src="artDialog.js"></script>

    

</head>
<body>
    <div id="main">
        <div class="tabContent">
            <h2>
                欢迎！</h2>
            <div>
                <img src="doc/aero.png" align="artDialog" /></div>
            <p>
                <strong>artDialog是一个精巧的web对话框组件，压缩后只有十多KB，并且不依赖其他框架。</strong></p>
            <div class="about">
                <h3>
                    能够自适应内容</h3>
                <p>
                    artDialog的特殊布局结构能够原生的适应内容变化，你不必像以前一样去考虑消息内容大小，她能自己去适应内容。当然她仍然可以接受一个固定高宽的参数，她能够防止内容溢出或截断，同时也不会产生难看的滚动条，甚至能够自动处理文本对齐方式。</p>
                <h3>
                    优雅灵活的接口</h3>
                <p>
                    artDialog很用心的设计了她的接口，她拥有丰富的配置参数控制初始化状态，并且每次调用后还会返回一些实用的内部控制接口，你可以先用变量把它保存起来，需要的时候在其他地方自由控制对话框。</p>
                <h3>
                    精心设计的UI机制</h3>
                <p>
                    artDialog采用九宫格的XHTML结构，CSS类钩子比较丰富，可以定制类似桌面软件般精致的皮肤。她支持多皮肤共存，这些皮肤的背景图片在页面载入时就会被缓存好，调用时几乎感觉不到延时。<a
                        href="#" onclick="effectDemo();return false" style="text-decoration: underline;">展示皮肤</a></p>
                <h3>
                    细致的用户体验</h3>
                <p>
                    她支持Esc快捷键关闭；如果对话框内容有输入控件她将支持Ctrl+Enter提交；智能给按钮添加焦点；小对话框自动采用黄金比例垂直居中；超过指定面积大小的对话框拖动自动采用替身挪动；自动计算边界防止超出可操作范围……</p>
                <h3>
                    跨浏览器兼容</h3>
                <p>
                    兼容：IE6+、Firefox、Chrome、Safari、Opera，浏览器版本越高体验越好。并且IE6下也能支持现代浏览器的静止定位(fixed)，支持覆盖下拉控件。</p>
                <h3>
                    与jQuery协作</h3>
                <p>
                    artDialog所有功能是不需要其他库就可以使用的，但是如果页面引入了jQuery，artDialog会奉献自己成为它的插件，利用它增强自身功能。</p>
            </div>
            <h2>
                使用帮助</h2>
            <h3>
                调用方式</h3>
            <p>
                一、使用传统的参数传值<br />
                art.dialog(String, Function, Function)</p>
            <div id="demoCode01">
                <code class=" javascript">art.dialog('artDialog崇尚：简单、强大、优雅', function(){alert('yes');});</code>
            </div>
            <p class="buttons">
                <button class="runCode" id="btn1" title="btn1" name="demoCode01">
                    运行&raquo;</button></p>
            <p>
                二、使用字面量传值<br />
                art.dialog(Object)</p>
            <div id="demoCode02">
                <pre><code class=" javascript">art.dialog({ content: '欢迎使用artDialog对话框组件！', skin: 'aero',
                    icon: 'succeed', follow: 'btn2', yesFn: function(){ this.follow('btn1').time(2);
                    return false; } });</code></pre>
            </div>
            <p class="buttons">
                <button class="runCode" id="btn2" title="btn2" name="demoCode02">
                    运行&raquo;</button></p>
            <p>
                是不是很简单？接下来将有几个表格列举artDialog的全部功能，你需要的时候可以使用它们。</p>
            <h3>
                配置参数 <span>[除了content参数其余的都是可选项]</span></h3>
            <table class="zebra">
                <colgroup>
                    <col class="col1">
                    <col class="col2">
                    <col class="col3">
                    <col class="col4">
                </colgroup>
                <thead>
                    <tr>
                        <th class="parameter">
                            名称
                        </th>
                        <th class="type">
                            类型
                        </th>
                        <th class="default">
                            默认值
                        </th>
                        <th class="note">
                            描述
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>内容</abbrev>
                        </th>
                    </tr>
                    <tr>
                        <th rowspan="2">
                            title
                        </th>
                        <td>
                            字符串
                        </td>
                        <td rowspan="2">
                            '提示'
                        </td>
                        <td rowspan="2">
                            标题内容。为false不显示标题栏（需要皮肤文件支持）
                        </td>
                    </tr>
                    <tr>
                        <td>
                            布尔
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="2">
                            content
                        </th>
                        <td>
                            字符串
                        </td>
                        <td rowspan="2">
                            null
                        </td>
                        <td rowspan="2">
                            消息内容，如果传入的是一个JSON，还需要与tmpl参数配合解析模板
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            对象
                        </td>
                    </tr>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>按钮</abbrev>
                        </th>
                    </tr>
                    <tr>
                        <th rowspan="2">
                            yesFn
                        </th>
                        <td>
                            函数
                        </td>
                        <td rowspan="2">
                            null
                        </td>
                        <td rowspan="2">
                            <p>
                                确定按钮回调函数。</p>
                            <p>
                                函数如果返回false将阻止对话框关闭；函数this指针指向内部api；如果传入true表示只显示有关闭功能的按钮；传入的第一个参数为对话框所在页面window对象（这个在穿越框架后有用）</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            布尔
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="2">
                            noFn
                        </th>
                        <td>
                            函数
                        </td>
                        <td rowspan="2">
                            null
                        </td>
                        <td rowspan="2">
                            <p>
                                取消按钮回调函数。</p>
                            <p>
                                函数如果返回false将阻止对话框关闭；函数this指针指向内部api；如果传入true表示只显示有关闭功能的按钮；传入的第一个参数为对话框所在页面window对象（这个在穿越框架后有用）</p>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            布尔
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            yesText
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            '确定'
                        </td>
                        <td>
                            "确定按钮"文字
                        </td>
                    </tr>
                    <tr>
                        <th>
                            noText
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            '取消'
                        </td>
                        <td>
                            "取消按钮"文字
                        </td>
                    </tr>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>尺寸</abbrev>
                        </th>
                    </tr>
                    <tr>
                        <th rowspan="2">
                            width
                        </th>
                        <td>
                            数值
                        </td>
                        <td rowspan="2">
                            'auto'
                        </td>
                        <td rowspan="2">
                            设置内容固定宽度，可以指定单位。没有则对话框自动适配
                        </td>
                    </tr>
                    <tr>
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="2">
                            height
                        </th>
                        <td>
                            数值
                        </td>
                        <td rowspan="2">
                            'auto'
                        </td>
                        <td rowspan="2">
                            设置内容固定高度，可以指定单位。没有则对话框自动适配
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>位置</abbrev>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            fixed
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            false
                        </td>
                        <td>
                            开启静止定位
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="2">
                            follow
                        </th>
                        <td>
                            元素
                        </td>
                        <td rowspan="2">
                            null
                        </td>
                        <td rowspan="2">
                            让对话框依附在指定元素附近。如果是字符串则表示使用ID获取元素
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr>
                        <th rowspan="2">
                            left
                        </th>
                        <td>
                            数值
                        </td>
                        <td rowspan="2">
                            'center'
                        </td>
                        <td rowspan="2">
                            X轴的坐标。如果开启了fixed则原点以浏览器视口为基准。可以使用'left'、'center'、'right'这些关键字
                        </td>
                    </tr>
                    <tr>
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="2">
                            top
                        </th>
                        <td>
                            数值
                        </td>
                        <td rowspan="2">
                            'center'
                        </td>
                        <td rowspan="2">
                            Y轴的坐标。如果开启了fixed则原点以浏览器视口为基准。可以使用'top'、'center'、'bottom'这些关键字
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>界面</abbrev>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            lock
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            false
                        </td>
                        <td>
                            开启锁屏。中断用户对话框之外的交互，用于显示非常重要的操作/消息
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            skin
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            'default'
                        </td>
                        <td>
                            自定义风格
                        </td>
                    </tr>
                    <tr>
                        <th>
                            border
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否显示边框。（需要皮肤文件支持）
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            icon
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            null
                        </td>
                        <td>
                            定义消息图标。（需要皮肤文件支持）
                        </td>
                    </tr>
                    <tr>
                        <th class="separate" colspan="4">
                            <abbrev>高级</abbrev>
                        </th>
                    </tr>
                    <tr class="odd">
                        <th>
                            id
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            自定义对话框ID属性。用途：1、防止重复弹出 2、返回已存在ID对话框的API接口
                        </td>
                    </tr>
                    <tr>
                        <th>
                            time
                        </th>
                        <td>
                            数值
                        </td>
                        <td>
                            null
                        </td>
                        <td>
                            设置对话框显示时间。以秒为单位
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            drag
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否允许用户拖动对话框
                        </td>
                    </tr>
                    <tr>
                        <th>
                            limit
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否限制挪动与定位范围
                        </td>
                    </tr>
                    <tr class="odd">
                        <th rowspan="3">
                            focus
                        </th>
                        <td>
                            布尔
                        </td>
                        <td rowspan="3">
                            true
                        </td>
                        <td rowspan="3">
                            定位焦点到对话框中指定元素，默认定位到按钮上。如果传入字符串则使用ID获取元素
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            字符串
                        </td>
                    </tr>
                    <tr class="odd">
                        <td>
                            元素
                        </td>
                    </tr>
                    <tr>
                        <th>
                            effect
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否开启动画特效
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            show
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否显示。为false表示不显示对话框，后面可以通过控制接口show()恢复显示
                        </td>
                    </tr>
                    <tr>
                        <th>
                            tmpl
                        </th>
                        <td>
                            字符串
                        </td>
                        <td>
                            null
                        </td>
                        <td>
                            启用模板引擎拼接消息内容，还需要与content参数传入JSON才能生效
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            esc
                        </th>
                        <td>
                            布尔
                        </td>
                        <td>
                            true
                        </td>
                        <td>
                            是否允许Esc键关闭对话框
                        </td>
                    </tr>
                    <tr>
                        <th rowspan="2">
                            window
                        </th>
                        <td>
                            字符串
                        </td>
                        <td rowspan="2">
                            'self'
                        </td>
                        <td rowspan="2">
                            指定窗口弹出对话框，可使用'top'、'parent'、'self'等关键字或者指定其他window对象。如果是'top'则表示让对话框在顶级页面弹出
                        </td>
                    </tr>
                    <tr>
                        <td>
                            对象
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            initFn
                        </th>
                        <td>
                            函数
                        </td>
                        <td>
                            null
                        </td>
                        <td>
                            对话框弹出后执行的函数
                        </td>
                    </tr>
                    <tr>
                        <th>
                            closeFn
                        </th>
                        <td>
                            函数
                        </td>
                        <td>
                            null
                        </td>
                        <td>
                            对话框关闭前执行的函数
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>
                上面这些的默认设置都可以统一被改变，如默认标题：art.dialog.defaults.title = '我是标题'</p>
            <p>
                需要对弹出后的对话框操作？下面介绍的就是artDialog的控制接口了。</p>
            <p>
                每次生成一个对话框后，它都会返回控制接口，这个控制接口还可以在<strong>回调函数的"this"指针</strong>获取到。</p>
            <p>
                如调用关闭接口，我们可以先定义一个变量引用对话框返回值：</p>
            <pre><code class=" javascript">var testDialog = art.dialog({ id: 'testDialog01', content:
                '我初始化后会返回控制接口，请注意接收' }); </code></pre>
            <p>
                然后在可以在其他地方调用"close"方法关闭对话框：</p>
            <pre><code class=" javascript">testDialog.close();</code></pre>
            <p>
                或者使用<code class=" javascript">art.dialog.get</code>()方法获取控制接口：</p>
            <pre><code class=" javascript">art.dialog.get('testDialog01').close();</code></pre>
            <p>
                好了，介绍了控制接口的用途，下面就是控制接口列表：</p>
            <h3>
                控制接口</h3>
            <table class="zebra">
                <colgroup>
                    <col class="col1">
                    <col class="col2">
                    <col class="col3">
                </colgroup>
                <thead>
                    <tr>
                        <th class="name">
                            名称
                        </th>
                        <th class="return">
                            返回值
                        </th>
                        <th class="note" colspan="3">
                            描述
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            close()
                        </th>
                        <td>
                            null
                        </td>
                        <td colspan="3">
                            关闭对话框
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            show()
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            显示对话框
                        </td>
                    </tr>
                    <tr>
                        <th>
                            hide()
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            隐藏对话框
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            content()
                        </th>
                        <td>
                            {HTMLElement}
                        </td>
                        <td colspan="3">
                            获取消息内容容器对象
                        </td>
                    </tr>
                    <tr>
                        <th>
                            content(value)
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            向消息容器中写入内容(innerHTML)
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            follow(element)
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            让对话框吸附到指定元素附近。（可传入对象的ID名称）
                        </td>
                    </tr>
                    <tr>
                        <th>
                            position(left, top)
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            重新定位对话框。无参数则居中定位
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            size(width, height)
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            重新设定对话框大小。注意此时参数类型必须为数值
                        </td>
                    </tr>
                    <tr>
                        <th>
                            focus(element)
                        </th>
                        <td>
                            {Object}
                        </td>
                        <td colspan="3">
                            定位焦点
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>
                artDialog还对一些常用的前后端交互方法进行扩展，并且这些对话框生下来就具有穿越框架的功能。这部分代码是作为插件实现的，你也可以根据自己需要去拓展新的方法（包括与jQuery结合使用），如果不需要也可以从源码中剔除掉：</p>
            <h3>
                自带的扩展方法 <span>[具体使用见演示文档]</span></h3>
            <table class="zebra">
                <colgroup>
                    <col class="col1">
                    <col class="col2">
                </colgroup>
                <thead>
                    <tr>
                        <th class="name" style="width: 22em">
                            名称
                        </th>
                        <th class="note" colspan="3">
                            描述
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            art.dialog.alert(content)
                        </th>
                        <td colspan="3">
                            警告
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            art.dialog.confirm(content, yesFn, noFn)
                        </th>
                        <td colspan="3">
                            确认
                        </td>
                    </tr>
                    <tr>
                        <th>
                            art.dialog.prompt(content, yesFn, value)
                        </th>
                        <td colspan="3">
                            提问
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            art.dialog.open(url, options)
                        </th>
                        <td colspan="3">
                            弹窗（iframe）
                        </td>
                    </tr>
                    <tr>
                        <th>
                            art.dialog.close()
                        </th>
                        <td colspan="3">
                            open方法创建的iframe里可用此关闭对话框
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            art.dialog.parent
                        </th>
                        <td colspan="3">
                            open方法创建的iframe里可用此获取来源窗口的window对象
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            art.dialog.tips(content, time)
                        </th>
                        <td colspan="3">
                            短暂提示
                        </td>
                    </tr>
                    <tr>
                        <th>
                            art.dialog.load(url, options, cache)
                        </th>
                        <td colspan="3">
                            Ajax加载内容
                        </td>
                    </tr>
                    <tr class="odd">
                        <th>
                            art.dialog.get(id, win)
                        </th>
                        <td colspan="3">
                            获取指定ID对话框的API. 第一个参数为ID，第二个默认当前window
                        </td>
                    </tr>
                </tbody>
            </table>
            <h3>
                jQuery + artDialog</h3>
            <p>
                如果页面引用了jQuery，artDialog将会献身成为jQuery的一个插件，方法与参数同上。例：</p>
            <pre><code class=" javascript">// 普通调用 $.dialog({content:'hello world!'}); // 使用jQuery强大的选择器让对话框跟随到元素附近
                $('#main .test').dialog({content: 'hello world'});</code></pre>
            <h2>
                演示</h2>
            <p>
                常规配置参数使用演示：<a href="doc/api.html" target="_blank">doc/api.html</a><br />
                跨框架下常用方法演示：<a href="doc/iframeTop.html" target="_blank">doc/iframeTop.html</a></p>
            <h2>
                下载</h2>
            <p>
                下载：<a href="http://code.google.com/p/artdialog/downloads/list" target="_blank">http://code.google.com/p/artdialog/downloads/list</a></p>
            <p>
                Code license:
                <br />
                <a href="http://www.gnu.org/licenses/lgpl.html" target="_blank">GNU Lesser General Public
                    License</a></p>
            <h2>
                应用到你的项目</h2>
            <p>
                一、在页面head引入一个js文件。</p>
            <pre><code class="javascript">&lt;script src=&quot;artDialog.min.js&quot;&gt;&lt;/script&gt;</code></pre>
            <p>
                二、在页面head设置默认配置（可选）。</p>
            <pre><code class="javascript">&lt;script&gt; // 设置对话框全局默认配置 (function(){ var d = art.dialog.defaults;
                // 按需加载要用到的皮肤，数组第一个为默认皮肤 // 如果只使用默认皮肤，可以不填写skin d.skin = ['default', 'chrome', 'facebook',
                'aero']; // 支持拖动 d.drag = true; // 超过此面积大小的对话框使用替身拖动 d.showTemp = 100000; })();
                &lt;/script&gt; </code></pre>
            <p>
                (更多可用可用默认设置请查看源文件)</p>
            <h2>
                主要的更新</h2>
            <dl>
                <dt>3.0.5</dt>
                <dd>
                    修复iPad或iPhone下使用锁屏焦点自动弹出的问题</dd>
                <dd>
                    修复移动设备使用手势缩放页面带来的漂移问题</dd>
                <dd>
                    修复fixed在移动设备中支持不完整的问题</dd>
                <dd>
                    修复window.top是框架集(frameset)页面可能会带来无限循环递归的问题</dd>
            </dl>
            <dl>
                <dt>3.0.4</dt>
                <dd>
                    修复closeFn参数在open与load方法执行出错</dd>
                <dd>
                    修复closeFn参数可能执行的问题</dd>
                <dd>
                    修复输入过程中按Esc意外关闭对话框的问题</dd>
                <dd>
                    增加art.dialog.get()方法获取指定ID对话框API</dd>
            </dl>
            <dl>
                <dt>3.0.3</dt>
                <dd>
                    修复锁屏的时候对话框内容无法使用退格键的BUG</dd>
                <dd>
                    修复框架集（frameset）页面不能植入artDialog而产生js报错的问题，并增加了其支持</dd>
                <dd>
                    art.dialog.open()产生的iframe其内部增加art.dialog.parent获取来源页window对象</dd>
            </dl>
            <dl>
                <dt>3.0.2</dt>
                <dd>
                    对art.dialog.open()产生的iframe可直接用art.dialog.clsoe()方法关闭</dd>
                <dd>
                    改善与jQuery的配合：ajax将由强大的jQuery.ajax驱动</dd>
                <dd>
                    为了保持命名风格，原来的art.dialog.get()换成art.dialog.load()</dd>
                <dd>
                    修复用jQuery.ready()在页面载入时直接调用对话框导致left参数失效的BUG</dd>
                <dd>
                    修复若干细小的BUG</dd>
            </dl>
            <dl>
                <dt>3.0.1</dt>
                <dd>
                    修复IE8可能重复执行的问题</dd>
            </dl>
            <dl>
                <dt>3.0</dt>
                <dd>
                    重写架构，DOM底层与应用层分离，代码重用</dd>
                <dd>
                    修复v2版几个严重的BUG</dd>
                <dd>
                    大幅度提高在IE浏览器下的性能</dd>
                <dd>
                    支持多皮肤共存，支持动画</dd>
                <dd>
                    简化框架应用下的穿越与对象传递操作</dd>
                <dd>
                    公开默认配置的读写</dd>
                <dd>
                    重写IE6 fixed实现</dd>
            </dl>
            <dl>
                <dt>2.0</dt>
                <dd>
                    重写代码，支持多对话框共存</dd>
                <dd>
                    支持返回控制接口关闭对话框</dd>
                <dd>
                    解决v1已知的一些BUG</dd>
            </dl>
            <dl>
                <dt>1.0</dt>
                <dd>
                    高度与宽度支持原生自适应内容，自适应文本对齐</dd>
                <dd>
                    支持拖动、Esc关闭对话框、坐标定位</dd>
                <dd>
                    支持自适应位置</dd>
                <dd>
                    支持IE6无抖动静止定位</dd>
            </dl>
            <h2>
                捐赠</h2>
            <p>
                artDialog就是你一直想要的对话框？哇～那么我非常期待你能够热情的提供15元或者其他金额的捐赠～</p>
            <p>
                <a href="http://www.alipay.com/" target="_blank">
                    <img src="doc/alipay.jpg" alt="支付宝" /></a><br />
                帐号：<span id="alipay"></span></p>
            <p>
            </p>
            <h2>
                联系</h2>
            <p>
                如果你对artDialog有什么意见建议可以用下面任意一种联系方式找到我。artDialog一直在不断完善自身，这个愉悦的过程中感谢有你的参与～</p>
            <p>
                作者：唐斌<br />
                邮箱：<span id="myEmail"></span><br />
                网站：<a href="http://www.planeart.cn" target="_blank">www.planeArt.cn</a><br />
                微博：<a href="http://t.qq.com/tangbin">t.qq.com/tangbin</a></p>
        </div>
    </div>
</body>
</html>
