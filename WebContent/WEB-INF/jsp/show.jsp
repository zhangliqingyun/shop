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
                     <br/><div style="height:50px"><a>生活服务</a></div>
                     <div style="height:50px"><a>办公商务</a></div>
                     <div style="height:50px"><a>吃喝玩乐</a></div>
                     <div style="height:50px;"><a id="returnmessage">便民服务</a></div>
                     <div style="height:50px"><a>投资理财</a></div>
                     <div style="height:100px"><a>热门招聘</a></div>
                 </td>
                 <td style="height:350px;">
                     <div style="height:30px"><span id="returnSpan">便民消息 </span> </div>
                      <div id="myhr">
                         <hr id="hr"/>
                      </div>  
                     <div id="tips" style="background-color:#C9EEFE;color:#2ED0FC;font-size:24px;font-style: italic"><span style="color:#FC0204;font-size:26px;">1元</span>可以让您的信息<span style="color:#FC0204;font-size:26px;">遍布全城</span>，您还在等什么<span style="color:#FC0204;font-size:26px;">?</span><span style="margin-left:80px;font-style: normal;color:white;background-color:#FF7B00;"><a href="#" style="text-decoration: none;color:white">立刻购买</a></span></div>   
                     	<div style="height:50px;margin-left:60px;margin-top:20px;font-size:14px;">   
						    标题:<span style="padding-left:15px"><input type="text" style="border-top:0;text-align:center;border-left:0px;border-right:0px" readonly="readonly" value="<s:property value="model.title"/>"/></span>
						</div>
	                     <div style="margin-left:60px;">     
					          <span style="font-size:14px;position:relative;left:0px;top:-130px;font-size:14px;">详情:</span>               
					   	        <textarea rows="10" cols="60" name="content" id="content" readonly="readonly"><s:property value="model.content"/></textarea>       
						</div>    
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