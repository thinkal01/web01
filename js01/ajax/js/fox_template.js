// 模板引擎
var $_fox = {
    /*
    参数1:模板字符串
    参数2:想要替换的对象
     */
    template: function (templateStr, obj) {
        // 正则表达式
        var reg = /<%=\s*([^%>]+\S)\s*%>/;
        // 匹配
        var result;
        // 每次循环都查找模板中 满足条件的文本 进行替换 直到查找不到为止
        while (result = reg.exec(templateStr)) {
            // 匹配的 文本
            var matchString = result[0];
            // 匹配的 =号 之后的 字母
            var matchWord = result[1];
            // 使用 字符串的replace 进行替换
            templateStr = templateStr.replace(matchString, obj[matchWord]);
        }
        return templateStr;
    }
};

function fox_template(str, obj) {
    // 准备正则 匹配至少一个字母
    var reg = /\w+/;

    // 准备挖好坑的字符串
    var str = str;

    // 准备 用来填坑的 对象
    var obj = obj;

    // 首先 使用正则对象 验证一次 字符串 while 会看 result 是否有值
    var result;
    while (result = reg.exec(str)) {
        // 获取 匹配的 key
        var key = result[0];

        // 通过key 获取value
        var value = obj[key];

        // 替换
        str = str.replace(key, value);
    }

    // 执行完毕 说明 替换完成了
    return str;
}

// 希望查找的东西是{{age}}
function fox_template_pro(str, obj) {
    // 准备正则 匹配至少一个 字母
    // 正则的 开始 是 {{    结束是}}
    // 中间的 小括号 可以对 正则 筛选出来的 字符串 再次筛选
    var reg = /{{(\w+)}}/;

    // 准备挖好坑的字符串
    var str = str;

    // 准备 用来填坑的 对象
    var obj = obj;

    // 首先 使用正则对象 验证一次 字符串 while 会看 result 是否有值
    // 这一次 找到的 有两个值
    /*
        第一个  {{animal}} 索引为0
        第二个 animal  索引为1
    */
    var result;
    while (result = reg.exec(str)) {
        // 获取 匹配的 key
        var key = result[1];

        // 通过key 获取value
        var value = obj[key];

        // 替换  替换的是 {{animal}}
        str = str.replace(result[0], value);
    }

    // 执行完毕 说明 替换完成了
    return str;
}