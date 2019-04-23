<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="./网上商城/index.htm">
					<img width="195px" height="55px" src="${pageContext.request.contextPath}/image/r___________renleipic_01/qingYun.png" alt="清云科技">
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

    <div class="container cart">
		<div class="span24">
			<div class="step step1">
				<div style="margin-top:15px">  
			       <span style="color:#FF4400;font-size:18px;font-weight:bold">确认订单信息</span>
			   <hr style="background-color:red;height:2px;border:none;"/>      
			</div> 
			</div>
			<table>
				<tbody>
					<tr>
						<th>图片</th>
						<th>商品信息</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<s:iterator  var="orderItem" value="model.orderItems">
						<tr>
							<td width="60">
								<input type="hidden" name="id" value="22"/>
								<img src="${pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
							</td>
							<td>
								<a target="_blank"><s:property value="#orderItem.product.pname"/></a>
							</td>
							<td>
								<s:property value="#orderItem.product.shop_price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="#orderItem.count"/>
								
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
							</td>
						</tr>
				   </s:iterator>
			  </tbody>
		 </table>
		 <dl id="giftItems" class="hidden" style="display: none;">
		 </dl>
		 <div class="total" style="border:0px solid red;background-color:#F2F7FF" >
				<em id="promotion"></em>
				<div>
				给卖家留言：<input type="text" style="width:280px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运送方式:&nbsp;&nbsp;&nbsp;&nbsp;普通配送&nbsp;&nbsp;快递 &nbsp;&nbsp;免邮 &nbsp;&nbsp;<span style="color:red">0.00</span> <br/>运费险:运费险卖家送,确认收货前退货可赔&nbsp;&nbsp;&nbsp;<span style="color:red">0.00</span>
				</div>
				<br/>实付款: <strong id="effectivePrice">￥<s:property value="model.total"/>元</strong>
		 </div>
		 <form id="orderForm" action="${pageContext.request.contextPath }/order_payOrder.action" method="post">
				<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
				<div class="span24">
					<div style="border:2px solid #F5F5F5;height:280px;margin-top:5px;margin-bottom:5px;">
					       <br/><span style="font-weight:bold;font-size:16px;">&nbsp;&nbsp;&nbsp;&nbsp;编辑收货信息</span><br/> <br/> <br/>
							&nbsp;&nbsp;&nbsp;&nbsp;详细地址&nbsp;&nbsp;&nbsp;：<input name="addr" type="text" value="<s:property value="model.user.addr"/>" style="width:350px" />
								<br /><br/><br/>
							&nbsp;&nbsp;&nbsp;&nbsp;收货人姓名：<input name="name" type="text" value="<s:property value="model.user.name"/>" style="width:150px" />
								<br /> <br/><br/>
							&nbsp;&nbsp;&nbsp;&nbsp;手机号码&nbsp;&nbsp;&nbsp;：<input name="phone" type="text"value="<s:property value="model.user.phone"/>" style="width:150px" />
					</div>
					
					<div style="border:2px solid #F5F5F5;height:100px;margin-top:5px;margin-bottom:5px;">
					   <br/>&nbsp;&nbsp;&nbsp;&nbsp; 菜鸟驿站代收服务&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:white;background-color:red;">免费</span><br/>
					   <br/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"/>[菜鸟驿站]北京 北京市 东城区 东四街道东四六条育芳胡同2号 齐善素食店(电话:13366233880)
					   <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style="text-decoration:none;color:#FD8000">修改驿站</a>
					</div>  
					
					<p style="border:2px solid #F5F5F5;">   
							选择支付方式：<br/>  
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${pageContext.request.contextPath }/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${pageContext.request.contextPath }/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle"/>
					</p>
					
					<p style="text-align:right;border:2px solid #F5F5F5;">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${pageContext.request.contextPath}/image/tjdd.jpg" width="204" height="51" border="0" />
							</a>
					</p>
				</div>
			</form>
		</div>
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