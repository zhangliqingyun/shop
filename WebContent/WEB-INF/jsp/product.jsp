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

<script type="text/javascript">
   	$(function(){  
			var fck = new FCKeditor("content");   
			fck.Width = "99%";
			fck.Height = "100%";
		   	fck.ToolbarSet = "bbs";
			fck.BasePath = "${pageContext.request.contextPath}/js/fckeditor/";  
			fck.ReplaceTextarea();
  
	  
		});
    
    function saveCart(){
         document.getElementById("cartForm").submit();
    }
    
    
    function report(){     
         var con ="<iframe style='width:100%;height:100%' name='iframehtml' frameborder='0' marginwidth='0' src='${pageContext.request.contextPath}/admin/report/addReport.jsp'></iframe>";   
         $('#addhtml').html(con);  
         $('#win').window('open');  
    }
    
    function save(){
        $.messager.alert('温馨提示','谢谢举报，我们会及时处理您的举报信息','info'); 
        var loginUser =  $('#loginUser').val();
        var pid = $('#pid').val();  
        window.frames['iframehtml'].save(loginUser,pid);      
    }
    
    function closeWin(){
        $('#win').window('close');  
    }
    
    //添加回复  
    function addreply(id){
        var con ="<iframe style='width:100%;height:100%' name='iframereplyhtml' frameborder='0' marginwidth='0' src='${pageContext.request.contextPath}/comments_addplypage.action?id="+id+"'"+"></iframe>";     
        $('#addreplyhtml').html(con);        
        $('#replywin').window('open');         
    }
     
    //关闭回复窗口
    function closeReplyWin(){
        $('#replywin').window('close');   
    }
      
    //保存回复的窗口
    function  savereply(){
        window.frames['iframereplyhtml'].save(); 
    }
        
