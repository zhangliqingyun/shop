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
    
    <title>评论信息列表</title>
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
  
  <body style="background-color:#EDE3D6">
       <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#EDE3D6" border="0" style="margin-top:20px;">
            <tr>
                 <td align="center" bgColor="#F0A050" style="font-size:12px;height:23px;"> 
                     <strong>评论信息列表</strong>   
                 </td>
            </tr>
            <tr>
                <td style="height:30px">  
                </td>
            </tr>
            <tr>
                 <td align="center" bgColor="#f5fafe">
                      <table cellspacing="0" cellpadding="1" bordercolor="gray" border="1" style="BORDER-RIGHT:gray 1px solid;BORDER-TOP:gray 1px solid;BORDER-LEFT:gray 1px solid;BORDER-BOTTOM:gray 1px solid;WORD-BREAK:break-all;WIDTH:100%;BORDER-COLLAPSE:collapse;BACKGROUND-COLOR:#f5fafe;WORD-WRAP:break-word" >
                          <tr style="FONT-WEIGHT:bold;FONT-SIZE:12px;height:25px;background-color:#F0A050">
                              <td align="center" width="2%">
                                                                                                                  序号
                              </td>
                              <td align="center" width="3%">  
                                                                                                                   商品编号
                              </td>
                              <td align="center" width="3%">
                                                                                                                 评论人  
                              </td>
                              <td align="center" width="30%">  
                                                                                                                 评论信息                                          
                              </td>
                              <td align="center" width="5%">     
                                                                                                                  评论时间
                              </td>    
                              <td align="center" width="3%">
                                                                                                                 删除评论
                              </td>
                          </tr>
                          <s:iterator var="comments" value="pageBean.list" status="status">
	                        <s:if test="#status.count % 2 ==0"> 
		                          <tr style="background-color :#EDEDEA" style="font-size:12px;" onmouseover="this.style.backgroundColor ='#FAD8B4'" onmouseout="this.style.backgroundColor = '#EDEDEA'" >
		                              <td align="center"  style="cursor:hand;height:22px;" width="2%">
		                                   ${status.count}                                                                              
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">
		                                   ${comments.product.pid}
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">
		                                   <s:property value="#comments.user.name"/>                 
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="30%">
		                                   ${comments.content}
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="8%">
		                                   ${comments.cdate}                                                                                 
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">     
		                                    <a href="${pageContext.request.contextPath}/comments_delete.action?id=<s:property value="#comments.id"/>">  
		                                      <img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">                                                                              
		                                   </a>                
		                              </td>
		                          </tr>
		                          </s:if>	
							  <s:else>
							       <tr  style="font-size:12px;" onmouseover="this.style.backgroundColor ='#FAD8B4'" onmouseout="this.style.backgroundColor = '#F5FAFE'" >
		                              <td align="center"  style="cursor:hand;height:22px;" width="2%">
		                                   ${status.count}                                                                              
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">
		                                   ${comments.product.pid}
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">
		                                   <s:property value="#comments.user.name"/>                 
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="30%">
		                                   ${comments.content}
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="8%">
		                                   ${comments.cdate}                                                                                 
		                              </td>
		                              <td align="center" style="cursor:hand;height:22px;" width="3%">     
		                                    <a href="${pageContext.request.contextPath}/comments_delete.action?id=<s:property value="#comments.id"/>">  
		                                      <img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">                                                                              
		                                   </a>                
		                              </td>
		                          </tr>
							  </s:else>
                          </s:iterator>
                      </table>
                 </td>
            </tr>
            <tr>
               <td align="center" style="font-size:12px;">  
                                                              第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页&nbsp;&nbsp;&nbsp;&nbsp;   
                 <s:if test="pageBean.page != 1">
                       <a style="text-decoration:none;color:black;" href="${pageContext.request.contextPath}/comments_list.action?page=1">首页</a>           
                       <a style="text-decoration:none;color:black;" href="${pageContext.request.contextPath}/comments_list.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
                 </s:if> 
                 <s:if test="pageBean.page != pageBean.totalPage">  
                       <a style="text-decoration:none;color:black;" href="${pageContext.request.contextPath}/comments_list.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
                       <a style="text-decoration:none;color:black;" href="${pageContext.request.contextPath}/comments_list.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
                 </s:if>                                                                         
               </td>
            </tr>
       </table>
       
  </body>
</html>
