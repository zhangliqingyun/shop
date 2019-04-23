<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>清云商城</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/1.ico"/> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
    <link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
           
         //发布商品的方法
         function addproduct(){    
           var con = "<iframe style='width:100%;height:100%' name='iframehtml' frameborder='0' marginwidth='0' src='${pageContext.request.contextPath}/product_addproduct.action'></iframe>";   
           $('#addproducthtml').html(con);
           $('#addproductwin').window('open');   
         }
         
         //关闭窗口的方法
         function closeaddproductWin(){
            $('#addproductwin').window('close');   
         }
         
         //保存添加商品的方法
         function saveaddproduct(){
            $.messager.alert('温馨提示','发布成功！请等待管理员审核...','info');   
            window.frames['iframehtml'].save();   
         }
         
         //点击搜索的方法
         function searchproduct(){
             var inputMessage = $('#inputmessage').val();
             //$.messager.alert('温馨提示',inputMessage,'info');   
             window.location.href="${pageContext.request.contextPath}/product_search.action?page=1&inputMessage="+inputMessage;     
         }
         
         //最低价格改变的方法
         function startPriceChange(startPrice){  
             var endPrice = $('#endprice option:selected').val();  //最高价 
             var inputMessage = $('#sessionInputMessage').val();   //搜索信息      
             window.location.href="${pageContext.request.contextPath}/product_search.action?page=1&inputMessage="+inputMessage+"&startprice="+startPrice+"&endprice="+endPrice;           
         }
            
         //最高价格改变的方法
         function endPriceChange(endPrice){
             var startPrice = $('#startprice option:selected').val(); //最低价
             var inputMessage = $('#sessionInputMessage').val();   //搜索信息       
             window.location.href="${pageContext.request.contextPath}/product_search.action?page=1&inputMessage="+inputMessage+"&startprice="+startPrice+"&endprice="+endPrice;           
         }
         
    </script>