</script>

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
	
	<div class="container productContent">
		
		<!-- 
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
		 --> 
		<div style="height:60px;line-height:60px;">  
		    <a href="${pageContext.request.contextPath }/index.action">首页</a>&nbsp;>&nbsp;
		    <a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="model.categorySecond.category.cid"/>&page=1"><s:property value="model.categorySecond.category.cname"/></a>&nbsp;>&nbsp;
		    <a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="model.categorySecond.csid"/>&page=1"><s:property value="model.categorySecond.csname"/></a>&nbsp; >&nbsp;
		    <s:property value="model.pname"/>
		</div>
		<div class="span18 last" style="width:100%;">  
			<div class="productImage">     
					<a>   
						<div class="zoomPad">
						   <img style="opacity: 1;" title="" class="medium" src="${pageContext.request.contextPath }/<s:property value="model.image"/>">
					    </div>
					</a> 
					<span style="margin-top:30px;">商品编号：<s:property value="model.pid"/></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/image/fx.jpg"/>&nbsp;&nbsp;<a href="#">分享</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/image/sc.jpg"/>&nbsp;&nbsp;<a href="#">收藏商品</a>  
			
			</div>
			<div class="name">     
			      <s:property value="model.pname"/>
			</div>
			
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<s:property value="model.shop_price"/>元</strong>
					</dd>
				</dl>
				<dl>   
				    <dt>参 考 价：</dt>
				    <del>￥<s:property value="model.market_price"/>元</del>  
				</dl>
				<dl>
					<dt>配送:</dt>
					<dd>
						从<s:property value="model.user.addr"/>
					</dd>  
				</dl>
				<dl>
					<dt>卖家 ：</dt>  
					<dd>
					    <span><s:property value="model.user.name"/> </span>  
					</dd>
				</dl>
				<dl>  
					<dt>电话 ：</dt>  
					<dd>
					    <span><s:property value="model.user.phone"/> </span>  
					</dd>
				</dl>
				<br/>
				<dl>
					<dt>
					   <s:if test="#session.existUser == null">            
					      <span style="color:red"><a href="${pageContext.request.contextPath}/user_loginPage.action" onclick="return confirm('您还没有登录！去登录？')">举报 </a></span>
					   </s:if>
					   <s:else>
					      <span style="color:red"><a href="#" onclick="report();">举报 </a></span>
					   </s:else>
					</dt>     
					<dd>
					    <span>    </span>
					</dd>
				</dl>
			</div>
	
				<form action="${pageContext.request.contextPath}/cart2_addCart.action" id="cartForm" method="post">
				<input id="pid" name="pid" type="hidden" value="<s:property value="model.pid"/>"/>  
				<input id="loginUser" type="hidden" value="<s:property value="#session.existUser.name"/>"/>  
					<s:if test="model.num==0">     
		            <div class="sl">
				       
				    </div>
				<div class="action">
						<div style="height:180px;">       
						       缺货中... 
						</div>   
				</div>        
		</s:if>   
		<s:else>
				
				<div class="sl">
				             购买数量:<input id="count" name="count" value="1" maxlength="4" onpaste="return false;" type="text" style="width:30px;"/>件 &nbsp; &nbsp; (库存<span style="color:#FF4400"><s:property value="model.num"/></span>件)
				</div>
				<div class="action">
						<div>     
						       <s:if test="#session.existUser == null">             
						          	<a href="${pageContext.request.contextPath}/user_loginPage.action" onclick="return confirm('您还没有登录！去登录？')"><img src="${pageContext.request.contextPath}/image/cart2.jpg"/></a>
						       </s:if>
						       <s:else>  
						       	  <a onclick="saveCart()" href="#"><img src="${pageContext.request.contextPath}/image/cart2.jpg"/></a>    
						       </s:else>
						</div>
				</div>  
				</s:else>
			 </form>
		
	
			 
			 <div class="pdesc">  
			       <p><br/><img src="${pageContext.request.contextPath}/image/r___________renleipic_01/qingYun.png" style="height:50px;width:190px;"/>  </p>
			       <p>公司：清云科技有限公司</p><br/>
			       <p>所在地：北京市朝阳区银河SOHO15919</p><br/>
			       <p><div style="margin-left:100px;background-color:#313FA2;height:30px;width:80px;"><span style="line-height:30px;height:30px;font-size:14px;"><a href="#" style="color:white;">联系客服</a></span></div></p><br/>
			       <p>服务承诺：</p><br/>
			       <p>100%正品 现货库存 专业选型</p> <br/> 
			 </div>
			<div id="bar" class="bar">  
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						<li>
						   <a href="#commentslist">评论列表</a>
						</li>
						
				</ul>
			</div>
			<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong><s:property value="model.pdesc"/></strong>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/<s:property value="model.image"/>">
					</div>          
			</div>	
			
			<!-- 评论列表展示 -->
			<div style="margin-bottom:10px;color:#FD8000">评论区</div>      
			<div id="commentslist" name="commentslist" style="border:1px solid #FD8000;">  
			   <table style="width:100%">      
			       <s:iterator var="comments" value="commentsList" status="status">  
				       <tr style="height:30px;border-top:1px solid #FD8000;width:100%;">
				          <td style="width:10%;text-align:center;color:#FD8000;font-size:14px;">        
				            <a href="#" style="color:#FD8000;"><s:property value="#comments.user.name"/> </a>
				          </td>    
				          <td style="font-size:14px;">  
				               ${content}           <br/>      
				          </td>    
				       </tr>
				       <tr style="height:30px; border-bottom:1px solid #FD8000;width:100%;">        
				          <td style="width:10%;text-align:center;">    
				                                            【${status.count }】楼      
				          </td>   
				          <td>
				                                            评论于:&nbsp;&nbsp;&nbsp;<s:property value="#comments.cdate"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				             <a href="#"  style="color:#FD8000">对我有用[0]</a>&nbsp;&nbsp;&nbsp;&nbsp;  <a href="#">丢个板砖[0]</a>&nbsp;&nbsp;&nbsp;&nbsp;
				             <s:if test="#session.existUser == null">
				                <a href="${pageContext.request.contextPath}/user_loginPage.action" style="color:#FD8000" onclick="return confirm('您还没有登录！去登录?')">回复</a>  
				             </s:if>
				             <s:else>       
				                <a href="#" onclick="addreply(<s:property value='#comments.id'/>);" style="color:#FD8000;cursor:pointer;">回复</a>        
				             </s:else>              
				          </td>          
				       </tr>
			       </s:iterator>
			   </table>
			</div>
			
			
			<div style="border:1px solid #FD8000;margin-top:10px;" >       
			   <form action="${pageContext.request.contextPath }/comments_save.action?pid=<s:property value="model.pid"/>" method="post">        
			        <input type="hidden"  name="userid" value="<s:property value="#session.existUser.uid"/>" />           
			        <input type="hidden"  name="productid" value="<s:property value="model.pid"/>" />           
					<div style="margin-left:10px;margin-right:10px;mgin-top:10px;">                   
					    <div style="margin-top:20px;margin-bottom:2px;">   
					       <span style="font-weight:bold;color:black;">回复内容 </span>匿名用户不能发表回复！<a href="${pageContext.request.contextPath }/user_loginPage.action" style="color:#FD8102">登录</a>|<a style="color:#FD8102" href="${pageContext.request.contextPath }/user_registPage.action">注册</a>  <a  style="color:red;" href="#"> 移动客户端回帖所得专家分翻倍，下载体验！ </a>
					    </div>              
					    <s:textarea id="content" name="content" cssStyle="height:200px;width:500px"></s:textarea>     
					</div>
					<div style="margin-left:10px;margin-right:10px;">      
					    <s:if test="#session.existUser == null">
					        <a class="easyui-linkbutton" href="${pageContext.request.contextPath }/user_loginPage.action" onclick="return confirm('您还没有登录！去登录？')" style="background-image: url('/shop/images/yellow.jpg');width:120px;margin-top:10px;height:30px;border:0px;color:white;font-size:16px;cursor:pointer;" ><span style="font-size:16px;">发布</span></a>  
					    </s:if> 
					    <s:else>
					        <input type="submit" style="background-color:#FD8102;width:120px;margin-top:10px;height:30px;border:0px;color:white;font-size:16px;cursor:pointer;border-radius:5px;"value="发 布"/>   
					    </s:else>
					    <span style="padding-left:60px;"> 每天回帖即可获得10分可用分！小技巧：<a href="#" style="color:#FD8102">教您如何更快获得可用分 </a>    &nbsp; &nbsp;&nbsp;&nbsp; 您可以输入1000个字符</span>
					</div>
					<div style="border:1px solid #FD8000;margin-top:10px;margin-left:10px;margin-right:10px;margin-bottom:10px">      
					    <p style="margin-top:10px;">&nbsp;&nbsp;1.请遵守清云用户行为准则，不得违反国家法律法规。</p>  
					    <p style="margin-top:10px;margin-bottom:10px;">&nbsp;&nbsp;2.请发表真实文明评论，不得出现诋毁的语言。</p>         
					</div> 
				</form>     
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
    
    <!--举报的窗口 -->  
    <div id="win" class="easyui-window" title="举报窗口" style="width:600px;height:400px"   
        data-options="iconCls:'icon-add',modal:true,closed:true"> 
        <div class="easyui-layout" data-options="fit:true">
            <div id="addhtml" data-options="region:'center',split:true"></div>
            <div data-options="region:'south'" style="text-align:center;padding:2px 2px;height:33px">
               <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">提交</a>  
               <a class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeWin()">取消</a>     
            </div>
        </div>
            
    </div>    
    
    <!-- 回复的窗口 -->
     <div id="replywin" class="easyui-window" title="回复窗口" style="width:700px;height:450px"   
        data-options="iconCls:'icon-add',modal:true,closed:true">     
        <div class="easyui-layout" data-options="fit:true">
            <div id="addreplyhtml" data-options="region:'center',split:true"></div>
            <div data-options="region:'south'" style="text-align:center;padding:2px 2px;height:33px">
               <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="savereply()">回复</a>  
               <a class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeReplyWin()">取消</a>     
            </div>
        </div>   
    </div> 

</body>
</html>