/**
 * Created by andy on 2015/7/17.
 */
function scroll(){
    if(window.pageYOffset != null)
    // ie9+ ���ϵ������  �����������
    {
        return{
            top:window.pageYOffset,
            left:window.pageXOffset
        }
    }
    //����dtd �������
    if(document.compatMode == 'CSS1Compat')
    {
        return {
            top: document.documentElement.scrollTop,
            left: document.documentElement.scrollLeft
        }
    }
    // ����ģʽ�������
    return{
        top: document.body.scrollTop,
        left: document.body.scrollLeft
    }
}
function $(id){return document.getElementById(id)}
function getStyle(obj,attr)
{
    if(obj.currentStyle)
    {
        return obj.currentStyle[attr];
    }
    else
    {
        return getComputedStyle(obj,null)[attr];
    }
}