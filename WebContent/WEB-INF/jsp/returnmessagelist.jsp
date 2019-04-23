<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>反馈信息列表</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
       <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0" style="margin-top:20px;">
            <tr>
                 <td align="center" bgColor="#afd1f3" style="font-size:12px;height:23px;"> 
                     <strong>反馈信息列表</strong>
                 </td>
            </tr>
            <tr>
                <td style="height:30px">  
                </td>
            </tr>
            <tr>
                 <td align="center" bgColor="#f5fafe">
                      <table cellspacing="0" cellpadding="1" bordercolor="gray" border="1" style="BORDER-RIGHT:gray 1px solid;BORDER-TOP:gray 1px solid;BORDER-LEFT:gray 1px solid;BORDER-BOTTOM:gray 1px solid;WORD-BREAK:break-all;WIDTH:100%;BORDER-COLLAPSE:collapse;BACKGROUND-COLOR:#f5fafe;WORD-WRAP:break-word" >
                          <tr style="FONT-WEIGHT:bold;FONT-SIZE:12px;height:25px;background-color:#afd1f3">
                              <td align="center" width="3%">
                                                                                                                  序号
                              </td>
                              <td align="center" width="25%">
                                                                                                                    反馈信息
                              </td>
                              <td align="center" width="5%">
                                                                                                                    联系方式
                              </td>
                              <td align="center" width="5%">
                                                                                                                   反馈时间
                              </td>
                          </tr>
                          <s:iterator var="returnmessage" value="pageBean.list" status="status">
	                          <tr style="font-size:12px;" onmouseover="this.style.backgroundColor ='white'" onmouseout="this.style.backgroundColor = '#f5fafe'" >
	                              <td align="center"  style="cursor:hand;height:22px;" width="3%">
	                                   ${status.count}                                                                              
	                              </td>
	                              <td align="center" style="cursor:hand;height:22px;" width="25%">
	                                   ${returnmessage.content}
	                              </td>
	                              <td align="center" style="cursor:hand;height:22px;" width="5%">
	                                   ${returnmessage.contact}
	                              </td>
	                              <td align="center" style="cursor:hand;height:22px;" width="5%">
	                                   ${returnmessage.returndate}                                                                                 
	                              </td>
	                          </tr>
                          </s:iterator>
                      </table>
                 </td>
            </tr>
            <tr>
               <td align="center" style="font-size:12px;">
                                                              第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页&nbsp;&nbsp;&nbsp;&nbsp;   
                 <s:if test="pageBean.page != 1">
                       <a href="${pageContext.request.contextPath}/returnMessage_list.action?page=1">首页</a>           
                       <a href="${pageContext.request.contextPath}/returnMessage_list.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
                 </s:if> 
                 <s:if test="pageBean.page != pageBean.totalPage">
                       <a href="${pageContext.request.contextPath}/returnMessage_list.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
                       <a href="${pageContext.request.contextPath}/returnMessage_list.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
                 </s:if>                                                                         
               </td>
            </tr>
       </table>
       
  </body>
</html>