</head>

 <body>
   <div class="container header">    
		<div class="span5">
			<div class="logo">
				<a href="">
					<img width="195px" height="55px" src="${pageContext.request.contextPath}/image/r___________renleipic_01/qingYun.png" alt="清云科技"/>
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
  
   <div style="height:100px;margin-top:20px;" >            
          <div>
	          <span id="message">      
	               <input class="easyui-textbox" name="inputmessage" value="<s:property value="#session.inputmessage"/>" id="inputmessage" style="width:507px;height:40px;color:red;"/>       
	          </span>
	          <a id="search" href='#' onclick="searchproduct()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清云搜索</a>
	          <s:if test="#session.existUser == null">
	             <a id="new1" href="${pageContext.request.contextPath}/user_loginPage.action" class="easyui-linkbutton" onclick="return confirm('您还没有登录！去登录？')" data-options="iconCls:'icon-edit'">免费发布信息</a> 
              </s:if>   
              <s:else>      
                 <a id="new2" href="#"  onclick="addproduct()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">免费发布信息</a> 
              </s:else>
        
          </div>
          <!-- 搜索区域 -->  
          <div style="margin-top:15px">
               <span style="margin-left:18%;" onmouseout="this.style.color='#6D6D6D'" onmouseover="this.style.color='#FF5500'">综合 </span> 
               <span style="margin-left:7%" onmouseout="this.style.color='#6D6D6D'" onmouseover="this.style.color='#FF5500'">人气 </span>   
               <span style="margin-left:7%" onmouseout="this.style.color='#6D6D6D'" onmouseover="this.style.color='#FF5500'">销量</span>     
               <span style="margin-left:7%" onmouseout="this.style.color='#6D6D6D'" onmouseover="this.style.color='#FF5500'">信用</span>
               <span style="margin-left:7%" onmouseout="this.style.color='#6D6D6D'" onmouseover="this.style.color='#FF5500'">价格</span> 
               <select style="color:gray;" name="startprice" id="startprice" onchange="startPriceChange(this.value)">
                    <option <s:if test="#session.startprice == 1">selected</s:if> value="1">--￥--</option>
                    <option <s:if test="#session.startprice == 0">selected</s:if> value="0">0</option>
                    <option <s:if test="#session.startprice == 100">selected</s:if> value="100">100</option>
                    <option <s:if test="#session.startprice == 200">selected</s:if> value="200">200</option>
                    <option <s:if test="#session.startprice == 300">selected</s:if> value="300">300</option>
                    <option <s:if test="#session.startprice == 400">selected</s:if> value="400">400</option>
                    <option <s:if test="#session.startprice == 500">selected</s:if> value="500">500</option>
                    <option <s:if test="#session.startprice == 600">selected</s:if> value="600">600</option>
                    <option <s:if test="#session.startprice == 700">selected</s:if> value="700">700</option>
                    <option <s:if test="#session.startprice == 800">selected</s:if> value="800">800</option>
                    <option <s:if test="#session.startprice == 900">selected</s:if> value="900">900</option>
                    <option <s:if test="#session.startprice == 1000">selected</s:if> value="1000">1000</option>
               </select>     
               &nbsp;&nbsp;—&nbsp;&nbsp;
               <select style="color:gray" id="endprice" name="endprice" onchange="endPriceChange(this.value)">
                 <option <s:if test="#session.endprice == 1">selected</s:if> value="1">--￥--</option>   
                    <option <s:if test="#session.endprice == 0">selected</s:if> value="0">0</option>
                    <option <s:if test="#session.endprice == 100">selected</s:if> value="100">100</option>
                    <option <s:if test="#session.endprice == 200">selected</s:if> value="200">200</option>
                    <option <s:if test="#session.endprice == 300">selected</s:if> value="300">300</option>
                    <option <s:if test="#session.endprice == 400">selected</s:if> value="400">400</option>
                    <option <s:if test="#session.endprice == 500">selected</s:if> value="500">500</option>
                    <option <s:if test="#session.endprice == 600">selected</s:if> value="600">600</option>
                    <option <s:if test="#session.endprice == 700">selected</s:if> value="700">700</option>
                    <option <s:if test="#session.endprice == 800">selected</s:if> value="800">800</option>
                    <option <s:if test="#session.endprice == 900">selected</s:if> value="900">900</option>
                    <option <s:if test="#session.endprice == 1000">selected</s:if> value="1000">1000</option>
               </select>  
               <input type="hidden" name="sessionInputMessage" id="sessionInputMessage" value="<s:property value="#session.inputmessage"/>"/>   
          </div>    
   </div>  
   
    
   
   <div>
      <span id="sjqy">手机清云</span><img id="winxin" src="${pageContext.request.contextPath}/images/weixin.png"></img></img>
      <marquee id="mymarquee" direction="up" style="border:solid 2px #FD8000" onMouseOut="this.start()" onMouseOver="this.stop()" behavior="scroll" scrollamount="3" scrolldelay="0" loop="-1" width="150" height="380" bgcolor="white" hspace="10" vspace="10" >
          <s:iterator var="convenience" value="convenienceList" > 
            	<center><a  target="_blank" href="${pageContext.request.contextPath}/convenience_show.action?id=<s:property value="#convenience.id"/>"><s:property value="#convenience.title"/></a><br/><br/></center>
          </s:iterator>    
      </marquee>
      <img id="zuo1" src="${pageContext.request.contextPath}/images/zuo1.png"></img>
      <img id="zuo2" src="${pageContext.request.contextPath}/images/zuo2.png"></img>
      <a href="#"><span id="fabu">想在清云发布信息？</span></a>
   </div>   

   <div class="container index">
		<div class="span24" style="border:1px solid #E4E4E4;" >      
			<div id="hotProduct" class="hotProduct clearfix" >
					<div class="title">
						<strong>所有宝贝</strong>
					</div>
					<ul class="tab">
				    </ul>   
					<ul class="tabContent" style="display: block;">
						 <s:iterator var="p" value="pageBean.list" >
							<li style="height: 260px;width:170px;">  
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank">
								       <img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"  width="150" height="150" style="display: block;">  
									   <span style='color:green'>
											 <s:property value="#p.pname"/>   
									   </span> 
									   <br/>
										<span class="price" style="color:red">
											    商城价： ￥ <s:property value="#p.shop_price"/>/份
										</span>
										<br/><br/>
										<span>
										      卖家:&nbsp;&nbsp;<s:property value="#p.user.name"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#p.user.addr"/>
										</span>  
								</a>  
							</li>
						 </s:iterator>
					</ul>   
			</div>
		</div>

           <div class="pagination">  
               <span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页</span>
	 		<s:if test="pageBean.page != 1">
				<a class="firstPage" href="${pageContext.request.contextPath }/product_search.action?page=1&inputMessage=<s:property value="#session.inputmessage"/>">&nbsp;</a>
				<a class="previousPage" href="${pageContext.request.contextPath }/product_search.action?page=<s:property value="pageBean.page-1"/>&inputMessage=<s:property value="#session.inputmessage"/>">&nbsp;</a>
			</s:if>
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
				     <a href="${pageContext.request.contextPath }/product_search.action?page=<s:property value="#i"/>&inputMessage=<s:property value="#session.inputmessage"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					 <span class="currentPage"><s:property value="#i"/></span>
				</s:else>   
			</s:iterator>
			<s:if test="pageBean.page != pageBean.totalPage">  
				<a class="nextPage" href="${pageContext.request.contextPath }/product_search.action?page=<s:property value="pageBean.page+1"/>&inputMessage=<s:property value="#session.inputmessage"/>">&nbsp;</a>
				<a class="lastPage" href="${pageContext.request.contextPath }/product_search.action?page=<s:property value="pageBean.totalPage"/>&inputMessage=<s:property value="#session.inputmessage"/>">&nbsp;</a>
			</s:if>   
    
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
   
    <!--添加商品的窗口 -->
   <div id="addproductwin" class="easyui-window" title="发布商品" style="width:700px;height:450px"   
        data-options="iconCls:'icon-add',modal:true,closed:true">     
        <div class="easyui-layout" data-options="fit:true">
            <div id="addproducthtml" data-options="region:'center',split:true"></div>
            <div data-options="region:'south'" style="text-align:center;padding:2px 2px;height:33px">
               <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveaddproduct()">发布</a>     
               <a class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeaddproductWin()">取消</a>     
            </div>
        </div>   
   </div>   
        
 
 </body>
</html>