<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清云商城</title>   
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<link href="./css/common.css" rel="stylesheet" type="text/css"/>
<link href="./css/product.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/returnmessage.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="http://localhost:8080/mango/">
					<img src="${pageContext.request.contextPath }/image/r___________renleipic_01/qingYun.png" width="195px" height="55px" alt="清云科技">
				</a>
			</div>
		</div>
		<div class="span9">
	        <div class="headerAd">
				    <img src="${pageContext.request.contextPath}/image/gx.jpg" width="320" height="45" style="margin-top:10px;"/>
	        </div>	
	    </div>
		<%@ include file="menu.jsp" %>
	</div>	
	
    <div id="mainReturn">   
         <table style="width:100%">
             <tr> 
                 <td id="leftTd">    
                     <br/><div style="height:50px"><a>关于我们</a></div>
                     <div style="height:50px"><a>收录申请</a></div>
                     <div style="height:50px"><a>广告合作</a></div>
                     <div style="height:50px;"><a id="returnmessage">建议反馈</a></div>
                     <div style="height:50px"><a>主页修复</a></div>
                     <div style="height:100px"><a>版权说明</a></div>
                 </td>
                 <td style="height:350px;">
                     <div style="height:30px"><span id="returnSpan">建议反馈 </span> </div>
                      <div id="myhr">
                         <hr id="hr"/>
                      </div>
                     <div id="tips" >您好，欢迎您给我们提出使用中遇到的问题或建议！留下联系方式，将有机会获得精美礼品！</div>
                     <form action="${pageContext.request.contextPath}/returnmessage_save.action" method="post">
	                     <div style="margin-left:60px;">
					          <span style="font-size:14px;position:relative;left:0px;top:-130px;font-size:14px;">反馈内容:</span>  
					   	        <textarea rows="10" cols="60" name="content" id="content"></textarea>     
					   	      <span style="position:relative;left:10px;top:-130px;font-size:14px;"><span style="color:red;font-weight:bold;font-size:14px;">*</span>必填 </span>
						</div>
						<div style="height:50px;margin-left:60px;">
						    <span style="font-size:14px;">联系方式：</span>    
						    <input onfocus="if(this.value=='请优先填写QQ号,方便在线沟通') this.value=''" onblur="if(this.value=='') this.value='请优先填写QQ号,方便在线沟通'" type="text" name="contact" value="请优先填写QQ号,方便在线沟通" id="connection" />
						    &nbsp;&nbsp;<span id="star2">*</span><span style="font-size:14px;">必填</span>
						</div>
						<div style="margin-left:130px;">
						   <input type="submit" id="submit" value="马上提交" onclick="javascript:$.messager.alert('温馨提示','谢谢反馈!','info');"  onmouseover="cursor:hand"/>
						</div> 
					 </form>  
                 </td>
             </tr>
         </table>
    </div>
    
    <br/>
      
 	<div class="container footer">
	   <div class="span24">
		   <div class="footerAd">
					<img src="./image/bottom.jpg" width="950" height="120">
           </div>  
   	   </div>
    </div>
    <div style="font-size:13px;color:#4B4B4B;text-align:center;margin-top:10px">       
           <p> 关于Qingyun | 清云推广 | 大客户合作 | 渠道合作 | 帮助中心 | 手机号被冒用 | 友情链接| 网站合作 | 招贤纳士 | 区县导航 | 关注清云微博  </p><br/>  
           <p>营业执照  京ICP证1109866号  京ICP备110451896  海淀公安局网络备案编号：11010817596  乙测资字110110186</p><br/>
		   <p>Copyright ©2017-<span style="font-size:14px">∞</span>  清云商城  版权所有</p><br/><br/>
    </div>
</body>
</html>