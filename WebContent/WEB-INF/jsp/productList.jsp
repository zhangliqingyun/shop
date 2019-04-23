<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清云商城</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="./css/common.css" rel="stylesheet" type="text/css"/>
<link href="./css/product.css" rel="stylesheet" type="text/css"/>
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

    <div class="container productList">
		<div class="span6">
			<div class="hotProductCategory" style="background-color:#9D1E27;">  
			      <s:iterator var="c" value="#session.cList">
						<dl>
							<dt>    
								<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><span style="color:white;"><s:property value="#c.cname"/></span></a>
							</dt>
							<s:iterator var="cs" value="#c.categorySeconds">
									<dd>
										<a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><span style="color:white;"><s:property value="#cs.csname"/></span></a>
									</dd>
							</s:iterator>
						</dl>
				   </s:iterator>	
			</div>
		</div>
		<div class="span18 last">
			<form id="productForm" action="./image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value="">
				<input type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">
				<div id="result" class="result table clearfix">
						<ul>
								<s:iterator  var="p" value="pageBean.list">
						            <li>
										<a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#p.pid"/>">
											<img src="${pageContext.request.contextPath }/<s:property value="#p.image"/>" width="170" height="170"  style="display: inline-block;">
											   
											<span style='color:green'>
											 <s:property value="#p.pname"/>
											</span>
											  
											<span class="price">
												商城价： ￥ <s:property value="#p.shop_price"/>/份
											</span>
											 
										</a>
									</li>
							 </s:iterator>
						</ul>
				</div>
	            <div class="pagination">
	                  <span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页</span>
	                  <s:if test="cid != null">
					        <s:if test="pageBean.page != 1">
								<a class="firstPage" href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="cid"/>&page=1">&nbsp;</a>
								<a class="previousPage" href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page-1"/>">&nbsp;</a>
							</s:if>
							<s:iterator var="i" begin="1" end="pageBean.totalPage">
								<s:if test="pageBean.page != #i">
								      <a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="cid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
								</s:if>
								<s:else>
									  <span class="currentPage"><s:property value="#i"/></span>
								</s:else>
							</s:iterator>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a class="nextPage" href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
								<a class="lastPage" href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
							</s:if>
		              </s:if>
		              <s:if test="csid != null">
					 		<s:if test="pageBean.page != 1">
								<a class="firstPage" href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="csid"/>&page=1">&nbsp;</a>
								<a class="previousPage" href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>">&nbsp;</a>
							</s:if>
							<s:iterator var="i" begin="1" end="pageBean.totalPage">
								<s:if test="pageBean.page != #i">
								     <a href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
								</s:if>
								<s:else>
									 <span class="currentPage"><s:property value="#i"/></span>
								</s:else>
							</s:iterator>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a class="nextPage" href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
								<a class="lastPage" href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
							</s:if>
		             </s:if>
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