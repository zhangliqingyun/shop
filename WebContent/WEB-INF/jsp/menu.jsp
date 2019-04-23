<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="span10 last">
		<div class="topNav clearfix">
			<ul>
			   <s:if test="#session.existUser ==null">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${pageContext.request.contextPath }/user_loginPage.action">登录</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>|
					</li>
				</s:if>
				<s:else>
						<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<s:property value="#session.existUser.name"/>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${pageContext.request.contextPath }/user_quit.action">退出</a>|
					</li>
				</s:else>
						<li>
							<a href="${pageContext.request.contextPath}/returnMessage_addpage.action" target="blank">反馈意见</a>
							
						</li>
			</ul>   
		</div>
		<div class="cart" style="margin-left:150px;">     
		    <s:if test="#session.existUser == null">
		         <a  href="${pageContext.request.contextPath }/user_loginPage.action" onclick="return confirm('您还没有登录!去登录?');">购物车</a>   
		    </s:if>   
		    <s:else>
			    <a  href="${pageContext.request.contextPath }/cart2_list.action">购物车</a>   
			</s:else>
		</div>
		<div>	
			<img src="${pageContext.request.contextPath}/image/phone2.jpg" style="line-height:26px;height:26px;"/><span style="margin-left:14px;font-size:16px;height:30px;line-height:30px">400-9057-828</span>
		</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="${pageContext.request.contextPath }/index.action">首页</a>
						|
					</li>
					<s:iterator var="c" value="#session.cList">
						<li>
							<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
						|  
						</li>
					</s:iterator>		
		</ul>
	</div>