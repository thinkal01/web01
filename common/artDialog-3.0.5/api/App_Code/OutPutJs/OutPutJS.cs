using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;

/// <summary>
///OutPutJS 的摘要说明
/// </summary>
public class OutPutJS : Intercept
{
	public OutPutJS()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 输出滚动图片
    /// </summary>
    /// <param name="type">图片表的类型</param>
    /// <param name="imagecount">要显示的图片的数量</param>
    //public static void OutPutStrollImage(imagetype type, int typeid, int imagecount)
    //{
    //    #region 先获取数据
    //    StringBuilder strSql = new StringBuilder();
    //    strSql.Append("select top " + imagecount.ToString() + " propic from ");
    //    switch (type)
    //    {
    //        case imagetype.typeCases:
    //            strSql.Append(" cgal where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        case imagetype.typeImage:
    //            strSql.Append(" image where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        case imagetype.typeProduct:
    //            strSql.Append(" product where classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        default:
    //            strSql.Append(" product where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //    }
    //    DataTable dt = DB.getdataset(strSql.ToString()).Tables[0];
    //    #endregion

    //    #region 输出图片列表
    //    StringBuilder strHtml = new StringBuilder();
    //    strHtml.Append("<div id=\"demo\"><div id=\"indemo\"><div id=\"demo1\">");
    //    //判断是否想要的图片数量和 实际的图片数量一致，不一致按照实际的情况来
    //    imagecount = dt.Rows.Count;
    //    for (int i = 0; i < imagecount; i++)
    //    {
    //        strHtml.Append("<img src=\"" + dt.Rows[i]["propic"].ToString() + "\" border=\"0\" />");
    //    }
    //    strHtml.Append("</div><div id=\"demo2\"></div></div></div>");

    //    #endregion

    //    #region 要输出的javascript的代码
    //    StringBuilder strScript = new StringBuilder();
    //    strScript.Append(" <script type=\"text/javascript\"> ");
    //    strScript.Append(" var speed=30; //数字越大速度越慢");
    //    strScript.Append(" var tab=document.getElementById(\"demo\"); ");
    //    strScript.Append(" var tab1=document.getElementById(\"demo1\"); ");
    //    strScript.Append(" var tab2=document.getElementById(\"demo2\"); ");
    //    strScript.Append(" tab2.innerHTML=tab1.innerHTML; ");
    //    strScript.Append(" function Marquee(){ ");
    //    strScript.Append(" if(tab2.offsetWidth-tab.scrollLeft<=0) ");
    //    strScript.Append(" tab.scrollLeft-=tab1.offsetWidth ");
    //    strScript.Append(" else{ tab.scrollLeft++; }} ");
    //    strScript.Append(" var MyMar=setInterval(Marquee,speed); ");
    //    strScript.Append(" tab.onmouseover=function() {clearInterval(MyMar)}; ");
    //    strScript.Append(" tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)}; ");
    //    strScript.Append(" </script> ");
    //    #endregion

    //    #region 开始输出
    //    Intercept.OutPutHtml(strHtml.Append(strScript.ToString()));
    //    #endregion

    //}

    /// <summary>
    /// 输出滚动图片，要是实际的图片数量和想要的数量不一致，按照实际的数量来输出
    /// </summary>
    /// <param name="type">图片表的类型</param>
    /// <param name="imagecount">要显示的图片的数量</param>
    /// <param name="typeid">添加图片的表的类型id</param>
    /// <param name="ImageHeight">图片的高度</param>
    /// <param name="ImageWidth">图片的宽度</param>
    //public static void OutPutStrollImage(imagetype type, int typeid, int imagecount, string ImageWidth, string ImageHeight)
    //{
    //    #region 有些变量要是没有值的话，先初始化

    //    if (ImageWidth.Trim() == "")
    //        ImageWidth = "209px";
    //    if (ImageHeight.Trim() == "")
    //        ImageHeight = "140px";

    //    #endregion

