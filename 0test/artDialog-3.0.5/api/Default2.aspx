<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="artDialog.js"></script>
    <script type="text/javascript" src="artDialog.min.js"></script>
    
    <script type="text/javascript">
        (function () {
            var d = art.dialog.defaults;

            // 按需加载要用到的皮肤，数组第一个为默认皮肤
            // 如果只使用默认皮肤，可以不填写skin
            d.skin = ['default', 'chrome', 'facebook', 'aero'];
           
            // 支持拖动
            d.drag = true;

            // 超过此面积大小的对话框使用替身拖动
            d.showTemp = 100000;
        })();

        function login() {

        art.dialog.open('Login.aspx', {
                title: '登录窗口',
                skin: 'aero',
                drag:false,
                lock:true,
                id: 'abc'
            });
}
        function Check()
        {
            PageMethods.GetShuju(LastStep);
        }
        function LastStep(result)
        {
//            alert(result);
              art.dialog({skin: 'aero',content: result});
        }
    </script>
    
<%--    <%
        Output.OutputDefault();
         %>--%>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptmanager" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div>
        <a href="#"  onclick="art.dialog.alert('登陆窗口')">后台登陆</a>
        <a href="#" onclick="art.dialog({content:'我支持ie'})">支持框架</a>
        <a href="#" onclick="art.dialog({skin: 'aero',content: '我是一个漂亮的半透明皮肤，支持IE6哦'});">我支持漂亮的皮肤</a>
        <a href="#" onclick="Check()">使用webservice的方法</a>
    </div>
    </form>
</body>
</html>
