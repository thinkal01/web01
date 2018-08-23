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
using System.Text.RegularExpressions;

/// <summary>
///Intercept 的摘要说明
/// </summary>
public class Intercept
{
	public Intercept()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 处理字符串，一个汉字算作两个长度，一个ascii编码字符算作一个长度，内部的方法
    /// </summary>
    /// <param name="temp">要处理的字符串</param>
    /// <param name="temp1">要获得多少个长度（实际想要的文字个数）</param>
    /// <returns></returns>
    protected static string GetChuli(string temp, int temp1)
    {
        temp1 = temp1 * 2;
        char[] arr = temp.ToCharArray(0, temp.Length);
        StringBuilder ss = new StringBuilder();
        int length = 0;
        for (int i = 0; i < arr.Length; i++)
        {
            if (length > temp1)
            {
                break;
            }
            if (arr[i] > 255)
            {
                ss.Append(arr[i]);
                length = length + 2;
            }
            else
            {
                ss.Append(arr[i]);
                length++;
            }
        }
        temp = ss.ToString();
        return temp;
    }

    /// <summary>
    /// 去掉全部的html代码
    /// </summary>
    /// <param name="strHtml">原来的带有html标签的html代码</param>
    /// <returns>去掉标签之后的html代码</returns>
    protected static string StripHTML(string strHtml)
    {
        string[] aryReg =
            {
                @"<script[^>]*?>.*?</script>",
                @"<(\/\s*)?!?((\w+:)?\w+)(\w+(\s*=?\s*(([""'])(\\[""'tbnr]|[^\7])*?\7|\w+)|.{0})|\s)*?(\/\s*)?>", 
                @"([\r\n])[\s]+", 
                @"&(quot|#34);", 
                @"&(amp|#38);",
                @"&(lt|#60);",
                @"&(gt|#62);",
                @"&(nbsp|#160);", 
                @"&(iexcl|#161);",
                @"&(cent|#162);", 
                @"&(pound|#163);",
                @"&(copy|#169);", 
                @"&#(\d+);",
                @"-->",
                @"<!--.*\n"
              };

        string[] aryRep =
                {
                  "", "", "", "\"", "&", "<", ">", "   ", "\xa1", //chr(161),
                  "\xa2", //chr(162),
                  "\xa3", //chr(163),
                  "\xa9", //chr(169),
                  "", "\r\n", ""
                };

        string newReg = aryReg[0];
        string strOutput = strHtml;
        for (int i = 0; i < aryReg.Length; i++)
        {
            Regex regex = new Regex(aryReg[i], RegexOptions.IgnoreCase);
            strOutput = regex.Replace(strOutput, aryRep[i]);
        }
        strOutput.Replace("<", "");
        strOutput.Replace(">", "");
        strOutput.Replace("\r\n", "");
        return strOutput;
    }

    /// <summary>
    /// 统一输出的方法
    /// </summary>
    /// <param name="temp">stringbuilder 类型的参数，要输出的内容</param>
    protected static void OutPutHtml(StringBuilder temp)
    {
        System.Web.HttpContext.Current.Response.Write(temp);
    }

    /// <summary>
    /// 统一输出的方法
    /// </summary>
    /// <param name="temp">string 类型的参数，要输出地内容</param>
    protected static void OutPutHtml(string temp)
    {
        System.Web.HttpContext.Current.Response.Write(temp);
    }

}
