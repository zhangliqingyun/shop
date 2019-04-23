<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>我的订单页面</title>
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
			<div class="" style="margin-top:15px">
					<span style="color:red;font-size:16px;font-weight:bold;">所有订单<s:property value="pageBean.totalCount"/>  </span>    
					<hr style="height:2px;border:none;background-color:red"/>   
			</div>
			<table>
				<tbody>
					<tr>
						<th>订单编号</th>
						<th>图片</th>
						<th>商品信息</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>订单状态</th>
						<th>商品操作</th>
					</tr>
					<s:iterator var="order" value="pageBean.list">
				
						<s:iterator  var="orderItem" value="#order.orderItems">
							<tr>
							    <td width="60">
							       <s:property value="#order.ordernumber"/>   
							    </td>
								<td width="60">
									<input type="hidden" name="id" value="22"/>
									<img src="${pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
								</td>
								<td>
									<a target="_blank"><s:property value="#orderItem.product.pname"/></a>
								</td>
								<td  width="60">
									<s:property value="#orderItem.product.shop_price"/>
								</td>
								<td class="quantity" width="60">
									<s:property value="#orderItem.count"/>
									<div>
										
									</div>
								</td>
								<td width="60">
									<span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
								</td>
								<td  width="80">
								     <s:if test="#order.state == 1">
								         <a href="${pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="">付款</font></a> 
								     </s:if>
								      <s:if test="#order.state == 2">
								                             已经付款 
								     </s:if>   
								      <s:if test="#order.state == 3">
								        <a href="${pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="">确认收货</font></a> 
								     </s:if>
								     <s:if test="#order.state == 4">
								                          交易成功
								     </s:if>
								     <s:if test="#order.state == 5">  
								                          退款/退货中...
								     </s:if>
								</td>
								<td  width="80">  
								     <s:if test="#order.state == 3 || #order.state == 2">
								         <a href="${pageContext.request.contextPath }/order_returnProduct.action?oid=<s:property value="#order.oid"/>"><font color="">退款/退货</font></a> 
								     </s:if>   
								</td> 
							</tr>
						</s:iterator>
			    </s:iterator>
				<tr>
					<td colspan="7">
					     <div class="pagination">
	                         <span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页</span>
		                     <s:if test="pageBean.page != 1">
					             <a class="firstPage" href="${pageContext.request.contextPath }/order_findByUid.action?page=1">&nbsp;</a>
					             <a class="previousPage" href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1"/>">&nbsp;</a>
				             </s:if>
				             <s:iterator var="i" begin="1" end="pageBean.totalPage">
					             <s:if test="pageBean.page != #i">
					                  <a href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#i"/>"><s:property value="#i"/></a>
					             </s:if>
					             <s:else>
						              <span class="currentPage"><s:property value="#i"/></span>
					             </s:else>
				             </s:iterator>
							 <s:if test="pageBean.page != pageBean.totalPage">
								 <a class="nextPage" href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
								 <a class="lastPage" href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
							 </s:if>
	                     </div>
					</td>
				</tr>
			 </tbody>
		  </table>
		</div>
	</div>
	
	<div style="text-align:center">
		<img src="${pageContext.request.contextPath}/image/tishi.jpg"/>  <span style="color:#FD8000">有问题？找<span style="font-size:20px;color:#FD8000">小云</span>哟 </span>  
	</div>  
	
	<div style="align:center;background-color:#F0F0F0;margin-left:15%;margin-right:15%;margin-bottom:10px;">    
	      <table style="margin:auto;">    
	          <tr style="line-height:30px;">
	              <td>
	                      <a style="color:#FD8000;text-decoration:none" href="#">1.如何修改订单商品尺码、型号、颜色等信息？</a>
	              </td>
	              <td>  
	                      <a style="color:#FD8000;text-decoration:none" href="#">2. 物流信息不更新了，怎么办？</a>
	              </td>
	          </tr>
	          <tr  style="line-height:30px;">
	              <td>
					      <a style="color:#FD8000;text-decoration:none" href="#">3. 卖家未按约定时间发货，怎么办？</a>
				  </td>
				  <td>
					      <a style="color:#FD8000;text-decoration:none" href="#">4.  卖家不处理我的退款，怎么办？</a>
	              </td>
	          </tr>
	      </table>
	</div>
	
  	<div class="container footer">
	   <div class="span24">
		   <div class="footerAd">
					<img src="./image/bottom.jpg" width="947" height="120">
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