    //    #region 先获取数据
    //    StringBuilder strSql = new StringBuilder();
    //    strSql.Append("select top " + imagecount.ToString() + " propic from ");
    //    switch (type)
    //    {
    //        case imagetype.typeCases:
    //            strSql.Append(" cgal where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        case imagetype.typeImage:
    //            strSql.Append(" image where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        case imagetype.typeProduct:
    //            strSql.Append(" product where classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //        default:
    //            strSql.Append(" product where  classid=" + typeid + " and isshowInpage='是' order by id desc");
    //            break;
    //    }
    //    DataTable dt = DB.getdataset(strSql.ToString()).Tables[0];
    //    #endregion

    //    #region 输出图片列表
    //    StringBuilder strHtml = new StringBuilder();
    //    strHtml.Append("<div id=\"demo\"><div id=\"indemo\"><div id=\"demo1\">");
    //    //判断是否想要的图片数量和 实际的图片数量一致，不一致按照实际的情况来
    //    imagecount = dt.Rows.Count;
    //    for (int i = 0; i < imagecount; i++)
    //    {
    //        strHtml.Append("<img src=\"" + dt.Rows[i]["propic"].ToString() + "\" border=\"0\" width=\"" + ImageWidth + "\"  heigth=\"" + ImageWidth + "\"/>");
    //    }
    //    strHtml.Append("</div><div id=\"demo2\"></div></div></div>");

    //    #endregion

    //    #region 要输出的javascript的代码
    //    StringBuilder strScript = new StringBuilder();
    //    strScript.Append(" <script type=\"text/javascript\"> ");
    //    strScript.Append(" var speed=30; //数字越大速度越慢");
    //    strScript.Append(" var tab=document.getElementById(\"demo\"); ");
    //    strScript.Append(" var tab1=document.getElementById(\"demo1\"); ");
    //    strScript.Append(" var tab2=document.getElementById(\"demo2\"); ");
    //    strScript.Append(" tab2.innerHTML=tab1.innerHTML; ");
    //    strScript.Append(" function Marquee(){ ");
    //    strScript.Append(" if(tab2.offsetWidth-tab.scrollLeft<=0) ");
    //    strScript.Append(" tab.scrollLeft-=tab1.offsetWidth; ");
    //    strScript.Append(" else{ tab.scrollLeft++; }} ");
    //    strScript.Append(" var MyMar=setInterval(Marquee,speed); ");
    //    strScript.Append(" tab.onmouseover=function() {clearInterval(MyMar)}; ");
    //    strScript.Append(" tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)}; ");
    //    strScript.Append(" </script> ");
    //    #endregion

    //    #region 开始输出
    //    Intercept.OutPutHtml(strHtml.Append(strScript.ToString()));
    //    #endregion

    //}

    /// <summary>
    /// 出入javascript脚本，防止文章复制（方法写到body中间或者是body和head之间）
    /// </summary>
    public static void OutPutNoCopy()
    {
        StringBuilder strHtml = new StringBuilder();
        strHtml.Append("<script type=\"text/javascript\" src=\"js/jquery.min.js\"></script><script type=\"text/javascript\" src=\"artDialog.js\"></script>");
        strHtml.Append("<script> function look(){ if(event.ctrlKey) alert(\"禁止按ctrl键!不准复制哦！~_~\"); } document.onkeydown=look;  </script><Script LANGUAGE=\"JavaScript\"> if(self!=top){top.location=self.location;}function click() {if (event.button==2) { alert('请与本公司管理员联系！')}}document.onmousedown=click;</script>");
        Intercept.OutPutHtml(strHtml);
    }

