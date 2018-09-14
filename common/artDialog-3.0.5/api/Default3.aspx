<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="artDialog.js"></script>
    <script type+"text/javascript">
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a href="#" onclick="art.dialog({skin: 'aero',content: '我是一个漂亮的半透明皮肤，支持IE6哦'});">我支持漂亮的皮肤</a>
</asp:Content>

