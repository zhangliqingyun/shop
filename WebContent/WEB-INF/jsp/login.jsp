<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员登录</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
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
	
	<div class="container login">
		 <div class="span12">
             <div class="ad">
					<img src="${pageContext.request.contextPath}/image/znsc2.jpg" width="500" height="330" alt="会员登录" title="会员登录">
             </div>		  
        </div>     
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong style="padding-left:60px">密码登录</strong>        
					</div>
					<form id="loginForm" action="${pageContext.request.contextPath }/user_login.action" method="post" novalidate="novalidate">
						<table>
							<tbody>
							 <tr>
							      <span style="color:red"><s:actionerror/></span>
								<th>
										用户名:
								</th>
								<td>
									<input type="text" style="color:gray" id="username" name="username" class="text" maxlength="20" value="请输入用户名..." onfocus="if(this.value='请输入用户名...') this.value=''" onblur="if(this.value=='') this.value='请输入用户名...'"/>
									   
								</td>     
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;	
								</th>
							</tr>
							<tr>
								<th>&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="登 录 清 云"/>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="submit" value="重置清云"/>   
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;	
								</th>
								<td>
									<dl>
										<dt>还没有注册清云账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="${pageContext.request.contextPath}/user_registPage.action">立即注册</a>
										</dd>
									</dl>
								</td>
								
							</tr>
						</tbody>
					  </table>
					</form>
					<div style="height:45px;background-color:#F3F3F3">  
				
				   </div>      
				</div>
				
			</div>
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