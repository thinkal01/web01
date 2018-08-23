<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultNotCopy.aspx.cs" Inherits="DefaultNotCopy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
 <%
     OutPutJS.OutPutPiaofuRight("这里是要漂浮的内容");
     %>
</head>
<body>

    <form id="form1" runat="server">
    <div style=" height:1000px" >1000px</div>
        <div style=" height:1000px" >1000px</div>
</div> 
    </form>
    
</body>

</html>
