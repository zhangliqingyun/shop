<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="http://localhost:8080/mango/">
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
	  <s:if test="#session.cart.cartItems.size() !=0">
		<div class="span24">
			<div class="step step1">
				购物车信息：
			</div>
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>单价</th>  
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<s:iterator var="cartItem" value="#session.cart.CartItems">
					    <tr>
							<td width="60">
								<input type="hidden" name="id" value="22">
								<img src="${pageContext.request.contextPath}/<s:property value="#cartItem.product.image"/>">
							</td>
							<td>
								<a target="_blank"> <s:property value="#cartItem.product.pname"/></a>
							</td>
							<td>
								￥<s:property value="#cartItem.product.shop_price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="#cartItem.count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#cartItem.subtotal"/></span>
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/cart_deleteCart.action?pid=<s:property value="#cartItem.product.pid"/>" class="delete">删除</a>
							</td>
						</tr>
				  </s:iterator>
				</tbody>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				    <em id="promotion"></em>
					<em>
					            登录后确认是否享有优惠
				    </em>
					赠送积分: <em id="effectivePoint"><s:property value="#session.cart.total"/></em>
					商品金额: <strong id="effectivePrice">￥<s:property value="#session.cart.total"/>元</strong>
			</div>
			<div class="bottom">
					<a href="${pageContext.request.contextPath }/cart_clearCart.action" id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath }/order_save.action" id="submit" class="submit">提交订单</a>
			</div>
		</div>
	  </s:if>
	  <s:else>
	  	<div class="span24">
			<div class="step step1">
				<h2><span style="color:blue">亲，您还没有添加购物，请去购物。</span></h2>
			</div>
		</div>
	  </s:else>
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