    /// <summary>
    /// 漂浮内容
    /// </summary>
    /// <param name="content">要浮动的内容</param>
    public static void OutPutPiaofuRight(string content)
    {
        StringBuilder stJs = new StringBuilder();
        stJs.Append("<div id=\"divStayTopright\" style=\"position:absolute; z-index:999\">"+content+"</div> ");
        stJs.Append(" <script type=\"text/javascript\">");
        stJs.Append(" var verticalpos=\"frombottom\";");
        stJs.Append(" function JSFX_FloatTopDiv()");
        stJs.Append(" {var startX =0,");
        stJs.Append(" startY = 459;");
        stJs.Append(" var ns = (navigator.appName.indexOf(\"Netscape\") != -1);");
        stJs.Append(" var d = document;");
        stJs.Append(" function ml(id)");
        stJs.Append(" {");
        stJs.Append(" var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.divs[id];");
        stJs.Append(" if(d.divs)el.style=el;");
        stJs.Append(" el.sP=function(x,y){this.style.right=x;this.style.top=y;};");
        stJs.Append(" el.x = startX;");
        stJs.Append(" if (verticalpos==\"fromtop\")");
        stJs.Append(" el.y = startY;");
        stJs.Append(" else{");
        stJs.Append(" el.y = ns ? pageYOffset + innerHeight : document.documentElement.scrollTop + document.documentElement.clientHeight;");
        stJs.Append(" el.y -= startY;");
        stJs.Append(" }");
        stJs.Append(" return el;}");
        stJs.Append(" window.stayTopright=function()");
        stJs.Append(" {");
        stJs.Append(" if (verticalpos==\"fromtop\"){");
        stJs.Append(" var pY = ns ? pageYOffset : document.documentElement.scrollTop;");
        stJs.Append(" ftlObj.y += (pY + startY - ftlObj.y)/8;");
        stJs.Append(" }");
        stJs.Append(" else{");
        stJs.Append(" var pY = ns ? pageYOffset + innerHeight : document.documentElement.scrollTop + document.documentElement.clientHeight;");
        stJs.Append(" ftlObj.y += (pY - startY - ftlObj.y)/8;");
        stJs.Append(" }");
        stJs.Append(" ftlObj.sP(ftlObj.x, ftlObj.y);");
        stJs.Append(" setTimeout(\"stayTopright()\", 10);");
        stJs.Append(" };");
        stJs.Append(" ftlObj = ml(\"divStayTopright\");");
        stJs.Append(" stayTopright();");
        stJs.Append(" }");
        stJs.Append(" JSFX_FloatTopDiv();");
        stJs.Append(" </script>");
        Intercept.OutPutHtml(stJs);
    }


    /// <summary>
    /// 输入要漂浮的内容即可
    /// </summary>
    /// <param name="content">要漂浮显示的内容</param>
    public static void OutPutPiaofuAllPage(string content)
    {
        StringBuilder strHtml = new StringBuilder();
        #region 添加内容

        strHtml.Append("<div id=\"codefans_net\" style=\"position:absolute\">");
        strHtml.Append(content);
        strHtml.Append("</div>");

        #endregion
        strHtml.Append(" <script type=\"text/javascript\"> ");
        strHtml.Append(" var x = 50,y = 60; ");
        strHtml.Append(" var xin = true, yin = true; ");
        strHtml.Append(" var step = 1; ");
        strHtml.Append(" var delay = 10; ");
        strHtml.Append(" var obj=document.getElementById(\"codefans_net\"); ");
        strHtml.Append(" function float() { ");
        strHtml.Append(" var L=T=0 ;");
        strHtml.Append(" var R= document.body.clientWidth-obj.offsetWidth;  ");
        strHtml.Append(" var B = document.body.clientHeight-obj.offsetHeight;  ");
        strHtml.Append(" obj.style.left = x + document.body.scrollLeft ; ");
        strHtml.Append(" obj.style.top = y + document.body.scrollTop  ;");
        strHtml.Append(" x = x + step*(xin?1:-1) ; ");
        strHtml.Append(" if (x < L) { xin = true; x = L;}  ");
        strHtml.Append(" if (x > R){ xin = false; x = R;}  ");
        strHtml.Append(" y = y + step*(yin?1:-1);  ");
        strHtml.Append(" if (y < T) { yin = true; y = T ;}  ");
        strHtml.Append(" if (y > B) { yin = false; y = B ;}  ");
        strHtml.Append(" }  ");
        strHtml.Append(" var itl= setInterval(\"float()\", delay) ; ");
        strHtml.Append(" obj.onmouseover=function(){clearInterval(itl)};  ");
        strHtml.Append(" obj.onmouseout=function(){itl=setInterval(\"float()\", delay)};  ");
        strHtml.Append(" </script> ");
        Intercept.OutPutHtml(strHtml);

    }
}
