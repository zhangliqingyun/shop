<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员注册</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>

<script >
   function checkForm(){
   //验证用户名
   //获取用户名框中的信息
	   var username=document.getElementById("username").value;
	   if(username ==''){
	   		alert("用户名不能为空！！！");
	   		return false;
	   }
	   //验证密码
   //获取密码框中的信息
	   var password=document.getElementById("password").value;
	   if(password ==''){
	   		alert("密码不能为空！！！");
	   		return false;
	   }
	   //验证二次密码
   //获取二次密码框中的信息
	   var repassword=document.getElementById("repassword").value;
	   if(repassword!=password){
	   		alert("两次密码不一样！！！");
	   		return false;
	   }
	   //验证邮箱
   //获取邮箱框中的信息
	   var email=document.getElementById("email").value;
	   if(email ==''){
	   		alert("邮箱不能为空！！！");
	   		return false;
	   }
   }
   
   function checkUserName(){
   		//获取用户名值
   		var username=document.getElementById("username").value;
   		//1创建AJAX引擎对象
   		var xhr=new createXmlHttp();
   		//2设置监听
   		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+username,true);
		// 4.发送
		xhr.send(null);
   }

  function createXmlHttp(){
  		var xmlHttp;
  		try{
  			xmlHttp=new XMLHttpRequest();
  		}catch(e){
  			try{
  				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  			}catch(e){
  				try{
  				xmlHttp=new ActiveXObject("Micosoft.XMLHTTP")
  				}catch(e){
  				
  				}
  			}
  		
  		}	
  	return xmlHttp;	
  }
  function change(){
  		var img1=document.getElementById("checkImg");
  		img1.src="${pageContext.request.contextPath}/checkImg.action?"+new Date().getTime();
  }
</script>
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
		<%@ include file="menu.jsp"%>
	</div>	
	
	<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong style="margin-left:40px;">欢迎注册</strong>
						<span style="color:red"><s:actionerror/></span>
					</div>
					<form id="registerForm" action="${pageContext.request.contextPath }/user_regist.action" method="post" novalidate="novalidate" onsubmit="return checkForm();">
						<table  style="width:550px;">  
						  <tbody>
							<tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" onblur="checkUserName()">
									<span id="span1"></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off">
									<span style="color:red"><s:fielderror fieldName="password"/></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input type="password" id="repassword" class="text" maxlength="20" autocomplete="off">
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>E-mail:
								</th>
								<td>
									<input type="text" id="email" name="email" class="text" maxlength="200">
									<span style="color:red"><s:fielderror fieldName="email"/></span>
								</td>
							</tr>
							<tr>
								<th>
									姓名:
								</th>
								<td>
									<input type="text" name="name" class="text" maxlength="200"/>
									<span style="color:red"><s:fielderror fieldName="name"/></span>
								</td>
							</tr>
							<tr>
								<th>
									电话:
								</th>
								<td>
										<input type="text" name="phone" class="text" />
										<span style="color:red"><s:fielderror fieldName="phone"/></span>
								</td>
							</tr>
							<tr>
								<th>
									地址:
								</th>
								<td>
										<input type="text" name="addr" class="text" maxlength="200">
										<span style="color:red"><s:fielderror fieldName="addr"/></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>验证码:
								</th>
								<td>
									<span class="fieldSet">
										<input type="text" id="checkcode" name="checkcode" class="text captcha" maxlength="4" autocomplete="off"><img id="checkImg" class="captchaImage" src="${pageContext.request.contextPath}/checkImg.action"  onclick="change()"   title="点击更换验证码">
									</span>
								</td>
							</tr>
							<tr>
								<th>&nbsp;	
								</th>
								<td>
									<input type="submit" class="submit" value="注册清云">
								</td>
							</tr>
							<tr>
								<th>&nbsp;	
								</th>
								<td>
									<span style="font-size:14px;">已经拥有清云账号了？&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="${pageContext.request.contextPath}/user_loginPage.action" style="font-size:14px;color:#FC7800">立即登录</a>
								</td>
							</tr>   
						</tbody>
					</table>
					<div>
                        <div>
					         <dl>
								<dt style="font-size:16px;color:#FC7800;">
									<br/><br/><br/><br/><br/><br/>无需注册，快速登录
								</dt>
								<dt style="margin-top:30px;">  
								   <img src="${pageContext.request.contextPath}/image/qq.jpg"/>  
								   <img src="${pageContext.request.contextPath}/image/wx.jpg" style="margin-left:50px;"/>  
								</dt>
								<dd style="margin-top:10px;">
									<span style="font-size:16px;"><a href="#">QQ登录</a></span><span style="font-size:16px;margin-left:35px;"><a href="#">微信登录</a></span>
								</dd>
								
							</dl>
                       </div>							
				    </div>
				 </form>
				</div>
			</div>
			<div style="height:30px;font-size:20px;background-color:#F0F0F0;text-align:center">    
		                          帮助中心
		    </div>
		    <div>
		      <table style="width:100%;margin-bottom:10px;">
		          <tr style="line-height: 30px;">
		             <td><a href="#">1、怎么一次性购买多件工具？</a></td>
		             <td><a href="#">2、怎么申请开具发票？</a></td>
		             <td><a href="#">3、忘记密码了怎么办？</a></td>
		             <td><a href="#">4、运费问题怎么收取？</a></td>
		          </tr>
		          <tr>
		             <td><a href="#">5、哪些地区和商品支持货到付款？</a></td>
		             <td><a href="#">6、可以用微信支付吗？</a></td>
		             <td><a href="#">7、可以支持支付宝支付吗？</a></td>
		             <td><a href="#">8、可以支持工具定制吗？</a></td>  
		          </tr>
		      </table>
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

    <div id="_my97DP" style="position: absolute; top: -1970px; left: -1970px;">
          <iframe style="width: 190px; height: 191px;" src="./会员注册 - Powered By Mango Team_files/My97DatePicker.htm" frameborder="0" border="0" scrolling="no"></iframe>
    </div>
</body>
</html>