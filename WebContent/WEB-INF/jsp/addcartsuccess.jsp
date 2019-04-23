<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />  
<title>清云商城</title>
  
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fckeditor/fckeditor.js"></script>

</head>     
<body>

	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a>
					<img width="195px" height="55px" src="${pageContext.request.contextPath}/image/r___________renleipic_01/qingYun.png" alt="清云科技">
				</a>
			</div>
		</div>
		<div class="span9">
	        <div class="headerAd">
						  <img src="${pageContext.request.contextPath}/image/gx.jpg" width="320" height="45" style="margin-top:10px;"/>
	        </div>	
	    </div>
		<%@ include file="menu.jsp"%>  
	</div>
	
	<div style="margin-left:15%;border:1px solid #D1D1D1;margin-right:15%;margin-top:20px;">        
	       <table>
	          <tr>
	             <td>   
	                  <div>
                          <img  style="height:320px;width:320px" src="${pageContext.request.contextPath}/<s:property value="#session.product.image"/>"/>
                      </div>   
	             </td>
	             <td>
	                 <div>
	                       <p>已添加商品:<span style="color:#FA7B00"><s:property value="#session.product.pname"/></span></p><br/><br/><br/>
	                       <p>继续添加其它属性：</p><br/><br/>    
	                       <div>　 　
                                                                                                          尺&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;
	                           <button value="M"  style="border:1px solid #D1D1D1;color:gray">M</button> &nbsp;
	                           <button value="L" style="border:1px solid #D1D1D1;color:gray">L</button> &nbsp;
	                           <button value="XL" style="border:1px solid #D1D1D1;color:gray">XL</button>   &nbsp;
	                           <button value="2XL" style="border:1px solid #D1D1D1;color:gray">2XL</button> &nbsp;
	                           <button value="3XL" style="border:1px solid #D1D1D1;color:gray">3XL</button> &nbsp;
	                           <button value="4XL" style="border:1px solid #D1D1D1;color:gray">4XL</button>    
	                       </div>  
	                       <p align="center">  
	                          <br/> <br/><img src="${pageContext.request.contextPath }/images/zhankai.png"/>  
	                       </p>
	                 </div>
	             </td>
	             <td>
	                 <div>
	                        <div>     
	                             <div style="height:120px"></div>            
	                             <a href="#" onclick="history.go(-1)"><img src="${pageContext.request.contextPath}/images/xiangqing.png" style="width:120px;height:40px"/></a>
	                        </div>
	                 </div>  
	             </td>
	             <td align="right">    
	                  <div style="width:160px;margin-right:10px;">            
	                       <div style="padding-top:-20px"><img src="${pageContext.request.contextPath}/images/ok.png"/>已成功加入购物车！</div>     
	                       <div style="height:30px"></div>          
	                       <div style="color:#FF4400;font-size:16px;margin-bottom:10px;align:right;">小计：￥<s:property value="#session.cartItem.subtotal"/></div>      
	                       <div style="font-size:12px;margin-bottom:5px;">购物车共有<span style="color:#FF4400"><s:property value="#session.cartitemnumber"/></span>件商品</div>  
	                       <div> <a href="${pageContext.request.contextPath}/cart2_list.action"><img src="${pageContext.request.contextPath}/images/jiesuan.png" style="height:40px;width:140px"/></a></div>         
	                        
	                  </div>     
	             </td>
	          </tr>
	       </table>
	</div>
	
		
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